*** Settings ***
Resource    ../page/page-header.resource
Resource    ../../common/user-api-request.resource
Resource    ../page/page-bank.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-account-info.resource



*** Keywords ***
Go To Quan Ly Bank Page
    Click On The Avatar Image On Header Page
    Click On The Menu Ngan Hang Cua Ban On The Account Info Page

Assert Quan Ly Bank Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bank Of User    ${GL_123BONG_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${data}    Get From Dictionary    ${dict}    data
    ${count}    Get Length    ${data}
    IF    ${count}==0
        ${locator}    Get Div Chua Co Tai Khoan Lien Ket On Quan Ly Bank Page
        ${exist}    Check Element Exists On Page    (${locator})[1]
        Should Be True    ${exist}
    ELSE
        ${arr_bank}    Set Variable    ${data}
        # nếu tổng số bank > 3 thì chỉ chech chi tiết 3 record đầu thôi.
        IF    ${count}>3
            ${count}=    Set Variable    3
        END
        FOR    ${i}    IN RANGE    ${count}
            ${expected_bank_account_name}    Get From Dictionary    ${arr_bank}[${i}]    bank_account_name
            ${expected_bank_account_no}    Get From Dictionary    ${arr_bank}[${i}]    bank_account_no
            ${locator}    Set Variable    //section//div[text()='${expected_bank_account_no}']/../preceding-sibling::div/div[text()='${expected_bank_account_name}']
            ${exist}    Check Element Exists On Page    ${locator}
            Should Be True    ${exist}
        END
    END
*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../page/page-bank.resource
Resource    ../../common/common-keywords.resource



*** Keywords ***
Go To Quan Ly Bank Page
    Go To    ${GL_LU88_URL}account/banking

Assert Quan Ly Bank Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bank Of User    ${bearer_token}
    ${content_api_bank}    Get Content Of API Bank    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${data}    Get Value From Json    ${json}    $.data
    ${count}    Get Length    ${data}[0]
    IF    ${count}==0
        ${locator}    Get Div Chua Co Tai Khoan Lien Ket On Quan Ly Bank Page
        ${exist}    Check Element Exists On Page    (${locator})[1]
        Should Be True    ${exist}
    ELSE
        ${arr_bank}    Set Variable    ${data}[0]
        # nếu tổng số bank > 3 thì chỉ chech chi tiết 3 record đầu thôi.
        IF    ${count}>3
            ${count}=    Set Variable    3
        END
        FOR    ${i}    IN RANGE    ${count}
            ${expected_bank_account_name}    Get From Dictionary    ${arr_bank}[${i}]    bank_account_name
            ${expected_bank_account_no}    Get From Dictionary    ${arr_bank}[${i}]    bank_account_no
            ${locator}    Set Variable    //section//div[text()='${expected_bank_account_no}']/following-sibling::div[text()='${expected_bank_account_name}']
            ${exist}    Check Element Exists On Page    ${locator}
            Should Be True    ${exist}

        END
        
    END
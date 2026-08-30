*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-header.resource
Resource    ../page/page-bank.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-account-info.resource
Resource    ../../common/user-api-request.resource



*** Keywords ***
Go To Quan Ly Bank Page
    Click On The Avatar Image On Header Page
    Click On The Menu Ngan Hang Cua Ban On The Account Info Page

Assert Quan Ly Bank Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_bank}    Send GET Request To Get Bank Of User    ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Evaluate    json.loads('''${content_api_bank}''')    modules=json
    ${data}    Get From Dictionary    ${dict}    data
    ${count}    Get Length    ${data}
    IF    ${count}==0
        ${locator}    Get Div Chua Co Tai Khoan Lien Ket On Quan Ly Bank Page
        ${exist}    Check Element Exists On Page    (${locator})[1]
        Should Be True    ${exist}
    ELSE
        # nếu tổng số bank > 3 thì chỉ chech chi tiết 3 record đầu thôi.
        IF    ${count}>3
            ${count}=    Set Variable    3
        END
        FOR    ${i}    IN RANGE    ${count}
            ${expected_bank_account_name}    Get From Dictionary    ${data}[${i}]    bank_account_name
            ${expected_bank_account_no}    Get From Dictionary    ${data}[${i}]    bank_account_no
            ${locator}    Set Variable    //section//div[text()='${expected_bank_account_no}']/following-sibling::div[text()='${expected_bank_account_name}']
            ${exist}    Check Element Exists On Page    ${locator}
            Should Be True    ${exist}

        END
        
    END
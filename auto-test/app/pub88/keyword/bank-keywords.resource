*** Settings ***
Resource    ../../import.resource
Resource    ../../common/user-api-request.resource
Resource    ../page/page-bank.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-footer-menu.resource



*** Keywords ***
Go To Quan Ly Bank Page
    Click On The Menu Tai Khoan On The Footer Menu
    Click On The Menu Ngan Hang Cua Ban On The Account Info Page

Assert Quan Ly Bank Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_bank}    Send GET Request To Get Bank Of User    ${GL_PUB88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Evaluate    json.loads('''${content_api_bank}''')    modules=json
    ${data}    Get From Dictionary    ${dict}    data
    ${count}    Get Length    ${data}
    IF    ${count}==0
        Assert User Dont Have Bank Yet
    ELSE
        Assert Bank Of User Is Correct    ${data}
    END

Assert User Dont Have Bank Yet
    ${locator}    Get Div Chua Co Tai Khoan Lien Ket On Quan Ly Bank Page
    ${exist}    Check Element Exists On Page    (${locator})[1]
    Should Be True    ${exist}
    Click On The Button Add Bank On Quan Ly Bank Page
    ${exits}    Check Element Exists On Page    //div[text()='Thêm tài khoản ngân hàng']
    Should Be True    ${exits}
    
    
Assert Bank Of User Is Correct
    [Arguments]    ${p_list_bank}
    ${arr_bank}    Set Variable    ${p_list_bank}
    # nếu tổng số bank > 3 thì chỉ chech chi tiết 3 record đầu thôi.
    ${count}    Get Length    ${arr_bank}
    IF    ${count}>3
        ${arr_bank}=    Set Variable    ${arr_bank}[:3]
    END
    FOR    ${bank}    IN    @{arr_bank}
        ${expected_bank_account_name}    Get From Dictionary    ${bank}    bank_account_name
        ${expected_bank_account_no}    Get From Dictionary    ${bank}    bank_account_no
        ${locator}    Set Variable    //section//div[text()='${expected_bank_account_no}']/following-sibling::div[text()='${expected_bank_account_name}']
        ${exist}    Check Element Exists On Page    ${locator}
        Should Be True    ${exist}
    END
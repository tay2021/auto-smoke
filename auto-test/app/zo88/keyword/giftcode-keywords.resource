*** Settings ***
Resource    ../page/page-header.resource
Resource    ../page/page-gift-code.resource
Resource    ../../common/common-keywords.resource




*** Keywords ***
Go To Gift Code Page
    Go To    ${GL_ZO88_URL}account/gift-code

Assert Claim Gift Code Correct
    ${locator}    Get Locator Label Tille Gift Code On Gift Code Page
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}
    Input Ma Gift Code On Textbox Gift Code On Gift Code Page    TESTTING    #INVALID GITF CODE
    Click Button Nhan Qua Ngay On Gift Code Page
    ${expected_error}    Set Variable    Không tìm thấy mã quà tặng hoặc mã quà tặng không hợp lệ.
    ${actual_error}    Get Text Error Infor On Gift Code Page
    Should Be True    '${expected_error}'=='${actual_error}'

    
    
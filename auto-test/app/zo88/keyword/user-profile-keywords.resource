*** Settings ***
Resource    ../page/page-header.resource
Resource    ../page/page-profile-information.resource
Resource    ../../common/common-keywords.resource




*** Keywords ***
Go to Profile Page
    Go To    ${GL_ZO88_URL}account/profile
    
    
Assert Profile Information Are Correct
    [Arguments]    ${p_expected_username}    ${p_expected_fullname}    ${p_expected_email}    ${p_expected_phone}    ${p_expected_telegram}
    ${exits}    Check Element Exists On Page    //span[text()='Thông tin cá nhân']/following-sibling::form//input[@value='${p_expected_fullname}']
    Should Be True    ${exits}
    ${exits}    Check Element Exists On Page    //span[text()='Thông tin cá nhân']/following-sibling::form//input[@value='${p_expected_fullname}']
    Should Be True    ${exits}
    ${exits}    Check Element Exists On Page    //span[text()='Thông tin cá nhân']/following-sibling::form//input[@value='${p_expected_email}']
    Should Be True    ${exits}
    ${exits}    Check Element Exists On Page    //span[text()='Xác thực tài khoản']/following-sibling::form//input[@value='${p_expected_phone}']
    Should Be True    ${exits}

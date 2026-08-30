*** Settings ***
Resource    ../../common/common-keywords.resource

*** Keywords ***
Input Username On Model Register
    [Arguments]    ${p_username}
    Wait For Element State And Fill Text    //input[@id='username-register-input']    ${p_username}

Input Password On Model Register
    [Arguments]    ${p_password}
    Wait For Element State And Fill Text    //input[@id='password-register-input']    ${p_password}

Input Phone Number On Model Register
    [Arguments]    ${p_phone_number}
    Wait For Element State And Fill Text    //input[@placeholder='Số điện thoại']    ${p_phone_number}

Click Button Register On Model Register
    Wait For Element State And Click On It    //div[@id='register-form']//span[text()='Đăng ký']
*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource

*** Keywords ***
Input Username On Model Register
    [Arguments]    ${p_username}
    Wait For Element State And Fill Text    //input[@name='username']    ${p_username}
    
Input Password On Model Register
    [Arguments]    ${p_password}
    Wait For Element State And Fill Text    //input[@name='password']    ${p_password}
    
Input Phone Number On Model Register
    [Arguments]    ${p_phone_number}
    Wait For Element State And Fill Text     //input[@name='phone']    ${p_phone_number}

Click Button Register On Model Register
    Wait For Element State And Click On It    //div[@id='login-form']//button[text()='Đăng ký']

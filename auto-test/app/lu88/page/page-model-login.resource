*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Input Username On Model Login
    [Arguments]    ${p_username}
    Wait For Element State And Fill Text    //input[@id='username-login-input']    ${p_username}
    
Input Password On Model Login
    [Arguments]    ${p_password}
    Wait For Element State And Fill Text    //input[@id='password-login-input']    ${p_password}
    
Click Button Dang Nhap On Model Login
    Wait For Element State And Click On It    //span[text()='Đăng nhập']/..

Get Label Info Login Successfully
    ${locator}    Set Variable    //*[text()='Đăng nhập thành công!']
    RETURN    ${locator}
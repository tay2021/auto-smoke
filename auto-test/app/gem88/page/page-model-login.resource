*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Input Username On Model Login
    [Arguments]    ${p_username}
    Wait For Element State And Fill Text    //input[@name='username']    ${p_username}
    
Input Password On Model Login
    [Arguments]    ${p_password}
    Wait For Element State And Fill Text    //input[@name='password']    ${p_password}
    
Click Button Dang Nhap On Model Login
    Wait For Element State And Click On It    //button[@type='submit']

Get Label Info Login Successfully
    ${locator}    Get Element    //p[text()='Đăng nhập thành công']
    RETURN    ${locator}
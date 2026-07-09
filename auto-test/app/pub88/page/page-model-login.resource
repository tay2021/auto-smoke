*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${txtbox_username}    //input[@id='username-login-input']
${txtbox_password}    //input[@id='password-login-input']
${btn_dangnhap}    //span[text()='Đăng nhập']/..


${lbel_LoginSuccessfully}    //*[text()='Đăng nhập thành công']


*** Keywords ***
Input Username On Model Login
    [Arguments]    ${p_username}
    Wait For Elements State    ${txtbox_username}    visible
    Fill Text    ${txtbox_username}    ${p_username}
    
Input Password On Model Login
    [Arguments]    ${p_password}
    Wait For Elements State    ${txtbox_password}    visible
    Fill Text    ${txtbox_password}    ${p_password}
    
Click Button Dang Nhap On Model Login
    Wait For Elements State    ${btn_dangnhap}    visible
    Click    ${btn_dangnhap}

Get Label Info Login Successfully
    ${locator}    Get Element    ${lbel_LoginSuccessfully}
    RETURN    ${locator}
*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Input Username On Login Page Dai Ly
    [Arguments]    ${p_username}
    Wait For Element State And Fill Text    //input[@id='username']    ${p_username}
    
Input Password On Login Page Dai Ly
    [Arguments]    ${p_password}
    Wait For Element State And Fill Text    //input[@id='password']    ${p_password}
    
Click Button Dang Nhap On Login Page Dai Ly
    Wait For Element State And Click On It    //button[@type='submit']
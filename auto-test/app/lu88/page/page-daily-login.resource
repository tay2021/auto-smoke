*** Settings ***
Library    Browser


*** Keywords ***
Input Username On Login Page Dai Ly
    [Arguments]    ${p_username}
    ${locator}    Set Variable    //input[@id='username']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_username}
    
Input Password On Login Page Dai Ly
    [Arguments]    ${p_password}
    ${locator}    Set Variable    //input[@id='password']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_password}
    
Click Button Dang Nhap On Login Page Dai Ly
    ${locator}    Set Variable    //button[@type='submit']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

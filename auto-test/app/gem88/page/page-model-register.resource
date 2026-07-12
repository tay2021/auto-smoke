*** Settings ***
Library    Browser

*** Keywords ***
Input Username On Model Register
    [Arguments]    ${p_username}
    ${locator}    Set Variable    //input[@name='username']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_username}

Input Password On Model Register
    [Arguments]    ${p_password}
    ${locator}    Set Variable    //input[@name='password']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_password}

Input Phone Number On Model Register
    [Arguments]    ${p_phone_number}
    ${locator}    Set Variable    //input[@name='phone']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_phone_number}

Click Button Register On Model Register
    ${locator}    Set Variable    //div[@id='login-form']//button[text()='Đăng ký']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
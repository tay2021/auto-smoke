*** Settings ***
Resource    ../../import.resource


*** Variables ***


*** Keywords ***
Select Random Kenh Nap On Flash Page
    Click    //span[text()='VNQR 1']
    
Input So Tien On Flash Page
    [Arguments]    ${p_amount}
    Fill Text    //input[@name='amount']    ${p_amount}
    
Click On Button Tao Ma QR On Flash Page
    ${locator}    Set Variable    //button[text()='LẤY MÃ NẠP TIỀN']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
    
Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    ${locator}    Set Variable    //img[@id='codepay-qr']
    Wait For Elements State    ${locator}    visible
    ${value}    Get Attribute    ${locator}    src
    RETURN    ${value}
    
Click Button Them Ngan Hang On Flash Page
    ${locator}    Set Variable    //button[text()='Thêm ngân hàng']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}



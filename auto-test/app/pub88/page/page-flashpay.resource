*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Select Random Kenh Nap On Flash Page
    Click    //h4[text()='Chọn cổng nạp']/following-sibling::div[1]/div[1]
    
Input So Tien On Flash Page
    [Arguments]    ${p_amount}
    Fill Text    //input[@id='amount']    ${p_amount}
    
Click On Button Tao Ma QR On Flash Page
    ${locator}    Set Variable    ((//div[@class='ant-tabs-content-holder']//form)[1]//*[text()='Tạo mã QR Code'])[1]
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
    
Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    ${value}    Get Attribute    //img[@alt='qr code']    src
    RETURN    ${value}



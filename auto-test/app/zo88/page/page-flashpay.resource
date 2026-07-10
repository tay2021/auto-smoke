*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Select Random Kenh Nap On Flash Page
    Click    //div[text()='Nhanh 01']
    
Input So Tien On Flash Page
    [Arguments]    ${p_amount}
    Fill Text    //div[text()='Số tiền muốn nạp']/following-sibling::div[1]/form//input    ${p_amount}
    
Click On Button Tao Ma QR On Flash Page
    ${locator}    Set Variable    //div[text()='Số tiền muốn nạp']/following-sibling::div[1]/form//button[text()='Tạo mã QR Code']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
    
Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    Wait For Elements State    //img[contains(@alt,'data:image')]    visible
    ${value}    Get Attribute    //img[contains(@alt,'data:image')]    src
    RETURN    ${value}



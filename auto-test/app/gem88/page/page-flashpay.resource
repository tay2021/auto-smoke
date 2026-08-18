*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource

*** Keywords ***
Select Random Kenh Nap On Flash Page
    Click    (//div[@class='deposit-wrapper']//div[contains(@class,'swiper-slide')])[1]
    
Input So Tien On Flash Page
    [Arguments]    ${p_amount}
    Fill Text    //label[@for='amount']/preceding-sibling::input    ${p_amount}
    
Click On Button Tao Ma QR On Flash Page
    Click    //button[text()='Tạo mã QR Code']
    
Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    ${locator}    Set Variable    //img[@id='codepay-qr']
    Wait For Elements State    ${locator}    visible
    Sleep    1s
    ${value}    Get Attribute    ${locator}    src
    RETURN    ${value}
*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Select Random Kenh Nap On Flash Page
    Click    (//div[@class='deposit-wrapper']//div[contains(@class,'swiper-slide')])[1]
    
Input So Tien On Flash Page
    [Arguments]    ${p_amount}
    Fill Text    //label[@for='amount']/preceding-sibling::input    ${p_amount}
    
Click On Button Tao Ma QR On Flash Page
    Click    //button[text()='Tạo mã QR Code']
    
Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    Wait For Elements State    //img[contains(@alt,'data:image/png')]    visible
    ${value}    Get Attribute    //img[contains(@alt,'data:image/png')]    src
    RETURN    ${value}



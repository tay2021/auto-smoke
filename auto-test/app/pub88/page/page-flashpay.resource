*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource



*** Keywords ***
Select Random Kenh Nap On Flash Page
    Click    //h4[text()='Chọn cổng nạp']/following-sibling::div[1]/div[1]
    
Input So Tien On Flash Page
    [Arguments]    ${p_amount}
    Fill Text    //input[@id='amount']    ${p_amount}
    
Click On Button Tao Ma QR On Flash Page
    Wait For Element State And Click On It    (//button//span[text()='Tạo mã QR Code'])[2]
    
Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    ${value}    Get Attribute    //img[@alt='qr code']    src
    RETURN    ${value}



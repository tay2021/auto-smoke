*** Settings ***
Library    Browser


*** Variables ***


*** Keywords ***
Get Locator Label Tille Gift Code On Gift Code Page
    ${locator}    Set Variable    //span[text()='GIFT CODE TẶNG BẠN!']
    RETURN    ${locator}

Input Ma Gift Code On Textbox Gift Code On Gift Code Page
    [Arguments]    ${p_giftcode}
    ${locator}    Set Variable    //div[text()='Nhập mã quà tặng']/following-sibling::div//input
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_giftcode}

Click Button Nhan Qua Ngay On Gift Code Page
    ${locator}    Set Variable    //form[@id='giftcode-form']//button[text()='Nhận quà ngay']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Get Text Error Infor On Gift Code Page
    ${value}    Get Text    (//div[@class='text-signal-error text-xs'])[1]
    RETURN    ${value}
*** Settings ***
Library    Browser


*** Variables ***


*** Keywords ***
Get Locator Label Tille Gift Code On Gift Code Page
    ${locator}    Set Variable    //form[@name='GiftcodeForm']/../preceding-sibling::div
    RETURN    ${locator}

Input Ma Gift Code On Textbox Gift Code On Gift Code Page
    [Arguments]    ${p_giftcode}
    ${locator}    Set Variable    //input[@name='giftcode']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_giftcode}

Click Button Nhan Qua Ngay On Gift Code Page
    ${locator}    Set Variable    //button[text()='Nhận quà ngay']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Get Text Error Infor On Gift Code Page
    ${value}    Get Text    (//div[contains(@class,'signal-error') and text()='Không tìm thấy mã quà tặng hoặc mã quà tặng không hợp lệ.'])[1]
    RETURN    ${value}
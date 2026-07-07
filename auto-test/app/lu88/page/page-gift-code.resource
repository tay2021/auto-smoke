*** Settings ***
Library    Browser


*** Variables ***


*** Keywords ***
Get Locator Label Tille Gift Code On Gift Code Page
    ${locator}    Set Variable    //h2[text()='Gift code']
    RETURN    ${locator}

Input Ma Gift Code On Textbox Gift Code On Gift Code Page
    [Arguments]    ${p_giftcode}
    ${locator}    Set Variable    (//section//form)[2]//input[@id='code']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_giftcode}

Click Button Nhan Qua Ngay On Gift Code Page
    ${locator}    Set Variable    (//section//form)[2]//button[text()='Nhận quà ngay']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Get Text Error Infor On Gift Code Page
    ${value}    Get Text    (//section//form)[2]//div[@class='ant-form-item-explain-error']
    RETURN    ${value}
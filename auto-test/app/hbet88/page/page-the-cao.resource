*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Select Nha Mang On Deposit The Cao Page
    [Documentation]    viettel: 1, mobifone: 2, vinaphone: 3, zing: 4, vietnammobile: 5. Chi nhập số 
    [Arguments]    ${p_operator}
    ${locator}    Set Variable    //div[text()='Bạn có']/following-sibling::div[1]/div[${p_operator}]/div
    Wait For Elements State    ${locator}   visible
    Click    ${locator}
    
Input Serial The Cao On Deposit The Cao Page
    [Arguments]    ${p_serial}
    ${locator}    Set Variable    //input[@id='card_serial']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_serial}

Input PIN The Cao On Deposit The Cao Page
    [Arguments]    ${p_pin}
    ${locator}    Set Variable    //input[@id='card_code']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_pin}

Select Menh Gia The Cao On Deposit The Cao Page
    [Arguments]    ${p_menh_gia}
    ${locator}    Set Variable    //input[@id='amount_deposit']/../following-sibling::span
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
    ${locator_10k}    Set Variable    (//div[@class='ant-select-item-option-content'])[2]
    Wait For Elements State    ${locator_10k}    visible
    Click    ${locator_10k}

Click Button Nap Tien On Deposit The Cao Page
    ${locator}    Set Variable    //button[text()='Nạp tiền']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

    
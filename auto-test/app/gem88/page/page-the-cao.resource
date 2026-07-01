*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Select Nha Mang On Deposit The Cao Page
    [Documentation]    viettel: 1, mobifone: 2, vinaphone: 3, zing: 4, vietnammobile: 5. Chi nhập số 
    [Arguments]    ${p_operator}
    ${locator}    Set Variable    (//div[@class='deposit-wrapper']/div[1]/div[2]//img)[${p_operator}]
    Wait For Elements State    ${locator}   visible
    Click    ${locator}
    
Input Serial The Cao On Deposit The Cao Page
    [Arguments]    ${p_serial}
    ${locator}    Set Variable    //div[@class='deposit-wrapper']/div[1]/div[2]//*[@id='card_serial']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_serial}

Input PIN The Cao On Deposit The Cao Page
    [Arguments]    ${p_pin}
    ${locator}    Set Variable    //div[@class='deposit-wrapper']/div[1]/div[2]//*[@id='card_code']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_pin}

Select Menh Gia The Cao On Deposit The Cao Page
    [Arguments]    ${p_menh_gia}
    ${locator}    Set Variable    (//div[@class='deposit-wrapper']/div[1]/div[2]//*[contains(text(),'${p_menh_gia}')])[1]
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Click Button Nap Tien On Deposit The Cao Page
    Click    //div[@class='deposit-wrapper']/div[1]/div[2]//button[text()='NẠP TIỀN']

    
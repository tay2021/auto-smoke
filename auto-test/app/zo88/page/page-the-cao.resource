*** Settings ***
Resource    ../../import.resource


*** Variables ***


*** Keywords ***
Select Nha Mang On Deposit The Cao Page
    [Documentation]    p_operator_name sẽ là 1 trong các giá trị sau: VIETTEL, MOBIFONE, VINAPHONE, ZING, VIETNAMOBILE
    [Arguments]    ${p_operator_name}
    ${locator}    Set Variable    //button/img[@alt='${p_operator_name}']
    Wait For Elements State    ${locator}   visible
    Click    ${locator}
    
Input Serial The Cao On Deposit The Cao Page
    [Arguments]    ${p_serial}
    ${locator}    Set Variable    (//input[@name='card_serial'])[1]
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_serial}

Input PIN The Cao On Deposit The Cao Page
    [Arguments]    ${p_pin}
    ${locator}    Set Variable    (//input[@name='card_code'])[1]
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_pin}

Select Menh Gia The Cao On Deposit The Cao Page
    [Arguments]    ${p_menh_gia}
    ${locator}    Set Variable    //div[contains(@class,'grid grid-cols-3')]/button[text()='${p_menh_gia}']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Click Button Nap Tien On Deposit The Cao Page
    ${locator}    Set Variable    //button[text()='NẠP TIỀN']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

    
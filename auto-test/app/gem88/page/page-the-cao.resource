*** Settings ***
Library    Browser    timeout=15s



*** Keywords ***
Select Nha Mang On Deposit The Cao Page
    [Documentation]    viettel: 1, mobifone: 2, vinaphone: 3, zing: 4, vietnammobile: 5. Chi nhập số 
    [Arguments]    ${p_operator}
    IF    ${p_operator}!=1
        ${locator}    Set Variable    //div[text()='Chọn Nhà mạng']/following-sibling::div/div[1]/div[${p_operator}]
        Wait For Elements State    ${locator}   visible    15s
        Click    ${locator}
    END
    
    
Input Serial The Cao On Deposit The Cao Page
    [Arguments]    ${p_serial}
    ${locator}    Set Variable    (//input[@id='card_serial'])[1]
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_serial}

Input PIN The Cao On Deposit The Cao Page
    [Arguments]    ${p_pin}
    ${locator}    Set Variable    (//input[@id='card_code'])[1]
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_pin}

Select Menh Gia The Cao On Deposit The Cao Page
    [Arguments]    ${p_menh_gia}
    ${locator}    Set Variable    (//div[text()='Mệnh giá nạp'])[1]/../div[2]//*[normalize-space()='${p_menh_gia}K']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Click Button Nap Tien On Deposit The Cao Page
    ${locator}    Set Variable    (//button[text()='NẠP TIỀN'])[1]
    Wait For Elements State    ${locator}    visible
    Sleep    1s
    Click    ${locator}

    
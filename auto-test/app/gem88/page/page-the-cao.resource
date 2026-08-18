*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource



*** Keywords ***
Select Nha Mang On Deposit The Cao Page
    [Documentation]    viettel: 1, mobifone: 2, vinaphone: 3, zing: 4, vietnammobile: 5. Chi nhập số 
    [Arguments]    ${p_operator}
    IF    ${p_operator}!=1
        Wait For Element State And Click On It    //div[text()='Chọn Nhà mạng']/following-sibling::div/div[1]/div[${p_operator}]
    END
    
    
Input Serial The Cao On Deposit The Cao Page
    [Arguments]    ${p_serial}
    Wait For Element State And Fill Text    //div[@class='deposit-wrapper']/div[1]/div[2]//form//input[@id='card_serial']    ${p_serial}

Input PIN The Cao On Deposit The Cao Page
    [Arguments]    ${p_pin}
    Wait For Element State And Fill Text    //div[@class='deposit-wrapper']/div[1]/div[2]//form//input[@id='card_code']    ${p_pin}

Select Menh Gia The Cao On Deposit The Cao Page
    [Arguments]    ${p_menh_gia}
    Wait For Element State And Click On It    (//*[normalize-space()='${p_menh_gia}K'])[2]

Click Button Nap Tien On Deposit The Cao Page
    ${locator}    Set Variable    (//button[text()='NẠP TIỀN'])[2]
    Wait For Elements State    ${locator}    visible
    Sleep    1s
    Click    ${locator}
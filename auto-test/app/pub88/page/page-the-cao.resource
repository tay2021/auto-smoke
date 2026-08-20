*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Select Nha Mang On Deposit The Cao Page
    [Documentation]    viettel: 1, mobifone: 2, vinaphone: 3, zing: 4, vietnammobile: 5. Chi nhập số 
    [Arguments]    ${p_operator}
    Wait For Element State And Click On It    //div[text()='Bạn có']/following-sibling::div[1]/div[${p_operator}]/div
    
Input Serial The Cao On Deposit The Cao Page
    [Arguments]    ${p_serial}
    Wait For Element State And Fill Text    //input[@id='card_serial']    ${p_serial}

Input PIN The Cao On Deposit The Cao Page
    [Arguments]    ${p_pin}
    Wait For Element State And Fill Text    //input[@id='card_code']    ${p_pin}

Select Menh Gia The Cao On Deposit The Cao Page
    [Arguments]    ${p_menh_gia}
    Wait For Element State And Click On It    //input[@id='amount_deposit']/../following-sibling::span
    Wait For Element State And Click On It    //div[@class='ant-select-item-option-content']/div/span[text()='${p_menh_gia} K']

Click Button Nap Tien On Deposit The Cao Page
    Wait For Element State And Click On It    //button//span[text()='Nạp tiền']

    
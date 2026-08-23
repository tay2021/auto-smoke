*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
    Wait For Element State And Click On It    //button[@role='combobox']
    
Get Buy Price Base On Currency And Network On Deposit Crypto Page
    [Arguments]    ${p_currency}    ${p_network}
    ${text}    Wait For Element State And Get Text    (//span[normalize-space(.)='${p_currency} - ${p_network}'])[1]/following-sibling::span
    RETURN    ${text}

Select Currency And NetWork On Deposit Crypto Page
    [Arguments]    ${p_currency}    ${p_network}
    Wait For Element State And Click On It    (//span[normalize-space(.)='${p_currency} - ${p_network}'])[1]

Get Text Of Span Address On Deposit Crypto Page
    ${text}    Wait For Element State And Get Text    //span[text()='Địa chỉ Ví']/following-sibling::div/span
    RETURN    ${text}

Click On The Link Huong Dan Mua Crypto On Deposit Crypto Page
    Wait For Element State And Click On It    //button[text()='Xem hướng dẫn mua Crypto']

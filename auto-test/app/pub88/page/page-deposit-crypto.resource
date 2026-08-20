*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
    Wait For Element State And Click On It    //div[@class='ant-select-selector']

Select Currency And NetWork On Deposit Crypto Page
    [Arguments]    ${p_currency}    ${p_network}
    Wait For Element State And Click On It    (//span[normalize-space(.)='${p_currency} - ${p_network}'])[1]

Get Text Of Span Address On Deposit Crypto Page
    ${text}    Wait For Element State And Get Text    //span[text()='Địa chỉ Ví']/following-sibling::div/span
    RETURN    ${text}

Click On Link Huong Dan Dang Ky Binance On Deposit Crypto Page
    Wait For Element State And Click On It    (//div[text()='Hướng dẫn'])[1]/following-sibling::a[3]
    
Click On Link Huong Dan Nap Tien On Deposit Crypto Page
    Wait For Element State And Click On It    (//div[text()='Hướng dẫn'])[1]/following-sibling::a[1]

Click On Link Huong Dan Rut Tien On Deposit Crypto Page
    Wait For Element State And Click On It    (//div[text()='Hướng dẫn'])[1]/following-sibling::a[2]

Get Hyperlink Value Of Link Huong Dan Dang Ky Binance On Deposit Crypto Page
    ${value}    Wait For Element State And Get Attribute    (//div[text()='Hướng dẫn'])[1]/following-sibling::a[3]    href
    RETURN    ${value}

Get Hyperlink Value Of Link Huong Dan Nap Tien On Deposit Crypto Page
    ${value}    Wait For Element State And Get Attribute    (//div[text()='Hướng dẫn'])[1]/following-sibling::a[1]    href
    RETURN    ${value}

Get Hyperlink Value Of Link Huong Dan Rut Tien On Deposit Crypto Page
    ${value}    Wait For Element State And Get Attribute    (//div[text()='Hướng dẫn'])[1]/following-sibling::a[2]    href
    RETURN    ${value}

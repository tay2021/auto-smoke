*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
    Wait For Element State And Click On It    //div[text()='Chọn loại tiền ảo']/following-sibling::div//span[@class='ant-select-selection-item']
    
Get Buy Price Base On Currency And Network On Deposit Crypto Page
    [Arguments]    ${p_currency}    ${p_network}
    ${text}    Wait For Element State And Get Text    //div[@class='ant-select-item ant-select-item-group' and @title='${p_currency}']/following-sibling::div//img[@alt='${p_currency}']/following-sibling::img[@alt='${p_network}']/../following-sibling::span
    RETURN    ${text}

Select Currency And NetWork On Deposit Crypto Page
    [Arguments]    ${p_currency}    ${p_network}
    Wait For Element State And Click On It    //div[@class='ant-select-item ant-select-item-group' and @title='${p_currency}']/following-sibling::div//img[@alt='${p_currency}']/following-sibling::img[@alt='${p_network}']/../following-sibling::span

Get Text Of Span Address On Deposit Crypto Page
    ${text}    Wait For Element State And Get Text    //div[text()='Địa chỉ ví']/following-sibling::div/span
    RETURN    ${text}

Click On The Link Huong Dan Mua Crypto On Deposit Crypto Page
    Wait For Element State And Click On It    (//a[text()='Xem hướng dẫn mua Crypto'])[2]
    
Get Hyper Link Of Button Element Xem Huong dan mua Crypto On Deposit Crypto Page
    ${href}    Wait For Element State And Get Attribute    (//a[text()='Xem hướng dẫn mua Crypto'])[2]    href
    ${href}    Set Variable    ${href}[1:]
    RETURN    ${href}

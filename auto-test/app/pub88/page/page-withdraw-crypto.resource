*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On The Tab Crypto On The Withdraw Crypto Page
    Wait For Element State And Click On It    //div[text()='Crypto']

Click On The Dropdownlist Network On The Withdraw Crypto Page
    Wait For Element State And Click On It    //span[text()='Chọn loại tiền ảo']/../../following-sibling::div//*[@class='ant-select-selector']

Select Network From Dropdownlist Network On The Withdraw Crypto Page
    [Arguments]    ${p_network}
    Wait For Element State And Click On It    //span[text()='${p_network}']

Set Value On TextBox Address On The Withdraw Crypto Page
    [Arguments]    ${p_address}
    Wait For Element State And Fill Text    //input[@id='wallet_address']    ${p_address}

Set Value On TextBox Amount Withdraw On The Withdraw Crypto Page
    [Arguments]    ${p_amount}
    Wait For Element State And Fill Text    (//input[@id='amount_withdraw'])[2]    ${p_amount}

Set Value On TextBox Confirm Phone Number On The Withdraw Crypto Page
    [Arguments]    ${p_confirm_phone}
    ${locator_sodt}    Set Variable    (//input[@id='verify_phone'])[2]
    Wait For Elements State    ${locator_sodt}    visible
    Type Text    ${locator_sodt}    ${p_confirm_phone}    delay=0.5
    Sleep    2s
    Keyboard Key    press    Tab

Click On The Button Rut Tien On The Withdraw Crypto Page
    Wait For Element State And Click On It   (//span[text()='Rút tiền']/ancestor::button)[2]

Get Element Rut Tien Thanh Cong Qua Crypto On The Withdraw Crypto Page
    RETURN    //span[text()='Nhận yêu cầu rút tiền']
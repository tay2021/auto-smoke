*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On The Tab Crypto On The Withdraw Crypto Page
    Wait For Element State And Click On It    //div[@class='ant-tabs-nav-list']//div[text()='Crypto']

Click On The Dropdownlist Withdraw Network On The Withdraw Crypto Page
    Wait For Element State And Click On It    //span[@class='ant-select-selection-item']
    
Select Withdraw Network On The Withdraw Crypto Page
    [Arguments]    ${p_network_withdraw}
    Wait For Element State And Click On It    //div[@class='ant-select-item ant-select-item-group']/following-sibling::div//span[text()='${p_network_withdraw}']

Set Value On TextBox Address On The Withdraw Crypto Page
    [Arguments]    ${p_address}
    Wait For Element State And Fill Text    //textarea[contains(@placeholder,'VD:')]    ${p_address}

Set Value On TextBox Amount Withdraw On The Withdraw Crypto Page
    [Arguments]    ${p_amount}
    Sleep     0.5s
    ${locator_amount}    Set Variable    (//*[@id='amount_withdraw'])[2]
    Wait For Elements State    ${locator_amount}    visible
    Type Text    ${locator_amount}    ${p_amount}    delay=0.5
    Sleep    1s
    #Keyboard Key    press    Tab

Set Value On TextBox Confirm Phone Number On The Withdraw Crypto Page
    [Arguments]    ${p_confirm_phone}
    ${locator_sodt}    Set Variable    (//input[@id='verify_phone'])[2]
    Wait For Elements State    ${locator_sodt}    visible
    Type Text    ${locator_sodt}    ${p_confirm_phone}    delay=0.5
    Sleep    2s
    Keyboard Key    press    Tab

Click On The Button Rut Tien On The Withdraw Crypto Page
    Wait For Element State And Click On It    //button[text()='Tạo lệnh rút']

Get Element Rut Tien Thanh Cong Qua The Cao On The Withdraw Crypto Page
    RETURN    //*[contains(text(),'Yêu cầu rút đã được tạo!')]
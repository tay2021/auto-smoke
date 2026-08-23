*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On The Tab Crypto On The Withdraw Crypto Page
    Wait For Element State And Click On It    //img[@alt='Crypto']


Click On The Dropdownlist Withdraw Network On The Withdraw Crypto Page
    Wait For Element State And Click On It    //div[@class='withdraw-wrapper']//button[@role='combobox']
    
Select Withdraw Network On The Withdraw Crypto Page
    [Arguments]    ${p_network_withdraw}
    ${count}=    Get Element Count    //span[normalize-space()='${p_network_withdraw}']
    IF    ${count}==1
        Wait For Element State And Click On It    //span[normalize-space()='${p_network_withdraw}']
    ELSE
        Wait For Element State And Click On It    (//span[normalize-space()='${p_network_withdraw}'])[2]
    END


Set Value On TextBox Address On The Withdraw Crypto Page
    [Arguments]    ${p_address}
    Wait For Element State And Fill Text    //input[@id='wallet_address']    ${p_address}

Set Value On TextBox Amount Withdraw On The Withdraw Crypto Page
    [Arguments]    ${p_amount}
    Wait For Element State And Fill Text    //input[@name='amount_withdraw']    ${p_amount}

Set Value On TextBox Confirm Phone Number On The Withdraw Crypto Page
    [Arguments]    ${p_confirm_phone}
    ${locator_sodt}    Set Variable    //input[@name='confirm_phone_number']
    Wait For Elements State    ${locator_sodt}    visible
    Type Text    ${locator_sodt}    ${p_confirm_phone}    delay=0.5
    Sleep    2s
    Keyboard Key    press    Tab

Click On The Button Rut Tien On The Withdraw Crypto Page
    Wait For Element State And Click On It    //button[text()='RÚT TIỀN']

Get Element Rut Tien Thanh Cong Qua The Cao On The Withdraw Crypto Page
    RETURN    //span[text()='RÚT TIỀN THÀNH CÔNG']
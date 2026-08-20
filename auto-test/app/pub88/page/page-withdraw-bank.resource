*** Settings ***
Resource    ../../common/common-keywords.resource

*** Keywords ***
Click On Dropdownlist Bank Name On The Withdraw By Bank Page
    Wait For Element State And Click On It    //span[text()='Chọn ngân hàng']/preceding-sibling::span

Select First Bank Name On The Withdraw By Bank Page
    Wait For Element State And Click On It    //div[@role='listbox']/following-sibling::div/div[1]/div[1]/div[1]/div[1]    #select first bank

Set Value For Textbox Account Name On The Withdraw By Bank Page
    [Arguments]    ${p_account_name}
    Wait For Element State And Fill Text    //input[@id='to_bank_name']    ${p_account_name}

Set Value For Textbox Account Number On The Withdraw By Bank Page
    [Arguments]    ${p_account_no}
    Sleep    1s
    Wait For Element State And Fill Text    //input[@id='to_bank_no']    ${p_account_no}

Set Value For Textbox Amount Withdraw On The Withdraw By Bank Page
    [Arguments]    ${p_amount}
    Wait For Element State And Fill Text    //input[@id='amount_withdraw']    ${p_amount}

Set Value For Textbox Phone Number On The Withdraw By Bank Page
    [Arguments]    ${p_phone_number}
    Wait For Elements State    //input[@id='verify_phone']    visible
    Type Text    //input[@id='verify_phone']    ${p_phone_number}    delay=0.5
    Sleep    1s

Click On The Button Rut Tien On The Withdraw By Bank Page
    Wait For Element State And Click On It    //span[text()='Rút tiền']/ancestor::button

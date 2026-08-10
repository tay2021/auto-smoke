*** Settings ***
Resource    ../../import.resource

*** Keywords ***
Select Bank Name At Model Add Bank On Flash Page
    [Arguments]    ${p_bank_name}
    ${locator}    Set Variable    //span[text()='Chọn ngân hàng']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
    Wait For Elements State    //span[text()='${p_bank_name}']    visible
    Click    //span[text()='${p_bank_name}']
     
Input Bank Account Number At Model Add Bank On Flash Page
    [Arguments]    ${p_account_number}
    ${locator}    Set Variable    //input[@name='bank_account_no']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_account_number}


Input Bank Account Name At Model Add Bank On Flash Page
    [Arguments]    ${p_account_name}
    ${locator}    Set Variable    //input[@name='bank_account_name']
    Wait For Elements State    ${locator}    visible
    Fill Text    ${locator}    ${p_account_name}
   
Click Button Xac Nhan At Model Add Bank On Flash Page
    Sleep    0.5s
    ${locator}    Set Variable    //label[text()='Tên tài khoản']/../following-sibling::button
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
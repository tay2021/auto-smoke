*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Set Value On TextBox Amount On Withdraw Bank Page
    [Arguments]    ${p_amount}
    Wait For Element State And Fill Text    //*[text()='Số tiền (1 K = 1,000 VNĐ)']/../../../following-sibling::div//input    ${p_amount}
    
    
Set Value On TextBox So Dien Thoai On Withdraw Bank Page
    [Arguments]    ${p_phone_number}
    ${locator_sodt}    Set Variable    //*[text()='Xác nhận số điện thoại (5 chữ số cuối cùng)']/../../following-sibling::div//input
    Wait For Elements State    ${locator_sodt}    visible
    Type Text    ${locator_sodt}    ${p_phone_number}    delay=0.5
    Sleep    2s
    Keyboard Key    press    Tab
    
Click On The Button Rut Tien On Withdraw Bank Page
    Wait For Element State And Click On It    //button[text()='Rút tiền']
    
Select Bank Name From Dropdownlist On Withdraw Bank Page
    [Arguments]    ${p_bank_name}
    Wait For Element State And Click On It    //span[text()='Chọn ngân hàng']/..//input
    Wait For Element State And Click On It    //span[text()='${p_bank_name}']

Set Value On The TextBox Ten Tai Khoan On Withdraw Bank Page
    [Arguments]    ${p_ten_tk}
    Wait For Element State And Fill Text    //*[text()='Tên người nhận']/../../following-sibling::div//input    ${p_ten_tk}
    
Set Value On The TextBox So Tai Khoan On Withdraw Bank Page
    [Arguments]    ${p_so_tk}
    Sleep    0.5s
    Wait For Element State And Fill Text    //*[text()='Số tài khoản']/../../following-sibling::div//input    ${p_so_tk}

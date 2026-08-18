*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Set Value On TextBox Amount On Withdraw Bank Page
    [Arguments]    ${p_amount}
    Wait For Element State And Fill Text    //*[text()='Nhập số tiền cần rút']/preceding-sibling::input    ${p_amount}
    
    
Set Value On TextBox So Dien Thoai On Withdraw Bank Page
    [Arguments]    ${p_phone_number}
    ${locator_sodt}    Set Variable    //*[text()='Xác nhận số điện thoại']/preceding-sibling::input
    Wait For Elements State    ${locator_sodt}    visible
    Type Text    ${locator_sodt}    ${p_phone_number}    delay=0.5
    Sleep    2s
    Keyboard Key    press    Tab
    
Click On The Button Rut Tien On Withdraw Bank Page
    Wait For Element State And Click On It    //button[text()='RÚT TIỀN']
    
Select Bank Name From Dropdownlist On Withdraw Bank Page
    [Arguments]    ${p_bank_name}
    Wait For Element State And Click On It    //*[contains(@*[local-name()='href'], 'arrow-down')]
    Wait For Element State And Click On It    //*[text()='${p_bank_name}']

Set Value On The TextBox Ten Tai Khoan On Withdraw Bank Page
    [Arguments]    ${p_ten_tk}
    Wait For Element State And Fill Text    //*[text()='Tên chủ tài khoản']/preceding-sibling::input    ${p_ten_tk}
    
Set Value On The TextBox So Tai Khoan On Withdraw Bank Page
    [Arguments]    ${p_so_tk}
    Wait For Element State And Fill Text    //*[text()='Số tài khoản']/preceding-sibling::input    ${p_so_tk}

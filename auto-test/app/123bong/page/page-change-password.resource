*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Set Current Password Textbox On Change Password Form
    [Arguments]    ${p_cur_pass}
    Wait For Element State And Fill Text    //input[@id='password']    ${p_cur_pass}
    
Set New Password Textbox On Change Password Form
    [Arguments]    ${p_new_pass}
    Wait For Element State And Fill Text    //input[@id='newPassword']    ${p_new_pass}

Set Confirm New Password Textbox On Change Password Form
    [Arguments]    ${p_confirm_new_pass}
    Wait For Element State And Fill Text    //input[@id='confirmPassword']    ${p_confirm_new_pass}

Click Button Luu Mat Khau On Change Password Form
    Wait For Element State And Click On It    //button[text()='Lưu mật khẩu']

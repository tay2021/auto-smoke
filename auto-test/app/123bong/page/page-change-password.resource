*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${input_cur_pass}            //input[@id='password']
${input_new_pass}            //input[@id='newPassword']
${input_confirm_new_pass}    //input[@id='confirmPassword']
${btn_save_new_pass}         //button[text()='Lưu mật khẩu']



*** Keywords ***
Set Current Password Textbox On Change Password Form
    [Arguments]    ${p_cur_pass}
    Fill Text    ${input_cur_pass}    ${p_cur_pass}
    
Set New Password Textbox On Change Password Form
    [Arguments]    ${p_new_pass}
    Fill Text    ${input_new_pass}    ${p_new_pass}

Set Confirm New Password Textbox On Change Password Form
    [Arguments]    ${p_confirm_new_pass}
    Fill Text    ${input_confirm_new_pass}    ${p_confirm_new_pass}

Click Button Luu Mat Khau On Change Password Form
    Click    ${btn_save_new_pass}
    
    





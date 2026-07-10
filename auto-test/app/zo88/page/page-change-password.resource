*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${input_cur_pass}            //label[text()='Mật khẩu hiện tại']/preceding-sibling::input
${input_new_pass}            //label[text()='Mật khẩu mới']/preceding-sibling::input
${input_confirm_new_pass}    //label[text()='Xác nhận mật khẩu mới']/preceding-sibling::input
${btn_save_new_pass}         //form[@id='change-password-form']//button[text()='Lưu mật khẩu']



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
    
    





*** Settings ***
Resource    ../page/page-header.resource
Resource    ../page/page-change-password.resource
Resource    ../../common/common-keywords.resource




*** Keywords ***
Go to Change Password Page
    Go To    ${GL_LU88_URL}account/profile
    Wait For Elements State    //span[text()='Thay đổi']    visible
    Click    //span[text()='Thay đổi']
    
    
Change Password User
    [Arguments]    ${p_current_pass}    ${p_new_pass}
    Set Current Password Textbox On Change Password Form    ${p_current_pass}
    Set New Password Textbox On Change Password Form     ${p_new_pass}
    Set Confirm New Password Textbox On Change Password Form    ${p_new_pass}
    Click Button Luu Mat Khau On Change Password Form

Assert Change Password Successfully
    ${locator}=    Set Variable    //*[text()='Đổi mật khẩu thành công']
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}
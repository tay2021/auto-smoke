*** Settings ***
Resource    ../page/page-change-password.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-header.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-profile-information.resource




*** Keywords ***
Go to Change Password Page
    Click On The Avatar Image On Header Page
    Click On The Icon Account Profile On The Account Info Page


Change Password User
    [Arguments]    ${p_current_pass}    ${p_new_pass}
    Click On The Button Thay Doi Mat Khau At Profile Page
    Set Current Password Textbox On Change Password Form    ${p_current_pass}
    Set New Password Textbox On Change Password Form     ${p_new_pass}
    Set Confirm New Password Textbox On Change Password Form    ${p_new_pass}
    Click Button Luu Mat Khau On Change Password Form

Assert Change Password Successfully
    ${locator}=    Set Variable    //*[text()='Đổi mật khẩu thành công']
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}
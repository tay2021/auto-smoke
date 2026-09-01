*** Settings ***
Resource    ../page/page-change-password.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-footer-menu.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-profile-information.resource




*** Keywords ***
Go to Change Password Page
    Click On The Menu Tai Khoan On The Footer Menu
    Click On The Card Account Info On The Account Info Page
    Click On The Button Thay Doi Mat Khau On Profile Page


Change Password User
    [Arguments]    ${p_current_pass}    ${p_new_pass}
    Set Current Password Textbox On Change Password Form    ${p_current_pass}
    Set New Password Textbox On Change Password Form     ${p_new_pass}
    Set Confirm New Password Textbox On Change Password Form    ${p_new_pass}

Assert Change Password Not Successfully
    ${locator}=    Set Variable    //div[text()='Mật khẩu mới không được trùng với mật khẩu hiện tại!']
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}
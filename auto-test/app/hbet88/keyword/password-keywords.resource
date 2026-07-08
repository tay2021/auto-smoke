*** Settings ***
Resource    ../page/page-header.resource
Resource    ../page/page-change-password.resource
Resource    ../../common/common-keywords.resource




*** Keywords ***
Go to Change Password Page
    Go To    ${GL_HBET_URL}account/profile
    Wait For Elements State    //span[text()='Thay đổi']    visible
    Click    //span[text()='Thay đổi']
    
    
Change Password User
    [Arguments]    ${p_current_pass}    ${p_new_pass}
    Set Current Password Textbox On Change Password Form    ${p_current_pass}
    Set New Password Textbox On Change Password Form     ${p_new_pass}
    Set Confirm New Password Textbox On Change Password Form    ${p_new_pass}


Assert Change Password Not Successfully
    ${locator}=    Set Variable    //div[text()='Mật khẩu mới không được trùng với mật khẩu hiện tại!']
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}
*** Settings ***
Library    Browser


*** Variables ***
#${btn_dang_nhap}    (//button[@id='open-login-modal'])[1]
${img_avatar_profile}                    //img[@alt='avatar']
${img_avatar_profile_info}               //img[@alt='Thông tin tài khoản']
${txt_username_profile}                  css=#profile-form:nth-child(2) input[name='username']
${txt_fullname_profile}                 .root-account-content-wrapper form#profile-form:first-child input[name=fullname]
${txt_phone_profile}                    .root-account-content-wrapper form#verify-form:first-child input[name='phone']
${txt_telegram_profile}                 .root-account-content-wrapper form#verify-form:first-child input[name='telegram']
${txt_email_profile}                     .root-account-content-wrapper form#profile-form:first-child input[name=email]



*** Keywords ***
Get User Name Value On Profile Page
    ${value}    Get Attribute    ${txt_username_profile}    value
    RETURN    ${value}

Get Full Name Value On Profile Page
    ${value}    Get Text    ${txt_fullname_profile}
    RETURN    ${value}

Get Phone Value On Profile Page
    ${value}    Get Text    ${txt_phone_profile}
    RETURN    ${value}

Get Telegram Value On Profile Page
    ${value}    Get Text    ${txt_telegram_profile}
    RETURN    ${value}

Get Email Value On Profile Page
    ${value}    Get Text    ${txt_email_profile}
    RETURN    ${value}

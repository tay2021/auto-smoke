*** Settings ***
Library    Browser


*** Variables ***
${img_avatar_profile_info}               //img[@alt='Thông tin tài khoản']
${txt_username_profile}                  //span[text()='Thông tin cá nhân']/following-sibling::form//input[@name='username']
${txt_fullname_profile}                 //span[text()='Thông tin cá nhân']/following-sibling::form//input[@name='fullname']
${txt_phone_profile}                    //span[text()='Xác thực tài khoản']/following-sibling::form//input[@name='phone']
${txt_email_profile}                    //span[text()='Thông tin cá nhân']/following-sibling::form//input[@name='email']



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


Get Email Value On Profile Page
    ${value}    Get Text    ${txt_email_profile}
    RETURN    ${value}

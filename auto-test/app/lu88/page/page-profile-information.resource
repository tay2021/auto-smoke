*** Settings ***
Library    Browser


*** Variables ***
${img_avatar_profile_info}               //img[@alt='Thông tin tài khoản']
${txt_username_profile}                  //input[@id='username']
${txt_fullname_profile}                 //input[@placeholder='Nhập tên hiển thị']
${txt_phone_profile}                    //input[@placeholder='Số diện thoại']
${txt_email_profile}                    //input[@placeholder='Địa chỉ email']



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

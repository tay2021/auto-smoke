*** Settings ***
Resource    ../../import.resource


*** Variables ***
${img_avatar_profile_info}               //img[@alt='Thông tin tài khoản']
${txt_username_profile}                  //input[@id='username']
${txt_fullname_profile}                 //input[@placeholder='Nhập tên hiển thị']
${txt_phone_profile}                    //input[@placeholder='Số diện thoại']
${txt_email_profile}                    //input[@placeholder='Địa chỉ email']
${txt_telegram_profile}                //span[text()='Telegram ID']/../../following-sibling::div//button/div[1]/span[1]/span


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
    
Get Telegram Value On Profile Page
    ${value}    Get Text    ${txt_telegram_profile}
    RETURN    ${value}

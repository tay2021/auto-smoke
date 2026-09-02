*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get User Name Value On Profile Page
    ${value}    Wait For Element State And Get Attribute    //input[@id='username']    value
    RETURN    ${value}

Get Full Name Value On Profile Page
    ${value}    Wait For Element State And Get Text    //input[@placeholder='Nhập tên hiển thị']
    RETURN    ${value}

Get Phone Value On Profile Page
    ${value}    Wait For Element State And Get Text    //input[@placeholder='Số diện thoại']
    RETURN    ${value}

Get Email Value On Profile Page
    ${value}    Wait For Element State And Get Text    //input[@placeholder='Địa chỉ email']
    RETURN    ${value}
    
Get Telegram Value On Profile Page
    ${value}    Wait For Element State And Get Text    //span[text()='Telegram ID']/../../following-sibling::div//button/div[1]/span[1]/span
    RETURN    ${value}

Click On The Button Thay Doi Mat Khau On Profile Page
    Wait For Element State And Click On It    //span[text()='Thay đổi']

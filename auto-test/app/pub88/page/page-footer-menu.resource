*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource



*** Keywords ***
Click On The Menu Tai Khoan On The Footer Menu
    Wait For Element State And Click On It    //span[text()='Tài khoản']

Click On The Menu Nap Tien On The Footer Menu
    Wait For Element State And Click On It    //div[@id='footer-mb']/div/div[1]
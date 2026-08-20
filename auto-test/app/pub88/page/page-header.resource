*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click Button Dang Nhap On Header Page
    Wait For Element State And Click On It    //header//div[@class='flex items-center']//span[text()='Đăng nhập']
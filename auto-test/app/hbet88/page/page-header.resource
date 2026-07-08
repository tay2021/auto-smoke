*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${btn_dang_nhap_header}                  //span[contains(@class,'header-pc')]//button[text()='Đăng nhập']


*** Keywords ***
Click Button Dang Nhap On Header Page
    Wait For Elements State    ${btn_dang_nhap_header}    attached
    Click    ${btn_dang_nhap_header}







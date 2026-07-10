*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${btn_dang_nhap_header}                  //div[@title='Search']/following-sibling::div/button


*** Keywords ***
Click Button Dang Nhap On Header Page
    Wait For Elements State    ${btn_dang_nhap_header}    attached
    Click    ${btn_dang_nhap_header}

Go To Login Page
    Go To    ${GL_ZO88_URL}?popup=login







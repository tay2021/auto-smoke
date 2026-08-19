*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On The Menu Ngan Hang Cua Ban On The Account Info Page
    Wait For Element State And Click On It    (//span[text()='Ngân hàng của bạn'])[2]
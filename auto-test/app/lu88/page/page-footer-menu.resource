*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Click On The Tab Nap Tien On The Footer Menu Page
    Wait For Element State And Click On It    //div[@id='footer']//span[text()='Nạp tiền']/..
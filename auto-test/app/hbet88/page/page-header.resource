*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Click On The Avatar Image On Header Page
    Wait For Element State And Click On It    //header//span[contains(@class,'ant-avatar')]



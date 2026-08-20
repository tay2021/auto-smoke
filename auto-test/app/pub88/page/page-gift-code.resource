*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Locator Label Tille Gift Code On Gift Code Page
    RETURN    //main[@id='account-layout']//header[contains(@class,'box-shadow-home')]/following-sibling::div/p

Input Ma Gift Code On Textbox Gift Code On Gift Code Page
    [Arguments]    ${p_giftcode}
    Wait For Element State And Fill Text    (//input[@id='code'])[1]    ${p_giftcode}

Click Button Nhan Qua Ngay On Gift Code Page
    Wait For Element State And Click On It    (//button//span[text()='Nhận quà ngay'])[1]

Get Text Error Infor On Gift Code Page
    ${text}    Wait For Element State And Get Text    (//div[@id='code_help'])[1]//div
    RETURN    ${text}
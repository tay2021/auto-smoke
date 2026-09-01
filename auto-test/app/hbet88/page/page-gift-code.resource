*** Settings ***
Resource    ../../common/common-keywords.resource

*** Keywords ***
Get Locator Label Tille Gift Code On Gift Code Page
    RETURN    //header[contains(@class,'items-center')]/preceding-sibling::div/span[text()='Gift code']

Input Ma Gift Code On Textbox Gift Code On Gift Code Page
    [Arguments]    ${p_giftcode}
    Wait For Element State And Fill Text    (//input[contains(@placeholder,'VD:')])[1]    ${p_giftcode}

Click Button Nhan Qua Ngay On Gift Code Page
    Click    (//button[text()='Nhận quà ngay'])[1]

Get Text Error Infor On Gift Code Page
    ${value}    Wait For Element State And Get Text    (//div[@class='ant-form-item-explain-error'])[1]
    RETURN    ${value}
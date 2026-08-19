*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Locator Label Tille Gift Code On Gift Code Page
    ${locator}    Set Variable    //span[text()='GIFT CODE TẶNG BẠN!']
    RETURN    ${locator}

Input Ma Gift Code On Textbox Gift Code On Gift Code Page
    [Arguments]    ${p_giftcode}
    Wait For Element State And Fill Text    //div[text()='Nhập mã quà tặng']/following-sibling::div//input    ${p_giftcode}

Click Button Nhan Qua Ngay On Gift Code Page
    Wait For Element State And Click On It    //form[@id='giftcode-form']//button[text()='Nhận quà ngay']

Get Text Error Infor On Gift Code Page
    ${text}    Wait For Element State And Get Text    (//div[@class='text-signal-error text-xs'])[1]
    RETURN    ${text}
*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On Tab Nap Tien Crypto On Deposit Page
    Wait For Element State And Click On It    //span[text()='Crypto']

Click On Tab Nap Tien The Cao On Deposit Page
    Wait For Element State And Click On It    //div[@data-node-key='mobicard']/div[1]

Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    ${value}    Wait For Element State And Get Attribute    //div[text()='Thông tin giao dịch']/../following-sibling::div/div[1]/div[1]/img    src
    RETURN    ${value}

Click On Tab Nap Tien QR Code On Deposit Page
    Wait For Element State And Click On It    //div[text()='QR Code']
*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On Tab Nap Tien Crypto On Deposit Page
    Wait For Element State And Click On It    //div[text()='Crypto']

Click On Tab Nap Tien The Cao On Deposit Page
    Wait For Element State And Click On It    //div[@data-node-key='mobicard']/div[1]

Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    ${value}    Wait For Element State And Get Attribute    (//img[contains(@alt,'crypto qr')])[1]    src
    RETURN    ${value}

Click On Tab Nap Tien QR Code On Deposit Page
    Wait For Element State And Click On It    //div[text()='QR Code']
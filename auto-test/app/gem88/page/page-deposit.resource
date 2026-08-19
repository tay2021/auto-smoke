*** Settings ***
Resource    ../../common/common-keywords.resource


*** Variables ***
    

*** Keywords ***
Click On Tab Nap Tien Crypto On Deposit Page
    Wait For Element State And Click On It    //img[@alt='Crypto']

Click On Tab Nap Tien The Cao On Deposit Page
    Wait For Element State And Click On It    //img[@alt='Thẻ cào']


Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    ${value}    Wait For Element State And Get Attribute    //img[contains(@alt,'data:image/png;base64')]    src
    RETURN    ${value}

Click On Tab Nap Tien QR Code On Deposit Page
    Wait For Element State And Click On It    //img[@alt='QR Code']

*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Variables ***
    

*** Keywords ***
Click On Tab Nap Tien Crypto On Deposit Page
    Wait For Element State And Click On It    //span[contains(text(),'Crypto')]

Click On Tab Nap Tien The Cao On Deposit Page
    Wait For Element State And Click On It    //div[text()='Thẻ cào']

Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    ${locator}    Set Variable    (//img[contains(@alt,'data:image/png;base64')])[1]
    ${value}    Get Attribute    ${locator}    src
    RETURN    ${value}

Click On Tab Nap Tien QR Code On Deposit Page
    ${tab_the_cao}    Set Variable    //div[text()='QR Code']
    Wait For Elements State    ${tab_the_cao}    visible
    Click    ${tab_the_cao}
    




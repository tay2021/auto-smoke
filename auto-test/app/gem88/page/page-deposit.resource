*** Settings ***
Library    Browser


*** Variables ***
    

*** Keywords ***
Click On Tab Nap Tien Crypto On Deposit Page
    ${tab_crypto}    Set Variable    (//a[@href='/account/deposit/crypto'])[2]
    Wait For Elements State    ${tab_crypto}    visible
    Click    ${tab_crypto}

Click On Tab Nap Tien The Cao On Deposit Page
    ${tab_the_cao}    Set Variable    (//a[@href='/account/deposit/scratch-card'])[2]
    Wait For Elements State    ${tab_the_cao}    visible
    Click    ${tab_the_cao}


Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    ${locator}    Set Variable    //img[contains(@alt,'data:image/png;base64')]
    ${value}    Get Attribute    ${locator}    src
    RETURN    ${value}

Click On Tab Nap Tien QR Code On Deposit Page
    ${tab_the_cao}    Set Variable    //div[@class='root-account-content-wrapper']/div[1]/div[2]//span[text()='QR Code']
    Wait For Elements State    ${tab_the_cao}    visible
    Click    ${tab_the_cao}
    




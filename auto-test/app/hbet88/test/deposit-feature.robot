*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Resource    ../keyword/deposit-keywords.resource

Test Teardown    Close Browser And Terminate Test Running




*** Test Cases ***
As a user I want to deposit by crypto correct
    [Tags]    smoke    deposit-crypto
    Open Hbet Site On Device    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Crypto Correct

As a user I want to check available network crypto deposit correct
    [Tags]    smoke    deposit-crypto-price     
    Open Hbet Site On Device    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Available Crypto Networks are correct
    
As a user I want to check address deposit network is correct
    [Tags]    smoke    deposit-crypto-address    
    Open Hbet Site On Device    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Crypto Network Addresses are correct

As a user I want to check link huong dan deposit withdraw by crypto
    [Tags]    smoke    deposit-crypto-guild
    Open Hbet Site On Device    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Link Huong Dan Nap Rut Crypto Correct

As a user I want to deposit by the cao correct
    [Tags]    smoke    deposit-card
    Open Hbet Site On Device    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${USERNAME_BANK_CC}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By The Cao Correct

As a user I want to deposit by flash pay correct
    [Tags]    smoke    deposit-flash
    Open Hbet Site On Device    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${USERNAME_BANK_CC}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    ${amount}    Set Variable    200
    Assert Create Phieu Nap By Flash Pay Correct    ${amount}
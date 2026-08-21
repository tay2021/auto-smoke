*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../gem88-variable.resource
Resource    ../keyword/deposit-keywords.resource

Test Teardown    Close Browser And Terminate Test Running




*** Test Cases ***
As a user I want to deposit by crypto correct
    [Tags]    smoke    deposit-crypto    
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Deposit Page
    Assert Create Phieu Nap By Crypto Correct

As a user I want to check available network crypto deposit correct
    [Tags]    smoke    deposit-crypto-price    
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Deposit Page
    Assert Available Crypto Networks are correct

As a user I want to check address deposit network is correct
    [Tags]    smoke    deposit-crypto-address
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Deposit Page
    Assert Crypto Network Addresses are correct

As a user I want to check link huong dan deposit withdraw by crypto
    [Tags]    smoke    deposit-crypto-guild
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Close Lucky Wheel Notification If Shown
    Go To Deposit Page
    Assert Link Huong Dan Nap Rut Crypto Correct

As a user I want to deposit by the cao correct
    [Tags]    smoke    deposit-card
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Close Lucky Wheel Notification If Shown
    Go To Deposit Page
    Assert Create Phieu Nap By The Cao Correct

As a user I want to deposit by flash pay correct
    [Tags]    smoke    deposit-flash
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Deposit Page
    Assert Create Phieu Nap By Flash Pay Correct
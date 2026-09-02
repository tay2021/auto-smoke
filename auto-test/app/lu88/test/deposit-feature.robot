*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/deposit-keywords.resource

Test Teardown    Close Browser And Terminate Test Running


*** Test Cases ***
As a user I want to deposit by crypto correct
    [Tags]    smoke    deposit-crypto
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Crypto Correct

As a user I want to check available network crypto deposit correct
    [Tags]    smoke    deposit-crypto-price    
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Available Crypto Networks are correct

As a user I want to check address deposit network is correct
    [Tags]    smoke    deposit-crypto-address
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Crypto Network Addresses are correct

As a user I want to check link huong dan deposit withdraw by crypto
    [Tags]    smoke    deposit-crypto-guild
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Link Huong Dan Nap Rut Crypto Correct

As a user I want to deposit by the cao correct
    [Tags]    smoke    deposit-card   
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Go To Deposit The Cao Page
    ${nha_mang}    Set Variable    1
    ${serial}    Set Variable    55555555555555
    ${pin}    Set Variable    555555555555
    ${menh_gia}    Set Variable    10
    Assert Create Phieu Nap By The Cao Correct    ${nha_mang}    ${serial}    ${pin}    ${menh_gia}
    
As a user I want to deposit by flash pay correct
    [Tags]    smoke    deposit-flash
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    #Go To Deposit Flash Page
    ${amount}    Set Variable    400
    Assert Create Phieu Nap By Flash Pay Correct    ${amount}
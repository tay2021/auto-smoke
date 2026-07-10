*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/deposit-keywords.resource

Test Teardown    Close Browser And Terminate Test Running




*** Test Cases ***
As a user I want to deposit by crypto correct
    [Tags]    smoke    deposit-crypto    
    Open Lu88 Site And Maximize Window    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Crypto Correct

As a user I want to deposit by the cao correct
    [Tags]    smoke    deposit-card    
    Open Lu88 Site And Maximize Window    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By The Cao Correct

As a user I want to deposit by flash pay correct
    [Tags]    smoke    deposit-card
    Open Lu88 Site And Maximize Window    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Flash Pay Correct
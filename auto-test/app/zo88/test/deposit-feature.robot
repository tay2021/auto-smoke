*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../zo88-variable.resource
Resource    ../keyword/deposit-keywords.resource

Test Teardown    Close Browser And Terminate test running




*** Test Cases ***
As a user I want to deposit by crypto correct
    [Tags]    smoke    deposit-crypto    
    Open Zo88 Site And Maximize Window    ${GL_ZO88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Zo88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Crypto Correct

As a user I want to deposit by the cao correct
    [Tags]    smoke    deposit-card    
    Open Zo88 Site And Maximize Window    ${GL_ZO88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Zo88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By The Cao Correct

As a user I want to deposit by flash pay correct
    [Tags]    smoke    flash
    Open Zo88 Site And Maximize Window    ${GL_ZO88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Zo88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Flash Pay Correct
*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/deposit-keywords.resource

Test Teardown    Close Browser And Terminate Test Running




*** Test Cases ***
As a user I want to deposit by crypto correct
    [Tags]    smoke    deposit-crypto    
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Crypto Correct

As a user I want to deposit by the cao correct
    [Tags]    smoke    deposit-card    
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By The Cao Correct

As a user I want to deposit by flash pay correct
    [Tags]    smoke    flash
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Deposit Page
    Assert Create Phieu Nap By Flash Pay Correct
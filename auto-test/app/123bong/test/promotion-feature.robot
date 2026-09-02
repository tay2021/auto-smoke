*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/promotion-keywords.resource


Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check user promotion commission correct
    [Tags]    smoke    promotion
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_VALID}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To User Promotion Page
    Assert User Promotion Page Show Correct

As a user I want to check user promotion 100% correct
    [Tags]    smoke    promotion
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_KM100%}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To User Promotion Page
    Assert User Promotion Page Show Correct
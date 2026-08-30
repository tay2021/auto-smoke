*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/promotion-keywords.resource


Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check user promotion with commission correct
    [Tags]    smoke    promotion
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To User Promotion Page
    Assert User Promotion Page Show Correct

As a user I want to check user promotion with 100% correct
    [Tags]    smoke    promotion
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_100%}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To User Promotion Page
    Assert User Promotion Page Show Correct
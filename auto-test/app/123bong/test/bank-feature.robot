*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/bank-keywords.resource

Test Teardown    Close Browser And Terminate Test Running


*** Test Cases ***
As a user I want to check user with bank correct
    [Tags]    smoke    user-bank
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_VALID}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Quan Ly Bank Page
    Assert Quan Ly Bank Page Show Correct

As a user I want to check user without bank correct
    [Tags]    smoke    user-bank
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_KM100%}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Quan Ly Bank Page
    Assert Quan Ly Bank Page Show Correct

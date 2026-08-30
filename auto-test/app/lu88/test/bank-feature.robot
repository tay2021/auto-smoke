*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/bank-keywords.resource

Test Teardown    Close Browser And Terminate Test Running


*** Test Cases ***
As a user I want to check user bank correct
    [Tags]    smoke    user-bank
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Quan Ly Bank Page
    Assert Quan Ly Bank Page Show Correct

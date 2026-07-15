*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Lu88 Dai ly successfully
    [Tags]    smoke    login-daily
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
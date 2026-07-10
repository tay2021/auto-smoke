*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/giftcode-keywords.resource


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check claim gift code correct
    [Tags]    smoke    gift-code
    Open Lu88 Site And Maximize Window    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Gift Code Page
    Assert Claim Gift Code Correct

*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Resource    ../keyword/giftcode-keywords.resource


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check claim gift code correct
    [Tags]    smoke    gift-code
    Open Hbet Site And Maximize Window    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Gift Code Page
    Assert Claim Gift Code Correct

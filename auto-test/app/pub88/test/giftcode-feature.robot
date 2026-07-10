*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../pub88-variable.resource
Resource    ../keyword/giftcode-keywords.resource


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check claim gift code correct
    [Tags]    smoke    gift-code
    Open Pub88 Site And Maximize Window    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Gift Code Page
    Assert Claim Gift Code Correct

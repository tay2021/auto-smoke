*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/promotion-keywords.resource


Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check user promotion correct
    [Tags]    smoke    promotion
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To User Promotion Page
    Assert User Promotion Page Show Correct
*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../gem88-variable.resource
Resource    ../keyword/promotion-keywords.resource


Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check user promotion correct
    [Tags]    smoke    promotion
    Open Gem88 Site And Maximize Window    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To User Promotion Page
    Assert User Promotion Page Show Correct



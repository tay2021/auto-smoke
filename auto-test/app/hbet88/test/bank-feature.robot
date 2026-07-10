*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Resource    ../keyword/bank-keywords.resource

Test Teardown    Close Browser And Terminate Test Running


*** Test Cases ***
As a user I want to check user bank correct
    [Tags]    smoke    user-bank
    Open Hbet Site And Maximize Window    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Quan Ly Bank Page
    Assert Quan Ly Bank Page Show Correct

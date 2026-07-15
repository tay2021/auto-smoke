*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/bank-keywords.resource

Test Teardown    Close Browser And Terminate Test Running


*** Test Cases ***
As a user I want to check user bank correct
    [Tags]    smoke    user-bank
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Quan Ly Bank Page
    Assert Quan Ly Bank Page Show Correct

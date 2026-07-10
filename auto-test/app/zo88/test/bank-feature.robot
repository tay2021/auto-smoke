*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../zo88-variable.resource
Resource    ../keyword/bank-keywords.resource

Test Teardown    Close Browser And Terminate test running


*** Test Cases ***
As a user I want to check user bank correct
    [Tags]    smoke    user-bank
    Open Zo88 Site And Maximize Window    ${GL_ZO88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Zo88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Quan Ly Bank Page
    Assert Quan Ly Bank Page Show Correct

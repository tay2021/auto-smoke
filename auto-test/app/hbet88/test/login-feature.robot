*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Hbet successfully
    [Tags]    smoke    login
    Open Hbet Site And Maximize Window    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
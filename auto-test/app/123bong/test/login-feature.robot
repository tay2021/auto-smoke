*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site 123Bong successfully
    [Tags]    smoke    login
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully


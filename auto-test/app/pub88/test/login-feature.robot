*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../pub88-variable.resource
Library    OperatingSystem

Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Pub88 successfully
    [Tags]    smoke    login
    Open Pub88 Site And Maximize Window    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
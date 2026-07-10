*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../zo88-variable.resource
Library    OperatingSystem

Test Teardown    Close Browser And Terminate test running



*** Test Cases ***
As a user I want to check Login to site Zo88 successfully
    [Tags]    smoke    login
    Open Zo88 Site And Maximize Window    ${GL_ZO88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Zo88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
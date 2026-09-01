*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../gem88-variable.resource
Library    OperatingSystem

Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Gem88 successfully
    [Tags]    smoke    temp-login
    Open Gem88 site on device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    testing    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
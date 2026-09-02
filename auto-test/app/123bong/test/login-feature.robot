*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource

Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check Login to site Lu88 successfully
    [Tags]    smoke    login
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_VALID}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
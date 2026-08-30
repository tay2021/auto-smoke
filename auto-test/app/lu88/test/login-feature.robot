*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Lu88 successfully
    [Tags]    smoke    login
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
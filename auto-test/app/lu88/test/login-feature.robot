*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Delete Temp Folder Of Profile Browser



*** Test Cases ***
As a user I want to check Login to site Lu88 successfully
    [Tags]    smoke    login
    Open Lu88 Site And Maximize Window    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully


*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/password-keywords.resource

Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check change password correct
    [Tags]    smoke    password
    Open Lu88 Site And Maximize Window    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Go To Change Password Page
    ${cur_pass}=    Set Variable    ${VALID_PASSWORD}
    ${new_pass}=    Set Variable    ${VALID_PASSWORD}
    Change Password User     ${cur_pass}    ${new_pass}
    Assert Change Password Successfully
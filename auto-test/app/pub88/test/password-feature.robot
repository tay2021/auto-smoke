*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../pub88-variable.resource
Resource    ../keyword/password-keywords.resource

Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check change password correct
    [Tags]    smoke    password
    Open Pub88 Site And Maximize Window    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Go To Change Password Page
    ${cur_pass}=    Set Variable    ${VALID_PASSWORD}
    ${new_pass}=    Set Variable    ${VALID_PASSWORD}
    Change Password User     ${cur_pass}    ${new_pass}
    Assert Change Password Not Successfully
*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Resource    ../keyword/password-keywords.resource

Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check change password correct
    [Tags]    smoke    password
    Open Hbet Site And Maximize Window    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Go To Change Password Page
    ${cur_pass}=    Set Variable    ${VALID_PASSWORD}
    ${new_pass}=    Set Variable    ${VALID_PASSWORD}
    Change Password User     ${cur_pass}    ${new_pass}
    Assert Change Password Not Successfully
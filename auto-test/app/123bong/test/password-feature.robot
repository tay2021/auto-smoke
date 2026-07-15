*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/password-keywords.resource

Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check change password correct
    [Tags]    smoke    password
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Go To Change Password Page
    ${cur_pass}=    Set Variable    ${VALID_PASSWORD}
    ${new_pass}=    Set Variable    ${VALID_PASSWORD}
    Change Password User     ${cur_pass}    ${new_pass}
    Assert Change Password Successfully
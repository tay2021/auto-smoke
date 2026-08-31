*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../../common/common-keywords.resource
Resource    ../keyword/user-profile-keywords.resource


Test Teardown    Close Browser And Terminate Test Running


*** Test Cases ***
As a user I want to check Profile user correct
    [Tags]    smoke    profile
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Profile Page
    Assert Profile Information Are Correct
*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Resource    ../keyword/vip-keywords.resource

Test Teardown    Close Browser And Delete Temp Folder Of Profile Browser


*** Test Cases ***
As a user I want to check vip level user correct
    [Tags]    smoke    vip
    Open Hbet Site And Maximize Window    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To VIP User Page
    Assert VIP User Page Show Correct
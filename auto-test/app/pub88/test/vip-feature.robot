*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../pub88-variable.resource
Resource    ../keyword/vip-keywords.resource

Test Teardown    Close Browser And Delete Temp Folder Of Profile Browser


*** Test Cases ***
As a user I want to check vip level user correct
    [Tags]    smoke    vip
    Open Pub88 Site And Maximize Window    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To VIP User Page
    Assert VIP User Page Show Correct
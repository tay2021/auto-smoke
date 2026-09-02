*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/p2p-keywords.resource

Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check P2p transaction correct
    [Tags]    smoke    p2p
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_VALID}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Giao Dich P2p Page
    Assert Page Giao Dich P2p Show Correct

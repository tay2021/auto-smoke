*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/p2p-keywords.resource

Test Teardown    Close Browser And Terminate Test Running

*** Test Cases ***
As a user I want to check P2p transaction correct
    [Tags]    smoke    p2p
    Open Lu88 Site On Device    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Lu88    ${USERNAME_DAILY}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Go To Giao Dich P2p Page
    Assert Page Giao Dich P2p Show Correct







    


    

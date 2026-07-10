*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../zo88-variable.resource
Resource    ../keyword/p2p-keywords.resource

Test Teardown    Close Browser And Terminate test running

*** Test Cases ***
As a user I want to check P2p transaction correct
    [Tags]    smoke    p2p
    Open Zo88 Site And Maximize Window    ${GL_ZO88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Zo88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Go To Giao Dich P2p Page
    Assert Page Giao Dich P2p Show Correct







    


    

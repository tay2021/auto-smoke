*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Resource    ../keyword/p2p-keywords.resource

Test Teardown    Close Browser And Delete Temp Folder Of Profile Browser

*** Test Cases ***
As a user I want to check P2p transaction correct
    [Tags]    smoke    p2p
    Open Hbet Site And Maximize Window    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Login To Site Hbet    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site Successfully
    Go To Giao Dich P2p Page
    Assert Page Giao Dich P2p Show Correct







    


    

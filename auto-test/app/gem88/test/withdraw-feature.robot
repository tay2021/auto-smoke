*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../gem88-variable.resource
Resource    ../keyword/withdraw-keywords.resource

Test Teardown    Close Browser And Delete Temp Folder Of Profile Browser



*** Test Cases ***
As a user I want to withdraw correct
    [Tags]    smoke    withdraw
    Open Gem88 Site And Maximize Window    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Withdraw Page
    Assert Withdraw Correct



   
*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../gem88-variable.resource
Resource    ../keyword/withdraw-keywords.resource

Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to withdraw by bank successfully
    [Tags]    smoke    withdraw    
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Withdraw Page
    Assert Withdraw Correct

As a user I can not withdraw if have rolling successfully
    [Tags]    smoke    withdraw-has-rolling
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USER_ROLLING}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Withdraw Page
    Assert Withdraw Correct

As a user I can withdraw by mobi card successfully
    [Tags]    smoke    withdraw-mobi-card
    Open Gem88 Site On Device    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Gem88    ${VALID_USER_WITHDRAW}    ${VALID_PASSWORD}
    Assert Login To Site88 Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Close Lucky Wheel Notification If Shown
    Go To Withdraw Page
    Withdraw By Mobi Card    1    100    11111    1
    Assert Withdraw By Mobi Card Successfully
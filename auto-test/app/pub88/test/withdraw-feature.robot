*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../pub88-variable.resource
Resource    ../keyword/withdraw-keywords.resource

Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to withdraw by bank successfully
    [Tags]    smoke    withdraw-by-flash    
    Open Pub88 Site On Device    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${VALID_USERNAME}    ${VALID_PASSWORD}    # có bank chính chủ
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    Assert Withdraw Correct

As a user I want to check user can not withdraw if have rolling successfully
    [Tags]    smoke    withdraw-by-flash
    Open Pub88 Site On Device    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${USER_KM_100%}    ${VALID_PASSWORD}    # user có rolling
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    Assert Withdraw Correct
    
As a user I can withdraw by mobi card successfully
    [Tags]    smoke    withdraw-mobi-card    
    Open Pub88 Site On Device    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${USER_WITHDRAW_MOBI}    ${VALID_PASSWORD}    # user có rolling
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    Withdraw By Mobi Card    1    100    11111    1
    Assert Withdraw By Mobi Card Successfully
    
As a user I can withdraw by crypto successfully
    [Tags]    smoke    withdraw-crypto
    Open Pub88 Site On Device    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Login To Site Pub88    ${USER_WITHDRAW_MOBI}    ${VALID_PASSWORD}    # user có rolling
    Assert Login To Site Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    Withdraw By Crypto    TRC20    TEmkQ6ViSU5Mg64Euw2duH2XP9gdfwBY5k    200    11111
    Assert Withdraw By Crypto Successfully


   
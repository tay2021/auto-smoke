*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/withdraw-keywords.resource

Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to withdraw with existing rolling correct
    [Tags]    smoke    withdraw    
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_KM100%}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    Assert Withdraw Correct
    
As a user I want to withdraw without rolling successfully
    [Tags]    smoke    withdraw
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_VALID}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    Assert Withdraw Correct
    
As a user I can withdraw by mobi card successfully
    [Tags]    smoke    withdraw-mobi-card
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_WITHDRAW_MOBI}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    Withdraw By Mobi Card    1    100    11111    1
    Assert Withdraw By Mobi Card Successfully

As a user I can withdraw by crypto successfully
    [Tags]    smoke    withdraw-crypto
    Open 123Bong Site On Device    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${USERNAME_WITHDRAW_CRYPTO}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Withdraw Page
    ${network-withdraw}=    Set Variable    TRC20
    ${address-withdraw}=    Set Variable    TEmkQ6ViSU5Mg64Euw2duH2XP9gdfwBY5k
    ${amount}=    Set Variable    200
    ${confirm-phone}=    Set Variable    11111
    Withdraw By Crypto    ${network-withdraw}    ${address-withdraw}    ${amount}    ${confirm-phone}
    #Confirm Withdraw By Crypto Correct    USDT - ${network-withdraw}    ${address-withdraw}    ${amount}
    Assert Withdraw By Crypto Successfully
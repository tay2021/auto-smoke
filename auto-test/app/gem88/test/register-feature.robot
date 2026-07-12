*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../gem88-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Lu88 Dai ly successfully
    [Tags]    smoke    register
    Open Gem88 Site And Maximize Window    ${GL_GEM88_URL}
    Close Welcome Pop Up If Shown
    #Open Register Form    ${GL_PUB88_URL}/?i=tester&popup=register
    Open Register Form    ${GL_GEM88_URL}/?i=tester&popup=login
    ${username}    Generate Random Username    tayg
    ${password}    Set Variable    123456
    ${phone_number}    Set Variable    09111111111
    Register An Gem88 Account    ${username}    ${password}    ${phone_number}
    Assert Register An Account Successfully    ${username}



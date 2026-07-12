*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../pub88-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Pub88 Dai ly successfully
    [Tags]    smoke    register
    Open Pub88 Site And Maximize Window    ${GL_PUB88_URL}
    Close Welcome Pop Up If Shown
    Open Register Form    ${GL_PUB88_URL}/?i=tester&popup=register
    ${username}    Generate Random Username    tayp
    ${password}    Set Variable    123456
    ${phone_number}    Set Variable    09111111111
    Register An Pub88 Account    ${username}    ${password}    ${phone_number}
    Assert Register An Account Successfully



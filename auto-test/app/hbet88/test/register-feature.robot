*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../hbet-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Hbet Dai ly successfully
    [Tags]    smoke    register
    Open Hbet Site And Maximize Window    ${GL_HBET_URL}
    Close Welcome Pop Up If Shown
    Open Register Form    ${GL_HBET_URL}/?i=tester&popup=register
    ${username}    Generate Random Username    tayhb
    ${password}    Set Variable    123456
    ${phone_number}    Set Variable    09111111111
    Register An HBet Account    ${username}    ${password}    ${phone_number}
    Assert Register An Account Successfully



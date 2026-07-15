*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site 123Bong successfully
    [Tags]    smoke    register
    Open 123bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Open Register Form    ${GL_123BONG_URL}/?i=tester&popup=register
    ${username}    Generate Random Username    tayb
    ${password}    Set Variable    123456
    ${phone_number}    Set Variable    09111111111
    Register An 123Bong Account    ${username}    ${password}    ${phone_number}
    Assert Register An Account Successfully



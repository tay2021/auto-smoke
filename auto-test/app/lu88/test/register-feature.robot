*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Library    OperatingSystem
Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Login to site Lu88 Dai ly successfully
    [Tags]    smoke    register
    Open Lu88 Site And Maximize Window    ${GL_LU88_URL}
    Close Welcome Pop Up If Shown
    Open Register Form    ${GL_LU88_URL}/?i=tester&popup=register
    ${username}    Generate Random Username    tayl
    ${password}    Set Variable    123456
    ${phone_number}    Set Variable    09111111111
    Register An Lu88 Account    ${username}    ${password}    ${phone_number}
    Assert Register An Account Successfully



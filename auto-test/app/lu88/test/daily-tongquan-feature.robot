*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/daily-tongquan-keywords.resource
Library    OperatingSystem


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check tong quan dai ly hom nay
    [Tags]    smoke    tong-quan    daily
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
    Assert Tong Quan Dai Ly Hom Nay Correct


As a user I want to check tong quan dai ly trong vong 7 ngay
    [Tags]    smoke    tong-quan    daily    
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
    Assert Tong Quan Dai Ly Trong Vong 7 Ngay Correct

As a user I want to check tong quan dai ly trong vong 30 ngay
    [Tags]    smoke    tong-quan    daily
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
    Assert Tong Quan Dai Ly Trong Vong 30 Ngay Correct
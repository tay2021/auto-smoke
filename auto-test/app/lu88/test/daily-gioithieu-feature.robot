*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/daily-gioithieu-keywords.resource
Library    OperatingSystem


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check tong quan dai ly hom nay
    [Tags]    smoke    doanh-so    daily
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
    Go To Page Gioi Thieu Dai Ly
    Assert Gioi Thieu Page Correct




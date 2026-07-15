*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/daily-doanhso-keywords.resource
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
    Go To Page Doanh So Dai Ly
    ${dict}    Get Current From Date And To Date Selected By Default
    ${from_date}    Set Variable    ${dict.from_date}
    ${to_date}    Set Variable    ${dict.to_date}
    Assert Doanh So From Date To Date Correct    ${from_date}    ${to_date}


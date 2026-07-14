*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../lu88-variable.resource
Resource    ../keyword/daily-baocao-keywords.resource
Library    OperatingSystem


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check bao cao quan ly hoi vien
    [Tags]    smoke    bao-cao    daily
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
    Go To Page Bao Cao Quan Ly Hoi Vien
    ${dict}    Get Current From Date And To Date Selected By Default On Chi Tiet Quan Ly Hoi Vien
    ${from_date}    Set Variable    ${dict.from_date}
    ${to_date}    Set Variable    ${dict.to_date}
    Assert Chi Tiet Quan Ly Hoi Vien Correct    ${from_date}    ${to_date}

As a user I want to check bao cao quan ly dai ly
    [Tags]    smoke    bao-cao    daily
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
    Go To Page Bao Cao Quan Ly Dai Ly
    ${dict}    Get Current From Date And To Date Selected By Default On Chi Tiet Quan Ly Dai Ly
    ${from_date}    Set Variable    ${dict.from_date}
    ${to_date}    Set Variable    ${dict.to_date}
    Assert Chi Tiet Quan Ly Dai Ly Correct    ${from_date}    ${to_date}

As a user I want to check bao cao tong cuoc theo game category
    [Tags]    smoke    bao-cao    daily
    Open Lu88 Site And Maximize Window    ${GL_LU88_DAILY_URL}
    Go To Site Lu88 Dai Ly    ${GL_LU88_DAILY_URL}
    Login To Site Lu88 Dai Ly    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep    1s
    Get And Set Bearer Token From Cookie After Login Successfully
    Assert Login To Site Lu88 Dai Ly Successfully
    Go To Page Bao Cao Quan Cuoc Theo Game Category
    ${dict}    Get Current From Date And To Date Selected By Default On Chi Tiet Quan Ly Dai Ly
    ${from_date}    Set Variable    ${dict.from_date}
    ${to_date}    Set Variable    ${dict.to_date}
    Assert Chi Tiet Quan Ly Cuoc Theo Game Category Correct    ${from_date}    ${to_date}






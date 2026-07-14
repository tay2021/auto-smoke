*** Settings ***
Library    DateTime
Resource    ../../common/common-keywords.resource
Resource    ../page/page-daily-gioithieu.resource
Resource    ../api-keywords/user-api-request.resource


*** Keyword ***
Go To Page Gioi Thieu Dai Ly
    Go To    ${GL_LU88_DAILY_URL}campaign
    
Assert Gioi Thieu Page Correct
    ${response}    Send GET Request To Get Profile User    ${GL_BEARER_TOKEN}
    ${content_api_profile}    Get Content Of Api Profile     ${response}
    ${json}    Convert String To Json    ${content_api_profile}
    ${id}    Get Value From Json    ${json}    $.data.id
    ${id}    Set Variable    ${id}[0]
    ${actual_link}=    Get Link Gioi Thieu On Gioi Thieu Page
    ${expected_link}=    Set Variable    ${GL_LU88_URL}?invite=${id}
    Should Be True    '${actual_link}'=='${expected_link}'
    ${actual_id}=    Get Div Id Gioi Thieu On Gioi Thieu Page
    Should Be True    '${actual_id}'=='${id}'
    
    
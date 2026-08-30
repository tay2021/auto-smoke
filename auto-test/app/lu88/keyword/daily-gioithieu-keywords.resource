*** Settings ***
Resource    ../../import.resource    
Resource    ../../common/common-keywords.resource
Resource    ../page/page-daily-gioithieu.resource
Resource    ../page/page-daily-left-menu.resource
Resource    ../../common/user-api-request.resource


*** Keywords ***
Go To Page Gioi Thieu Dai Ly
    Click On The Hamburge Menu On Left Menu Page
    Click On The Menu Gioi Thieu On Left Menu Page
    
Assert Gioi Thieu Page Correct
    ${response}    Send GET Request To Get Profile User    ${GL_LU88_GATEWAY_URL}    ${GL_BEARER_TOKEN}
    ${dict}    Evaluate    json.loads('''${response}''')    modules=json
    ${id}    Get From Dictionary    ${dict['data']}    id
    ${actual_link}=    Get Link Gioi Thieu On Gioi Thieu Page
    ${expected_link}=    Set Variable    ${GL_LU88_URL}?invite=${id}
    Should Be True    '${actual_link}'=='${expected_link}'
    ${actual_id}=    Get Div Id Gioi Thieu On Gioi Thieu Page
    Should Be True    '${actual_id}'=='${id}'
    
    
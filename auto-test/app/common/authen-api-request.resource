*** Settings ***
Resource    common-api-keywords.resource
Resource    ../variable.resource


*** Keywords ***
Send POST Request To Login
    [Arguments]    ${p_gateway}    ${p_username}    ${p_password}
    ${headers}=    Get Header For Brand Api Request
    ${payload}=    Create Dictionary    username=${p_username}    password=${p_password}
    ${response}    Send Api Request To Server    POST    ${p_gateway}    ${URI_LOGIN}    ${headers}    ${payload}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}
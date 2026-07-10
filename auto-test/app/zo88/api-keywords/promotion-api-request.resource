*** Settings ***
Resource    ../../common/common-api-keywords.resource
Resource    ../../variable.resource
Library    JSONLibrary
Library    DateTime


*** Keywords ***
Send POST Request To Get Lucky Wheel V2 Promotion Of User
    [Arguments]    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    POST    ${GL_ZO88_GATEWAY_URL}    ${URI_LUCKY_WHEEL_V2}   ${headers}
    RETURN    ${response}

Get Content Of Api Lucky Wheel V2 Promotion
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}


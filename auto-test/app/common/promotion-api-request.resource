*** Settings ***
Resource    common-api-keywords.resource
Resource    ../variable.resource
Resource    ../import.resource


*** Keywords ***
Send POST Request To Get Lucky Wheel V2 Promotion Of User
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    POST    ${p_gateway}    ${URI_LUCKY_WHEEL_V2}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}
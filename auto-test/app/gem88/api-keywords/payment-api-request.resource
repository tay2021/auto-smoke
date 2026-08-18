*** Settings ***
Resource    ../../common/common-api-keywords.resource


*** Keywords ***
Send GET Request To Get Deposit Currency For Crypto
    [Arguments]    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_GEM88_GATEWAY_URL}    ${URI_DEPOSIT_CURRENCY}   ${headers}
    RETURN    ${response}

Get Content Of Api Deposit Currency For Crypto
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Send GET Request To Get Address Base On Network For Crypto Deposit
    [Arguments]    ${p_bearer_token}    ${p_network}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_GEM88_GATEWAY_URL}    ${URI_NETWORK_ADDRESS}/${p_network}   ${headers}
    RETURN    ${response}

Get Content Of Api Get Address Base On Network For Crypto Deposit
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}
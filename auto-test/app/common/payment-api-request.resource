*** Settings ***
Resource    common-api-keywords.resource


*** Keywords ***
Send GET Request To Get Deposit Currency For Crypto
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_DEPOSIT_CURRENCY}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}

Send GET Request To Get Address Base On Network For Crypto Deposit
    [Arguments]    ${p_gateway}    ${p_bearer_token}    ${p_network}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_NETWORK_ADDRESS}/${p_network}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}
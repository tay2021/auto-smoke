*** Settings ***
Resource    ../../common/common-api-keywords.resource
Resource    ../../variable.resource
Library    JSONLibrary
Library    DateTime


*** Keywords ***
Send GET Request To Get Bao Cao Quan Ly Hoi Vien
    [Arguments]    ${p_bearer_token}    ${p_from_date}    ${p_to_date}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${p_from_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_from_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${p_to_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_to_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${response}    Send Api Request To Server    GET    ${GL_LU88_GATEWAY_URL}    ${URI_DAILY_DIRECT_AGENT}?from_date=${p_from_date}&to_date=${p_to_date}&page=1&limit=10&sort=created_time&reserve=true    ${headers}
    RETURN    ${response}

Get Content Of Api Get Bao Cao Quan Ly Hoi Vien
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Send GET Request To Get Bao Cao Quan Ly Dai Ly
    [Arguments]    ${p_bearer_token}    ${p_from_date}    ${p_to_date}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${p_from_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_from_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${p_to_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_to_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${response}    Send Api Request To Server    GET    ${GL_LU88_GATEWAY_URL}    ${URI_DAILY_SUB_AGENT}?from_date=${p_from_date}&to_date=${p_to_date}&page=1&limit=10&sort=created_time&reserve=true    ${headers}
    RETURN    ${response}

Get Content Of Api Get Bao Cao Quan Ly Dai Ly
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Send GET Request To Get Bao Cao Quan Ly Bet Game Theo Category
    [Arguments]    ${p_bearer_token}    ${p_from_date}    ${p_to_date}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${p_from_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_from_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${p_to_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_to_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${response}    Send Api Request To Server    GET    ${GL_LU88_GATEWAY_URL}    ${URI_DAILY_BET-BY-CATEGORY}?from_date=${p_from_date}&to_date=${p_to_date}&page=1&limit=10&sort=created_time&reserve=true    ${headers}
    RETURN    ${response}

Get Content Of Api Get Bao Cao Quan Ly Bet Game Theo Category
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}
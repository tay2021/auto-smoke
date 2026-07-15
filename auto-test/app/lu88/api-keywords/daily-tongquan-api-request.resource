*** Settings ***
Resource    ../../common/common-api-keywords.resource
Resource    ../../variable.resource
Library    JSONLibrary
Library    DateTime


*** Keywords ***
Send GET Request To Get Total Agent
    [Arguments]    ${p_bearer_token}    ${p_from_date}    ${p_to_date}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${p_from_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_from_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${p_to_date}=    Evaluate    __import__('datetime').datetime.strptime("${p_to_date}", "%d-%m-%Y").strftime("%Y-%m-%d")
    ${response}    Send Api Request To Server    GET    ${GL_LU88_GATEWAY_URL}    ${URI_DAILY_THONGKE_TOTAL_AGENT}?filter%5Bcreated_time%5D%5Bfrom_date%5D=${p_from_date}&filter%5Bcreated_time%5D%5Bto_date%5D=${p_to_date}&page=1&perPage=10    ${headers}
    RETURN    ${response}

Get Content Of Api Get Total Agent
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}


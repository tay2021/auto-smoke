*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-api-keywords.resource
Resource    ../../variable.resource


*** Keywords ***
Send GET Request To Get Profile User
    [Arguments]    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_PUB88_GATEWAY_URL}    ${URI_PROFILE}   ${headers}
    RETURN    ${response}

Get Content Of Api Profile 
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Get Profile Information Detail
    [Arguments]    ${p_api_content_profile}
    ${json}    Evaluate    json.loads('''${p_api_content_profile}''')    modules=json
    ${username}    Get From Dictionary    ${json["data"]}    username
    ${fullname}    Get From Dictionary    ${json["data"]}    fullname
    ${email}    Get From Dictionary    ${json["data"]}    email    default=EMPTY
    ${tele_chat_id}    Get From Dictionary    ${json["data"]}    tele_chat_id
    ${phone}    Get From Dictionary    ${json["data"]}    phone
    &{dict}    Create Dictionary    username=${username}    fullname=${fullname}    email=${email}    tele_chat_id=${tele_chat_id}    phone=${phone}
    RETURN    ${dict}

Send GET Request To Get LSGD Of User
    [Arguments]    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_PUB88_GATEWAY_URL}    ${URI_LSGD}   ${headers}
    RETURN    ${response}

Get Content Of API LSGD
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Send GET Request To Get LSC Of User
    [Arguments]    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_PUB88_GATEWAY_URL}    ${URI_LSC}   ${headers}
    RETURN    ${response}

Get Content Of API LSC
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Send GET Request To Get Bank Of User
    [Arguments]    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_PUB88_GATEWAY_URL}    ${URI_BANK}   ${headers}
    RETURN    ${response}

Get Content Of API Bank
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Send GET Request To Get Promotion Of User
    [Arguments]    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_PUB88_GATEWAY_URL}    ${URI_PROMOTION}   ${headers}
    RETURN    ${response}

Get Content Of API User Promotion
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}

Send GET Request To Get Promotion Commission Detail Of User
    [Arguments]    ${p_bearer_token}
    ${cur_date}=    Get Current Date    time_zone=local    result_format=%Y-%m-%d
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_PUB88_GATEWAY_URL}    ${URI_BET_STATICTIS}?date=${cur_date}   ${headers}
    RETURN    ${response}

Get Content Of API User Promotion Commission Detail
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}



Send GET Request To Get VIP Detail Of User
    [Arguments]    ${p_bearer_token}
    ${cur_date}=    Get Current Date    time_zone=local    result_format=%Y-%m-%d
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${GL_PUB88_GATEWAY_URL}    ${URI_VIP_PROGRAM}   ${headers}
    RETURN    ${response}

Get Content Of API User VIP Detail
    [Arguments]    ${p_api_response}
    ${content}    Get Response Content Of Api Request    ${p_api_response}
    RETURN    ${content}
*** Settings ***
Resource    common-api-keywords.resource
Resource    ../variable.resource
Resource    ../import.resource



*** Keywords ***
Send GET Request To Get Profile User
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_PROFILE}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response} 
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
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_LSGD}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}

Send GET Request To Get LSC Of User
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_LSC}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}

Send GET Request To Get Bank Of User
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_BANK}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}

Send GET Request To Get Promotion Of User
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_PROMOTION}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}

Send GET Request To Get Promotion Commission Detail Of User
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${cur_date}=    Get Current Date    time_zone=local    result_format=%Y-%m-%d
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_BET_STATICTIS}?date=${cur_date}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}

Send GET Request To Get VIP Detail Of User
    [Arguments]    ${p_gateway}    ${p_bearer_token}
    ${cur_date}=    Get Current Date    time_zone=local    result_format=%Y-%m-%d
    ${dict}=    Create Dictionary    Authorization=Bearer ${p_bearer_token}
    ${headers}=    Get Header For Brand Api Request    ${dict}
    ${response}    Send Api Request To Server    GET    ${p_gateway}    ${URI_VIP_PROGRAM}   ${headers}
    ${content}    Get Response Content Of Api Request    ${response}
    RETURN    ${content}
*** Settings ***
Library            RequestsLibrary
Library            Collections
Library            api-request.py




*** Keywords ***
Send Api Request To Server
    [Arguments]    ${method}    ${base_url}    ${uri}=${EMPTY}    ${headers}={}    ${payload}={}
    [Documentation]    Keyword này dùng để send request tới server
    ...    Arguments:
    ...    method: 1 trong các values: put, delete, post, get, ...
    ...    base_url: base url of server.
    ...    uri: api resource identification.
    ...    headers: headers of request.
    ...    payload: payload of request.
    ...    Steps:
    ...    Step 1: Set log request, lúc này chưa có giá trị response, bắt buộc phải lưu thông tin request, vì có trường hợp request bị fail dẫn đến mình ko lưu log được.
    ...    Step 2: Send request
    ...    Step 3: Set log request, lúc này đã có thêm giá trị response
    ${response}=    Send Request    method=${method}    base_url=${base_url}    uri=${uri}    headers=${headers}    payload=${payload}
    ${payload}=    Set Variable    ${response.request.body}
    ${content}=    Set Variable    ${response.text}
    RETURN    ${response}
    
    
Get Header For Brand Api Request
    [Arguments]    ${p_dict}=@{EMPTY}
    ${headers}=    Create Dictionary    Accept=*/*
    ...    accept=application/json, text/plain, */*
    ...    accept-language=en-US,en;q=0.9
    ...    browser=Chrome
    ...    content-type=application/json
    ...    device=pc
    ...    os=Mac OSX
    #...    sec-ch-ua="Google Chrome";v="123", "Not:A-Brand";v="8", "Chromium";v="123"
    ...    sec-ch-ua-mobile=?0
    #...    sec-ch-ua-platform="macOS"
    ...    sec-fetch-dest=empty
    ...    sec-fetch-mode=cors
    ...    sec-fetch-site=same-site
    ...    user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36
    FOR    ${key}    IN    @{p_dict}
        ${value}=    Set Variable    ${p_dict["${key}"]}
        Set To Dictionary    ${headers}    ${key}=${value}
    END
    RETURN    ${headers}

Get Header Status Code And Response Content Of Api Request
    [Documentation]    Keyword này dùng để lấy header status code và content của api response.
    ...    *Params* p_api_response: response của keyword Send Api Request To Server
    ...
    ...    *Return* Trả về header status code và content của api request
    [Arguments]    ${p_api_response}
    ${header_status_code}    Set Variable    ${p_api_response.status_code}
    ${content}    Set Variable    ${p_api_response.text}
    RETURN    ${header_status_code}    ${content}

Get Response Content Of Api Request
    [Documentation]    Keyword này dùng để lấy content của api response.
    [Arguments]    ${p_api_response}
    ${content}    Set Variable    ${p_api_response.text}
    RETURN    ${content}
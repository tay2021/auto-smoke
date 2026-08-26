*** Settings ***
Resource    ../../import.resource
Resource    ../gem88-variable.resource
Resource    ../../common/authen-api-request.resource
Resource    ../../common/promotion-api-request.resource
Library     OperatingSystem
Suite Setup    Clear All Free Spin Of User


*** Keywords ***
Clear All Free Spin Of User
    ${list}    Get All Username Variable From Resource File
    Log    ${list}
    FOR    ${user}    IN    @{list}
        ${content}    Send POST Request To Login    ${GL_GEM88_GATEWAY_URL}    ${user}    123456
        ${dict}    Evaluate    json.loads('''${content}''')    modules=json
        ${token}    Get From Dictionary    ${dict['data']}    token
        ${res}    Send POST Request To Get Lucky Wheel V2 Promotion Of User    ${GL_GEM88_GATEWAY_URL}    ${token}
        ${dict_res}    Evaluate    json.loads('''${res}''')    modules=json
        ${remaining_turns}    Get From Dictionary    ${dict_res['data']}    remaining_turns
        IF    ${remaining_turns}>0
            ${content}    Send POST Request To Spin    ${GL_GEM88_GATEWAY_URL}    ${token}    ${remaining_turns}
        END
    END

Check Start With Username
    [Arguments]    ${p_string}
    ${status}    Run Keyword And Return Status    Should Match Regexp    ${p_string}    ^\\$\\{USERNAME.*
    RETURN    ${status}

Get All Username Variable From Resource File
    ${content}=    Get File    ${CURDIR}/../gem88-variable.resource
    @{lines}=    Split To Lines    ${content}
    @{username_vars}=    Create List
    FOR    ${line}    IN    @{lines}
        ${line}=    Strip String    ${line}
        ${bool}=    Check Start With Username    ${line}
        IF    ${bool}
            ${arr}=    Split String    ${line}
            Append To List    ${username_vars}    ${arr}[1]
        END
    END
    RETURN    ${username_vars}
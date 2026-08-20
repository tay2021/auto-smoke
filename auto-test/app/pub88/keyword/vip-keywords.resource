*** Settings ***
Resource    ../../import.resource
Resource    ../../common/user-api-request.resource



*** Keywords ***
Go To VIP User Page
    Go To    ${GL_PUB88_URL}su-kien/vip-club


Assert VIP User Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_vip}    Send GET Request To Get VIP Detail Of User    ${GL_PUB88_GATEWAY_URL}   ${bearer_token}
    ${json}    Convert String To Json    ${content_api_vip}
    ${level}    Get Value From Json    ${json}    $.data[0].level
    #${actual_vip_level}    Get Value Of Vip Level On VIP Program Page

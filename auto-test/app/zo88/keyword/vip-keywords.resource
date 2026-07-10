*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-vip.resource



*** Keywords ***
Go To VIP User Page
    Go To    ${GL_ZO88_URL}su-kien/vip-club


Assert VIP User Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get VIP Detail Of User   ${bearer_token}
    ${content_api_vip}    Get Content Of API User VIP Detail    ${response}
    ${json}    Convert String To Json    ${content_api_vip}
    ${level}    Get Value From Json    ${json}    $.data[0].level
    #${actual_vip_level}    Get Value Of Vip Level On VIP Program Page

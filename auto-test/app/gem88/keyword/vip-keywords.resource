*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-vip.resource



*** Keywords ***
Go To VIP User Page
    Click On The Avatar Image On Header Page
    Click On The Avatar Image VIP On Header Page


Assert VIP User Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get VIP Detail Of User   ${bearer_token}
    ${content_api_vip}    Get Content Of API User VIP Detail    ${response}
    ${json}    Convert String To Json    ${content_api_vip}
    ${level}    Get Value From Json    ${json}    $.data[0].level
    ${accumulate_stake}    Get Value From Json    ${json}    $.data[0].accumulated_stake
    ${expected_level}=    Run Keyword If    '${level}[0]' == '0'    Set Variable    Graphite
    ...    ELSE IF    '${level}[0]' == '1'    Set Variable    Jade
    ...    ELSE IF    '${level}[0]' == '2'    Set Variable    Ruby
    ...    ELSE IF    '${level}[0]' == '3'    Set Variable    Sapphire
    ...    ELSE IF    '${level}[0]' == '4'    Set Variable    Emerald
    ...    ELSE IF    '${level}[0]' == '5'    Set Variable    Diamond
    ...    ELSE IF    '${level}[0]' == '6'    Set Variable    Black Diamond
    ...    ELSE    Fail    Invalid input: ${level}[0]
    ${expected_accumulate_stake}=    Evaluate    "{:,.0f}".format(float(${accumulate_stake[0]}) * 1000)
    ${actual_vip_level}    Get Value Of Vip Level On VIP Program Page
    ${actual_vip_accumulate}    Get Value Of Accumulate On VIP Program Page
    #Should Be True    '${expected_level}'=='${actual_vip_level}'
    #Should Be True    '${expected_accumulate_stake}'=='${actual_vip_accumulate}'
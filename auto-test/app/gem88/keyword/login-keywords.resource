*** Settings ***
Resource    ../../common/common-keywords.resource
Resource    ../page/page-welcome-pop-up.resource
Resource    ../page/page-model-login.resource
Resource    ../api-keywords/promotion-api-request.resource
Library     OperatingSystem




*** Keywords ***
Open Gem88 site and maximize window
    [Arguments]    ${p_url}
    Open Site and maximize window    ${p_url}

Go To Login Page
    Go To    ${GL_GEM88_URL}?popup=login


Close Welcome Pop Up If Shown
    ${btn_close_welcome_pop_up}    Get Button Close Welcome Pop Up Element
    ${exists}    Check Element Exists On Page    ${btn_close_welcome_pop_up}
    IF    ${exists}
        Click    ${btn_close_welcome_pop_up}
    END

Login To Site Gem88
    [Arguments]    ${p_username}    ${p_password}
    Go To Login Page
    Input Username On Model Login    ${p_username}
    Input Password On Model Login    ${p_password}
    Keyboard Key    press    Enter

Assert Login To Site88 Successfully
    ${locator}    Get Label Info Login Successfully
    ${exits}    Check Element Exists On Page    ${locator}
    Should Be True    ${exits}
    
Close Lucky Wheel Notification If Shown
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send POST Request To Get Lucky Wheel V2 Promotion Of User    ${bearer_token}
    ${content_api_bank}    Get Content Of Api Lucky Wheel V2 Promotion    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${remaining_turns}    Get Value From Json    ${json}    $.data.remaining_turns
    ${is_empty}=    Evaluate    len($remaining_turns) == 0
    IF    not ${is_empty}
        Click Button Close Dap Da Notification
    END
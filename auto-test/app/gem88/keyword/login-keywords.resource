*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-welcome-pop-up.resource
Resource    ../page/page-model-login.resource
Resource    ../page/page-model-register.resource
Resource    ../../common/promotion-api-request.resource





*** Keywords ***
Open Gem88 site and maximize window
    [Arguments]    ${p_url}
    Open Site and maximize window    ${p_url}

Open Gem88 site on device
    [Arguments]    ${p_url}    ${p_device_type}=iPhone 17 Pro Max
    Open Site On Device    ${p_url}    ${p_device_type}

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
    ${content_api}    Send POST Request To Get Lucky Wheel V2 Promotion Of User    ${GL_GEM88_GATEWAY_URL}    ${bearer_token}
    ${json}    Convert String To Json    ${content_api}
    Log    ${json}
    ${remaining_turns}    Get Value From Json    ${json}    $.data.remaining_turns
    ${is_empty}=    Evaluate    len($remaining_turns) == 0
    IF    not ${is_empty}
        Click Button Close Dap Da Notification
    END

Open Register Form
    [Arguments]    ${p_url_form_register}
    Go to    ${p_url_form_register}

Register An Gem88 Account
    [Arguments]    ${p_username}    ${p_password}    ${p_phone_number}
    Input Username On Model Register    ${p_username}
    Input Password On Model Register    ${p_password}
    Input Phone Number On Model Register    ${p_phone_number}
    Click Button Register On Model Register

Assert Register An Account Successfully
    [Arguments]    ${p_expected_usser}
    ${exist}    Check Element Exists On Page    //*[contains(text(),'Chào mừng ${p_expected_usser}')]
    Should Be True    ${exist}


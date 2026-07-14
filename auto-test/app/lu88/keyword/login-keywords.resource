*** Settings ***
Resource    ../../common/common-keywords.resource
Resource    ../page/page-welcome-pop-up.resource
Resource    ../page/page-model-login.resource
Resource    ../page/page-header.resource
Resource    ../page/page-daily-header.resource
Resource    ../page/page-daily-login.resource
Library     OperatingSystem
Resource    ../api-keywords/user-api-request.resource
Library    String
Resource    ../page/page-model-register.resource




*** Keywords ***
Open Lu88 site and maximize window
    [Arguments]    ${p_url}
    Open Site and maximize window    ${p_url}

Close Welcome Pop Up If Shown
    ${btn_close_welcome_pop_up}    Get Button Close Welcome Pop Up Element
    ${exists}    Check Element Exists On Page    ${btn_close_welcome_pop_up}
    IF    ${exists}
        Click    ${btn_close_welcome_pop_up}
    END

Login To Site Lu88
    [Arguments]    ${p_username}    ${p_password}
    Click Button Dang Nhap On Header Page
    Input Username On Model Login    ${p_username}
    Input Password On Model Login    ${p_password}
    Keyboard Key    press    Enter

Assert Login To Site88 Successfully
    ${locator}    Get Label Info Login Successfully
    ${exits}    Check Element Exists On Page    ${locator}
    Should Be True    ${exits}

Go To Site Lu88 Dai Ly
    [Arguments]    ${p_url_daily}
    Go To    ${p_url_daily}
    Wait For Function    document.readyState === "complete"
    
Login To Site Lu88 Dai Ly
    [Arguments]    ${p_username_daily}    ${p_password_daily}
    Input Username On Login Page Dai Ly    ${p_username_daily}
    Input Password On Login Page Dai Ly    ${p_password_daily}
    Click Button Dang Nhap On Login Page Dai Ly


Assert Login To Site Lu88 Dai Ly Successfully
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Profile User    ${bearer_token}
    ${content_api_lsc}    Get Content Of API LSC    ${response}
    ${json}    Convert String To Json    ${content_api_lsc}
    ${username}    Get Value From Json    ${json}    $.data.username
    ${balance}    Get Value From Json    ${json}    $.data.balance
    ${expected_username}    Set Variable    ${username}[0]
    ${expected_balance}    Set Variable    ${balance}[0]
    ${actual_username}    Get UserName At Header Name On Page Daily
    ${actual_balance}    Get Balance User At Header Name On Page Daily
    ${actual_balance}    Remove String    ${actual_balance}    K    ,    ${SPACE}
    Should Be True    '${expected_username}'=='${actual_username}'
    Should Be True    '${expected_balance}'=='${actual_balance}'

Open Register Form
    [Arguments]    ${p_url_form_register}
    Go to    ${p_url_form_register}
 
Register An Lu88 Account
    [Arguments]    ${p_username}    ${p_password}    ${p_phone_number}
    Input Username On Model Register    ${p_username}
    Input Password On Model Register    ${p_password}
    Input Phone Number On Model Register    ${p_phone_number}
    Click Button Register On Model Register

Assert Register An Account Successfully
    ${exist}    Check Element Exists On Page    //*[contains(text(),'Đăng ký thành công')]
    Should Be True    ${exist}


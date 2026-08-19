*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-welcome-pop-up.resource
Resource    ../page/page-model-login.resource
Resource    ../page/page-header.resource
Resource    ../page/page-model-register.resource





*** Keywords ***
Open Pub88 site and maximize window
    [Arguments]    ${p_url}
    Open Site and maximize window    ${p_url}

Open Pub88 site on device
    [Arguments]    ${p_url}    ${p_device_type}=iPhone 14 Pro Max
    Open Site On Device    ${p_url}    ${p_device_type}


Close Welcome Pop Up If Shown
    ${btn_close_welcome_pop_up}    Get Button Close Welcome Pop Up Element
    ${exists}    Check Element Exists On Page    ${btn_close_welcome_pop_up}
    IF    ${exists}
        Click    ${btn_close_welcome_pop_up}
    END

Go To Login Page
    Go To    ${GL_PUB88_URL}?popup=login

Login To Site Pub88
    [Arguments]    ${p_username}    ${p_password}
    Go To Login Page
    Input Username On Model Login    ${p_username}
    Input Password On Model Login    ${p_password}
    Keyboard Key    press    Enter

Assert Login To Site Successfully
    ${locator}    Get Label Info Login Successfully
    ${exits}    Check Element Exists On Page    ${locator}
    Should Be True    ${exits}


Open Register Form
    [Arguments]    ${p_url_form_register}
    Go to    ${p_url_form_register}

Register An Pub88 Account
    [Arguments]    ${p_username}    ${p_password}    ${p_phone_number}
    Input Username On Model Register    ${p_username}
    Input Password On Model Register    ${p_password}
    Input Phone Number On Model Register    ${p_phone_number}
    Click Button Register On Model Register

Assert Register An Account Successfully
    ${exist}    Check Element Exists On Page    //*[contains(text(),'Đăng ký thành công')]
    Should Be True    ${exist}

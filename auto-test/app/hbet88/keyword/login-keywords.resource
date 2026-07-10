*** Settings ***
Resource    ../../common/common-keywords.resource
Resource    ../page/page-welcome-pop-up.resource
Resource    ../page/page-model-login.resource
Resource    ../page/page-header.resource
Resource    ../api-keywords/promotion-api-request.resource
Library     OperatingSystem




*** Keywords ***
Open Hbet site and maximize window
    [Arguments]    ${p_url}
    Open Site and maximize window    ${p_url}


Close Welcome Pop Up If Shown
    ${btn_close_welcome_pop_up}    Get Button Close Welcome Pop Up Element
    ${exists}    Check Element Exists On Page    ${btn_close_welcome_pop_up}
    IF    ${exists}
        Click    ${btn_close_welcome_pop_up}
    END

Login To Site Hbet
    [Arguments]    ${p_username}    ${p_password}
    Click Button Dang Nhap On Header Page
    Input Username On Model Login    ${p_username}
    Input Password On Model Login    ${p_password}
    Keyboard Key    press    Enter

Assert Login To Site Successfully
    ${locator}    Get Label Info Login Successfully
    ${exits}    Check Element Exists On Page    ${locator}
    Should Be True    ${exits}

*** Settings ***
Library    Browser


*** Variables ***
${btn_close_welcome_pop_up}    //*[@id='login-modal-container']/following-sibling::div[4]/div[2]/div[1]/div[1]/img


*** Keywords ***
Click Button Close Welcome Pop Up
    Wait For Elements State    ${btn_close_welcome_pop_up}    visible
    Click    ${btn_close_welcome_pop_up}

Get Button Close Welcome Pop Up Element
    ${element}    Set Variable    ${btn_close_welcome_pop_up}
    RETURN    ${element}

Click Button Close Dap Da Notification
    ${btn_close_dap_da_notification}    Set Variable    //div[@role='dialog']/div[1]/div[1]/div[1]/div[1]/div[1]/img
    ${count}    Get Element Count    ${btn_close_dap_da_notification}
    IF    ${count}>0
        Click    ${btn_close_dap_da_notification}
    END
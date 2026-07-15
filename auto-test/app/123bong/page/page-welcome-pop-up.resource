*** Settings ***
Library    Browser


*** Variables ***
${btn_close_welcome_pop_up}    //div[contains(@class,'swiper-pagination')]/../preceding-sibling::img


*** Keywords ***
Click Button Close Welcome Pop Up
    Wait For Elements State    ${btn_close_welcome_pop_up}    visible
    Click    ${btn_close_welcome_pop_up}

Get Button Close Welcome Pop Up Element
    ${element}    Set Variable    ${btn_close_welcome_pop_up}
    RETURN    ${element}

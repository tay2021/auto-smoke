*** Settings ***
Library    Browser    timeout=15s



*** Keywords ***
Get Link Gioi Thieu On Gioi Thieu Page
    ${locator}    Set Variable    (//main//span[text()='Link giới thiệu'])[1]/following-sibling::div/span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Div Id Gioi Thieu On Gioi Thieu Page
    ${locator}    Set Variable    (//span[text()='Mã giới thiệu'])[1]/following-sibling::div/span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}






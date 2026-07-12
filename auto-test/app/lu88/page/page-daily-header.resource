*** Settings ***
Library    Browser




*** Keywords ***
Get Value Of Vip Level On VIP Program Page
    ${value}    Get Text    //div[contains(@class,'ant-progress ant-progress-status')]/../preceding-sibling::h6
    RETURN    ${value}

Get UserName At Header Name On Page Daily
    ${locator}    Set Variable    //header//h6
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Balance User At Header Name On Page Daily
    ${locator}    Set Variable    //header//h6/following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}
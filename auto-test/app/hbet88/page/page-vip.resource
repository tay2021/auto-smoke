*** Settings ***
Library    Browser




*** Keywords ***
Get Value Of Vip Level On VIP Program Page
    ${value}    Get Text    //div[contains(@class,'ant-progress ant-progress-status')]/../preceding-sibling::h6
    RETURN    ${value}
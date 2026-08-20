*** Settings ***
Resource    ../../common/common-keywords.resource

*** Keywords ***
Get Value Of Vip Level On VIP Program Page
    ${value}    Wait For Element State And Get Text    //div[contains(@class,'ant-progress ant-progress-status')]/../preceding-sibling::h6
    RETURN    ${value}
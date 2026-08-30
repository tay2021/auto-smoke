*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Link Gioi Thieu On Gioi Thieu Page
    ${text}    Wait For Element State And Get Text    //h6[text()='Link giới thiệu']/following-sibling::div[2]/div[1]/div[1]/div[1]/span
    RETURN    ${text}

Get Div Id Gioi Thieu On Gioi Thieu Page
    ${text}    Wait For Element State And Get Text    //h6[text()='Link giới thiệu']/following-sibling::div[2]/div[1]/div[2]/div[1]/span
    RETURN    ${text}






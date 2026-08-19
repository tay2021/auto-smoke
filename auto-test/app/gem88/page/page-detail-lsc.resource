*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Value Thoi Gian In LCS Detail Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text    //tbody/tr[${p_index}]/td[1]/div[1]/div[2]
    RETURN    ${text}

Get Value ID In LSC Detail Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text    //tbody/tr[${p_index}]/td[1]//span
    RETURN    ${text}

Get Value Tro Choi Name In LSC Detail Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text     //tbody/tr[${p_index}]/td[2]/div
    RETURN    ${text}

Get Value Tien Cuoc In LSC Detail Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text     //tbody/tr[${p_index}]/td[3]/div
    RETURN    ${text}

Get Value Tien Thang Thua In LSC Detail Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text     //tbody/tr[${p_index}]/td[4]/div
    RETURN    ${text}

Get Value Tien Thuong In LSC Detail Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text     //tbody/tr[${p_index}]/td[5]/div
    RETURN    ${text}


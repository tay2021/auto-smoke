*** Settings ***
Library    Browser    timeout=15s



*** Keywords ***
Get Value Thoi Gian In LCS Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text     //tbody/tr[${p_index}]/td[1]/div[1]/div[2]
    RETURN    ${value}

Get Value ID In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text     //tbody/tr[${p_index}]/td[1]//span
    RETURN    ${value}

Get Value Tro Choi Name In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text     //tbody/tr[${p_index}]/td[2]/div
    RETURN    ${value}

Get Value Tien Cuoc In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text     //tbody/tr[${p_index}]/td[3]/div
    RETURN    ${value}

Get Value Tien Thang Thua In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text     //tbody/tr[${p_index}]/td[4]/div
    RETURN    ${value}

Get Value Tien Thuong In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text     //tbody/tr[${p_index}]/td[5]/div
    RETURN    ${value}


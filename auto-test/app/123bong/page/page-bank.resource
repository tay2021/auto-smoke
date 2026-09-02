*** Settings ***
Resource    ../../common/common-keywords.resource

*** Keywords ***
Get Div Chua Co Tai Khoan Lien Ket On Quan Ly Bank Page
    RETURN    //div[text()='Chưa có tài khoản liên kết']

Get Value Of Ten Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text    (//section//img)[${p_index}]/../following-sibling::div[2]
    RETURN    ${value}

Get Value Of So Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text    (//section//img)[${p_index}]/../following-sibling::div[1]
    RETURN    ${value}
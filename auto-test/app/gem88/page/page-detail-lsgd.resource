*** Settings ***
Resource    ../../common/common-keywords.resource


*** Variables ***
${table_xpath_prefix}    //div[@class='root-account-content-wrapper']//div[contains(@class,'flex flex-col items-center justify-center')]



*** Keywords ***
Get Value Amount In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${text}    Wait For Element State And Get Text     //div[text()='Số lượng hiển thị']/../../following-sibling::div//div[normalize-space()='#${p_id_ticket}']/../following-sibling::div/div[1]/div[2]
    RETURN    ${text}

Get Value ID In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${text}    Wait For Element State And Get Text     //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../following-sibling::td[1]/div[1]
    RETURN    ${text}

Get Value Thoi Gian In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${text}    Wait For Element State And Get Text     //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../div[1]/div[2]
    RETURN    ${text}

Get Value Loai Giao Dich In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${text}    Wait For Element State And Get Text    //div[text()='Số lượng hiển thị']/../../following-sibling::div//div[normalize-space()='#${p_id_ticket}']/../following-sibling::div/div[1]/div[1]
    RETURN    ${text}

Get Value Ngan Hang In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${text}    Wait For Element State And Get Text    //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../following-sibling::td[4]/div[1]/span
    RETURN    ${text}

Get Value Trang Thai In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${text}    Wait For Element State And Get Text    //div[text()='Số lượng hiển thị']/../../following-sibling::div//div[normalize-space()='#${p_id_ticket}']/../following-sibling::div/div[1]/div[3]
    RETURN    ${text}
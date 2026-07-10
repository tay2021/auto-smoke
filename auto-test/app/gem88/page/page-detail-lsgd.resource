*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${table_xpath_prefix}    //div[@class='root-account-content-wrapper']//div[contains(@class,'flex flex-col items-center justify-center')]



*** Keywords ***
Get Value Amount In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${value}    Get Text     //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../following-sibling::td[2]/div
    RETURN    ${value}

Get Value ID In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${value}    Get Text     //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../following-sibling::td[1]/div[1]
    RETURN    ${value}

Get Value Thoi Gian In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${value}    Get Text     //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../div[1]/div[2]
    RETURN    ${value}

Get Value Loai Giao Dich In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${value}    Get Text     //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../following-sibling::td[1]/div
    RETURN    ${value}

Get Value Ngan Hang In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${value}    Get Text    //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../following-sibling::td[4]/div[1]/span
    RETURN    ${value}

Get Value Trang Thai In LSDG Detail Page
    [Arguments]    ${p_id_ticket}
    ${value}    Get Text    //tbody//td[1]//span[normalize-space()='#${p_id_ticket}']/../../../following-sibling::td[5]//span
    RETURN    ${value}
*** Settings ***
Library    Browser    timeout=15s



*** Keywords ***
Get Locator Lich Su Giao Dich Trong On LSGD Page
    ${locator}    Set Variable    (//*[text()='Bạn chưa từng phát sinh giao dịch.'])[1]
    RETURN    ${locator}
    

Get Locator Nap Tien Ngay On LSGD Page
    ${locator}    Set Variable    //section[contains(@class,'deposit-page')]/div[1]//span[text()='Nạp Ngay']
    RETURN    ${locator}

Get Value Amount In LSDG Detail Page
    [Arguments]    ${p_id_phieu}
    ${value}    Get Text     //tbody//tr/*[contains(normalize-space(),'${p_id_phieu}')]/following-sibling::td[2]
    RETURN    ${value}


Get Value Loai Giao Dich In LSDG Detail Page
    [Arguments]    ${p_id_phieu}
    ${value}    Get Text     //tbody//tr/*[contains(normalize-space(),'${p_id_phieu}')]/following-sibling::td[1]
    RETURN    ${value}

Get Value Ngan Hang In LSDG Detail Page
    [Arguments]    ${p_id_phieu}
    ${value}    Get Text     //tbody//tr/*[contains(normalize-space(),'${p_id_phieu}')]/following-sibling::td[4]
    RETURN    ${value}

Get Value Trang Thai In LSDG Detail Page
    [Arguments]    ${p_id_phieu}
    ${value}    Get Text     //tbody//tr/*[contains(normalize-space(),'${p_id_phieu}')]/following-sibling::td[5]
    RETURN    ${value}


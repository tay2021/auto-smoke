*** Settings ***
Library    Browser    timeout=15s



*** Variables ***
${btn_nap_tien_ngay_on_lsdg_page}    //div[contains(@class,'bg-account-page')]//div[@class='text-center']/following-sibling::div//button        


*** Keywords ***
Get Locator Lich Su Cuoc Trong On LSC Page
    ${locator}    Set Variable    (//div[text()='Bạn không có phát sinh lịch sử cược.'])[1]
    RETURN    ${locator}

Get Value ID In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text    //tbody/tr[${p_index}]/td[1]//span
    RETURN    ${value}

Get Value Tro Choi Name In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Get Text     //tbody/tr[${p_index}]/td[2]/div[1]
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
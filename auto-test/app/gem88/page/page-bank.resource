*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${pre_fix_table_bank}    //div[@class='root-account-content-wrapper']//div[text()='Quản lý ngân hàng']/../following::div[1]/div[3]


*** Keywords ***
Get Span Lien Ket Ngan Hang On Quan Ly Bank Page
    ${locator}    Set Variable    //*[text()='Liên kết ngân hàng']
    RETURN    ${locator}

Get Value Of Ten Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${value}    Get Text    ${pre_fix_table_bank}/div[${p_index}]//span[text()='Tên tài khoản']/following-sibling::span
    RETURN    ${value}

Get Value Of So Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${value}    Get Text    ${pre_fix_table_bank}/div[${p_index}]//span[text()='Số tài khoản']/following-sibling::span
    RETURN    ${value}

Get Value Of Trang Thai On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${value}    Get Text    ${pre_fix_table_bank}/div[${p_index}]/div[1]/div[1]/div[1]/div[2]
    RETURN    ${value}
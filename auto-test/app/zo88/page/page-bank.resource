*** Settings ***
Library    Browser    timeout=15s



*** Keywords ***
Get Div Chua Co Tai Khoan Lien Ket On Quan Ly Bank Page
    ${locator}    Set Variable    //span[text()='Quý khách vui lòng thêm tài khoản ngân hàng chính chủ để có thể thực hiện Nạp/Rút tiền.']
    RETURN    ${locator}

Get Value Of Ten Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${value}    Get Text    (//section//img)[${p_index}]/../following-sibling::div[2]
    RETURN    ${value}

Get Value Of So Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${value}    Get Text    (//section//img)[${p_index}]/../following-sibling::div[1]
    RETURN    ${value}

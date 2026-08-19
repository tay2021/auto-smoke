*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Div Chua Co Tai Khoan Lien Ket On Quan Ly Bank Page
    ${locator}    Set Variable    //span[text()='Quý khách vui lòng thêm tài khoản ngân hàng chính chủ để có thể thực hiện Nạp/Rút tiền.']
    RETURN    ${locator}

Get Value Of Ten Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text    (//section//img)[${p_index}]/../following-sibling::div[2]
    RETURN    ${text}

Get Value Of So Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text    (//section//img)[${p_index}]/../following-sibling::div[1]
    RETURN    ${text}

Click On The Button Add Bank On Quan Ly Bank Page
    Wait For Element State And Click On It    //span[text()='Thêm tài khoản']

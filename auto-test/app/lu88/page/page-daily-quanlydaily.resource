*** Settings ***
Library    Browser    timeout=15s
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Default Selected From Date On Page Quan Ly Dai Ly
    ${value}    Wait And Get Value Of Element    (//input[@placeholder='Chọn thời gian'])[1]
    RETURN    ${value}

Get Default Selected To Date On Page Quan Ly Dai Ly
    ${value}    Wait And Get Value Of Element    (//input[@placeholder='Chọn thời gian'])[2]
    RETURN    ${value}

Get Ten Dang Nhap Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[1]
    RETURN    ${value}

Get Nguon Dang Ky Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[2]/div
    RETURN    ${value}


Get Thoi Gian Dang Ky Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[3]/div
    RETURN    ${value}

Get Thoi Gian Dang Nhat Gan Nhat Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[4]/div
    RETURN    ${value}

Get Trang Thai Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[5]/div
    RETURN    ${value}

Get Level Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[6]/div
    RETURN    ${value}
*** Settings ***
Library    Browser    timeout=15s
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Default Selected From Date On Page Quan Ly Hoi Vien
    ${value}    Wait And Get Value Of Element    (//input[@placeholder='Chọn thời gian'])[1]
    RETURN    ${value}

Get Default Selected To Date On Page Quan Ly Hoi Vien
    ${value}    Wait And Get Value Of Element    (//input[@placeholder='Chọn thời gian'])[2]
    RETURN    ${value}

Get Ten Dang Nhap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[1]
    RETURN    ${value}

Get Nguon Dang Ky Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[2]/div
    RETURN    ${value}

Get Thoi Gian Dang Ky Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[3]/div
    RETURN    ${value}

Get Thoi Gian Dang Nhat Gan Nhat Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[4]/div
    RETURN    ${value}

Get Trang Thai Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[5]/div
    RETURN    ${value}

Get Lai Rong Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[6]/span
    RETURN    ${value}

Get Tong Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[7]/span
    RETURN    ${value}

Get So Lan Nap Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[8]/span
    RETURN    ${value}

Get Tong Cuoc Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[9]/span
    RETURN    ${value}

Get Thang Thua Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[10]/span
    RETURN    ${value}

Get Hoa Hong Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[11]/span
    RETURN    ${value}

Get Hoan Tra Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[12]/span
    RETURN    ${value}

Get Khuyen Mai 100 Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[13]/span
    RETURN    ${value}

Get Phi Tong Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //tbody//td[text()='${p_id}']/following-sibling::td[14]/span
    RETURN    ${value}


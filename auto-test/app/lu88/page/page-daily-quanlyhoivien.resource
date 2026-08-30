*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Default Selected From Date On Page Quan Ly Hoi Vien
    ${value}    Wait For Element State And Get Attribute    //h6[text()='Quản lý hội viên']/following-sibling::div[1]/div[1]/div[1]/div[1]/div[1]//input    value
    RETURN    ${value}

Get Default Selected To Date On Page Quan Ly Hoi Vien
    ${value}    Wait For Element State And Get Attribute    //h6[text()='Quản lý hội viên']/following-sibling::div[1]/div[1]/div[1]/div[2]//input    value
    RETURN    ${value}

Get Ten Dang Nhap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/../h6
    RETURN    ${value}


Get Thoi Gian Dang Ky Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Thời gian đăng ký']/following-sibling::span
    RETURN    ${value}

Get Thoi Gian Dang Nhat Gan Nhat Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Thời gian đăng nhập gần nhất']/following-sibling::span
    RETURN    ${value}

Get Tong Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Tổng nạp']/following-sibling::span
    RETURN    ${value}

Get So Lan Nap Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Số lần nạp']/following-sibling::span
    RETURN    ${value}

Get Tong Cuoc Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Tổng cược']/following-sibling::span
    RETURN    ${value}

Get Thang Thua Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Thắng / Thua']/following-sibling::span
    RETURN    ${value}

Get Hoa Hong Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Hoa hồng']/following-sibling::span
    RETURN    ${value}

Get Hoan Tra Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Hoàn trả ']/following-sibling::span
    RETURN    ${value}

Get Khuyen Mai 100 Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Khuyến mãi 100% ']/following-sibling::span
    RETURN    ${value}

Get Phi Tong Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Phí tổng nạp ']/following-sibling::span
    RETURN    ${value}

Get Lai Rong Base On Ma Hoi Vien On Page Quan Ly Hoi Vien
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[1]//h6[text()='Lãi ròng ']/following-sibling::span
    RETURN    ${value}
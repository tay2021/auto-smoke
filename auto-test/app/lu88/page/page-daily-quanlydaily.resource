*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Default Selected From Date On Page Quan Ly Dai Ly
    ${value}    Wait For Element State And Get Attribute    //span[text()='Từ tháng']/following-sibling::div/div/input    value
    RETURN    ${value}

Get Default Selected To Date On Page Quan Ly Dai Ly
    ${value}    Wait For Element State And Get Attribute    //span[text()='Đến tháng']/following-sibling::div/div/input    value
    RETURN    ${value}

Get Ten Dang Nhap Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/../h6
    RETURN    ${value}

Get Thoi Gian Dang Ky Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Thời gian đăng ký']/following-sibling::span
    RETURN    ${value}

Get Thoi Gian Dang Nhat Gan Nhat Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
   ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Thời gian đăng nhập gần nhất']/following-sibling::span
    RETURN    ${value}

Get Level Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    //span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Tài khoản']/following-sibling::span
    RETURN    ${value}

Get Hoa Hong Base On Ma Hoi Vien On Page Quan Ly Dai Ly
    [Arguments]    ${p_id}
    ${value}    Wait And Get Value Of Element    (//span[normalize-space(.)='Mã thành viên : ${p_id}']/ancestor::div[contains(@class, 'ant-collapse-item')]/div[2]/div[1]/div[1]//span[text()='Hoa hồng']/following-sibling::span)[2]
    RETURN    ${value}
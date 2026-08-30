*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Default Selected From Date
    ${value}    Wait For Element State And Get Text    (//input[@placeholder='Chọn thời gian'])[1]
    RETURN    ${value}

Get Default Selected To Date
    ${value}    Wait For Element State And Get Text    (//input[@placeholder='Chọn thời gian'])[2]
    RETURN    ${value}

Get Span Lai Rong On Doanh So Page
    ${text}    Wait For Element State And Get Text    (//span[text()='Lãi ròng '])[2]/../following-sibling::span
    RETURN    ${text}

Get Span Hoa Hong On Doanh So Page
    ${text}    Wait For Element State And Get Text    //span[text()='Hoa hồng']/../following-sibling::span
    RETURN    ${text}

Get Span Tien Cuoc On Doanh So Page
    ${text}    Wait For Element State And Get Text    //span[text()='Tiền cược']/../following-sibling::span
    RETURN    ${text}

Get Span Thang Thua On Doanh So Page
    ${text}    Wait For Element State And Get Text    //span[text()='Thắng / Thua']/../following-sibling::span
    RETURN    ${text}

Get Span Hoan Tra On Doanh So Page
    ${text}    Wait For Element State And Get Text    //span[text()='Hoàn trả ']/../following-sibling::span
    RETURN    ${text}

Get Span Khuyen Mai On Doanh So Page
    ${text}    Wait For Element State And Get Text    //span[contains(text(),'KM')]/../following-sibling::span
    RETURN    ${text}

Get Span Tong Nap On Doanh So Page
    ${text}    Wait For Element State And Get Text    //span[text()='Tổng nạp']/../following-sibling::span
    RETURN    ${text}

Get Span Phi Tong Nap On Doanh So Page
    ${text}    Wait For Element State And Get Text    //span[text()='Phí tổng nạp ']/../following-sibling::span
    RETURN    ${text}
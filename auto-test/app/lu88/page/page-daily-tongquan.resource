*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Value Of Span Tong Lai Rong On Tong Quan Page
    ${text}=    Get Text    xpath=//*[contains(text(), 'Lãi ròng')]/following-sibling::*[1]
    RETURN    ${text}

Get Value Of Span Tong Thang Thua On Tong Quan Page
    ${text}    Wait For Element State And Get Text    //h6[text()='Tổng quan']/following-sibling::div[2]/div[1]/div[2]/div[1]/following-sibling::span
    RETURN    ${text}

Get Value Of Span Tong Nap On Tong Quan Page
    ${text}    Wait For Element State And Get Text    //h6[text()='Tổng quan']/following-sibling::div[2]/div[1]/div[3]/div[1]/following-sibling::span
    RETURN    ${text}

Get Value Of Span Tong Thanh Vien Moi On Tong Quan Page
    ${text}    Wait For Element State And Get Text    //h6[text()='Tổng quan']/following-sibling::div[2]/div[1]/div[4]/div[1]/following-sibling::span
    RETURN    ${text}

Click Span Hom Nay On Tong Quan Page
    Wait For Element State And Click On It    //*[text()='Hôm nay']

Click Span 7 Ngay On Tong Quan Page
    Wait For Element State And Click On It    //*[text()='7 ngày']

Click Span 30 Ngay On Tong Quan Page
    Wait For Element State And Click On It    //*[text()='30 ngày']
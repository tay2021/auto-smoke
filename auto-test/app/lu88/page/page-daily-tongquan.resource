*** Settings ***
Library    Browser    timeout=15s



*** Keywords ***
Get Value Of Span Tong Lai Rong On Tong Quan Page
    ${locator}    Set Variable    (//span[text()='Lãi ròng'])[1]/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Value Of Span Tong Thang Thua On Tong Quan Page
    ${locator}    Set Variable    (//span[text()='Thắng thua'])[1]/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Value Of Span Tong Nap On Tong Quan Page
    ${locator}    Set Variable    (//span[text()='Tổng nạp'])[1]/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Value Of Span Tong Thanh Vien Moi On Tong Quan Page
    ${locator}    Set Variable    (//span[text()='Thành viên mới'])[1]/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Click Span Hom Nay On Tong Quan Page
    ${locator}    Set Variable    //*[text()='Hôm nay']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Click Span 7 Ngay On Tong Quan Page
    ${locator}    Set Variable    //*[text()='7 ngày']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

Click Span 30 Ngay On Tong Quan Page
    ${locator}    Set Variable    //*[text()='30 ngày']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
*** Settings ***
Library    Browser    timeout=15s



*** Keywords ***
Get Default Selected From Date
    ${locator}    Set Variable    (//input[@placeholder='Chọn thời gian'])[1]
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Default Selected To Date
    ${locator}    Set Variable    (//input[@placeholder='Chọn thời gian'])[2]
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Lai Rong On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[1]//*[text()='Lãi ròng ']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Hoa Hong On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[1]//*[text()='% Hoa hồng ']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Tien Cuoc On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[1]//*[text()='Tiền cược']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Thang Thua On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[1]//*[text()='Thắng / Thua']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Hoan Tra On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[2]//*[text()='Hoàn trả ']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Khuyen Mai On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[2]//*[text()='Khuyến mãi ']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Tong Nap On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[2]//*[text()='Tổng nạp']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}

Get Span Phi Tong Nap On Doanh So Page
    ${locator}    Set Variable    //main/div[1]/div[1]/div[2]/div[1]/div[2]//*[text()='Phí tổng nạp ']/../../following-sibling::span
    Wait For Elements State    ${locator}    visible
    ${value}    Get Text    ${locator}
    RETURN    ${value}
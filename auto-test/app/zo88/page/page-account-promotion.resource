*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Get Label Locator Tham Gia Khuyen Mai 100% On Promotion Page
    ${locator}    Set Variable    (//h3[text()='Khuyến mãi nạp lần đầu 100%'])[1]
    RETURN    ${locator}

Get Label Locator Tham Gia Khuyen Mai Hoan Tra On Promotion Page
    ${locator}    Set Variable    (//h3[text()='Hoàn trả vô tận 1.5%'])[1]
    RETURN    ${locator}
    
Get Value Of Total Stake On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền cược:']/following-sibling::span)[1]
    RETURN    ${value}

Get Value Of Total Commission Cashback On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền hoàn trả:']/following-sibling::span)[1]
    RETURN    ${value}

Get Value Of So Tien Da Nap Promtion 100% On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền đã nạp:'])[1]/following-sibling::span
    RETURN    ${value}

Get Value Of So Tien Thuong Promtion 100% On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền thưởng:'])[1]/following-sibling::span
    RETURN    ${value}

Get Value Of So Tien Rolling Promtion 100% On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền cược cần hoàn thành:'])[1]/following-sibling::span/span[2]
    RETURN    ${value}


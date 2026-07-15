*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Get Label Locator Tham Gia Khuyen Mai 100% On Promotion Page
    ${locator}    Set Variable    //span[text()='Khuyến mãi 100% lần nạp đầu']
    RETURN    ${locator}

Get Label Locator Tham Gia Khuyen Mai Hoan Tra On Promotion Page
    ${locator}    Set Variable    //span[text()='Hoàn trả vô tận 1.3%']
    RETURN    ${locator}
    
Get Value Of Total Stake On Promotion Page
    ${value}    Get Text    //span[text()='Tiền cược']/following-sibling::span
    RETURN    ${value}

Get Value Of Total Commission Cashback On Promotion Page
    ${value}    Get Text    //span[text()='Hoàn trả']/following-sibling::span
    RETURN    ${value}

Get Value Of So Tien Da Nap Promtion 100% On Promotion Page
    ${value}    Get Text    //span[text()='Tiền nạp']//following-sibling::span
    RETURN    ${value}

Get Value Of So Tien Thuong Promtion 100% On Promotion Page
    ${value}    Get Text    //span[text()='Tiền thưởng']//following-sibling::span
    RETURN    ${value}

Get Value Of So Tien Rolling Promtion 100% On Promotion Page
    ${value}    Get Text    //span[text()='Số tiền cược cần đạt:']//following-sibling::span
    RETURN    ${value}


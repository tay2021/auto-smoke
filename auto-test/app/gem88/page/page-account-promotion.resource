*** Settings ***
Library    Browser    timeout=15s


*** Variables ***


*** Keywords ***
Get Label Locator Tham Gia Khuyen Mai 100% On Promotion Page
    ${locator}    Set Variable    //div[contains(@class,'bg-account-page')]/div[1]/div[3]//*[text()='Khuyến mãi nạp lần đầu 100%']
    RETURN    ${locator}

Get Label Locator Tham Gia Khuyen Mai Hoan Tra On Promotion Page
    ${locator}    Set Variable    //div[contains(@class,'bg-account-page')]/div[1]/div[3]//*[text()='Hoàn trả vô tận đến 1%']
    RETURN    ${locator}
    
Get Value Of Total Stake On Promotion Page
    ${value}    Get Text    (//*[contains(@class,'bg-promotion-detail')])[2]//*[text()='Số tiền cược:']/following::span[1]
    RETURN    ${value}

Get Value Of Total Commission Cashback On Promotion Page
    ${value}    Get Text    (//*[contains(@class,'bg-promotion-detail')])[2]//*[text()='Số tiền hoàn trả:']/following::span[1]
    RETURN    ${value}

Get Value Of So Tien Da Nap Promtion 100% On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền đã nạp:'])[2]/following-sibling::span
    RETURN    ${value}

Get Value Of So Tien Thuong Promtion 100% On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền thưởng:'])[2]/following-sibling::span
    RETURN    ${value}

Get Value Of So Tien Rolling Promtion 100% On Promotion Page
    ${value}    Get Text    (//span[text()='Số tiền cược cần hoàn thành:'])[2]/following-sibling::span/span[2]
    RETURN    ${value}


*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Label Locator Tham Gia Khuyen Mai 100% On Promotion Page
    RETURN    //span[text()='Khuyến mãi 100% lần nạp đầu']

Get Label Locator Tham Gia Khuyen Mai Hoan Tra On Promotion Page
    RETURN    //span[text()='Hoàn trả vô tận 1.5%']
    
Get Value Of Total Stake On Promotion Page
    ${text}    Wait For Element State And Get Text    //span[text()='Tổng tiền cược']/following-sibling::span
    RETURN    ${text}

Get Value Of Total Commission Cashback On Promotion Page
    ${text}    Wait For Element State And Get Text    //span[text()='Tổng tiền hoàn trả']/following-sibling::span
    RETURN    ${text}

Get Value Of So Tien Da Nap Promtion 100% On Promotion Page
    ${text}    Wait For Element State And Get Text    //span[text()='Tiền nạp']//following-sibling::span
    RETURN    ${text}

Get Value Of So Tien Thuong Promtion 100% On Promotion Page
    ${text}    Wait For Element State And Get Text    //span[text()='Tiền thưởng']//following-sibling::span
    RETURN    ${text}

Get Value Of So Tien Rolling Promtion 100% On Promotion Page
    ${text}    Wait For Element State And Get Text    //span[text()='Số tiền cược cần đạt để nhận KM']//following-sibling::span
    RETURN    ${text}


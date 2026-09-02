*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Label Locator Tham Gia Khuyen Mai 100% On Promotion Page
    RETURN    //span[text()='Khuyến mãi 100% lần nạp đầu']

Get Label Locator Tham Gia Khuyen Mai Hoan Tra On Promotion Page
    RETURN    //span[text()='Hoàn trả vô tận 1.5%']

Get Value Of Total Stake On Promotion Page
    Sleep    1s
    ${value}    Wait For Element State And Get Text    //span[text()='Tiền cược']/../span[2]
    RETURN    ${value}

Get Value Of Total Commission Cashback On Promotion Page
    Sleep    1s
    ${value}    Wait For Element State And Get Text    //span[text()='Hoàn trả']/../span[2]
    RETURN    ${value}

Get Value Of So Tien Da Nap Promtion 100% On Promotion Page
    ${value}    Wait For Element State And Get Text    //span[text()='Tiền nạp']/../span[2]
    RETURN    ${value}

Get Value Of So Tien Thuong Promtion 100% On Promotion Page
    ${value}    Wait For Element State And Get Text    //span[text()='Tiền thưởng']/../span[2]
    RETURN    ${value}

Get Value Of So Tien Rolling Promtion 100% On Promotion Page
    ${value}    Wait For Element State And Get Text    //span[text()='Số tiền cược cần đạt:']/../span[2]
    RETURN    ${value}
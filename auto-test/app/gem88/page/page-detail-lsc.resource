*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${table_xpath_chi_tiet_lsc_prefix}    //div[@class='root-account-content-wrapper']//div[contains(@class,'flex flex-col items-center justify-center')]



*** Keywords ***
Get Value Thoi Gian In LCS Detail Page
    ${value}    Get Text     ${table_xpath_chi_tiet_lsc_prefix}//p[text()='Thời gian']/following-sibling::p
    RETURN    ${value}

Get Value ID In LSC Detail Page
    ${value}    Get Text     ${table_xpath_chi_tiet_lsc_prefix}//p[text()='ID']/following-sibling::div/span
    RETURN    ${value}

Get Value Tro Choi Name In LSC Detail Page
    ${value}    Get Text     ${table_xpath_chi_tiet_lsc_prefix}//p[text()='Trò chơi']/following-sibling::div
    RETURN    ${value}

Get Value Tien Cuoc In LSC Detail Page
    ${value}    Get Text     ${table_xpath_chi_tiet_lsc_prefix}//p[text()='Tiền cược']/following-sibling::p
    RETURN    ${value}

Get Value Tien Thang Thua In LSC Detail Page
    ${value}    Get Text     ${table_xpath_chi_tiet_lsc_prefix}//p[text()='Thắng/Thua']/following-sibling::div
    RETURN    ${value}

Get Value Tien Thuong In LSC Detail Page
    ${value}    Get Text     ${table_xpath_chi_tiet_lsc_prefix}//p[text()='Thưởng']/following-sibling::p
    RETURN    ${value}

Click Button Back to LSC Page
    ${btn_back}    Set Variable    //*[contains(@*[name()="xlink:href"], '#back')]
    Wait For Elements State    ${btn_back}
    Click    ${btn_back}

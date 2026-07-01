*** Settings ***
Library    Browser    timeout=15s


*** Variables ***
${table_xpath_prefix}    //div[@class='root-account-content-wrapper']//div[contains(@class,'flex flex-col items-center justify-center')]



*** Keywords ***
Get Value Amount In LSDG Detail Page
    ${value}    Get Text     ${table_xpath_prefix}/div[1]
    RETURN    ${value}

Get Value ID In LSDG Detail Page
    ${value}    Get Text     ${table_xpath_prefix}//p[text()='ID']/following-sibling::div/span
    RETURN    ${value}

Get Value Thoi Gian In LSDG Detail Page
    ${value}    Get Text     ${table_xpath_prefix}//p[text()='Thời gian']/following-sibling::p
    RETURN    ${value}

Get Value Loai Giao Dich In LSDG Detail Page
    ${value}    Get Text     ${table_xpath_prefix}//p[text()='Loại']/following-sibling::p
    RETURN    ${value}

Get Value Ngan Hang In LSDG Detail Page
    ${value}    Get Text     ${table_xpath_prefix}//p[text()='Ngân hàng']/following-sibling::p/span
    RETURN    ${value}

Get Value Trang Thai In LSDG Detail Page
    ${value}    Get Text     ${table_xpath_prefix}//p[text()='Trạng thái']/following-sibling::div//span
    RETURN    ${value}

Click Button Back to LSGD Page
    ${btn_back}    Set Variable    //*[contains(@*[name()="xlink:href"], '#arrow-left')]
    Wait For Elements State    ${btn_back}
    Click    ${btn_back}




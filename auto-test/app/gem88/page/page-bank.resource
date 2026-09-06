*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Span Lien Ket Ngan Hang On Quan Ly Bank Page
    ${locator}    Set Variable    //*[text()='Liên kết ngân hàng']
    RETURN    ${locator}

Get Value Of Ten Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text    //div[@class='relative block w-full md:hidden']/div[2]/div[3]/div[${p_index}]//span[text()='Tên tài khoản']/../span[2]
    RETURN    ${text}

Get Value Of So Tai Khoan On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text    //div[@class='relative block w-full md:hidden']/div[2]/div[3]/div[${p_index}]//span[text()='Số tài khoản']/../span[2]
    RETURN    ${text}

Get Value Of Trang Thai On Quan Ly Bank Page
    [Arguments]    ${p_index}
    ${text}    Wait For Element State And Get Text    //div[@class='relative block w-full md:hidden']/div[2]/div[3]/div[${p_index}]//img/../div[1]/div[2]/div[1]
    RETURN    ${text}
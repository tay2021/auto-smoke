*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource



*** Keywords ***
Get Locator Lich Su Giao Dich Trong On LSGD Page
    RETURN    (//*[text()='Bạn chưa từng phát sinh giao dịch.'])[1]

Get Locator Nap Tien Ngay On LSGD Page
    RETURN    //section[contains(@class,'deposit-page')]/div[1]//span[text()='Nạp Ngay']
    
    
Click To View Detail Of Transaction On LSDG Detail Page
    [Arguments]    ${p_index}
    Wait For Element State And Click On It    //div[@id='first']/../div[${p_index}]

Get Value Amount On LSDG Detail Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text     //div[@id='first']/../div[${p_index}]/div[1]/div[2]/div[2]/div[1]
    RETURN    ${value}

Get Value Loai Giao Dich On LSDG Detail Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text     //div[@id='first']/../div[${p_index}]/div[1]/div[2]//span/span[1]
    RETURN    ${value}

Get Value Trang Thai On LSDG Detail Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text     //div[@id='first']/../div[${p_index}]/div[1]/div[2]/div[2]//span
    RETURN    ${value}
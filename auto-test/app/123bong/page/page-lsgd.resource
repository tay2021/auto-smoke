*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Click On The Arrow To Expand Detail On LSGD Page
    [Arguments]    ${p_index}
    Wait For Element State And Click On It    //div[@id='first']/../div[${p_index}]

Get Locator Lich Su Giao Dich Trong On LSGD Page
    RETURN    //section[contains(@class,'deposit-page')]/div[1]//*[text()='Bạn chưa từng phát sinh giao dịch.']

Get Locator Nap Tien Ngay On LSGD Page
    RETURN    //section[contains(@class,'deposit-page')]/div[1]//div[text()='Nạp Ngay']

Get Value Amount In LSDG Detail Page
    [Arguments]    ${index}
    ${value}    Wait For Element State And Get Text    //div[@id='first']/../div[${index}]/div[1]/div[2]/div[2]/div[1]
    RETURN    ${value}


Get Value Loai Giao Dich In LSDG Detail Page
    [Arguments]    ${index}
    ${value}    Wait For Element State And Get Text     //div[@id='first']/../div[${index}]/div[1]/div[2]/div[1]/span[1]/span
    RETURN    ${value}

Get Value Ngan Hang In LSDG Detail Page
    [Arguments]    ${index}
    ${value}    Wait For Element State And Get Text     //div[@id='first']/../div[${index}]//following-sibling::div[1]/div[1]/div[2]/span[2]
    RETURN    ${value}

Get Value Trang Thai In LSDG Detail Page
    [Arguments]    ${index}
    ${value}    Wait For Element State And Get Text     //div[@id='first']/../div[${index}]/div[1]/div[2]/div[2]/div[2]/span
    RETURN    ${value}
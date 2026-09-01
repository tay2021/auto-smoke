*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource



*** Variables ***
${btn_nap_tien_ngay_on_lsdg_page}    //div[contains(@class,'bg-account-page')]//div[@class='text-center']/following-sibling::div//button        


*** Keywords ***
Click On The Arrow To Expand Detail On LSC Page
    [Arguments]    ${p_index}
    Wait For Element State And Click On It    //div[@id='first']/../div[${p_index}]

Get Locator Lich Su Cuoc Trong On LSC Page
    RETURN    //table/following-sibling::div//span[text()='Bạn không có phát sinh lịch sử cược.']

Get Value ID In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text    //div[@id='first']/../div[${p_index}]/following-sibling::div[1]/div[1]/div[2]/span[2]
    RETURN    ${value}

Get Value Tro Choi Name In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text    (//div[@id='first']/../div[${p_index}]//span)[2]
    RETURN    ${value}

Get Value Tien Cuoc In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text    //div[@id='first']/../div[${p_index}]/following-sibling::div[1]/div[1]/div[3]/span[2]
    RETURN    ${value}

Get Value Tien Thang Thua In LSC Detail Page
    [Arguments]    ${p_index}
    ${value}    Wait For Element State And Get Text     //div[@id='first']/../div[${p_index}]/div[1]/div[1]/div[2]
    RETURN    ${value}
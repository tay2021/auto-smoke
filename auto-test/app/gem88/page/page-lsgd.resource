*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Locator Lich Su Giao Dich Trong On LSGD Page
    RETURN    //div[contains(@class,'bg-account-page')]//div[@class='text-center']//div[text()='Bạn chưa từng phát sinh giao dịch.']
    

Get Locator Nap Tien Ngay On LSGD Page
    RETURN    //div[contains(@class,'bg-account-page')]//div[@class='text-center']/following-sibling::div//button

Click On A Transaction On LSGD Page
    [Arguments]    ${p_id_phieu}
    Wait For Element State And Click On It    //*[@class='root-account-content-wrapper']//*[contains(@class,'flex flex-col px-3 py-4')]/*[contains(normalize-space(),'${p_id_phieu}')]

Click On Button Giao Dich Ngay On LSGD Page
    Wait For Element State And Click On It    (//button[text()='NẠP TIỀN NGAY'])[2]
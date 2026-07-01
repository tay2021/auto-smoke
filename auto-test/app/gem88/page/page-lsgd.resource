*** Settings ***
Library    Browser    timeout=15s



*** Variables ***
${btn_nap_tien_ngay_on_lsdg_page}    //div[contains(@class,'bg-account-page')]//div[@class='text-center']/following-sibling::div//button        


*** Keywords ***
Get Locator Lich Su Giao Dich Trong On LSGD Page
    ${locator}    Set Variable    //div[contains(@class,'bg-account-page')]//div[@class='text-center']//div[text()='Bạn chưa từng phát sinh giao dịch.']
    RETURN    ${locator}
    

Get Locator Nap Tien Ngay On LSGD Page
    RETURN    ${btn_nap_tien_ngay_on_lsdg_page}

Click On A Transaction On LSGD Page
    [Arguments]    ${p_id_phieu}
    Click    //*[@class='root-account-content-wrapper']//*[contains(@class,'flex flex-col px-3 py-4')]/*[contains(normalize-space(),'${p_id_phieu}')]
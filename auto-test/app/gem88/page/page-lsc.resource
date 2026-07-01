*** Settings ***
Library    Browser    timeout=15s



*** Variables ***
${btn_nap_tien_ngay_on_lsdg_page}    //div[contains(@class,'bg-account-page')]//div[@class='text-center']/following-sibling::div//button        


*** Keywords ***
Get Locator Lich Su Cuoc Trong On LSC Page
    ${locator}    Set Variable    //div[text()='Bạn không có phát sinh lịch sử cược.']
    RETURN    ${locator}

Click On A Transaction On LSC Page
    [Arguments]    ${p_id_transaction}
    Click    //*[@class='root-account-content-wrapper']//*[contains(@class,'flex flex-col px-3 py-4')]/*[contains(normalize-space(),'${p_id_transaction}')]
    


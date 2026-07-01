*** Settings ***
Library    Browser


*** Variables ***
${btn_close_welcome_pop_up}    //div[contains(@class,'dots welcome-banner')]/../../preceding-sibling::div/img


*** Keywords ***
Get Value Of Vip Level On VIP Program Page
    ${value}    Get Text    //*[contains(text(),'Hạng hiện tại')]/preceding-sibling::span
    RETURN    ${value}

Get Value Of Accumulate On VIP Program Page
    ${value}    Get Text    (//*[contains(@class,'swiper-slide-active')])[1]//*[contains(text(),'Lên cấp tiếp theo')]/../div[1]/div[1]/span
    RETURN    ${value}
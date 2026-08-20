*** Settings ***
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Locator Lich Su Cuoc Trong On LSC Page
    RETURN    //table/following-sibling::div//span[text()='Bạn không có phát sinh lịch sử cược.']

Click On The First Expand Arrow On LSC Page
    Wait For Element State And Click On It    css=#first > div > div > div.text-success-main.text-20.text-scale-body.flex.flex-col.items-center.justify-center.text-right.font-bold > svg

Get Value ID Of First Transaction On LSC Detail Page
    ${value}    Wait For Element State And Get Text    //div[@id='first']//following-sibling::div[1]//span[text()='ID']/following-sibling::span
    RETURN    ${value}

Get Value Tro Choi Name Of First Transaction On LSC Detail Page
    ${value}    Wait For Element State And Get Text     //div[@id='first']//span[1]
    RETURN    ${value}

Get Value Tien Cuoc Of First Transaction On LSC Detail Page
    ${value}    Wait For Element State And Get Text    //div[@id='first']//following-sibling::div[1]//span[text()='Số tiền']/following-sibling::span
    RETURN    ${value}

Get Value Tien Thang Thua Of First Transaction On LSC Detail Page
    ${value}    Wait For Element State And Get Text     //div[@id='first']/div[1]/div[1]/div[2]
    RETURN    ${value}

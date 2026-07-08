*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../page/page-deposit.resource
Resource    ../page/page-the-cao.resource
Resource    ../page/page-flashpay.resource
Library    String



*** Keywords ***
Go To Deposit Page
    Go To    ${GL_LU88_URL}account/deposit

Assert Create Phieu Nap By Crypto Correct
    Click On Tab Nap Tien Crypto On Deposit Page
    ${src}    Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    Should Start With    ${src}    data:image/png;base64

Assert Create Phieu Nap By The Cao Correct
    Click On Tab Nap Tien The Cao On Deposit Page
    Select Nha Mang On Deposit The Cao Page    1    #chon mang viettel
    Input Serial The Cao On Deposit The Cao Page    55555555555555
    Input PIN The Cao On Deposit The Cao Page    55555555555    #gia tri test
    Select Menh Gia The Cao On Deposit The Cao Page    10
    Click Button Nap Tien On Deposit The Cao Page
    Get Text    body    contains    Nạp thẻ thành công

Assert Create Phieu Nap By Flash Pay Correct
    Click On Tab Nap Tien QR Code On Deposit Page
    Select Random Kenh Nap On Flash Page
    Input So Tien On Flash Page    200
    Click On Button Tao Ma QR On Flash Page
    ${src}    Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    Should Start With    ${src}    data:image/png;base64






*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On The Menu Ngan Hang Cua Ban On The Account Info Page
    Wait For Element State And Click On It    (//span[text()='Ngân hàng của bạn'])[2]

Click On The Menu Gift Code On The Account Info Page
    Wait For Element State And Click On It    (//a[text()='Gift code'])[2]

Click On The Menu P2P On The Account Info Page
    Wait For Element State And Click On It    (//a[contains(text(),'P2P')])[2]

Click On The Menu Ca Cuoc On The Account Info Page
    Wait For Element State And Click On It    (//span[text()='Cá cược'])[2]

Click On The Menu Giao Dich On The Account Info Page
    Wait For Element State And Click On It    (//span[text()='Giao dịch'])[2]

Click On The User Avatar On The Account Info Page
    Wait For Element State And Click On It    (//img[@alt='avatar'])[3]

Click On The Menu Khuyen Mai On The Account Info Page
    Wait For Element State And Click On It    (//a[contains(text(),'Khuyến mãi')])[2]

Click On The Menu Rut Tien On The Account Info Page
    Wait For Element State And Click On It    (//a[contains(text(),'Rút tiền')])[3]
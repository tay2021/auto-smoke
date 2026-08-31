*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Click On The Menu Ngan Hang Cua Ban On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//span[text()='Ngân hàng của bạn']

Click On The Menu Gift Code On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//span[text()='Gift code']

Click On The Menu Ca Cuoc On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//a[text()='Cá cược']

Click On The Menu P2P On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//a[text()='P2P']

Click On The Icon Account Profile On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//a[@href='/account/profile']

Click On The Menu Khuyen Mai Cua Ban On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//span[text()='Khuyến mãi của bạn']

Click On The Menu Thanh Vien VIP On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//span[text()='Thành viên VIP']

Click On The Menu Rut Tien On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//a[text()='Rút tiền']

Click On The Menu Giao Dich On The Account Info Page
    Wait For Element State And Click On It    //main[@class='main-content']/div[1]/div[1]/div[2]/div[2]//a[text()='Giao dịch']

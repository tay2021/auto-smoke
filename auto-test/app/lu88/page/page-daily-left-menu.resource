*** Settings ***
Resource    ../../common/common-keywords.resource



*** Keywords ***
Click On The Hamburge Menu On Left Menu Page
    Wait For Element State And Click On It    //header//*[contains(@class,'ant-avatar')]/following-sibling::div[3]

Click On The Menu Gioi Thieu On Left Menu Page
    Wait For Element State And Click On It    //a[contains(text(),'Link giới thiệu')]

Click On The Menu Doanh So On Left Menu Page
    Wait For Element State And Click On It    //a[contains(text(),'Doanh số')]

Click On The Menu Quan Ly Hoi Vien On Left Menu Page
    Wait For Element State And Click On It    //span[text()='Quản lý hội viên']/..

Click On The Menu Quan Ly Dai Ly On Left Menu Page
    Wait For Element State And Click On It    //span[text()='Quản lý đại lý']/..

Click On The Menu Tong Cuoc On Left Menu Page
    Wait For Element State And Click On It    //span[text()='Tổng cược']/..
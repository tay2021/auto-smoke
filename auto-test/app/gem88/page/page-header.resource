*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource




*** Keywords ***
Click On The Avatar Image On Header Page
    Wait For Element State And Click On It    //img[@alt='avatar']

Click On The Avatar Image Quan Ly Ngan Hang On Header Page
    Wait For Element State And Click On It    img[alt='Quản lý ngân hàng']

Click On The Button Nap Tien On Header Page
    Wait For Element State And Click On It    //div[@role='dialog']//button[text()='Nạp tiền']
    
Click On The Avatar Image Gift Code On Header Page
    Wait For Element State And Click On It    img[alt='Gift code']
    
Click On The Avatar Image Lich Su Cuoc On Header Page
    Wait For Element State And Click On It    img[alt='Lịch sử cược']
    
Click On The Avatar Image Giao Dich P2p On Header Page
    Wait For Element State And Click On It    img[alt='Giao dịch P2P']

Click On The Avatar Image Doi Mat Khau On Header Page
    Wait For Element State And Click On It    img[alt='Đổi mật khẩu']

Click On The Avatar Image Lich Su Giao Dich On Header Page
    Wait For Element State And Click On It    img[alt='Lịch sử giao dịch']

Click On The Avatar Image Profile Information On Header Page
    Wait For Element State And Click On It    img[alt='Thông tin tài khoản']
    
Click On The Avatar Image Promotion On Header Page
    Wait For Element State And Click On It    img[alt='Khuyến mãi áp dụng']

Click On The Avatar Image VIP On Header Page
    Wait For Element State And Click On It    img[alt='VIP club']

Click On The Button Rut Tien On Header Page
    Wait For Element State And Click On It    //div[@role='dialog']//button[text()='Rút tiền']

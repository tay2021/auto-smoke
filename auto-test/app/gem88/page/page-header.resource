
*** Variables ***
${btn_dang_nhap_header}                  (//button[@id='open-login-modal'])[1]
${img_avatar_profile}                    //img[@alt='avatar']
${img_avatar_profile_info}               img[alt='Thông tin tài khoản']
${img_avatar_doi_matkhau}                img[alt='Đổi mật khẩu']
${img_avatar_p2p}                        img[alt='Giao dịch P2P']
${img_avatar_lsgd}                       img[alt='Lịch sử giao dịch']
${img_avatar_lsc}                        img[alt='Lịch sử cược']
${img_avatar_quanly_bank}                img[alt='Quản lý ngân hàng']
${img_avatar_promotion}                  img[alt='Khuyến mãi áp dụng']
${img_avatar_vip}                        img[alt='VIP club']
${img_avatar_gift_code}                  //span[text()='Gift code']





*** Keywords ***
Click Button Dang Nhap On Header Page
    Wait For Elements State    ${btn_dang_nhap_header}    attached
    Click With Options    ${btn_dang_nhap_header}     force=True
    Click    ${btn_dang_nhap_header}

Click On The Avatar Image On Header Page
    Wait For Elements State    ${img_avatar_profile}    visible
    Click    ${img_avatar_profile}
    
Click On The Avatar Image Profile Information On Header Page
    Wait For Elements State    ${img_avatar_profile_info}    visible
    Click    ${img_avatar_profile_info}

Click On The Avatar Image Doi Mat Khau On Header Page
    Wait For Elements State    ${img_avatar_doi_matkhau}    visible
    Click    ${img_avatar_doi_matkhau}
    
Click On The Avatar Image Giao Dich P2p On Header Page
    Wait For Elements State    ${img_avatar_p2p}    visible
    Click    ${img_avatar_p2p}

Click On The Avatar Image Lich Su Giao Dich On Header Page
    Wait For Elements State    ${img_avatar_lsgd}    visible
    Click    ${img_avatar_lsgd}
    
Click On The Avatar Image Lich Su Cuoc On Header Page
    Wait For Elements State    ${img_avatar_lsc}    visible
    Click    ${img_avatar_lsc}

Click On The Avatar Image Quan Ly Ngan Hang On Header Page
    Wait For Elements State    ${img_avatar_quanly_bank}    visible
    Click    ${img_avatar_quanly_bank}

Click On The Avatar Image Promotion On Header Page
    Wait For Elements State    ${img_avatar_promotion}    visible
    Click    ${img_avatar_promotion}

Click On The Avatar Image VIP On Header Page
    Wait For Elements State    ${img_avatar_vip}    visible
    Click    ${img_avatar_vip}
    
Click On The Avatar Image Gift Code On Header Page
    Wait For Elements State    ${img_avatar_gift_code}    visible
    Click    ${img_avatar_gift_code}

Click On The Button Nap Tien On Header Page
    ${btn_naptien}    Set Variable    //div[@role='dialog']//button[text()='Nạp tiền']
    Wait For Elements State    ${btn_naptien}    visible
    Click    ${btn_naptien}

Click On The Button Rut Tien On Header Page
    ${btn_naptien}    Set Variable    //div[@role='dialog']//button[text()='Rút tiền']
    Wait For Elements State    ${btn_naptien}    visible
    Click    ${btn_naptien}
*** Settings ***
Resource    ../../import.resource


*** Variables ***
${btn_dang_nhap_header}                  //button[text()='Đăng nhập']
${img_avatar_profile}                    //header//span[contains(@class,'ant-avatar')]
${img_avatar_profile_info}               //ul[contains(@class,'ant-dropdown')]//*[@href='/account/profile']






${img_avatar_doi_matkhau}                img[alt='Đổi mật khẩu']
${img_avatar_p2p}                        img[alt='Giao dịch P2P']
${img_avatar_lsgd}                       img[alt='Lịch sử giao dịch']
${img_avatar_lsc}                        img[alt='Lịch sử cược']
${img_avatar_quanly_bank}                img[alt='Quản lý ngân hàng']
${img_avatar_promotion}                  img[alt='Khuyến mãi áp dụng']
${img_avatar_vip}                        img[alt='VIP club']
${img_avatar_gift_code}                  img[alt='Gift code']





*** Keywords ***
Click Button Dang Nhap On Header Page
    Wait For Elements State    ${btn_dang_nhap_header}    attached
    Click    ${btn_dang_nhap_header}

Click On The Avatar Image On Header Page
    Wait For Elements State    ${img_avatar_profile}    visible
    Click    ${img_avatar_profile}

Click On The Avatar Image Profile Information On Header Page
    Wait For Elements State    ${img_avatar_profile_info}    visible
    Click    ${img_avatar_profile_info}
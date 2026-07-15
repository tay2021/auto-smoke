*** Settings ***
Library    DateTime
Resource    ../../common/common-keywords.resource
Resource    ../page/page-daily-quanlyhoivien.resource
Resource    ../page/page-daily-quanlydaily.resource
Resource    ../api-keywords/daily-baocao-api-request.resource



*** Keyword ***
Go To Page Bao Cao Quan Ly Hoi Vien
    Go To    ${GL_LU88_DAILY_URL}revenue-by-user

Go To Page Bao Cao Quan Ly Dai Ly
    Go To    ${GL_LU88_DAILY_URL}revenue-by-agent

Go To Page Bao Cao Quan Cuoc Theo Game Category
    Go To    ${GL_LU88_DAILY_URL}bet-type

Get Current From Date And To Date Selected By Default On Chi Tiet Quan ly Hoi Vien
    ${from_date}    Get Default Selected From Date On Page Quan Ly Hoi Vien
    ${to_date}    Get Default Selected To Date On Page Quan Ly Hoi Vien
    ${dict}    Create Dictionary    from_date=${from_date}    to_date=${to_date}
    RETURN    ${dict}

Get Current From Date And To Date Selected By Default On Chi Tiet Quan ly Dai Ly
    ${from_date}    Get Default Selected From Date On Page Quan Ly Dai Ly
    ${to_date}    Get Default Selected To Date On Page Quan Ly Dai Ly
    ${dict}    Create Dictionary    from_date=${from_date}    to_date=${to_date}
    RETURN    ${dict}

Assert Chi Tiet Quan Ly Hoi Vien Correct
    [Arguments]    ${p_from_date}    ${p_to_date}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bao Cao Quan Ly Hoi Vien   ${bearer_token}    ${p_from_date}    ${p_to_date}
    ${content_api_bank}    Get Content Of Api Get Bao Cao Quan Ly Hoi Vien    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${item}    Get Value From Json    ${json}    $.data.items
    ${item}    Set Variable    ${item}[0]
    ${len}    Get Length    ${item}
    IF    ${len}>0
        FOR    ${data}    IN    @{item}
            ${id}    Get From Dictionary    ${data}    id
            Log    ${id}
            ${expected_username}    Get From Dictionary    ${data}    username
            ${expected_nguon_dang_ky}    Get From Dictionary    ${data}    utm_campaign
            IF    '${expected_nguon_dang_ky}'=='None'
                ${expected_nguon_dang_ky}    Set Variable    --------
            END
            ${expected_thoi_gian_dang_ky}    Get From Dictionary    ${data}    created_time
            ${expected_thoi_gian_dang_ky}=    Evaluate    __import__('datetime').datetime.strptime("${expected_thoi_gian_dang_ky}".replace('Z', ''), "%Y-%m-%dT%H:%M:%S.%f").strftime("%d/%m/%Y")
            ${expected_thoi_gian_dang_nhap_gan_nhat}=    Get From Dictionary    ${data}    last_login
            ${expected_thoi_gian_dang_nhap_gan_nhat}=    Evaluate    __import__('datetime').datetime.strptime("${expected_thoi_gian_dang_nhap_gan_nhat}".replace('Z', ''), "%Y-%m-%dT%H:%M:%S.%f").strftime("%d/%m/%Y")
            ${expected_trang_thai}=    Get From Dictionary    ${data}    status
            IF    '${expected_trang_thai}' in ['ACTIVE','SUSPECT']
                ${expected_trang_thai}    Set Variable    Hoạt động
            END
            ${expected_lai_rong}=    Get From Dictionary    ${data}    agent_profit
            ${expected_lai_rong}=    Evaluate    "{:,.0f}".format(${expected_lai_rong})
            ${expected_tong_nap}     Get From Dictionary    ${data}    deposit
            ${expected_so_lan_nap}     Get From Dictionary    ${data}    deposit_count    default=0
            ${expected_tong_cuoc}     Get From Dictionary    ${data}    stake
            ${expected_tong_cuoc}    Evaluate    "{:,.0f}".format(${expected_tong_cuoc})

            ${expected_thang_thua}     Get From Dictionary    ${data}    winLost
            ${expected_thang_thua}    Evaluate    "{:,.0f}".format(${expected_thang_thua})
            ${expected_hoa_hong}     Get From Dictionary    ${data}    agent_commission
            ${expected_hoa_hong}    Convert Thousand With Comma    ${expected_hoa_hong}
            ${expected_hoan_tra}     Get From Dictionary    ${data}    return_commission
            ${expected_hoan_tra}    Convert Thousand With Comma    ${expected_hoan_tra}
            ${expected_km_100}     Get From Dictionary    ${data}    promotion_real_amount
            ${expected_km_100}    Evaluate    "{:,.0f}".format(${expected_km_100})
            
            
            ${actual_username}    Get Ten Dang Nhap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_nguon_dang_ky}    Get Nguon Dang Ky Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_thoi_gian_dang_ky}    Get Thoi Gian Dang Ky Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_thoi_gian_dang_nhap_gan_nhat}    Get Thoi Gian Dang Nhat Gan Nhat Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_trang_thai}    Get Trang Thai Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_lai_rong}    Get Lai Rong Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_lai_rong}    Remove Space And Char K Out Of String    ${actual_lai_rong}
            ${actual_tong_nap}    Get Tong Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_tong_nap}    Remove Space And Char K Out Of String    ${actual_tong_nap}
            ${actual_so_lan_nap}    Get So Lan Nap Nap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_tong_cuoc}    Get Tong Cuoc Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_tong_cuoc}    Remove Space And Char K Out Of String    ${actual_tong_cuoc}
            ${actual_thang_thua}    Get Thang Thua Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_thang_thua}    Remove Space And Char K Out Of String    ${actual_thang_thua}
            ${actual_hoa_hong}    Get Hoa Hong Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_hoa_hong}    Remove Space And Char K Out Of String    ${actual_hoa_hong}
            ${actual_hoa_tra}    Get Hoan Tra Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_hoa_tra}    Remove Space And Char K Out Of String    ${actual_hoa_tra}
            ${actual_km_100}    Get Khuyen Mai 100 Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_km_100}    Remove Space And Char K Out Of String    ${actual_km_100}

            Should Be True    '${expected_username}'=='${actual_username}'
            Should Be True    '${expected_nguon_dang_ky}'=='${actual_nguon_dang_ky}'
            Run Keyword And Continue On Failure    Should Be True    '${expected_thoi_gian_dang_ky}'=='${actual_thoi_gian_dang_ky}'
            Should Be True    '${expected_thoi_gian_dang_nhap_gan_nhat}'=='${actual_thoi_gian_dang_nhap_gan_nhat}'
            Should Be True    '${expected_trang_thai}'=='${actual_trang_thai}'
            Should Be True    '${expected_lai_rong}'=='${actual_lai_rong}'
            Should Be True    '${expected_tong_nap}'=='${actual_tong_nap}'
            Should Be True    '${expected_so_lan_nap}'=='${actual_so_lan_nap}'
            Should Be True    '${expected_tong_cuoc}'=='${actual_tong_cuoc}'
            Should Be True    '${expected_thang_thua}'=='${actual_thang_thua}'
            Should Be True    '${expected_hoan_tra}'=='${actual_hoa_tra}'
            Should Be True    '${expected_km_100}'=='${actual_km_100}'

        END
    END

Assert Chi Tiet Quan Ly Dai Ly Correct
    [Arguments]    ${p_from_date}    ${p_to_date}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bao Cao Quan Ly Dai Ly   ${bearer_token}    ${p_from_date}    ${p_to_date}
    ${content_api_bank}    Get Content Of Api Get Bao Cao Quan Ly Dai Ly    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${item}    Get Value From Json    ${json}    $.data.items
    ${item}    Set Variable    ${item}[0]
    ${len}    Get Length    ${item}
    IF    ${len}>0
        FOR    ${data}    IN    @{item}
            ${id}    Get From Dictionary    ${data}    id
            Log    ${id}
            ${expected_username}    Get From Dictionary    ${data}    username
            ${expected_nguon_dang_ky}    Get From Dictionary    ${data}    utm_campaign
            IF    '${expected_nguon_dang_ky}'=='None'
                ${expected_nguon_dang_ky}    Set Variable    --------
            END
            ${expected_thoi_gian_dang_ky}    Get From Dictionary    ${data}    created_time
            ${expected_thoi_gian_dang_ky}=    Evaluate    __import__('datetime').datetime.strptime("${expected_thoi_gian_dang_ky}".replace('Z', ''), "%Y-%m-%dT%H:%M:%S.%f").strftime("%d/%m/%Y")
            ${expected_thoi_gian_dang_nhap_gan_nhat}=    Get From Dictionary    ${data}    last_login
            ${expected_thoi_gian_dang_nhap_gan_nhat}=    Evaluate    __import__('datetime').datetime.strptime("${expected_thoi_gian_dang_nhap_gan_nhat}".replace('Z', ''), "%Y-%m-%dT%H:%M:%S.%f").strftime("%d/%m/%Y")
            ${expected_trang_thai}=    Get From Dictionary    ${data}    agent_status
            IF    '${expected_trang_thai}'=='APPROVED'
                ${expected_trang_thai}    Set Variable    Đã Duyệt
            END
            ${expected_level}    Get From Dictionary    ${data}    agent_level
            ${expected_hoa_hong}    Get From Dictionary    ${data}    agent_percent
            ${expected_hoa_hong}    Set Variable    ${expected_hoa_hong}%

            ${expected_level}=    Get From Dictionary    ${data}    agent_level
            ${expected_level}    Set Variable    Đại lý cấp ${expected_level}


            ${actual_username}    Get Ten Dang Nhap Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_nguon_dang_ky}    Get Nguon Dang Ky Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_thoi_gian_dang_ky}    Get Thoi Gian Dang Ky Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_thoi_gian_dang_nhap_gan_nhat}    Get Thoi Gian Dang Nhat Gan Nhat Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_trang_thai}    Get Trang Thai Base On Ma Hoi Vien On Page Quan Ly Hoi Vien    ${id}
            ${actual_level}    Get Level Base On Ma Hoi Vien On Page Quan Ly Dai Ly    ${id}
            
            Should Be True    '${expected_username}'=='${actual_username}'
            Should Be True    '${expected_nguon_dang_ky}'=='${actual_nguon_dang_ky}'
            Run Keyword And Continue On Failure    Should Be True    '${expected_thoi_gian_dang_ky}'=='${actual_thoi_gian_dang_ky}'
            Should Be True    '${expected_thoi_gian_dang_nhap_gan_nhat}'=='${actual_thoi_gian_dang_nhap_gan_nhat}'
            Should Be True    '${expected_trang_thai}'=='${actual_trang_thai}'
            Should Be True    '${expected_level}'=='${actual_level}'

        END
    END

Assert Chi Tiet Quan Ly Cuoc Theo Game Category Correct
    [Arguments]    ${p_from_date}    ${p_to_date}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bao Cao Quan Ly Bet Game Theo Category   ${bearer_token}    ${p_from_date}    ${p_to_date}
    ${content_api_bank}    Get Content Of Api Get Bao Cao Quan Ly Bet Game Theo Category    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${data}    Get Value From Json    ${json}    $.data
    ${data}    Set Variable    ${data}[0]
    ${len}    Get Length    ${data}
    IF    ${len}>0
        FOR    ${item}    IN    @{data}
            ${category_name}    Get From Dictionary    ${item}    category
            ${category_name}    Evaluate    "${category_name}".lower()
            ${stake}    Get From Dictionary    ${item}    stake
            ${stake}    Evaluate    "{:,.0f}".format(${stake})
            ${stake}    Set Variable    ${stake} K
            ${locator}    Set Variable     //*[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='${category_name}']
            ${exist}   Check Element Exists On Page    ${locator}
            Should Be True    ${exist}
        END
    END
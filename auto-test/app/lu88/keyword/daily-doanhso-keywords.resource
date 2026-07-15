*** Settings ***
Library    DateTime
Resource    ../../common/common-keywords.resource
Resource    ../page/page-daily-commission.resource
Resource    ../api-keywords/daily-tongquan-api-request.resource


*** Keyword ***
Go To Page Doanh So Dai Ly
    Go To    ${GL_LU88_DAILY_URL}commission
    
Get Current From Date And To Date Selected By Default
    ${from_date}=    Get Default Selected From Date
    ${to_date}=    Get Default Selected To Date
    ${dict}    Create Dictionary    from_date=${from_date}    to_date=${to_date}
    RETURN    ${dict}

Assert Doanh So From Date To Date Correct
    [Arguments]    ${p_from_date}    ${p_to_date}
    Sleep    1s
    ${actual_lai_rong}    Get Span Lai Rong On Doanh So Page
    ${actual_lai_rong}=    Remove Space And Char K Out Of String    ${actual_lai_rong}
    ${actual_hoa_hong}    Get Span Hoa Hong On Doanh So Page
    ${actual_hoa_hong}=    Remove Space And Char K Out Of String    ${actual_hoa_hong}
    ${actual_tien_cuoc}    Get Span Tien Cuoc On Doanh So Page
    ${actual_tien_cuoc}=    Remove Space And Char K Out Of String    ${actual_tien_cuoc}
    ${actual_thang_thua}    Get Span Thang Thua On Doanh So Page
    ${actual_thang_thua}=    Remove Space And Char K Out Of String    ${actual_thang_thua}
    ${actual_hoan_tra}    Get Span Hoan Tra On Doanh So Page
    ${actual_hoan_tra}=    Remove Space And Char K Out Of String    ${actual_hoan_tra}
    ${actual_khuyen_mai}    Get Span Khuyen Mai On Doanh So Page
    ${actual_khuyen_mai}=    Remove Space And Char K Out Of String    ${actual_khuyen_mai}
    ${actual_tong_nap}    Get Span Tong Nap On Doanh So Page
    ${actual_tong_nap}=    Remove Space And Char K Out Of String    ${actual_tong_nap}
    ${actual_phi_tong_nap}    Get Span Phi Tong Nap On Doanh So Page
    ${actual_phi_tong_nap}=    Remove Space And Char K Out Of String    ${actual_phi_tong_nap}
    

    ${data}    Get Total Of Agent Via Api    ${p_from_date}    ${p_to_date}
    ${expected_total_commission}    Get Value From Json    ${data}    $.total_commission
    ${expected_total_commission}    Convert Thousand With Comma    ${expected_total_commission}[0]
    ${expected_hoa_hong}    Get Value From Json    ${data}    $.agent_commission
    ${expected_hoa_hong}    Convert Thousand With Comma    ${expected_hoa_hong}[0]
    ${expected_stake}    Get Value From Json    ${data}    $.stake
    ${expected_stake}    Convert Thousand With Comma    ${expected_stake}[0]
    ${expected_winlost}    Get Value From Json    ${data}    $.winlost
    ${expected_winlost}    Convert Thousand With Comma    ${expected_winlost}[0]
    ${expected_return_commission}    Get Value From Json    ${data}    $.return_commission
    ${expected_return_commission}    Convert Thousand With Comma    ${expected_return_commission}[0]
    ${expected_invoice_promotion_real_amount}    Get Value From Json    ${data}    $.invoice_promotion_real_amount
    ${expected_invoice_promotion_real_amount}    Convert Thousand With Comma    ${expected_invoice_promotion_real_amount}[0]
    ${expected_invoice_payment_amount}    Get Value From Json    ${data}    $.invoice_payment_amount
    ${expected_invoice_payment_amount}    Convert Thousand With Comma    ${expected_invoice_payment_amount}[0]
    ${expected_invoice_payment_amount_fee}    Get Value From Json    ${data}    $.invoice_payment_amount_fee
    ${expected_invoice_payment_amount_fee}    Convert Thousand With Comma    ${expected_invoice_payment_amount_fee}[0]

    Should Be True    '${expected_total_commission}'=='${actual_lai_rong}'
    Should Be True    '${expected_hoa_hong}'=='${actual_hoa_hong}'
    Should Be True    '${expected_stake}'=='${actual_tien_cuoc}'
    Should Be True    '${expected_winlost}'=='${actual_thang_thua}'
    Should Be True    '${expected_return_commission}'=='${actual_hoan_tra}'
    Should Be True    '${expected_invoice_promotion_real_amount}'=='${actual_khuyen_mai}'
    Should Be True    '${expected_invoice_payment_amount}'=='${actual_tong_nap}'
    Should Be True    '${expected_invoice_payment_amount_fee}'=='${actual_phi_tong_nap}'


Get Total Of Agent Via Api
    [Arguments]    ${p_from_date}    ${p_to_date}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Total Agent   ${bearer_token}    ${p_from_date}    ${p_to_date}
    ${content_api_bank}    Get Content Of Api Get Total Agent    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${data}    Get Value From Json    ${json}    $.data
    RETURN    ${data}[0]




*** Settings ***
Library    DateTime
Resource    ../../common/common-keywords.resource
Resource    ../page/page-daily-tongquan.resource
Resource    ../api-keywords/daily-tongquan-api-request.resource


*** Keyword ***
Assert Tong Quan Dai Ly Trong Vong 30 Ngay Correct
    Click Span 30 Ngay On Tong Quan Page
    Wait For Load State    networkidle
    Assert Tong Quan Dai Ly    30

Assert Tong Quan Dai Ly Trong Vong 7 Ngay Correct
    Click Span 7 Ngay On Tong Quan Page
    Wait For Load State    networkidle
    Assert Tong Quan Dai Ly    7


Assert Tong Quan Dai Ly Hom Nay Correct
    Click Span Hom Nay On Tong Quan Page
    Sleep    1s
    Assert Tong Quan Dai Ly    1


Assert Tong Quan Dai Ly
    [Arguments]    ${p_so_ngay}    #Các giá trị là 1, 7, 30
    ${actual_tong_lai_rong}    Get Value Of Span Tong Lai Rong On Tong Quan Page
    ${actual_tong_thang_thua}    Get Value Of Span Tong Thang Thua On Tong Quan Page
    ${actual_tong_nap}    Get Value Of Span Tong Nap On Tong Quan Page
    ${actual_tong_new_memeber}    Get Value Of Span Tong Thanh Vien Moi On Tong Quan Page

    ${actual_tong_lai_rong}    Remove Space And Char K Out Of String    ${actual_tong_lai_rong}
    ${actual_tong_thang_thua}    Remove Space And Char K Out Of String    ${actual_tong_thang_thua}
    ${actual_tong_nap}    Remove Space And Char K Out Of String    ${actual_tong_nap}
    ${actual_tong_new_memeber}    Remove Space And Char K Out Of String    ${actual_tong_new_memeber}

    IF    ${p_so_ngay}==1
        ${dict_data}    Get Total Of Agent Today
    ELSE IF    ${p_so_ngay}==7
        ${dict_data}    Get Total Of Agent Today Last 7 Days
    ELSE IF    ${p_so_ngay}==30
        ${dict_data}    Get Total Of Agent Today Last 30 Days
    ELSE
        Fail    ${p_so_ngay} chỉ nhập 1 (tức hôm nay), 7 (tức 7 ngày), 30 (tức 30 ngày).
    END

    ${expected_tong_lai_rong}=    Get From Dictionary    ${dict_data}    total_commission
    ${expected_tong_lai_rong}    Convert Thousand With Comma    ${expected_tong_lai_rong}
    ${expected_tong_thang_thua}=    Get From Dictionary    ${dict_data}    winlost
    ${expected_tong_thang_thua}    Convert Thousand With Comma    ${expected_tong_thang_thua}
    ${expected_tong_nap}=    Get From Dictionary    ${dict_data}    invoice_payment_amount
    ${expected_tong_nap}    Convert Thousand With Comma    ${expected_tong_nap}
    ${expected_tong_user_new}=    Get From Dictionary    ${dict_data}    user_new

    Should Be True    ${actual_tong_lai_rong}==${expected_tong_lai_rong}
    Should Be True    ${expected_tong_thang_thua}==${expected_tong_thang_thua}
    Should Be True    ${actual_tong_nap}==${expected_tong_nap}
    Should Be True    ${actual_tong_new_memeber}==${expected_tong_user_new}



Get Total Of Agent Today
    ${current_date}=    Get Current Date    result_format=%d-%m-%Y
    ${data}    Get Total Of Agent Via Api    ${current_date}    ${current_date}
    RETURN    ${data}

Get Total Of Agent Today Last 7 days
    ${current_date}=    Get Current Date    result_format=%d-%m-%Y
    ${prev_7_days}=    Get Current Date    result_format=%d-%m-%Y    increment=-7 days
    ${data}    Get Total Of Agent Via Api    ${current_date}    ${prev_7_days}
    RETURN    ${data}
    
Get Total Of Agent Today Last 30 days
    ${current_date}=    Get Current Date    result_format=%d-%m-%Y
    ${prev_30_days}=    Get Current Date    result_format=%d-%m-%Y    increment=-30 days
    ${data}    Get Total Of Agent Via Api    ${current_date}    ${prev_30_days}
    RETURN    ${data}
    
Get Total Of Agent Via Api
    [Arguments]    ${p_from_date}    ${p_to_date}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Total Agent   ${bearer_token}    ${p_from_date}    ${p_to_date}
    ${content_api_bank}    Get Content Of Api Get Total Agent    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${data}    Get Value From Json    ${json}    $.data
    RETURN    ${data}[0]
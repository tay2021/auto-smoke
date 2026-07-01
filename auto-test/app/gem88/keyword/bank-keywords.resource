*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../page/page-bank.resource
Resource    ../../common/common-keywords.resource



*** Keywords ***
Go To Quan Ly Bank Page
    Click On The Avatar Image On Header Page
    Click On The Avatar Image Quan Ly Ngan Hang On Header Page

Assert Quan Ly Bank Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bank Of User    ${bearer_token}
    ${content_api_bank}    Get Content Of API Bank    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${data}    Get Value From Json    ${json}    $.data
    ${count}    Get Length    ${data}[0]
    IF    ${count}==0
        ${locator}    Get Span Lien Ket Ngan Hang On Quan Ly Bank Page
        ${exist}    Check Element Exists On Page    (${locator})[1]
        Should Be True    ${exist}
    ELSE
        ${arr_bank}    Set Variable    ${data}[0]
        # nếu tổng số bank > 3 thì chỉ chech chi tiết 3 record đầu thôi.
        IF    ${count}>3
            ${count}=    Set Variable    3
        END
        FOR    ${i}    IN RANGE    ${count}
            ${expected_bank_account_name}    Get From Dictionary    ${arr_bank}[${i}]    bank_account_name
            ${expected_bank_account_no}    Get From Dictionary    ${arr_bank}[${i}]    bank_account_no
            ${expected_is_reviewed}    Get From Dictionary    ${arr_bank}[${i}]    is_reviewed
            IF    ${expected_is_reviewed}
                ${expected_is_reviewed}    Set Variable    Đã xác thực
            ELSE
                ${expected_is_reviewed}    Set Variable    Chưa xác thực
            END
            ${actual_bank_account_name}    Get Value Of Ten Tai Khoan On Quan Ly Bank Page    ${i+1}
            ${actual_bank_account_no}    Get Value Of So Tai Khoan On Quan Ly Bank Page    ${i+1}
            ${actual_bank_trang_thai}    Get Value Of Trang Thai On Quan Ly Bank Page    ${i+1}
            Should Be True    '${expected_bank_account_name}'=='${actual_bank_account_name}'
            Should Be True    '${expected_bank_account_no}'=='${actual_bank_account_no}'
            Should Be True    '${expected_is_reviewed}'=='${actual_bank_trang_thai}'
        END
        
    END
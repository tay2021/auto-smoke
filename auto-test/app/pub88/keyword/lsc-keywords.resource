*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource
Resource    ../../common/user-api-request.resource
Resource    ../page/page-lsc.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-footer-menu.resource
Library     ../../utils/utils-lib.py


*** Keywords ***
Go to Lich Su Cuoc Page
    Click On The Menu Tai Khoan On The Footer Menu
    Click On The Menu Ca Cuoc On The Account Info Page
    
Assert Lich Su Cuoc Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_lsc}    Send GET Request To Get LSC Of User   ${GL_PUB88_GATEWAY_URL}    ${bearer_token}
    ${json}    Convert String To Json    ${content_api_lsc}
    ${item}    Get Value From Json    ${json}    $.data.items
    ${count}    Get Length    ${item}[0]
    IF    ${count}==0
        ${locator}    Get Locator Lich Su Cuoc Trong On LSC Page
        ${exist}    Check Element Exists On Page    (${locator})[1]
        Should Be True    ${exist}
    ELSE
        ${arr_lsc}    Set Variable    ${item}[0]
        # nếu tổng số lsgd > 3 thì chỉ chech chi tiết 3 record đầu thôi.
        IF    ${count}>3
            ${arr_lsc}    Get Slice From List    ${arr_lsc}    0    3
        END
        Assert Detail Of A Betting Transaction In Detail LSC Page    ${arr_lsc}
    END

Assert Detail Of A Betting Transaction In Detail LSC Page
    [Arguments]    ${p_list_lsc}
    ${item}    Set Variable    ${p_list_lsc}[0]
    ${expected_id}    Get From Dictionary    ${item}    id
    ${expected_tro_choi}    Get From Dictionary    ${item}    product
    ${expected_tien_cuoc}    Get From Dictionary    ${item}    stake
    ${expected_thang_thua}    Get From Dictionary    ${item}    winlost
    ${expected_thuong}    Get From Dictionary    ${item}    commission    default=0
    IF    '${expected_thuong}'=='None'
        ${expected_thuong}    Set Variable    0
    END

    ${expected_thang_thua}    Remove String    ${expected_thang_thua}    +    -
    ${expected_thuong}    Format With K From Original    ${expected_thuong}

    Click On The First Expand Arrow On LSC Page
    ${actual_id}    Get Value ID Of First Transaction On LSC Detail Page
    ${actual_tro_choi}    Get Value Tro Choi Name Of First Transaction On LSC Detail Page
    ${actual_tien_cuoc}    Get Value Tien Cuoc Of First Transaction On LSC Detail Page
    ${actual_thang_thua}    Get Value Tien Thang Thua Of First Transaction On LSC Detail Page
    ${actual_thang_thua}=    Remove String    ${actual_thang_thua}    +    -    K
    ${actual_tien_cuoc}    Remove String    ${actual_tien_cuoc}    ${SPACE}    K

    Should Be True    '${expected_id}'=='${actual_id}'
    Should Be True    '${expected_tro_choi}'=='${actual_tro_choi}'
    Should Be True    '${expected_tien_cuoc}'=='${actual_tien_cuoc}'
    Should Be True    '${expected_thang_thua}'=='${actual_thang_thua}'
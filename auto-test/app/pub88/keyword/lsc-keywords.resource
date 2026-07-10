*** Settings ***
Resource    ../page/page-header.resource
Resource    ../../common/common-keywords.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../page/page-lsc.resource
Library     ../../utils/utils-lib.py
Library     String






*** Keywords ***
Go to Lich Su Cuoc Page
    Go To    ${GL_PUB88_URL}/account/history-bet
    
Assert Lich Su Cuoc Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get LSC Of User   ${bearer_token}
    ${content_api_lsc}    Get Content Of API LSC    ${response}
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

    ${expected_tien_cuoc}    Format With K From Original    ${expected_tien_cuoc}
    ${expected_thang_thua}    Format With K From Original    ${expected_thang_thua}
    ${expected_thang_thua}    Remove String    ${expected_thang_thua}    +    -
    ${expected_thuong}    Format With K From Original    ${expected_thuong}
        
    ${actual_id}    Get Value ID In LSC Detail Page    1
    ${actual_id}=    Evaluate    "${actual_id}"[1:]    #remove # before of id
    ${actual_tro_choi}    Get Value Tro Choi Name In LSC Detail Page    1
    ${actual_tien_cuoc}    Get Value Tien Cuoc In LSC Detail Page    1
    ${actual_thang_thua}    Get Value Tien Thang Thua In LSC Detail Page    1
    ${actual_thang_thua}=    Remove String    ${actual_thang_thua}    +    -
    ${actual_thuong}    Get Value Tien Thuong In LSC Detail Page    1

    Should Be True    '${expected_id}'=='${actual_id}'
    Should Be True    '${expected_tro_choi}'=='${actual_tro_choi}'
    Should Be True    '${expected_tien_cuoc}'=='${actual_tien_cuoc}'
    Should Be True    '${expected_thang_thua}'=='${actual_thang_thua}'
    Should Be True    '${expected_thuong}'=='${actual_thuong}'
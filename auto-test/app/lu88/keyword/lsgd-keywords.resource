*** Settings ***
Resource    ../page/page-header.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-lsgd.resource
Resource    ../page/page-detail-lsgd.resource
Resource    ../api-keywords/user-api-request.resource
Library     ../../utils/utils-lib.py




*** Keywords ***
Go to Lich Su Giao Gich Page
    Go To    ${GL_LU88_URL}account/history-payment
    
Assert LSGD Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get LSGD Of User   ${bearer_token}
    ${content_api_lsgd}    Get Content Of API LSGD    ${response}
    ${json}    Convert String To Json    ${content_api_lsgd}
    ${item}    Get Value From Json    ${json}    $.data.items
    ${count}    Get Length    ${item}[0]
    IF    ${count}==0
        ${locator}    Get Locator Lich Su Giao Dich Trong On LSGD Page
        ${exist}    Check Element Exists On Page    ${locator}
        Should Be True    ${exist}
        ${locator}    Get Locator Nap Tien Ngay On LSGD Page
        ${exist}    Check Element Exists On Page    ${locator}
        Should Be True    ${exist}
    ELSE
        ${arr_lsgd}    Set Variable    ${item}[0]
        # nếu tổng số lsgd > 3 thì chỉ chech chi tiết 3 record đầu thôi.
        IF    ${count}>3
            ${arr_lsgd}    Get Slice From List    ${arr_lsgd}    0    3
        END
        Assert Detail Of A Transaction In Detail LSGD Page    ${arr_lsgd}
    END
    
Assert Detail Of A Transaction In Detail LSGD Page
    [Arguments]    ${p_list_lsgd}
    FOR    ${item}    IN    @{p_list_lsgd}
        ${expected_id}    Get From Dictionary    ${item}    id
        ${expected_amount}    Get From Dictionary    ${item}    amount
        ${method}    Get From Dictionary    ${item}    method
        IF    '${method}'=='phone_card'
            ${expected_amount}    Get From Dictionary    ${item}    card_amount
        END
        ${expected_time}    Get From Dictionary    ${item}    created_time
        ${expected_action}    Get From Dictionary    ${item}    action
        ${expected_status}    Get From Dictionary    ${item}    status
        ${expected_amount}    Format With K    ${expected_amount}
        ${expected_time}    Reformat To Utc7    ${expected_time}
        IF    '${expected_action}'=='DEPOSIT'
            ${expected_action}    Set Variable    Nạp tiền
        ELSE IF    '${expected_action}'=='WITHDRAW'
            ${expected_action}    Set Variable    Rút tiền
        END

        ${actual_amount}    Get Value Amount In LSDG Detail Page    ${expected_id}
        ${actual_amount}=    Evaluate    "${actual_amount}"[1:]
        ${actual_action}    Get Value Loai Giao Dich In LSDG Detail Page    ${expected_id}
        ${actual_status}    Get Value Trang Thai In LSDG Detail Page    ${expected_id}
        Should Be True    '${expected_amount}'=='${actual_amount}'
        Should Be True    '${expected_action}'=='${actual_action}'

    END


*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-lsgd.resource
Resource    ../page/page-footer-menu.resource
Resource    ../page/page-account-info.resource
Resource    ../../common/user-api-request.resource
Library     ../../utils/utils-lib.py





*** Keywords ***
Go to Lich Su Giao Gich Page
    Click On The Menu Tai Khoan On The Footer Menu
    Click On The Menu Giao Dich On The Account Info Page
    
Assert LSGD Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_lsgd}    Send GET Request To Get LSGD Of User    ${GL_PUB88_GATEWAY_URL}   ${bearer_token}
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
    ${i}    Set Variable    1
    FOR    ${item}    IN    @{p_list_lsgd}
        ${expected_id}    Get From Dictionary    ${item}    id
        ${expected_amount}    Get From Dictionary    ${item}    amount
        ${method}    Get From Dictionary    ${item}    method
        #IF    '${method}'=='phone_card'
        #    ${expected_amount}    Get From Dictionary    ${item}    card_amount
        #END
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
        
        Click To View Detail Of Transaction On LSDG Detail Page    ${i}
        ${actual_amount}    Get Value Amount On LSDG Detail Page    ${i}
        ${actual_amount}=    Evaluate    re.sub(r'^[+-]', '', """${actual_amount}""") if re.match(r'^[+-]', """${actual_amount}""") else """${actual_amount}"""
        ${actual_amount}=    Evaluate    "${actual_amount}"[:-1] + " K"
        ${actual_action}    Get Value Loai Giao Dich On LSDG Detail Page    ${i}
        ${actual_status}    Get Value Trang Thai On LSDG Detail Page    ${i}

        Should Be True    '${expected_amount}'=='${actual_amount}'
        Should Be True    '${expected_action}'=='${actual_action}'
        Click To View Detail Of Transaction On LSDG Detail Page    ${i}
        ${i}    Evaluate    ${i} + 1
    END


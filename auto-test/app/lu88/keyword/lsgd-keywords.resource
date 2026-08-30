*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-header.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-lsgd.resource
Resource    ../page/page-account-info.resource
Resource    ../../common/common-api-keywords.resource
Resource    ../../common/user-api-request.resource
Library     ../../utils/utils-lib.py




*** Keywords ***
Go to Lich Su Giao Gich Page
    Click On The Avatar Image On Header Page
    Click On The Menu Giao Dich On The Account Info Page
    
Assert LSGD Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get LSGD Of User   ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${items}    Get From Dictionary     ${dict['data']}    items
    ${count}    Get Length    ${items}
    IF    ${count}==0
        ${locator}    Get Locator Lich Su Giao Dich Trong On LSGD Page
        ${exist}    Check Element Exists On Page    ${locator}
        Should Be True    ${exist}
        ${locator}    Get Locator Nap Tien Ngay On LSGD Page
        ${exist}    Check Element Exists On Page    ${locator}
        Should Be True    ${exist}
    ELSE
        ${arr_lsgd}    Set Variable    ${items}
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

        ${expected_time}    Get From Dictionary    ${item}    created_time
        ${expected_action}    Get From Dictionary    ${item}    action
        ${expected_status}    Get From Dictionary    ${item}    status
        ${expected_amount}    Format With K    ${expected_amount}
        ${expected_time}    Reformat To Utc7    ${expected_time}
        IF    '${expected_action}'=='DEPOSIT'
            ${type}=    Get From Dictionary    ${item}    type
            IF    '${type}'=='PAYMENT'
                ${expected_action}    Set Variable    Nạp tiền
            ELSE
                ${expected_action}    Set Variable    Khuyến mãi
            END
        ELSE IF    '${expected_action}'=='WITHDRAW'
            ${expected_action}    Set Variable    Rút tiền
        END

        ${actual_amount}    Get Value Amount In LSDG Detail Page    ${expected_id}
        ${actual_amount}=    Evaluate    re.sub(r'^[+-]', '', """${actual_amount}""") if re.match(r'^[+-]', """${actual_amount}""") else """${actual_amount}"""
        ${actual_action}    Get Value Loai Giao Dich In LSDG Detail Page    ${expected_id}
        ${actual_status}    Get Value Trang Thai In LSDG Detail Page    ${expected_id}
        Should Be True    '${expected_action}'=='${actual_action}'
        IF    '${method}'!='phone_card'
            Should Be True    '${expected_amount}'=='${actual_amount}'
        END

    END


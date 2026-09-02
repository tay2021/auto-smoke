*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-lsgd.resource
Resource    ../../common/user-api-request.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-header.resource
Library     ../../utils/utils-lib.py


*** Keywords ***
Go to Lich Su Giao Gich Page
    Click On The Avatar Image On Header Page
    Click On The Menu Giao Dich On The Account Info Page

Assert LSGD Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get LSGD Of User   ${GL_123BONG_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${items}    Get From Dictionary    ${dict['data']}    items
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
    ${i}    Set Variable    0
    FOR    ${item}    IN    @{p_list_lsgd}
        ${i}    Evaluate    ${i} + 1
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
        ${expected_amount}    Remove String    ${expected_amount}    ${SPACE}
        ${expected_time}    Reformat To Utc7    ${expected_time}
        IF    '${expected_action}'=='DEPOSIT'
            ${expected_action}    Set Variable    Nạp tiền
        ELSE IF    '${expected_action}'=='WITHDRAW'
            ${expected_action}    Set Variable    Rút tiền
        END

        Show Full Detail Of Transaction    ${i}

        ${actual_amount}    Get Value Amount In LSDG Detail Page    ${i}
        ${actual_amount}=    Evaluate    re.sub(r'^[+-]', '', """${actual_amount}""") if re.match(r'^[+-]', """${actual_amount}""") else """${actual_amount}"""
        ${actual_action}    Get Value Loai Giao Dich In LSDG Detail Page    ${i}
        ${actual_status}    Get Value Trang Thai In LSDG Detail Page    ${i}
        Should Be True    '${expected_amount}'=='${actual_amount}'
        Should Be True    '${expected_action}'=='${actual_action}'
        Show Full Detail Of Transaction    ${i}
    END

Show Full Detail Of Transaction
    [Arguments]    ${p_index}
    Click On The Arrow To Expand Detail On LSGD Page    ${p_index}
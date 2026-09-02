*** Settings ***
Resource    ../../common/user-api-request.resource
Resource    ../page/page-header.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-withdraw-bank.resource
Resource    ../page/page-withdraw-mobi.resource
Resource    ../page/page-withdraw-crypto.resource
Resource    ../page/page-withdraw-crypto-confirm-model.resource



*** Keywords ***
Go To Withdraw Page
   Click On The Avatar Image On Header Page
   Click On The Menu Rut Tien On The Account Info Page

Assert Withdraw Correct
    #check user co bank chinh chu hay ko
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Of User    ${GL_123BONG_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${exist}    Run Keyword And Return Status    Dictionary Should Contain Key    ${dict['data']}    rolling
    IF    ${exist}
        ${rolling}    Get From Dictionary    ${dict['data']}    rolling
    ELSE
        ${rolling}    Set Variable    0
    END

    ${has_bank_cc}    Check User Has Any Bank Chinh Chu
    IF    ${has_bank_cc}
        Input Amount And Phone Number On Withdraw Page    200    11111
    ELSE
        ${ten_tk}    Set Variable    NGUYEN VAN TAI
        ${so_tk}    Set Variable    11111111111
        Select Bank To Withdraw    Vietcombank
        Input Bank Info On Withdraw Page    ${ten_tk}    ${so_tk}
        Input Amount And Phone Number On Withdraw Page    200    11111
    END
    Click On The Button Rut Tien On Withdraw Bank Page
    IF    ${rolling}==0
        Get Text    body    contains    Yêu cầu rút tiền thành công!
    ELSE
         Wait For Elements State    //span[contains(text(),'chưa đủ điều kiện rút tiền')]
         Get Text    body    contains    Tổng tiền cược yêu cầu
         Get Text    body    contains    Tiền cược yêu cầu
         Get Text    body    contains    Vui lòng cược thêm để có thể rút tiền.
    END


Select Bank And Input Bank Info On Withdraw Page
    [Arguments]    ${p_ten_tk}    ${p_so_tk}
    Click    //div[text()='Xem thêm']/../preceding-sibling::div[2]/../div[2]/div[1]/img    #chon random cai dau tien
    Fill Text    //input[@id='to_bank_name']    ${p_ten_tk}
    Wait For Elements State    //input[@id='to_bank_no']    visible
    Click    //input[@id='to_bank_no']
    Sleep    1s
    Fill Text    //input[@id='to_bank_no']    ${p_so_tk}

Input Amount And Phone Number On Withdraw Page
    [Arguments]    ${p_amount}    ${p_phone}
    Wait For Elements State    //input[@id='amount_withdraw']    visible
    Click    //input[@id='amount_withdraw']
    Sleep    1s
    Fill Text    //input[@id='amount_withdraw']    ${p_amount}
    Wait For Elements State    //input[@id='verify_phone']    visible
    Click    //input[@id='verify_phone']
    Sleep    1s
    Fill Text    //input[@id='verify_phone']    ${p_phone}

Click On Button Rut Tien On Withdraw Page
    Wait For Elements State    //button[text()='Rút tiền']    visible
    Click    //button[text()='Rút tiền']

Check User Has Any Bank Chinh Chu
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bank Of User    ${GL_123BONG_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${data}    Get From Dictionary    ${dict}    data
    ${count}    Get Length    ${data}
    ${flag_bank_cc}    Set Variable    False
    IF    ${count}!=0
        FOR    ${item}    IN    @{data}
            ${is_review}    Get From Dictionary    ${item}    is_reviewed
            IF    ${is_review}
                ${flag_bank_cc}    Set Variable    True
            END

            IF    ${is_review}
                BREAK
            END
        END
    END
    RETURN    ${flag_bank_cc}

Select Bank To Withdraw
    [Arguments]    ${p_bank_name}
    Select Bank Name From Dropdownlist On Withdraw Bank Page    ${p_bank_name}    #Vietcombank

Input Bank Info On Withdraw Page
    [Arguments]    ${p_ten_tk}    ${p_so_tk}
    Set Value On The TextBox Ten Tai Khoan On Withdraw Bank Page    ${p_ten_tk}
    Set Value On The TextBox So Tai Khoan On Withdraw Bank Page    ${p_so_tk}

Withdraw By Mobi Card
    [Arguments]    ${p_operator}    ${p_menh_gia}    ${p_confirm_phone}    ${p_card_quantity}
    Click On The Tab The Cao On The Withdraw Mobi Page
    Select Nha Mang On The Withdraw Mobi Page    ${p_operator}
    Select Menh Gia The Cao On The Withdraw Mobi Page    ${p_menh_gia}
    Set Value For TextBox Number Of Card On Withdraw Mobi Page    ${p_card_quantity}
    Set Value For TextBox Confirm Phone Number On Withdraw Mobi Page    ${p_confirm_phone}
    Click On The Button Rut Tien On The Withdraw Mobi Page

Assert Withdraw By Mobi Card Successfully
    ${element}=    Get Element Rut Tien Thanh Cong Qua The Cao On The Withdraw Mobi Page
    ${exits}=    Check Element Exists On Page    ${element}
    Should Be True    ${exits}

Withdraw By Crypto
    [Arguments]    ${p_network}    ${p_address}    ${p_amount}    ${p_phone_number}
    Click On The Tab Crypto On The Withdraw Crypto Page
    Click On The Dropdownlist Withdraw Network On The Withdraw Crypto Page
    Select Withdraw Network On The Withdraw Crypto Page    ${p_network}
    Set Value On TextBox Address On The Withdraw Crypto Page    ${p_address}
    Set Value On TextBox Amount Withdraw On The Withdraw Crypto Page    ${p_amount}
    Set Value On TextBox Confirm Phone Number On The Withdraw Crypto Page    ${p_phone_number}
    Click On The Button Rut Tien On The Withdraw Crypto Page

Confirm Withdraw By Crypto Correct
    [Arguments]    ${p_network}    ${p_address}    ${p_amount}
    ${confirm_network}    Get Text Of Span Loai Tien Ao On Model Withdraw Crypto Confirm Page
    ${confirm_digit_address}    Get Text Of Span Dia Chi Vi Tien Ao On Model Withdraw Crypto Confirm Page
    ${confirm_4last_digit_address}    Set Variable    ${confirm_digit_address}[-4:]
    ${confirm_amount}    Get Text Of Span So Tien Rut On Model Withdraw Crypto Confirm Page
    Should Be True    '${p_network}'=='${confirm_network}'
    ${last_4digit_address}=    Evaluate    "${p_address}"[-4:]
    Should Be True    '${last_4digit_address}'=='${confirm_4last_digit_address}'
    ${confirm_amount}=    Evaluate    "${confirm_amount}"[:-8]
    Should Be True    '${p_amount}'=='${confirm_amount}'
    Click On The Checkbox Confirm On Model Withdraw Crypto Confirm Page
    Click On The Button Xac Nhan ON Model Withdraw Crypto Confirm Page


Assert Withdraw By Crypto Successfully
    ${element}=    Get Element Rut Tien Thanh Cong Qua The Cao On The Withdraw Crypto Page
    ${exits}=    Check Element Exists On Page    ${element}
    Should Be True    ${exits}
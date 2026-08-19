*** Settings ***
Resource    ../../common/user-api-request.resource
Resource    ../page/page-header.resource
Resource    ../page/page-withdraw-bank.resource
Resource    ../page/page-withdraw-mobi.resource
Resource    ../page/page-withdraw-crypto.resource



*** Keywords ***
Go To Withdraw Page
    Click On The Avatar Image On Header Page
    Click On The Button Rut Tien On Header Page


Assert Withdraw Correct
    #check user co bank chinh chu hay ko
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_bank}    Send GET Request To Get Promotion Of User    ${GL_GEM88_GATEWAY_URL}    ${bearer_token}
    ${json}    Convert String To Json    ${content_api_bank}
    ${exist}    Run Keyword And Return Status    Dictionary Should Contain Key    ${json['data']}    rolling
    IF    ${exist}
        ${rolling}    Get Value From Json    ${json}    $.data.rolling
        ${rolling}    Set Variable    ${rolling}[0]
    ELSE
        ${rolling}    Set Variable    0
    END

    IF    ${rolling}>0
        # usser bi dinh rolling
        #Get Text    body    contains    Vui lòng hoàn tất để rút tiền.
        #Get Text    body    contains    Hoàn thành
        Get Text    body    contains    tổng cược yêu cầu
        #Get Text    body    contains    để rút tiền.
    ELSE
        #check phan usser co bank chinh chu hay khong
        ${has_bank_cc}    Check User Has Any Bank Chinh Chu
        IF    ${has_bank_cc}
            Input Amount And Phone Number On Withdraw Page    200    11111
        ELSE
            ${ten_tk}    Set Variable    NGUYEN VAN TAI
            ${so_tk}    Set Variable    11111111111
            Select Bank And Input Bank Info On Withdraw Page    ${ten_tk}    ${so_tk}
            Input Amount And Phone Number On Withdraw Page    200    11111
        END
        Click On The Button Rut Tien On Withdraw Bank Page
        Get Text    body    contains    RÚT TIỀN THÀNH CÔNG
    END

Select Bank And Input Bank Info On Withdraw Page
    [Arguments]    ${p_ten_tk}    ${p_so_tk}
    Select Bank Name From Dropdownlist On Withdraw Bank Page    Vietcombank
    Set Value On The TextBox Ten Tai Khoan On Withdraw Bank Page    ${p_ten_tk}
    Set Value On The TextBox So Tai Khoan On Withdraw Bank Page    ${p_so_tk}


Input Amount And Phone Number On Withdraw Page
    [Arguments]    ${p_amount}    ${p_phone}
    Set Value On TextBox Amount On Withdraw Bank Page    ${p_amount}
    Set Value On TextBox So Dien Thoai On Withdraw Bank Page    ${p_phone}

    
Check User Has Any Bank Chinh Chu
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_bank}    Send GET Request To Get Bank Of User    ${GL_GEM88_GATEWAY_URL}    ${bearer_token}
    ${json}    Convert String To Json    ${content_api_bank}
    ${data}    Get Value From Json    ${json}    $.data
    ${count}    Get Length    ${data}[0]
    ${flag_bank_cc}    Set Variable    False
    IF    ${count}!=0
        FOR    ${item}    IN    @{data}[0]
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
    
    
Withdraw By Mobi Card
    [Arguments]    ${p_operator}    ${p_menh_gia}    ${p_confirm_phone}    ${p_card_quantity}
    Click On The Tab The Cao On The Withdraw Mobi Page
    Select Nha Mang On The Withdraw Mobi Page    ${p_operator}
    Select Menh Gia The Cao On The Withdraw Mobi Page    ${p_menh_gia}
    Set Value For TextBox Confirm Phone Number On Withdraw Mobi Page    ${p_confirm_phone}
    Set Value For TextBox Number Of Card On Withdraw Mobi Page    ${p_card_quantity}
    Click On The Button Rut Tien On The Withdraw Mobi Page

Assert Withdraw By Mobi Card Successfully
    ${element}=    Get Element Rut Tien Thanh Cong Qua The Cao On The Withdraw Mobi Page
    ${exits}=    Check Element Exists On Page    ${element}
    Should Be True    ${exits}

Withdraw By Crypto
    [Arguments]    ${p_address}    ${p_amount}    ${p_phone_number}
    Click On The Tab Crypto On The Withdraw Crypto Page
    Set Value On TextBox Address On The Withdraw Crypto Page    ${p_address}
    Set Value On TextBox Amount Withdraw On The Withdraw Crypto Page    ${p_amount}
    Set Value On TextBox Confirm Phone Number On The Withdraw Crypto Page    ${p_phone_number}
    Click On The Button Rut Tien On The Withdraw Crypto Page

Assert Withdraw By Crypto Successfully
    ${element}=    Get Element Rut Tien Thanh Cong Qua The Cao On The Withdraw Crypto Page
    ${exits}=    Check Element Exists On Page    ${element}
    Should Be True    ${exits}
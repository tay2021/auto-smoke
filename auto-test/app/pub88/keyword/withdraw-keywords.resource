*** Settings ***
Resource    ../../import.resource
Resource    ../../common/user-api-request.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-footer-menu.resource
Resource    ../page/page-withdraw-bank.resource
Resource    ../page/page-withdraw-mobi.resource
Resource    ../page/page-withdraw-crypto.resource


*** Keywords ***
Go To Withdraw Page
    Click On The Menu Tai Khoan On The Footer Menu
    Click On The Menu Rut Tien On The Account Info Page

Assert Withdraw Correct
    #check user co bank chinh chu hay ko
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_bank}    Send GET Request To Get Promotion Of User    ${GL_PUB88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Evaluate    json.loads('''${content_api_bank}''')    modules=json
    ${exist}    Run Keyword And Return Status    Dictionary Should Contain Key    ${dict['data']}    rolling
    IF    ${exist}
        ${data}    Get From Dictionary    ${dict}    data
        ${rolling}    Get From Dictionary    ${data}    rolling
    ELSE
        ${rolling}    Set Variable    0
    END

    IF    ${rolling}==0
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
        Submit Withdraw By Bank
        Get Text    body    contains    Yêu cầu rút tiền thành công!
    ELSE
        IF    ${rolling}>0
            # usser bi dinh rolling
            #Get Text    body    contains    Vui lòng hoàn tất để rút tiền.
            Get Text    body    contains    Tổng tiền cược yêu cầu
            Get Text    body    contains    Tiền cược yêu cầu
            Get Text    body    contains    Vui lòng cược thêm để có thể rút tiền.

        END
    END


Select Bank And Input Bank Info On Withdraw Page
    [Arguments]    ${p_ten_tk}    ${p_so_tk}
    Click On Dropdownlist Bank Name On The Withdraw By Bank Page
    Select First Bank Name On The Withdraw By Bank Page
    Set Value For Textbox Account Name On The Withdraw By Bank Page    ${p_ten_tk}
    Set Value For Textbox Account Number On The Withdraw By Bank Page    ${p_so_tk}

Input Amount And Phone Number On Withdraw Page
    [Arguments]    ${p_amount}    ${p_phone}
    Set Value For Textbox Amount Withdraw On The Withdraw By Bank Page    ${p_amount}
    Set Value For Textbox Phone Number On The Withdraw By Bank Page    ${p_phone}

Submit Withdraw By Bank
    Click On The Button Rut Tien On The Withdraw By Bank Page
    
Check User Has Any Bank Chinh Chu
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_bank}    Send GET Request To Get Bank Of User    ${GL_PUB88_GATEWAY_URL}    ${bearer_token}
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
    Click On The Dropdownlist Network On The Withdraw Crypto Page
    Select Network From Dropdownlist Network On The Withdraw Crypto Page    ${p_network}
    Set Value On TextBox Address On The Withdraw Crypto Page    ${p_address}
    Set Value On TextBox Amount Withdraw On The Withdraw Crypto Page    ${p_amount}
    Set Value On TextBox Confirm Phone Number On The Withdraw Crypto Page    ${p_phone_number}
    Click On The Button Rut Tien On The Withdraw Crypto Page

Assert Withdraw By Crypto Successfully
    ${element}=    Get Element Rut Tien Thanh Cong Qua Crypto On The Withdraw Crypto Page
    ${exits}=    Check Element Exists On Page    ${element}
    Should Be True    ${exits}
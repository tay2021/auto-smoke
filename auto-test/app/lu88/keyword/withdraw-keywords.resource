*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Library    String



*** Keywords ***
Go To Withdraw Page
    Go To    ${GL_LU88_URL}account/withdraw

Assert Withdraw Correct
    #check user co bank chinh chu hay ko
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Of User    ${bearer_token}
    ${content_api_bank}    Get Content Of API Bank    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${rolling}    Get Value From Json    ${json}    $.data.rolling
    ${len}=    Get Length    ${rolling}
    ${rolling}    Set Variable    ${rolling}[0]
    
    IF    '${rolling}'=='${None}' or '${rolling}'=='${EMPTY}'
        ${rolling}    Set Variable    0
    END
    
    IF    ${len}==0 or ${rolling}==0
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
        Click On Button Rut Tien On Withdraw Page
        Get Text    body    contains    Yêu cầu rút tiền thành công!
    ELSE
        IF    ${rolling}[0]>0
            # usser bi dinh rolling
            #Get Text    body    contains    Vui lòng hoàn tất để rút tiền.
            Get Text    body    contains    Tổng tiền cược yêu cầu
            Get Text    body    contains    Tiền cược yêu cầu
            Get Text    body    contains    Vui lòng cược thêm để có thể rút tiền.
        END
    END


Select Bank And Input Bank Info On Withdraw Page
    [Arguments]    ${p_ten_tk}    ${p_so_tk}
    Click    //div[text()='Xem thêm']/../preceding-sibling::div[2]/../div[2]/div[1]/img    #chon random cai dau tien
    Fill Text    //input[@id='to_bank_name']    ${p_ten_tk}
    Fill Text    //input[@id='to_bank_no']    ${p_so_tk}

Input Amount And Phone Number On Withdraw Page
    [Arguments]    ${p_amount}    ${p_phone}
    Fill Text    //input[@id='amount_withdraw']    ${p_amount}
    Fill Text    //input[@id='verify_phone']    ${p_phone}

Click On Button Rut Tien On Withdraw Page
    Wait For Elements State    //button[text()='Rút tiền']    visible
    Click    //button[text()='Rút tiền']
    
Check User Has Any Bank Chinh Chu
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bank Of User    ${bearer_token}
    ${content_api_bank}    Get Content Of API Bank    ${response}
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
   
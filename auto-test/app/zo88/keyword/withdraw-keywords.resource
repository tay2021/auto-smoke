*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Library    String



*** Keywords ***
Go To Withdraw Page
    Go To    ${GL_ZO88_URL}account/withdraw

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
        Get Text    body    contains    RÚT TIỀN THÀNH CÔNG
    ELSE
        IF    ${rolling}[0]>0
            # usser bi dinh rolling
            #Get Text    body    contains    Vui lòng hoàn tất để rút tiền.
            Get Text    body    contains    Bạn chưa hoàn tất
            Get Text    body    contains    tổng cược yêu cầu
            Get Text    body    contains    Vui lòng hoàn tất để rút tiền.
        END

    END


Select Bank And Input Bank Info On Withdraw Page
    [Arguments]    ${p_ten_tk}    ${p_so_tk}
    Click    //div[text()='Chọn ngân hàng rút tiền']
    Click    //div[text()='Chọn ngân hàng rút tiền']/../following-sibling::div[1]/div[2]/div[1]    #chon random cai dau tien
    Fill Text    //input[@name='bank_account_name']    ${p_ten_tk}
    ${locator_sotk}    Set Variable    //input[@name='bank_account_no']
    Wait For Elements State    ${locator_sotk}    visible
    Clear Text    ${locator_sotk}
    Click    ${locator_sotk}
    Fill Text    ${locator_sotk}    ${p_so_tk}

Input Amount And Phone Number On Withdraw Page
    [Arguments]    ${p_amount}    ${p_phone}
    ${locator_amount}    Set Variable    //label[text()='Nhập số tiền cần rút']/preceding-sibling::input
    Wait For Elements State    ${locator_amount}    visible
    Fill Text    ${locator_amount}    ${p_amount}
    ${locator_sodt}    Set Variable    //label[text()='Xác nhận số điện thoại']/preceding-sibling::input
    Wait For Elements State    ${locator_sodt}    visible
    Type Text    ${locator_sodt}    ${p_phone}    delay=0.5
    Sleep    2s
    Keyboard Key    press    Tab

Click On Button Rut Tien On Withdraw Page
    ${locator}    Set Variable    //button[text()='RÚT TIỀN']
    Wait For Elements State    ${locator}    visible
    Click    ${locator}
    
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
   
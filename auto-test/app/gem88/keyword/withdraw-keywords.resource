*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource
Library    String



*** Keywords ***
Go To Withdraw Page
    Click On The Avatar Image On Header Page
    Click On The Button Rut Tien On Header Page

Assert Withdraw Correct
    #check user co bank chinh chu hay ko
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Of User    ${bearer_token}
    ${content_api_bank}    Get Content Of API Bank    ${response}
    ${json}    Convert String To Json    ${content_api_bank}
    ${rolling}    Get Value From Json    ${json}    $.data.rolling    

    IF    ${rolling}[0]>0 or ${rolling}==[]
        # usser bi dinh rolling
        #Get Text    body    contains    Vui lòng hoàn tất để rút tiền.
        Get Text    body    contains    Hoàn thành
        Get Text    body    contains    tổng cược yêu cầu
        Get Text    body    contains    để rút tiền.
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
        Click On Button Rut Tien On Withdraw Page
        Get Text    body    contains    RÚT TIỀN THÀNH CÔNG
    END

Select Bank And Input Bank Info On Withdraw Page
    [Arguments]    ${p_ten_tk}    ${p_so_tk}
    Click    //*[contains(@*[local-name()='href'], 'arrow-down')]
    Click    //*[text()='Vietcombank']
    Fill Text    //*[text()='Tên chủ tài khoản']/preceding-sibling::input    ${p_ten_tk}
    Fill Text    //*[text()='Số tài khoản']/preceding-sibling::input    ${p_so_tk}

Input Amount And Phone Number On Withdraw Page
    [Arguments]    ${p_amount}    ${p_phone}
    Fill Text    //*[text()='Nhập số tiền cần rút']/preceding-sibling::input    ${p_amount}
    Fill Text    //*[text()='Xác nhận số điện thoại']/preceding-sibling::input    ${p_phone}

Click On Button Rut Tien On Withdraw Page
    Click    //button[text()='RÚT TIỀN']
    
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
            ${is_review}    Get Dictionary Values    ${item}    is_reviewed
            IF    ${is_review}
                ${flag_bank_cc}    Set Variable    True
            END
            
            IF    ${is_review}
                BREAK
            END
        END
    END
    RETURN    ${flag_bank_cc}
   
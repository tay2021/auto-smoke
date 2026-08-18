*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Click On The Tab The Cao On The Withdraw Mobi Page
    Wait For Element State And Click On It    //img[@alt='Thẻ cào']
    
Select Nha Mang On The Withdraw Mobi Page
    [Documentation]    [Documentation]    p_operator accept integer number only:
    ...    1: Viettel
    ...    2: Mobifone
    ...    3: Vinaphone
    ...    4: Zing
    ...    5: Vietnamobile
    ...    If input other values, will raise error
    [Arguments]    ${p_operator}
    # Convert to integer for comparison
    ${operator_int}=    Convert To Integer    ${p_operator}

    # Validate range (1-5)
    IF    $operator_int < 1 or $operator_int > 5
        Fail    ERROR: p_operator must be between 1 and 5. Got: ${operator_int}. Valid values: 1=Viettel, 2=Mobifone, 3=Vinaphone, 4=Zing, 5=Vietnamobile.
    END
    Wait For Element State And Click On It    (//img[@alt='img-card'])[${p_operator}]
    
Select Menh Gia The Cao On The Withdraw Mobi Page
    [Arguments]    ${p_menh_gia_the}
    Wait For Element State And Click On It    //div[normalize-space()='${p_menh_gia_the}K']
    
Set Value For TextBox Confirm Phone Number On Withdraw Mobi Page
    [Arguments]    ${p_confirm_phone}
    ${locator}    Set Variable    //input[@name='confirm_phone_number']
    Wait For Elements State    ${locator}    visible
    Type Text    ${locator}    ${p_confirm_phone}    delay=0.5
    Sleep    2s
    Keyboard Key    press    Tab
    
Set Value For TextBox Number Of Card On Withdraw Mobi Page
    [Arguments]    ${p_card_quantity}
    Wait For Element State And Fill Text    //input[@id='quantity_card']    ${p_card_quantity}

Click On The Button Rut Tien On The Withdraw Mobi Page
    Wait For Element State And Click On It    //button[text()='RÚT TIỀN']

Get Element Rut Tien Thanh Cong Qua The Cao On The Withdraw Mobi Page
    ${locate_withdraw_success}    Set Variable    //span[text()='RÚT TIỀN THÀNH CÔNG']
    RETURN    ${locate_withdraw_success}
*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get Text Of Span Loai Tien Ao On Model Withdraw Crypto Confirm Page
    ${text}    Wait For Element State And Get Text    //span[text()='Loại tiền ảo']/following-sibling::div/span
    RETURN    ${text}

Get Text Of Span Dia Chi Vi Tien Ao On Model Withdraw Crypto Confirm Page
    ${text}    Wait For Element State And Get Text    //span[text()='Địa chỉ ví']/following-sibling::p/span[3]
    RETURN    ${text}

Get Text Of Span So Tien Rut On Model Withdraw Crypto Confirm Page
    ${text}    Wait For Element State And Get Text    //span[text()='Số tiền rút']/following-sibling::span
    RETURN    ${text}

Click On The Checkbox Confirm On Model Withdraw Crypto Confirm Page
    Wait For Element State And Click On It    //span[text()='Tôi đã kiểm tra và xác nhận địa chỉ này là chính xác']/..

Click On The Button Xac Nhan ON Modle Withdraw Crypto Confirm Page
    Wait For Element State And Click On It    //button[text()='XÁC NHẬN']
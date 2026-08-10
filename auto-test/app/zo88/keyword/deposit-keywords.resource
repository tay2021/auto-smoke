*** Settings ***
Resource    ../page/page-header.resource
Resource    ../page/page-deposit.resource
Resource    ../page/page-the-cao.resource
Resource    ../page/page-flashpay.resource
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../page/page-add-bank-at-flash-page.resource



*** Keywords ***
Go To Deposit Page
    Go To    ${GL_ZO88_URL}account/deposit

Assert Create Phieu Nap By Crypto Correct
    Click On Tab Nap Tien Crypto On Deposit Page
    ${src}    Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    Should Start With    ${src}    data:image/png;base64

Assert Create Phieu Nap By The Cao Correct
    Click On Tab Nap Tien The Cao On Deposit Page
    Select Nha Mang On Deposit The Cao Page    VIETTEL
    Select Menh Gia The Cao On Deposit The Cao Page    10,000
    Input Serial The Cao On Deposit The Cao Page    55555555555555
    Input PIN The Cao On Deposit The Cao Page    55555555555    #gia tri test
    Click Button Nap Tien On Deposit The Cao Page
    Wait For Page Contains A Text    div[role="dialog"]    NẠP TIỀN THÀNH CÔNG
    Get Text    body    contains    NẠP TIỀN THÀNH CÔNG
    Get Text    body    contains    Bạn đã tạo thành công phiếu nạp 10K.
    Get Text    body    contains    Xin vui lòng chờ để được xử lý.
    Click    //button[text()='LỊCH SỬ GIAO DỊCH']
    Wait For Page Contains A Text    div[id="home-layout"]    Lịch sử giao dịch
    ${current_url}    Get Url
    Should End With    ${current_url}    /account/history/transaction

Assert Create Phieu Nap By Flash Pay Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${boolean}    Check User Has Bank Account Or Not    ${bearer_token}
    IF    not ${boolean}
        Add Bank Account Before Create QR code
    END
    Create Flash QR Code



Check User Has Bank Account Or Not
    [Arguments]    ${p_bearerToken}
    ${boolean}    Set Variable    False
    ${response}    Send GET Request To Get Bank Of User    ${p_bearerToken}
    ${content_api_lsc}    Get Content Of API Bank    ${response}
    ${dict}    Evaluate    json.loads('''${content_api_lsc}''')    json
    ${data_list}    Get From Dictionary    ${dict}    data
    ${length}    Get Length    ${data_list}
    IF    ${length}>0
        ${boolean}    Set Variable    True
    END
    RETURN    ${boolean}

Create Flash QR Code
    Click On Tab Nap Tien QR Code On Deposit Page
    Select Random Kenh Nap On Flash Page
    Input So Tien On Flash Page    200
    Click On Button Tao Ma QR On Flash Page
    ${src}    Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    Should Start With    ${src}    data:image/png;base64


Add Bank Account Before Create QR code
    ${boolean}    Check Element Exists On Page    //img[@alt='add bank']
    Should Be True    ${boolean}
    ${boolean}    Check Element Exists On Page    //p[text()='Thêm tài khoản ngân hàng']
    Should Be True    ${boolean}
    Click Button Them Ngan Hang On Flash Page
    Select Bank Name At Model Add Bank On Flash Page    Vietcombank
    Input Bank Account Number At Model Add Bank On Flash Page    11111111111111
    Input Bank Account Name At Model Add Bank On Flash Page    NGUYEN VAN TAI
    Click Button Xac Nhan At Model Add Bank On Flash Page




*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-deposit.resource
Resource    ../page/page-the-cao.resource
Resource    ../page/page-flashpay.resource
Resource    ../page/page-footer-menu.resource
Resource    ../../common/payment-api-request.resource
Resource    ../page/page-deposit-crypto.resource
Resource    ../page/page-the-cao.resource



*** Keywords ***
Go To Deposit Page
    Click On The Tab Nap Tien On The Footer Menu Page
        
Go To Deposit The Cao Page
    Click On Tab Nap Tien The Cao On Deposit Page
    
Go To Deposit Flash Page
    Click On Tab Nap Tien QR Code On Deposit Page

Assert Create Phieu Nap By Crypto Correct
    Click On Tab Nap Tien Crypto On Deposit Page
    ${src}    Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    Should Start With    ${src}    data:image/png;base64

Assert Available Crypto Networks are correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_crypto_currency}    Send GET Request To Get Deposit Currency For Crypto   ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Evaluate    json.loads('''${content_api_crypto_currency}''')    modules=json
    ${data}    Get From Dictionary    ${dict}    data
    ${len}    Get Length    ${data}
    Should Be True    ${len}>0
    Click On Tab Nap Tien Crypto On Deposit Page
    Assert Available Crypto Currency Show Correct    ${data}

Assert Available Crypto Currency Show Correct
    [Arguments]    ${p_data}
    ${count}    Get Length    ${p_data}
    IF     ${count}>3
        ${p_data}    Set Variable    ${p_data}[:3]
    END
    Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
    Sleep    1s
    FOR    ${item}    IN    @{p_data}
        ${currency}    Get From Dictionary    ${item}    currency
        ${price}    Get From Dictionary    ${item}    price
        ${expected_buyPrice}    Get From Dictionary    ${price}[1]    buyPrice
        ${networks}    Get From Dictionary    ${item}    networks
        FOR    ${network}    IN    @{networks}
            Log    ${currency}-${network}
            ${actual_price}    Get Buy Price Base On Currency And Network On Deposit Crypto Page    ${currency}    ${network}
            ${actual_price}    Remove String    ${actual_price}    =    ,    ${SPACE}    VNĐ
            Should Be True    '${expected_buyPrice}'=='${actual_price}'
        END
    END

Assert Crypto Network Addresses are correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_crypto_currency}    Send GET Request To Get Deposit Currency For Crypto   ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Evaluate    json.loads('''${content_api_crypto_currency}''')    modules=json
    ${data}    Get From Dictionary    ${dict}    data
    Click On Tab Nap Tien Crypto On Deposit Page
    FOR    ${item}    IN    @{data}
        ${currency}    Get From Dictionary    ${item}    currency
        ${networks}    Get From Dictionary    ${item}    networks
        FOR    ${network}    IN    @{networks}
            Log    ${currency}-${network}
            Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
            ${expected_address}    Get Address Base On Network    ${network}
            Select Currency And NetWork On Deposit Crypto Page    ${currency}    ${network}
            Sleep    0.5s
            ${actual_address}    Get Text Of Span Address On Deposit Crypto Page
            Should Be True    "${expected_address}"=="${actual_address}"
        END
    END

Get Address Base On Network
    [Arguments]    ${p_network}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api}    Send GET Request To Get Address Base On Network For Crypto Deposit    ${GL_LU88_GATEWAY_URL}    ${bearer_token}    ${p_network}
    ${dict}    Evaluate    json.loads('''${content_api}''')    modules=json
    ${data}    Get From Dictionary    ${dict}    data
    ${address}    Get From Dictionary    ${data}[0]    address
    ${network}    Get From Dictionary    ${data}[0]    network
    ${qrCode}    Get From Dictionary    ${data}[0]    qrCode
    Should Be True    "${network}"=="${p_network}"
    Validate Crypto Address Correct Format    ${address}    ${network}
    Validate QR Code Correct    ${qrCode}
    RETURN    ${address}

Assert Link Huong Dan Nap Rut Crypto Correct
    Click On Tab Nap Tien Crypto On Deposit Page
    Click On The Link Huong Dan Mua Crypto On Deposit Crypto Page
    Sleep    0.5s
    ${href}    Get Hyper Link Of Button Element Xem Huong Dan Mua Crypto On Deposit Crypto Page
    New Page    ${GL_LU88_URL}${href}
    ${current_url}    Get Url
    Should Be True    "${current_url}"=="${GL_LU88_URL}huong-dan/binance"

Assert Create Phieu Nap By The Cao Correct
    [Arguments]    ${p_nha_mang}    ${p_serial}    ${p_pin}    ${p_menh_gia}
    Click On Tab Nap Tien The Cao On Deposit Page
    Select Nha Mang On Deposit The Cao Page    ${p_nha_mang}    #chon mang viettel
    Input Serial The Cao On Deposit The Cao Page    ${p_serial}
    Input PIN The Cao On Deposit The Cao Page    ${p_pin}    #gia tri test
    Select Menh Gia The Cao On Deposit The Cao Page    ${p_menh_gia}
    Click Button Nap Tien On Deposit The Cao Page
    Get Text    body    contains    Nạp thẻ thành công

Assert Create Phieu Nap By Flash Pay Correct
    [Arguments]    ${p_amount}
    Select Random Kenh Nap On Flash Page
    Input So Tien On Flash Page    ${p_amount}
    Click On Button Tao Ma QR On Flash Page
    ${src}    Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    Should Start With    ${src}    data:image/png;base64
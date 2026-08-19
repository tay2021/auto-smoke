*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-deposit.resource
Resource    ../page/page-the-cao.resource
Resource    ../page/page-flashpay.resource
Resource    ../page/page-footer-menu.resource
Resource    ../../common/payment-api-request.resource
Resource    ../page/page-deposit-crypto.resource



*** Keywords ***
Go To Deposit Page
    Click On The Menu Nap Tien On The Footer Menu

Assert Create Phieu Nap By Crypto Correct
    Click On Tab Nap Tien Crypto On Deposit Page
    ${src}    Get Attribute Src Of Locator Ma QR Crypto On Deposit Page
    Should Start With    ${src}    data:image/png;base64

Assert Create Phieu Nap By The Cao Correct
    Click On Tab Nap Tien The Cao On Deposit Page
    Select Nha Mang On Deposit The Cao Page    1    #chon mang viettel
    Input Serial The Cao On Deposit The Cao Page    55555555555555
    Input PIN The Cao On Deposit The Cao Page    55555555555    #gia tri test
    Select Menh Gia The Cao On Deposit The Cao Page    10
    Click Button Nap Tien On Deposit The Cao Page
    Get Text    body    contains    Nạp thẻ thành công

Assert Create Phieu Nap By Flash Pay Correct
    Click On Tab Nap Tien QR Code On Deposit Page
    Select Random Kenh Nap On Flash Page
    Input So Tien On Flash Page    200
    Click On Button Tao Ma QR On Flash Page
    ${src}    Get Locator Attribute Src Ma QR Flash Pay On Flash Page
    Should Start With    ${src}    data:image/png;base64

Assert Available Crypto Networks are correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api_crypto_currency}    Send GET Request To Get Deposit Currency For Crypto   ${GL_PUB88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Evaluate    json.loads('''${content_api_crypto_currency}''')    modules=json
    ${data}    Get From Dictionary    ${dict}    data
    ${len}    Get Length    ${data}
    Should Be True    ${len}>0
    Click On Tab Nap Tien Crypto On Deposit Page
    Assert Available Crypto Currency Show Correct    ${data}

Assert Available Crypto Currency Show Correct
    [Arguments]    ${p_dict}
    Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
    Sleep    1s
    FOR    ${item}    IN    @{p_dict}
        ${currency}    Get From Dictionary    ${item}    currency
        ${price}    Get From Dictionary    ${item}    price
        ${expected_buyPrice}    Get From Dictionary    ${price}[1]    buyPrice
        ${expected_buyPrice}    Evaluate    "{:,}".format(int(${expected_buyPrice}))
        ${networks}    Get From Dictionary    ${item}    networks
        FOR    ${network}    IN    @{networks}
            Log    ${currency}-${network}
            Get Elements    //*[.//*[contains(text(), '${network}')] and ./*[contains(text(), '${expected_buyPrice}')]]
        END
    END

Assert Crypto Network Addresses are correct
    Click On Tab Nap Tien Crypto On Deposit Page
    Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
    ${count}    Get Element Count    //div[@id='currency_list']/../div[2]//div[contains(@class,'ant-select-item-option-grouped')]//img/following-sibling::span
    FOR    ${i}    IN RANGE    ${count}
        Log    ${i}
        IF    ${i}!=0
            Click On Dropdownlist Select Crypto Currency On Deposit Crypto Page
        END

        ${network}    Wait For Element State And Get Text    (//div[@id='currency_list']/../div[2]//div[contains(@class,'ant-select-item-option-grouped')]//img/following-sibling::span)[${i+1}]
        Log    ${network}
        Click    (//div[@id='currency_list']/../div[2]//div[contains(@class,'ant-select-item-option-grouped')]//img/following-sibling::span)[${i+1}]
        ${expected_address}    Get Address Base On Network    ${network}
        Sleep    1s
        Log    ${expected_address}
        ${actual_address}    Wait For Element State And Get Text    //div[text()='Địa chỉ ví']/following-sibling::div/span
        Should Be True    '${actual_address}'=='${expected_address}'
    END
    
Get Address Base On Network
    [Arguments]    ${p_network}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${content_api}    Send GET Request To Get Address Base On Network For Crypto Deposit    ${GL_PUB88_GATEWAY_URL}    ${bearer_token}    ${p_network}
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
    ${actual_link_dang_ky}    Get Hyperlink Value Of Link Huong Dan Dang Ky Binance On Deposit Crypto Page
    ${actual_link_dang_ky}    Evaluate    '${actual_link_dang_ky}'[1:]
    Click On Link Huong Dan Dang Ky Binance On Deposit Crypto Page
    Sleep    0.5s
    ${current_url}    Get Url
    Should Be True    "${current_url}"=="${GL_PUB88_URL}${actual_link_dang_ky}"
    Go Back
    ${actual_link_nap_tien}    Get Hyperlink Value Of Link Huong Dan Nap Tien On Deposit Crypto Page
    ${actual_link_nap_tien}    Evaluate    '${actual_link_nap_tien}'[1:]
    Click On Link Huong Dan Nap Tien On Deposit Crypto Page
    Sleep    0.5s
    ${current_url}    Get Url
    Should Be True    "${current_url}"=="${GL_PUB88_URL}${actual_link_nap_tien}"
    Go Back
    ${actual_link_rut_tien}    Get Hyperlink Value Of Link Huong Dan Rut Tien On Deposit Crypto Page
    ${actual_link_rut_tien}    Evaluate    '${actual_link_rut_tien}'[1:]
    Click On Link Huong Dan Rut Tien On Deposit Crypto Page
    Sleep    0.5s
    ${current_url}    Get Url
    Should Be True    "${current_url}"=="${GL_PUB88_URL}${actual_link_rut_tien}"
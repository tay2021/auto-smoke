*** Settings ***
Resource    ../import.resource
Resource    ../variable.resource
Resource    ../device-simulator.resource
Library    Collections
Library    BuiltIn
Library    OperatingSystem
Library    DateTime
Library    Process


*** Keywords ***
Open Site and maximize window
    [Arguments]    ${p_url}

    ${args}=    Create List
    ...    --disable-dev-shm-usage
    ...    --no-sandbox
    ...    --disable-gpu

    IF    ${GL_HEADLESS}
        ${VIEWPORT_WIDTH}    Set Variable    1920
        ${VIEWPORT_HEIGHT}    Set Variable    1080
        New Browser    browser=${GL_BROWSER}    headless=${GL_HEADLESS}    args=${args}
        New Context
        New Page    ${p_url}    wait_until=load
        Set Viewport Size    width=${VIEWPORT_WIDTH}    height=${VIEWPORT_HEIGHT}
    ELSE
        Append To List    ${args}    --start-maximized
        New Browser    browser=${GL_BROWSER}    headless=${GL_HEADLESS}    args=${args}
        New Context    viewport=${None}
        New Page    ${p_url}    wait_until=load
    END
    
Open Site On device
    [Arguments]    ${p_url}    ${p_device_type}

    ${device_config}=    Run Keyword If    "${p_device_type}" == "iPhone 17 Pro Max"    Set Variable    ${IPHONE_17_PRO_MAX}
    ...    ELSE IF    "${p_device_type}" == "iPhone 14 Pro Max"    Set Variable    ${IPHONE_14_PRO_MAX}
    ...    ELSE IF    "${p_device_type}" == "iPhone 15 Pro"    Set Variable    ${IPHONE_15_PRO}
    ...    ELSE    Fail    Unsupported device: ${p_device_type}

    ${args}=    Create List
    ...    --disable-dev-shm-usage
    ...    --no-sandbox
    ...    --disable-gpu
    ...    --window-size=${device_config}[width],${device_config}[height]
    ...    --user-agent=${device_config}[user_agent]

    New Browser    browser=${GL_BROWSER}    headless=${GL_HEADLESS}    args=${args}
    New Context    viewport={'width': ${device_config}[width], 'height': ${device_config}[height], 'deviceScaleFactor': ${device_config}[scale], 'isMobile': True, 'hasTouch': True}
    New Page    ${p_url}    wait_until=load


Check Element Exists On Page
    [Documentation]    Kiểm tra element có exists trên page không.
    [Arguments]    ${locator}    ${timeout}=5s
    ${exists}=    Run Keyword And Return Status    Wait For Elements State    ${locator}    attached    ${timeout}
    IF    ${exists}
        Log    ✅ Element: ${locator} có xuát hiện sau ${timeout}s
        RETURN    ${True}
    ELSE
        Log    ⚠️ Element không xuất hiện trong ${timeout}s, bỏ qua: ${locator}
        RETURN    ${False}
    END

Get And Set Bearer Token From Cookie After Login Successfully
    Sleep    1s
    ${dict_token}    Get Cookie    token
    ${bearer_token}    Get From Dictionary    ${dict_token}    value
    Set Global Variable    ${GL_BEARER_TOKEN}    ${bearer_token}
    RETURN    ${bearer_token}


Close Browser And Terminate test running
    Run Keywords    Close Browser
    
Generate Random Username
    [Arguments]    ${p_prefix}
    ${epoch_ms}=    Evaluate    int(time.time() * 1000)
    ${unique_id}=    Evaluate    str(${epoch_ms})[-6:]
    ${account_name}=    Set Variable    ${p_prefix}${unique_id}
    RETURN    ${account_name}
    
Remove Space And Char K Out Of String
    [Arguments]    ${p_string}
    ${value}=    Evaluate    __import__('re').sub(r'[ k]', '', "${p_string}", flags=__import__('re').IGNORECASE)
    RETURN    ${value}

Convert Thousand With Comma
    [Arguments]    ${p_str}
    ${result}=    Evaluate    "{:,.0f}".format(int(${p_str}) / 1000)
    RETURN    ${result}
    
Wait And Get Value Of Element
    [Arguments]    ${p_element}
    Wait For Elements State    ${p_element}    visible
    ${value}    Get Text    ${p_element}
    RETURN    ${value}
    
Wait For Page Contains A Text
    [Arguments]    ${p_selector}    ${p_text}
    Wait For Condition    Text    ${p_selector}    contains     ${p_text}    timeout=5s
    
Wait For Element State And Click On It
    [Arguments]    ${p_locator}    ${p_state}=visible
    Wait For Elements State    ${p_locator}    ${p_state}
    Click    ${p_locator}
    
Wait For Element State And Get Text
    [Arguments]    ${p_locator}    ${p_state}=visible
    Wait For Elements State    ${p_locator}    ${p_state}
    ${text}    Get Text    ${p_locator}
    RETURN    ${text}
    
Wait For Element State And Get Attribute
    [Arguments]    ${p_locator}    ${p_attribute}    ${p_state}=visible
    Wait For Elements State    ${p_locator}    ${p_state}
    ${value}    Get Attribute    ${p_locator}    ${p_attribute}
    RETURN    ${value}

Wait For Element State And Fill Text
    [Arguments]    ${p_locator}    ${p_text}    ${p_state}=visible
    Wait For Elements State    ${p_locator}    ${p_state}
    Fill Text    ${p_locator}    ${p_text}

Validate Crypto Address Correct Format
    [Arguments]    ${p_address}    ${p_network}
    [Documentation]    Simple validation for crypto addresses

    ${p_network}=    Set Variable    ${p_network.upper()}

    IF    "${p_network}" in ["ERC-20", "ERC20", "BEP-20", "BEP20"]
        Should Start With    ${p_address}    0x    msg=Invalid ERC-20/BEP-20 address: Must start with '0x'
        Length Should Be    ${p_address}    42    msg=Invalid ERC-20/BEP-20 address: Must be 42 characters
    ELSE IF    "${p_network}" in ["TRC-20", "TRC20"]
        Should Start With    ${p_address}    T    msg=Invalid TRC-20 address: Must start with 'T'
        Length Should Be    ${p_address}    34    msg=Invalid TRC-20 address: Must be 34 characters
    ELSE
        Fail    Unsupported network: ${p_network}
    END
    Log    ✅ Valid ${p_network} address: ${p_address}

Validate QR Code Correct
    [Arguments]    ${qr_code}
    [Documentation]    Simple QR code format validation
    ${qr_code}=    Strip String    ${qr_code}
    # Check prefix
    Should Start With    ${qr_code}    data:image/png;base64,    msg=Invalid QR code format: Missing 'data:image/png;base64,' prefix
    # Extract and validate base64
    ${base64_data}=    Get Substring    ${qr_code}    22
    Should Not Be Empty    ${base64_data}    msg=QR code base64 data is empty
    # Validate base64 characters
    Should Match Regexp    ${base64_data}    ^[A-Za-z0-9+/]+=*$    msg=Invalid base64 characters in QR code
    # Validate PNG header (starts with iVBORw0KGgo for PNG)
    Should Start With    ${base64_data}    iVBORw0KGgo    msg=Invalid PNG data in QR code
    Log    ✅ Valid QR code format

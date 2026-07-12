*** Settings ***
Library    Browser
Resource    ../variable.resource
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
*** Settings ***
Resource    ../../common/common-keywords.resource
Resource    ../page/page-welcome-pop-up.resource
Resource    ../page/page-model-login.resource
Resource    ../page/page-header.resource
Library     OperatingSystem




*** Keywords ***
Open Zo88 site and maximize window
    [Arguments]    ${p_url}
    ${args}=    Create List
    ...    --disable-dev-shm-usage
    ...    --no-sandbox
    ...    --disable-gpu
    New Browser    browser=${GL_BROWSER}    headless=${GL_HEADLESS}    args=${args}
    New Context
    New Page    ${p_url}    wait_until=load
    Set Viewport Size    width=${GL_VIEWPORT_WIDTH}    height=${GL_VIEWPORT_HEIGHT}

Close Welcome Pop Up If Shown
    ${btn_close_welcome_pop_up}    Get Button Close Welcome Pop Up Element
    ${exists}    Check Element Exists On Page    ${btn_close_welcome_pop_up}
    IF    ${exists}
        Click    ${btn_close_welcome_pop_up}
    END

Login To Site Zo88
    [Arguments]    ${p_username}    ${p_password}
    Go To Login Page
    Input Username On Model Login    ${p_username}
    Input Password On Model Login    ${p_password}
    Keyboard Key    press    Enter

Assert Login To Site Successfully
    ${locator}    Get Label Info Login Successfully
    ${exits}    Check Element Exists On Page    ${locator}
    Should Be True    ${exits}

    
Close Browser And Delete Temp Folder Of Profile Browser
    Run Keywords    Close Browser    
    ...    AND    Sleep    2s
    ...    AND    Remove Directory    ${GL_PROFILE_PATH}    recursive=True

Close Browser And Terminate test running
    Run Keywords    Close Browser

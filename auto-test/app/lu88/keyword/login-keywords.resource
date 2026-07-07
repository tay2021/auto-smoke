*** Settings ***
Resource    ../../common/common-keywords.resource
Resource    ../page/page-welcome-pop-up.resource
Resource    ../page/page-model-login.resource
Resource    ../page/page-header.resource
Resource    ../api-keywords/promotion-api-request.resource
Library     OperatingSystem




*** Keywords ***
Open Lu88 site and maximize window
    [Arguments]    ${p_url}
    ${profile_path}    Create Copy Of Original Chrome Profile    ${SOURCE_FOLDER}    ${DEST_BASE_DIR}
    Set Global Variable    ${GL_PROFILE_PATH}    ${profile_path}
    New Persistent Context    userDataDir=${profile_path}
    ...    browser=${GL_BROWSER}
    ...    headless=${GL_HEADLESS}
    ...    args=["--start-maximized"]
    ...    viewport=None
    New Page    ${p_url}    wait_until=load


Close Welcome Pop Up If Shown
    ${btn_close_welcome_pop_up}    Get Button Close Welcome Pop Up Element
    ${exists}    Check Element Exists On Page    ${btn_close_welcome_pop_up}
    IF    ${exists}
        Click    ${btn_close_welcome_pop_up}
    END

Login To Site Lu88
    [Arguments]    ${p_username}    ${p_password}
    Click Button Dang Nhap On Header Page
    Input Username On Model Login    ${p_username}
    Input Password On Model Login    ${p_password}
    Keyboard Key    press    Enter

Assert Login To Site88 Successfully
    ${locator}    Get Label Info Login Successfully
    ${exits}    Check Element Exists On Page    ${locator}
    Should Be True    ${exits}

    
Close Browser And Delete Temp Folder Of Profile Browser
    Run Keywords    Close Browser    
    ...    AND    Sleep    2s
    ...    AND    Remove Directory    ${GL_PROFILE_PATH}    recursive=True

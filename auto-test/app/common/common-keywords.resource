*** Settings ***
Library    Browser
Resource    ../variable.resource
Library    Collections
Library    BuiltIn
Library    OperatingSystem
Library    DateTime
Library    Process



*** Variables ***
${SOURCE_FOLDER}    ${EXECDIR}${/}chrome-profile-bak    # Your existing folder
${DEST_BASE_DIR}    ${EXECDIR}${/}chrome-profile

*** Keywords ***
Get View Port Of Device For Testing
    ${device}=    Get Device    ${GL_DEVICE_NAME}
    ${width}=    Set Variable    ${device}[screen][width]
    ${height}=    Set Variable    ${device}[screen][height]
    &{viewport}=    Create Dictionary    width=${width}    height=${height}
    RETURN    ${viewport}


Open Browser And Go To Page
    [Documentation]    Mở Browser và đi đến site
    [Arguments]    ${url}

    ${profile_path}    Create Copy Of Original Chrome Profile    ${SOURCE_FOLDER}    ${DEST_BASE_DIR}
    Set Global Variable    ${GL_PROFILE_PATH}    ${profile_path}
    ${custom_viewport}    Get View Port Of Device For Testing
    #New Persistent Context    userDataDir=${EXECDIR}/chrome-profile
    New Persistent Context    userDataDir=${profile_path}
    ...    browser=${GL_BROWSER}
    ...    headless=${GL_HEADLESS}
    ...    viewport=${custom_viewport}
    New Page    ${url}    wait_until=load


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




Create Copy Of Original Chrome Profile
    [Documentation]    Copy an existing folder and name it with current timestamp
    [Arguments]    ${source_dir}    ${destination_base}

    # Generate timestamp for folder name (YYYYMMDD_HHMMSS)
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${dest_folder}=    Set Variable    ${destination_base}${/}profile_${timestamp}

    # Create destination base directory if it doesn't exist
    Create Directory    ${destination_base}

    # Copy the entire folder with all contents
    ${os_name}=    Evaluate    platform.system()    platform

    IF    "${os_name}" == "Windows"
        # Windows: Use xcopy with /E (recursive) and /I (destination is directory)
        Run Process    xcopy ${source_dir} ${dest_folder} /E /I /Q    shell=True
    ELSE
        # Linux/macOS: Use cp -r (recursive)
        Run Process    cp -r ${source_dir} ${dest_folder}    shell=True
    END

    # Verify the copy was successful
    Directory Should Exist    ${dest_folder}
    Log    Created copy: ${dest_folder}
    RETURN    ${dest_folder}

Close Browser And Terminate test running
    Run Keywords    Close Browser
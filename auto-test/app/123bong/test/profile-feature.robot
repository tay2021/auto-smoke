*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../../common/common-keywords.resource
Resource    ../api-keywords/user-api-request.resource
Resource    ../keyword/user-profile-keywords.resource


Test Teardown    Close Browser And Terminate Test Running


*** Test Cases ***
As a user I want to check Profile user correct
    [Tags]    smoke    profile
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    ${response}    Send GET Request To Get Profile User    ${GL_BEARER_TOKEN}
    ${content_api_profile}    Get Content Of Api Profile     ${response}
    ${dict}    Get Profile Information Detail    ${content_api_profile}
    ${expected_username}=    Get From Dictionary    ${dict}    username
    ${expected_fullname}=    Get From Dictionary    ${dict}    fullname
    ${expected_email}=    Get From Dictionary    ${dict}    email
    IF    '${expected_email}'=='None'
        ${expected_email}    Set Variable    ${EMPTY}
    END
    ${expected_phone}=    Get From Dictionary    ${dict}    phone
    ${expected_telegram}=    Get From Dictionary    ${dict}    tele_chat_id
    Go To Profile Page
    Assert Profile Information Are Correct    ${expected_username}    ${expected_fullname}    ${expected_email}
    ...    ${expected_phone}    ${expected_telegram}
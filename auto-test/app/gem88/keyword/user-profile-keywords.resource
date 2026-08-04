*** Settings ***
Resource    ../page/page-profile-information.resource
Resource    ../api-keywords/user-api-request.resource




*** Keywords ***
Go to Profile Page
    Go To    ${GL_GEM88_URL}account/profile
    

Assert Profile Information Are Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Profile User    ${GL_BEARER_TOKEN}
    ${content_api_profile}    Get Content Of Api Profile    ${response}
    ${dict}    Get Profile Information Detail    ${content_api_profile}
    ${expected_username}=    Get From Dictionary    ${dict}    username
    ${expected_fullname}=    Get From Dictionary    ${dict}    fullname
    ${expected_email}=    Get From Dictionary    ${dict}    email
    ${expected_phone}=    Get From Dictionary    ${dict}    phone
    ${expected_telegram}=    Get From Dictionary    ${dict}    tele_chat_id

    ${expected_email}    Set Variable If    '${expected_email}'=='None'    ${EMPTY}    ${expected_email}
    ${expected_phone}    Set Variable If    '${expected_phone}'=='None'    ${EMPTY}    ${expected_phone}
    ${expected_telegram}    Set Variable If    '${expected_telegram}'=='None'    ${EMPTY}    ${expected_telegram}

    ${actual_username}    Get User Name Value On Profile Page
    ${actual_fullname}    Get Full Name Value On Profile Page
    ${actual_email}    Get Email Value On Profile Page
    ${actual_phone}    Get Phone Value On Profile Page
    ${actual_telegram}    Get Telegram Value On Profile Page
    
    Should Be True    '${actual_username}'=='${expected_username}'    msg=User name không đúng
    Should Be True    '${actual_fullname}'=='${expected_fullname}'    msg=Full name không đúng
    Should Be True    '${actual_email}'=='${expected_email}'    msg=Email name không đúng
    Should Be True    '${actual_phone}'=='${expected_phone}'    msg=Phone không đúng
    Should Be True    '${actual_telegram}'=='${expected_telegram}'    msg=Telegram name không đúng
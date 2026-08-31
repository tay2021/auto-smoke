*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-profile-information.resource
Resource    ../../common/user-api-request.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-header.resource






*** Keywords ***
Go to Profile Page
    Click On The Avatar Image On Header Page
    Click On The Icon Account Profile On The Account Info Page
    
    
Assert Profile Information Are Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Profile User    ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${expected_username}=    Get From Dictionary    ${dict['data']}    username
    ${expected_fullname}=    Get From Dictionary    ${dict['data']}    fullname
    ${expected_email}=    Get From Dictionary    ${dict['data']}    email
    ${expected_phone}=    Get From Dictionary    ${dict['data']}    phone
    ${expected_telegram}=    Get From Dictionary    ${dict['data']}    tele_chat_id

    ${expected_email}    Set Variable If    '${expected_email}'=='None'    ${EMPTY}    ${expected_email}
    ${expected_phone}    Set Variable If    '${expected_phone}'=='None'    ${EMPTY}    ${expected_phone}
    ${expected_telegram}    Set Variable If    '${expected_telegram}'=='None'    ${EMPTY}    ${expected_telegram}

    ${actual_username}    Get User Name Value On Profile Page
    ${actual_fullname}    Get Full Name Value On Profile Page
    ${actual_email}    Get Email Value On Profile Page
    ${actual_phone}    Get Phone Value On Profile Page

    Should Be True    '${actual_username}'=='${expected_username}'    msg=User name không đúng
    Should Be True    '${actual_fullname}'=='${expected_fullname}'    msg=Full name không đúng
    Should Be True    '${actual_email}'=='${expected_email}'    msg=Email name không đúng
    Should Be True    '${actual_phone}'=='${expected_phone}'    msg=Phone không đúng

    
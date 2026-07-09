*** Settings ***
Resource    ../page/page-header.resource
Resource    ../page/page-profile-information.resource




*** Keywords ***
Go to Profile Page
    Go To    ${GL_PUB88_URL}account/profile
    
    
Assert Profile Information Are Correct
    [Arguments]    ${p_expected_username}    ${p_expected_fullname}    ${p_expected_email}    ${p_expected_phone}    ${p_expected_telegram}
    ${actual_username}    Get User Name Value On Profile Page
    ${actual_fullname}    Get Full Name Value On Profile Page
    ${actual_email}    Get Email Value On Profile Page
    ${actual_phone}    Get Phone Value On Profile Page
    Should Be True    '${actual_username}'=='${p_expected_username}'    msg=User name không đúng
    Should Be True    '${actual_fullname}'=='${p_expected_fullname}'    msg=Full name không đúng
    Should Be True    '${actual_email}'=='${p_expected_email}'    msg=Email name không đúng
    Should Be True    '${actual_phone}'=='${p_expected_phone}'    msg=Phone không đúng

    
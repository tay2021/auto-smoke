*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-header.resource
Resource    ../page/page-account-info.resource
Resource    ../../common/user-api-request.resource


*** Keywords ***
Go To VIP User Page
    Click On The Avatar Image On Header Page
    Click On The Menu Thanh Vien VIP On The Account Info Page

Assert VIP User Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get VIP Detail Of User   ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${level}    Get From Dictionary    ${dict['data'][0]}    level
    #${actual_vip_level}    Get Value Of Vip Level On VIP Program Page
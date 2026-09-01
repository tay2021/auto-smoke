*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-header.resource
Resource    ../../common/user-api-request.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-footer-menu.resource



*** Keywords ***
Go To VIP User Page
   Click On The Menu Tai Khoan On The Footer Menu
   Click On The Menu Thanh Vien VIP On The Account Info Page


Assert VIP User Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get VIP Detail Of User   ${GL_HBET_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${level}    Get Value From Json    ${dict['data']}    level
    #${actual_vip_level}    Get Value Of Vip Level On VIP Program Page

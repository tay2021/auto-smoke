*** Settings ***
Resource    ../../common/common-keywords.resource
Resource    ../page/page-p2p.resource
Resource    ../page/page-account-info.resource
Resource    ../page/page-footer-menu.resource


*** Keywords ***
Go To Giao Dich P2p Page
    Click On The Menu Tai Khoan On The Footer Menu
    Click On The Menu P2P On The Account Info Page


Assert Page Giao Dich P2p Show Correct
    Close Pop Up Chao Mung Den Voi P2p
    ${locator}    Get Element Balance Of User
    ${exist}    Check Element Exists On Page    ${locator}    timeout=30s
    Should Be True    ${exist}
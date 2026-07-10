*** Settings ***
Resource    ../page/page-header.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-p2p.resource





*** Keywords ***
Go To Giao Dich P2p Page
    Go To    ${GL_ZO88_URL}account/p2p

Assert Page Giao Dich P2p Show Correct
    Close Pop Up Chao Mung Den Voi P2p
    ${locator}    Get Element Balance Of User
    ${exist}    Check Element Exists On Page    ${locator}    timeout=30s
    Should Be True    ${exist}
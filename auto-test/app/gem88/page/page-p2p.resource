*** Settings ***
Library    Browser    timeout=15s
Resource    ../../common/common-keywords.resource


*** Variables ***



*** Keywords ***
Close Pop up Chao Mung Den Voi P2p
    ${locator}    Set Variable    //iframe[contains(@src,'buy')] >>> //*[text()='Chào mừng đến với P2P']
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}
    Click With Options    //iframe[contains(@src,'buy')] >>> div[role='dialog'] > div:nth-child(2)    force=True
    
Get Element Balance Of User
    ${locator}    Set Variable    //iframe[contains(@src,'buy')] >>> //div[contains(@class,'_balance-container_')]
    RETURN    ${locator}
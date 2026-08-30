*** Settings ***
Resource    ../../import.resource
Resource    ../page/page-account-promotion.resource
Resource    ../../common/common-keywords.resource
Resource    ../page/page-header.resource
Resource    ../page/page-account-info.resource
Resource    ../../common/user-api-request.resource
Library     ../../utils/utils-lib.py




*** Keywords ***
Go To User Promotion Page
    Click On The Avatar Image On Header Page
    Click On The Menu Khuyen Mai Cua Ban On The Account Info Page
    
Assert User Promotion Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Of User    ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${code}    Get From Dictionary    ${dict}    code
    IF    ${code}==200
        ${type}    Get From Dictionary    ${dict['data']}    type
        IF   '${type}'=='COMMISSION'
            Assert Promotion Commission Of User
        ELSE IF    '${type}'=='WELCOME'
            Assert Promotion Welcome Of User
        END
    ELSE IF    ${code}==400
        Assert User Without Promotion
    END
        
       
    
    

Assert Promotion Commission Of User
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Commission Detail Of User    ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${expected_total_stake}    Get From Dictionary        ${dict['data']}    stake
    ${expected_total_stake}=    Evaluate    "{:,}".format($expected_total_stake)
    ${expected_commission}    Get From Dictionary    ${dict['data']}    commission
    ${expected_commission}    Evaluate    round(${expected_commission})
    #${$expected_commission}=    Evaluate    "{:,}".format($expected_commission)
    ${actual_total_stake}    Get Value Of Total Stake On Promotion Page
    ${actual_total_cashback}    Get Value Of Total Commission Cashback On Promotion Page
    ${actual_total_stake}    Remove String    ${actual_total_stake}    ${SPACE}    K
    ${actual_total_cashback}    Remove String    ${actual_total_cashback}    ${SPACE}    K
    ${actual_total_cashback}=    Evaluate    round(${actual_total_cashback})
    Should Be True    '${expected_total_stake}'=='${actual_total_stake}'
    Should Be True    '${expected_commission}'=='${actual_total_cashback}'


Assert Promotion Welcome Of User
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Of User    ${GL_LU88_GATEWAY_URL}    ${bearer_token}
    ${dict}    Convert Response Content Of Api To A Dictionary    ${response}
    ${deposit_amount}    Get From Dictionary    ${dict['data']}    deposit_amount
    ${rolling}    Get From Dictionary    ${dict['data']}    rolling
    ${promotion_amount}    Get From Dictionary    ${dict['data']}    promotion_amount
    ${expected_deposit_amount}    Format With K    ${deposit_amount}
    ${expected_promotion_amount}    Format With K    ${promotion_amount}
    ${expected_rolling}    Format With K    ${rolling}
    ${actual_so_tien_nap}    Get Value Of So Tien Da Nap Promtion 100% On Promotion Page
    ${actual_so_tien_thuong}    Get Value Of So Tien Thuong Promtion 100% On Promotion Page
    ${actual_so_tien_rolling}    Get Value Of So Tien Rolling Promtion 100% On Promotion Page
    ${actual_so_tien_rolling}    Remove String    ${actual_so_tien_rolling}    /
    ${actual_so_tien_rolling}    Strip String    ${actual_so_tien_rolling}    mode=left
    Should Be True    '${expected_deposit_amount}'=='${actual_so_tien_nap}'
    Should Be True    '${expected_promotion_amount}'=='${actual_so_tien_thuong}'
    Should Be True    '${expected_rolling}'=='${actual_so_tien_rolling}'
    

Assert User Without Promotion
    ${locator}    Get Label Locator Tham Gia Khuyen Mai Hoan Tra On Promotion Page
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}
    ${locator}    Get Label Locator Tham Gia Khuyen Mai 100% On Promotion Page
    ${exist}    Check Element Exists On Page    ${locator}
    Should Be True    ${exist}

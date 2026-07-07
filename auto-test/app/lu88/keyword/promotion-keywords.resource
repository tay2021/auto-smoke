*** Settings ***
Resource    ../page/page-header.resource
Resource    ../api-keywords/user-api-request.resource   
Resource    ../page/page-account-promotion.resource
Resource    ../../common/common-keywords.resource
Library     String
Library     ../../utils/utils-lib.py




*** Keywords ***
Go To User Promotion Page
    Go To    ${GL_LU88_URL}/account/promotion
    
Assert User Promotion Page Show Correct
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Of User    ${bearer_token}
    ${content_api_lsc}    Get Content Of API LSC    ${response}
    ${json}    Convert String To Json    ${content_api_lsc}
    ${code}    Get Value From Json    ${json}    $.code
    ${code}    Set Variable    ${code}[0]
    IF    ${code}==200
        ${type}    Get Value From Json    ${json}    $.data.type
        IF   '${type}[0]'=='COMMISSION'
            Assert Promotion Commission Of User
        ELSE IF    '${type}[0]'=='WELCOME'
            Assert Promotion Welcome Of User
        END
    ELSE IF    ${code}==400
        Assert User Without Promotion
    END
        
       
    
    

Assert Promotion Commission Of User
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Commission Detail Of User    ${bearer_token}
    ${content_api_promotion_detail}    Get Content Of API User Promotion Commission Detail    ${response}
    ${json}    Convert String To Json    ${content_api_promotion_detail}
    ${expected_total_stake}    Get Value From Json    ${json}    $.data.stake
    ${expected_total_stake}=    Evaluate    "{:,}".format($expected_total_stake[0])
    ${expected_commission}    Get Value From Json    ${json}    $.data.commission
    ${expected_commission}    Evaluate    int(${expected_commission}[0])
    ${$expected_commission}=    Evaluate    "{:,}".format($expected_commission)
    ${actual_total_stake}    Get Value Of Total Stake On Promotion Page
    ${actual_total_cashback}    Get Value Of Total Commission Cashback On Promotion Page
    ${actual_total_stake}    Remove String    ${actual_total_stake}    ${SPACE}    K
    ${actual_total_cashback}    Remove String    ${actual_total_cashback}    ${SPACE}    K
    Should Be True    '${expected_total_stake}'=='${actual_total_stake}'
    Should Be True    '${expected_commission}'=='${actual_total_cashback}'


Assert Promotion Welcome Of User
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Promotion Of User    ${bearer_token}
    ${content_api_promotion}    Get Content Of API User Promotion    ${response}
    ${json}    Convert String To Json    ${content_api_promotion}
    ${deposit_amount}    Get Value From Json    ${json}    $.data.deposit_amount
    ${rolling}    Get Value From Json    ${json}    $.data.rolling
    ${promotion_amount}    Get Value From Json    ${json}    $.data.promotion_amount
    ${expected_deposit_amount}    Format With K    ${deposit_amount}[0]
    ${expected_promotion_amount}    Format With K    ${promotion_amount}[0]
    ${expected_rolling}    Format With K    ${rolling}[0]
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

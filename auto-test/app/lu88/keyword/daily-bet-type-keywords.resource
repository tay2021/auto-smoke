*** Settings ***
Resource    ../page/page-daily-bet-type.resource
Resource    ../api-keywords/daily-baocao-api-request.resource



*** Keywords ***
Get Current From Date And To Date Selected By Default On Chi Tiet Quan Ly Dai Ly Theo Game Category
    ${from_date}    Get Default Selected From Date On Quan Ly Dai Ly Theo Game Category Page
    ${to_date}    Get Default Selected To Date On Quan Ly Dai Ly Theo Game Category Page
    ${dict}    Create Dictionary    from_date=${from_date}    to_date=${to_date}
    RETURN    ${dict}
    

Assert Chi Tiet Quan Ly Cuoc Theo Game Category Correct
    [Arguments]    ${p_from_date}    ${p_to_date}
    ${bearer_token}    Set Variable    ${GL_BEARER_TOKEN}
    ${response}    Send GET Request To Get Bao Cao Quan Ly Bet Game Theo Category   ${bearer_token}    ${p_from_date}    ${p_to_date}
    ${dict}    Evaluate    json.loads('''${response}''')    modules=json
    ${data}    Get From Dictionary    ${dict}    data
    ${len}    Get Length    ${data}
    IF    ${len}>0
        FOR    ${item}    IN    @{data}
            ${category_name}    Get From Dictionary    ${item}    category
            IF    '${category_name}'=='SLOT'
                ${category_name}    Set Variable    SLOTS
            END
            ${category_name}    Evaluate    "${category_name}".lower().replace("_"," ")
            ${stake}    Get From Dictionary    ${item}    stake
            ${stake}    Evaluate    "{:,.0f}".format(${stake})
            ${stake}    Set Variable    ${stake} K
            ${locator}    Set Variable     //*[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='${category_name}']
            ${exist}   Check Element Exists On Page    ${locator}
            Should Be True    ${exist}
        END
    END

*** Settings ***
Resource    ../../common/common-keywords.resource

*** Keywords ***
    
Get Default Selected From Date On Quan Ly Dai Ly Theo Game Category Page
    ${value}    Wait For Element State And Get Attribute    //span[text()='Từ ngày']/following-sibling::div/div/input    value
    RETURN    ${value}

Get Default Selected To Date On Quan Ly Dai Ly Theo Game Category Page
    ${value}    Wait For Element State And Get Attribute    //span[text()='Đến ngày']/following-sibling::div/div/input    value
    RETURN    ${value}
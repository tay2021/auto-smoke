*** Settings ***
Resource    ../../import.resource
Resource    ../../common/common-keywords.resource


*** Keywords ***
Get User Name Value On Profile Page 
    ${value}    Wait For Element State And Get Attribute    (//input[@name='username'])[3]    value
    RETURN    ${value}

Get Full Name Value On Profile Page
    ${value}    Wait For Element State And Get Attribute    (//input[@name='fullname'])[2]    value
    RETURN    ${value}

Get Phone Value On Profile Page
    ${value}    Wait For Element State And Get Attribute    (//input[@name='phone'])[2]    value
    RETURN    ${value}

Get Telegram Value On Profile Page
    Sleep    1s
    ${element}    Get Element    (//label[@for='telegram'])[2]/../input
    Log    ${element}
    ${value}    Wait For Element State And Get Attribute    (//input[@name='telegram'])[2]    value
    RETURN    ${value}

Get Email Value On Profile Page
    ${value}    Wait For Element State And Get Attribute    (//input[@name='email'])[2]    value
    RETURN    ${value}

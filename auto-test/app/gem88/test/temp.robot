*** Settings ***
Resource    ../keyword/freespin-keywords.resource


*** Test Cases ***
Check Temp TC
    [Tags]    login
    Clear All Free Spin Of User
    Log    Done

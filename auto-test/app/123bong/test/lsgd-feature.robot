*** Settings ***
Resource    ../keyword/login-keywords.resource
Resource    ../123bong-variable.resource
Resource    ../keyword/lsgd-keywords.resource


Test Teardown    Close Browser And Terminate Test Running



*** Test Cases ***
As a user I want to check Lich Su Giao Dich Show Correct
    [Tags]    smoke    lsgd
    Open 123Bong Site And Maximize Window    ${GL_123BONG_URL}
    Close Welcome Pop Up If Shown
    Login To Site 123Bong    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login To Site 123Bong Successfully
    Get And Set Bearer Token From Cookie After Login Successfully
    Go To Lich Su Giao Gich Page
    Assert LSGD Page Show Correct









    


    

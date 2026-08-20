*** Settings ***
Resource    ../../common/common-keywords.resource

*** Keywords ***
Click Button Close Welcome Pop Up
    Wait For Element State And Click On It    //div[contains(@class,'swiper-pagination')]/../preceding-sibling::img

Get Button Close Welcome Pop Up Element
    RETURN    //div[contains(@class,'swiper-pagination')]/../preceding-sibling::img
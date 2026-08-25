*** Settings ***
Documentation     Variables for PUB88 tests

*** Variables ***
# Application URLs
${GL_PUB88_DOMAIN}                pub88.college
${GL_PUB88_URL}                   https://${GL_PUB88_DOMAIN}/
${GL_PUB88_GATEWAY_URL}           https://${GL_PUB88_DOMAIN}/gw/api/v2/

# Test Data
${VALID_USERNAME}            alphapub88    #co bank chinh chu
${USER_KM_100%}              taypub8888    #usser này có rolling
${USER_WITHDRAW_MOBI}        taypubmobi    #dùng tk này đẻ test rút tièn mobi
${USER_WITHDRAW_CRYPTO}      taypubcrypto    #dùng tk này đẻ test rút tièn mobi
${VALID_PASSWORD}            123456
*** Settings ***
Documentation     Variables for PUB88 tests

*** Variables ***
# Application URLs
${GL_PUB88_DOMAIN}                pub88.channel
${GL_PUB88_URL}                   https://${GL_PUB88_DOMAIN}/
${GL_PUB88_GATEWAY_URL}           https://${GL_PUB88_DOMAIN}/gw/api/v2/

# Test Data
${VALID_USERNAME}            alphapub88
${USER_KM_100%}              taypub8888
${VALID_PASSWORD}            123456
*** Settings ***
Documentation     Variables for 123Bong tests

*** Variables ***
# Application URLs
${GL_123BONG_DOMAIN}                123bong.cool
${GL_123BONG_URL}                   https://${GL_123BONG_DOMAIN}/
${GL_123BONG_GATEWAY_URL}           https://${GL_123BONG_DOMAIN}/gw/api/v2/

# Test Data
${USERNAME_VALID}                     taybong123
${USERNAME_KM100%}                    taybongkm100
${USERNAME_WITHDRAW_MOBI}             taybongmobi
${USERNAME_WITHDRAW_CRYPTO}           taybongcrypto
${VALID_PASSWORD}                     123456
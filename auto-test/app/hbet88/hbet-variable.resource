*** Settings ***
Documentation     Variables for HBET tests

*** Variables ***
# Application URLs
${GL_HBET_DOMAIN}                hbet.wtf
${GL_HBET_URL}                   https://${GL_HBET_DOMAIN}/
${GL_HBET_GATEWAY_URL}           https://${GL_HBET_DOMAIN}/gw/api/v2/

# Test Data
${USERNAME_BANK_CC}             taybetbank
${USERNAME_WITHDRAW_MOBI}       taynewhbet
${USERNAME_WITHDRAW_CRYPTO}     tayhbetcrypto
${USERNAME_KM100%}              taybetkm100
${VALID_USERNAME}               tayhbet700
#${VALID_USERNAME}              taynewhbet

${VALID_PASSWORD}            123456
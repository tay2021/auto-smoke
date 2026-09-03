*** Settings ***
Documentation     Variables for LU88 tests

*** Variables ***
# Application URLs
${GL_LU88_DOMAIN}                lu88.law
${GL_LU88_URL}                   https://${GL_LU88_DOMAIN}/
${GL_LU88_GATEWAY_URL}           https://${GL_LU88_DOMAIN}/gw/api/v2/
${GL_LU88_DAILY_URL}             https://daily.${GL_LU88_DOMAIN}/

# Test Data
#${VALID_USERNAME}           taynu001
${USERNAME_WITHDRAW_ROLLING}    taycon102
${USERNAME_WITHDRAW_CRYPTO}     feyalu001
${USERNAME_WITHDRAW_CARD}       feyalu001
${USERNAME_100%}                taycon102    #tk co km 100
${USERNAME_CHANGE_PASS}         taycon102
${USERNAME_DAILY}               taydaily    #có đai ly con là taycon102
${VALID_PASSWORD}               123456
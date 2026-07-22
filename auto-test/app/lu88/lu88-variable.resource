*** Settings ***
Documentation     Variables for LU88 tests

*** Variables ***
# Application URLs
${GL_LU88_DOMAIN}                lu88.lc
${GL_LU88_URL}                   https://${GL_LU88_DOMAIN}/
${GL_LU88_GATEWAY_URL}           https://${GL_LU88_DOMAIN}/gw/api/v2/
${GL_LU88_DAILY_URL}             https://daily.${GL_LU88_DOMAIN}/

# Test Data
#${VALID_USERNAME}            taynu001
#${VALID_USERNAME}           taylukm100    #tk co km 100
#${VALID_USERNAME}           taylu888    #tk co km 100
${VALID_USERNAME}            taydaily
${VALID_PASSWORD}            123456

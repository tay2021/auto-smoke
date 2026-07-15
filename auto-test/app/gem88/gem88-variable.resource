*** Settings ***
Documentation     Variables for GEM88 tests

*** Variables ***
# Application URLs
${GL_GEM88_DOMAIN}                gem88.sh
${GL_GEM88_URL}                   https://${GL_GEM88_DOMAIN}/
${GL_GEM88_GATEWAY_URL}           https://${GL_GEM88_DOMAIN}/gw/api/v2/

# Test Data
${VALID_USERNAME}            taygem001
#taycc01
#taygem001   -- tai khoan nay dung test km hoan tra
#taykhuyenmai100   - tai khaon nay dung test km 100$%
${VALID_PASSWORD}            123456

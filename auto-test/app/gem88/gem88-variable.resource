*** Settings ***
Documentation     Variables for GEM88 tests

*** Variables ***
# Application URLs
${GL_GEM88_DOMAIN}                gem88.cfd
${GL_GEM88_URL}                   https://${GL_GEM88_DOMAIN}/
${GL_GEM88_GATEWAY_URL}           https://${GL_GEM88_DOMAIN}/gw/api/v2/

# Test Data
${VALID_USERNAME}            taygem8888
${VALID_USER_ROLLING}        taycc01
${VALID_USER_WITHDRAW}       taygem001    #-- tai khoan nay dung test km hoan tra
${VALID_USER_CRYPTO}         taykmgem101
#taykhuyenmai100   - tai khaon nay dung test km 100$%
${VALID_PASSWORD}            123456

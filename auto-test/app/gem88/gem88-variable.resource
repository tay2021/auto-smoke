*** Settings ***
Documentation     Variables for GEM88 tests

*** Variables ***
# Application URLs
${GL_GEM88_DOMAIN}                gem88.zone
${GL_GEM88_URL}                   https://${GL_GEM88_DOMAIN}/
${GL_GEM88_GATEWAY_URL}           https://${GL_GEM88_DOMAIN}/gw/api/v2/

# Test Data
# qui tắc đặt tên phải bắt đầu bằng chữ USERNAME_xxxxxx
${USERNAME_VALID}          taygem8888
${USERNAME_ROLLING}        taycc01
${USERNAME_WITHDRAW}       taygem001    #-- tai khoan nay dung test km hoan tra
${USERNAME_CRYPTO}         taykmgem101
${VALID_PASSWORD}          123456    # đặt cùng 1 pass cho dễ control
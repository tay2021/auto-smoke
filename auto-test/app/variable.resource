*** Variables ***
# Browser Configuration
${GL_BROWSER}                   chromium
${GL_HEADLESS}                  ${False}
${GL_DEFAULT_TIMEOUT}           30000
${GL_DEVICE_NAME}               iPhone 14 Pro Max
${GL_VIEWPORT_WIDTH}            1920
${GL_VIEWPORT_HEIGHT}           1080


# biến global bearer token để dùng cho api request
${GL_BEARER_TOKEN}           ${NONE}    # không được thay đổi biến global này. nó sẽ được set tụ động sau khi login thành công


# api uri
${URI_PROFILE}               user/profile
${URI_LSGD}                  user/transaction-history?limit=10&page=1&days=3&isFetch=true
${URI_LSC}                   user/bet-history?status=&limit=10&page=1
${URI_BANK}                  user/bank
${URI_PROMOTION}             user/promotion
${URI_BET_STATICTIS}         user/bet-statistic
${URI_VIP_PROGRAM}           user/vip-program/user



# api promotion
${URI_LUCKY_WHEEL_V2}        lucky-wheel-v2/user-data

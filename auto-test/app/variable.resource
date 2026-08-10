*** Variables ***
# Browser Configuration
${GL_BROWSER}                   chromium
${GL_HEADLESS}                  ${True}
${GL_DEFAULT_TIMEOUT}           30000


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



# dành cho api đại lý của lu88
${URI_DAILY_THONGKE_USER}                               agent/statistic/user
${URI_DAILY_THONGKE_SUB}                                agent/statistic/sub
${URI_DAILY_THONGKE_TOTAL_AGENT_BY_DAY}                 agent/statistic/total-of-agent-by-day
${URI_DAILY_THONGKE_TOTAL_AGENT}                        agent/statistic/total-of-agent
${URI_DAILY_DIRECT_AGENT}                               agent/statistic/direct-agent-users
${URI_DAILY_SUB_AGENT}                                  agent/statistic/sub-agents
${URI_DAILY_BET-BY-CATEGORY}                            agent/statistic/bet-by-category



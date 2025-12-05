#include <string>

namespace legacy_money {
struct MoneyConfig {
    int         version         = 2;
    int         def_money       = 0;
    float       pay_tax         = 0.0;
    bool        enable_commands = true;
    std::string currency_symbol = "$";
    long long max_single_pay       = 10000;  // 单次转账最大限制
    long long max_daily_pay_amount = 50000;  // 每日转账总额限制
    int       max_daily_pay_times  = 10;     // 每日转账次数限制
};

bool         loadConfig();
MoneyConfig& getConfig();
} // namespace legacy_money
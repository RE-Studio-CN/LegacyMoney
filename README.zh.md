# LegacyMoney

[English](README.md) | 简体中文  
LeviLamina 的经典版 LiteLoaderMoney ，但是进行了修改

# 安装

## 使用Lip

```bash
lip install github.com/LiteLDev/LegacyMoney
```

# 用法

| 命令                           | 说明                  | 权限等级 |
| ------------------------------ | --------------------- | -------- |
| /money query(s) [玩家]         | 查询你自己/他人的余额 | 玩家/OP  |
| /money pay(s) <玩家> <数量>    | 转账给某人            | 玩家     |
| /money set(s) <玩家> <数量>    | 设置某人的余额        | OP       |
| /money add(s) <玩家> <数量>    | 添加某人的余额        | OP       |
| /money reduce(s) <玩家> <数量> | 减少某人的余额        | OP       |
| /money hist                    | 打印流水账            | 玩家     |
| /money purge                   | 清除流水账            | OP       |
| /money top                     | 余额排行              | 玩家     |

# 配置文件

```jsonc
{
    "version": 2,
    "def_money": 0,             // 玩家初始金额
    "pay_tax": 0.0,             // 转账税率
    "enable_commands": true,    // 启用money指令
    "currency_symbol": "$",     // 货币符号
    "max_single_pay": 0,        // 单次转账最大限制
    "max_daily_pay_amount": 0,  // 每日转账总额限制
    "max_daily_pay_times": 0    // 每日转账次数限制
}
```

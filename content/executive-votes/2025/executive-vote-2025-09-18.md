---
title: Template - [Executive Vote] Delayed Upgrade Penalty, Launch Agent 2 Allocator Adjustment, LSEV2-SKY-A Liquidation Ratio Increase, First Monthly Settlement Cycle, AD Compensation for September 2025, Atlas Core Development USDS and SKY Payments, Spark Proxy Spell - September 18, 2025
summary: Set Delayed Upgrade Penalty, Launch Agent 2 Allocator Adjustment, LSEV2-SKY-A Liquidation Ratio increase, Monthly Settlement Cycle execution for July-August 2025, August Aligned Delegate Compensation, Atlas Core Development USDS and SKY payments for September 2025, Spark proxy spell execution.
date: 2025-09-18T00:00:00.000Z
address: "0x98B876F9E8Aa2d32A85042F5fe8E860d3a7B8d3B"
---

# [Executive Proposal] Delayed Upgrade Penalty, Launch Agent 2 Allocator Adjustment, LSEV2-SKY-A Liquidation Ratio Increase, First Monthly Settlement Cycle, AD Compensation for September 2025, Atlas Core Development USDS and SKY Payments, Spark Proxy Spell - September 18, 2025

The Governance Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The [Delayed Upgrade Penalty](https://sky-atlas.powerhouse.io/A.4.1.2.1.4.2.5_Set_Conversion_Fee_In_MKR_To_SKY_Conversion_Contract_To_1%25/1f1f2ff0-8d73-804c-948b-fddc869fcb65%7Cb341f4c0b83472dc1f9e1a3b) will be set to 1%.
- Launch Agent 2 Allocator Instance Operator will be replaced with a subproxy-based setup.
- The LSEV2-SKY-A Liquidation Ratio will be increased.
- The first Monthly Settlement Cycle, corresponding to July-August 2025, will be executed.
- A total of **22,899 USDS** will be distributed as Aligned Delegate compensation for August 2025.
- A total of **77,724 USDS** and **618,000 SKY** will be distributed as Core Atlas Development payments for September 2025.
- A Spark Prime Agent proxy spell will be executed.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/A.1.9.2.1.2_Pause_Delay_Current_Value/09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal **has its earliest execution date set to Monday September 22, 2025 at 14:00 UTC**. This means that it cannot be executed before that date.

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Set Delayed Upgrade Penalty

- **Authorization**: [A.4.1.2.1.4.2.5](https://sky-atlas.powerhouse.io/A.4.1.2.1.4.2.5_Set_Conversion_Fee_In_MKR_To_SKY_Conversion_Contract_To_1%25/1f1f2ff0-8d73-804c-948b-fddc869fcb65%7Cb341f4c0b83472dc1f9e1a3b)
- **Proposal**: [Forum Post](https://forum.sky.money/t/phase-3-mkr-to-sky-migration-items-september-18th-spell/27178)

If this executive proposal passes, then the Delayed Upgrade Penalty for upgrading MKR to SKY will be set to **1%**.

### Launch Agent 2 Allocator Adjustment

- **Authorization**: [Governance Poll 1583](https://vote.sky.money/polling/QmYt7nbx)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-nova-allocator-adjustment/27175)

If this executive proposal passes, then the following series of actions to Launch Agent 2 will be executed:

- Offboard previously ratified operator in favor of a SubProxy-based setup:
  - Remove Operator ability to transfer USDS out of the Launch Agent 2 allocator buffer via:
    - `AllocatorBufferLike(ALLOCATOR_NOVA_A_BUFFER).approve(USDS, NOVA_OPERATOR, 0);`
  - Remove Operator from the role 0 via:
    - `AllocatorRolesLike(ALLOCATOR_ROLES).setUserRole("ALLOCATOR-NOVA-A", NOVA_OPERATOR, 0, false);`
  - Remove ability to "draw" and "wipe" for the role 0 via:
    - `AllocatorRolesLike(ALLOCATOR_ROLES).setRoleAction("ALLOCATOR-NOVA-A", 0, ALLOCATOR_NOVA_A_VAULT, VaultLike.draw.selector, false);`
    - `AllocatorRolesLike(ALLOCATOR_ROLES).setRoleAction("ALLOCATOR-NOVA-A", 0, ALLOCATOR_NOVA_A_VAULT, VaultLike.wipe.selector, false);`
- Set the SubProxy address to [0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310)
- Set up the Subproxy:
  - Set SubProxy as the ilk admin instead of the Pause Proxy via:
    - `AllocatorRolesLike(ALLOCATOR_ROLES).setIlkAdmin("ALLOCATOR-NOVA-A", NOVA_PROXY);`
  - Move ownership of the ALLOCATOR_NOVA_A_VAULT to the SubProxy via:
    - `WardsAbstract(ALLOCATOR_NOVA_A_VAULT).rely(NOVA_PROXY);`
    - `WardsAbstract(ALLOCATOR_NOVA_A_VAULT).deny(MCD_PAUSE_PROXY);`
  - Move ownership of the ALLOCATOR_NOVA_A_BUFFER to the SubProxy via:
    - `WardsAbstract(ALLOCATOR_NOVA_A_BUFFER).rely(NOVA_PROXY);`
    - `WardsAbstract(ALLOCATOR_NOVA_A_BUFFER).deny(MCD_PAUSE_PROXY);`

### LSEV2-SKY-A Liquidation Ratio Increase

- **Authorization**: [Atlas Axis Authorization](https://forum.sky.money/t/september-18-2025-proposed-changes-to-lsev2-sky-a-liquidation-ratio/27160/2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-lsev2-sky-a-liquidation-ratio/27160)

If this executive proposal passes, then the LSEV2-SKY-A [Liquidation Ratio](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.1_Liquidation_Ratio/1184ab96-8cad-4755-9798-2c8782304407|57eaf45219bea3b430c2) will be increased as follows:

- Increase LSEV2-SKY-A Liquidation Ratio by 20 percentage points, from 125% to **145%**.

### Monthly Settlement Cycle Execution for July-August 2025

- **Authorization**: [A.2.5.1.2.2.1](https://sky-atlas.powerhouse.io/A.2.5.1.2.2.1_Stage_1/241f2ff0-8d73-8014-b124-e76f5f5c91fc%7C9e1fcc279923ea16fa2d)
- **Proposal**: [Forum Post](https://forum.sky.money/t/monthly-settlement-cycle-1-july-august-september-18-2025-spell/27173)

If this executive proposal passes, then the [Monthly Settlement Cycle](https://sky-atlas.powerhouse.io/A.2.5_Sky_Core_Monthly_Settlement_Cycle/1d8f2ff0-8d73-807c-80f0-e58dde70cc27|9e1f) corresponding to July-August 2025 will be executed as follows.

#### Spark Settlement

- Mint 1,603,952 USDS debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer via:
  - `_takeAllocatorPayment(ALLOCATOR_SPARK_A_VAULT, 1_603_952e18);`
- Transfer 5,927,944 USDS from the Surplus Buffer to the [Spark SubProxy](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) via:
  - `_transferUsds(SPARK_PROXY: 0x3300f198988e4C9C63F75dF86De36421f06af8c4, 5_927_944e18);`

#### Grove Settlement

- Mint 4,788,407 USDS debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer via:
  - `_takeAllocatorPayment(ALLOCATOR_BLOOM_A_VAULT, 4_788_407e18);`
- Transfer 30,654 USDS from the Surplus Buffer to the [Grove SubProxy](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) via:
  - `_transferUsds(GROVE_PROXY: 0x1369f7b2b38c76B6478c0f0E66D94923421891Ba, 30_654e18);`

### Aligned Delegate Compensation for August 2025

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/Budget_And_Participation_Requirements/4c698938-1a11-4486-a568-e54fc6b0ce0c%7C0db3af4e)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-2025-aligned-delegate-compensation/27165)

If this executive proposal passes, then a total of **22,899 USDS** will be distributed to seven Aligned Delegates as compensation for August 2025 as follows:

| Delegate    | Amount (USDS) | Address                                                                                                               |
|-------------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| WBC         | 4,000         | [0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47](https://etherscan.io/address/0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47) |
| Tango       | 3,400         | [0xB2B86A130B1EC101e4Aed9a88502E08995760307](https://etherscan.io/address/0xB2B86A130B1EC101e4Aed9a88502E08995760307) |
| SkyStaking  | 2,854         | [0x05c73AE49fF0ec654496bF4008d73274a919cB5C](https://etherscan.io/address/0x05c73AE49fF0ec654496bF4008d73274a919cB5C) |
| AegisD      | 645           | [0x78C180CF113Fe4845C325f44648b6567BC79d6E0](https://etherscan.io/address/0x78C180CF113Fe4845C325f44648b6567BC79d6E0) |

### Atlas Core Development Payments for September 2025

- **Authorization**: [Ecosystem Authorization](https://forum.sky.money/t/atlas-core-development-payment-requests-september-2025/27139/6), [Atlas Axis Authorizations](https://forum.sky.money/t/atlas-core-development-payment-requests-september-2025/27139/5)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-core-development-payment-requests-september-2025/27139)

If this executive proposal passes, then a total of **77,724 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for September 2025 as follows:

#### USDS Payments

| Recipient | Amount (USDS) | Address                                                                                                               |
|-----------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 50,167        | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 16,417        | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| Kohla     | 11,140        | [0x73dFC091Ad77c03F2809204fCF03C0b9dccf8c7a](https://etherscan.io/address/0x73dFC091Ad77c03F2809204fCF03C0b9dccf8c7a) |

#### SKY Payments

| Recipient | Amount (SKY) | Address                                                                                                               |
|-----------|-------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 330,000      | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 288,000      | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |

### Prime Agent Proxy Spell for Spark

If this executive proposal passes, then a Prime Agent proxy spell for Spark will be executed at [0x7B28F4Bdd7208fe80916EBC58611Eb72Fb6A09Ed](https://etherscan.io/address/0x7B28F4Bdd7208fe80916EBC58611Eb72Fb6A09Ed) with the following contents.

#### Spark Liquidity Layer Base - Activate MORPHO Transfer Rate Limit

- **Authorization**: [Governance Poll 1572](https://vote.sky.money/polling/QmUaV3Xj)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Activate a MORPHO transfer [rate limit](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) for the [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) on Base with the following parameters:

- Transfers
  - maxAmount: **100,000 MORPHO**
  - slope: **100,000 MORPHO per day**
  - Recipient: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://basescan.org/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) (Spark Base liquidation multisig)

#### Spark Liquidity Layer Base - Increase USDC CCTP Rate Limits

- **Authorization**: [Governance Poll 1573](https://vote.sky.money/polling/QmPT2Ynb)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Increase the [Cross-chain Transfer Protocol (CCTP)](https://docs.spark.fi/user-guides/spark-liquidity-layer#cctp) [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) as follows:

- Global: **Unlimited**
- Base to Ethereum
  - maxAmount: **200 million USDC**
  - slope: **500 million USDC per day**

#### Spark Liquidity Layer Base - Upgrade ALM Controller to v1.7

- **Authorization**: [Governance Poll 1574](https://vote.sky.money/polling/QmVwqNSv)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Upgrade the current [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) ALM Controller on Base to version 1.7.

#### Spark Liquidity Layer Mainnet - Increase USDC CCTP Rate Limits

- **Authorization**: [Governance Poll 1575](https://vote.sky.money/polling/QmXzyYyJ)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Increase the [Cross-chain Transfer Protocol (CCTP)](https://docs.spark.fi/user-guides/spark-liquidity-layer#cctp) [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) as follows:

- Global: **Unlimited**
- Ethereum to Base
  - maxAmount: **200 million USDC**
  - slope: **500 million USDC per day**

#### Spark Liquidity Layer Mainnet - Onboard PYUSD-USDS Curve Pool

- **Authorization**: [Governance Poll 1576](https://vote.sky.money/polling/QmUv9fbY)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Onboard the PYUSD-USDS Curve Pool to the [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) on mainnet with the following [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits):

- Token/deposit address: [0xA632D59b9B804a956BfaA9b48Af3A1b74808FC1f](https://etherscan.io/address/0xa632d59b9b804a956bfaa9b48af3a1b74808fc1f)
  - Fee: 0.001%
  - A parameter: 10,000
  - Off peg multiplier: 5
- Underlying asset: USDS and PYUSD
- Deposits
  - maxAmount: **5 million**
  - slope: **50 million per day**
- Withdrawals
  - maxAmount: **5 million**
  - slope: **100 million per day**
- Swaps
  - maxAmount: **5 million**
  - slope: **50 million per day**
  - maxSlippage: **0.2%**

#### Spark Liquidity Layer Mainnet - Onboard USDS SPK Farm

- **Authorization**: [Governance Poll 1577](https://vote.sky.money/polling/Qme1KAbo)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Onboard the USDS SPK farm to the [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) on mainnet with the following [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits):

- Deposit address: [0x173e314C7635B45322cd8Cb14f44b312e079F3af](https://etherscan.io/address/0x173e314c7635b45322cd8cb14f44b312e079f3af)
- Underlying asset: **USDS**
- Deposits
  - maxAmount: **250 million USDS**
  - slope: **50 million per day**
- Withdrawals
  - maxAmount: **unlimited**

#### Spark Liquidity Layer Mainnet - Upgrade ALM Controller to v1.7

- **Authorization**: [Governance Poll 1578](https://vote.sky.money/polling/QmdX2eGt)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Upgrade the current [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) ALM Controller on mainnet to version 1.7.

#### Spark USDS Morpho Vault Mainnet - Onboard December PT-USDS-SPK

- **Authorization**: [Governance Poll 1579](https://vote.sky.money/polling/QmeyqTyQ)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Onboard the [PT-USDS-SPK-18Dec2025](https://app.pendle.finance/trade/markets/0x40b7380796751d15005197fb488b0449bd691e46/swap?view=pt&chain=ethereum&tab=info) token to the Spark USDS Morpho vault on mainnet with the following parameters:

- Supply cap: **1 billion USDS**
- LLTV: **96.5%**
- Oracle details
  - **Upgradable oracle, Spark prime proxy as owner**
  - USDS price: **1 USD**
  - Pendle linear discount rate: **15%**

#### SparkLend Mainnet - Increase USDT Cap Automator Rate Limits

- **Authorization**: [Governance Poll 1580](https://vote.sky.money/polling/Qmc8PHPC)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Increase the USDT [Cap Automator rate limit](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3_SparkLend_Risk_Parameters_Cap_Automators/1c1f2ff0-8d73-81ec-bc16-e2f85c0765d7%7C7896ed3326389fe3553030cd0a82f68e) for SparkLend on Mainnet:

- Supply cap
  - gap: **1 billion USDT**
  - max: **5 billion USDT**
- Borrow cap
  - gap: **200 million USDT**
  - max: **5 billion USDT**

#### SparkLend Mainnet - Withdraw USDS and DAI Reserves from SparkLend

- **Authorization**: [Governance Poll 1581](https://vote.sky.money/polling/QmX3Lfa6)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Transfer all accumulated DAI and USDS reserves from the SparkLend Collector to the Spark Proxy on mainnet with the following details:

- Sender address: [0xb137E7d16564c81ae2b0C8ee6B55De81dd46ECe5](https://etherscan.io/address/0xb137E7d16564c81ae2b0C8ee6B55De81dd46ECe5) (SparkLend Collector)
- Recipient address: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Proxy)

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

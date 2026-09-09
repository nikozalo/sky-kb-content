---
title: Template - [Executive Vote] stUSDS Onboarding, SKY Token Rewards Rebalance, Core Simplification Buffer Budget Transfer, Accessibility Reward Budget Transfer, Spark Proxy Spell - September 4, 2025
summary: Onboard stUSDS and the stUSDS Bounded External Access Module Exception (stUSDS BEAM), update Sky Token Rewards stream, transfer USDS for Core Simplification Buffer Budget, transfer USDS for Accessibility Reward Budget, execute Spark Proxy Spell.
date: 2025-09-04T00:00:00.000Z
address: "0x1832dF0fF2bf73A182e09966166BEC6C4ed0b69b"
---

# [Executive Proposal] stUSDS Onboarding, SKY Token Rewards Rebalance, Core Simplification Buffer Budget Transfer, Accessibility Reward Budget Transfer, Spark Proxy Spell - September 4, 2025

The Governance Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- stUSDS will be onboarded with the actions below.
- The reward rate for the USDS-SKY farm will be updated with the actions described below.
- **8 million USDS** will be transferred to [0xD8507ef0A59f37d15B5D7b630FA6EEa40CE4AFdD](https://etherscan.io/address/0xd8507ef0a59f37d15b5d7b630fa6eea40ce4afdd) for the Core Simplification Buffer Budget.
- **3 million USDS** will be transferred to [0x05F471262d15EECA4059DadE070e5BEd509a4e73](https://etherscan.io/address/0x05F471262d15EECA4059DadE070e5BEd509a4e73) for the Accessibility Reward budget.
- A Spark proxy spell will be executed at [0xe7782847eF825FF37662Ef2F426f2D8c5D904121](https://etherscan.io/address/0xe7782847eF825FF37662Ef2F426f2D8c5D904121).

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/A.1.9.2.1.2_Pause_Delay_Current_Value/09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**. 

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### stUSDS Onboarding

- **Authorization**: [Governance Poll 1562](https://vote.sky.money/polling/QmQwTjgE)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-09-01/27122), [2](https://forum.sky.money/t/technical-scope-of-the-stusds-module-launch/27129)

If this executive proposal passes, then stUSDS will be onboarded to support SKY Staking, as described in [A.4.4.1 - SKY Staking](https://sky-atlas.powerhouse.io/A.4.4.1_SKY_Staking/3923f478-26b6-4036-b6d2-92b94505e6e1%7Cb341740e), by executing the following actions:

- Update LSEV2-SKY-A clipper by calling [`LockstakeInit.updateClipper`](https://github.com/sky-ecosystem/lockstake/blob/d4dbe6eab1644e398d3fa59fe84c0522fad46532/deploy/LockstakeInit.sol#L307-L364) with the following parameters:
  - `clipper_` being `LockstakeClipper` at [0x836F56750517b1528B5078Cba4Ac4B94fBE4A399](https://etherscan.io/address/0x836F56750517b1528B5078Cba4Ac4B94fBE4A399)
  - `cuttee` being `ERC1967Proxy for StUsds` at [0x99CD4Ec3f88A45940936F469E4bB72A2A701EEB9](https://etherscan.io/address/0x99CD4Ec3f88A45940936F469E4bB72A2A701EEB9)
- Initialize stUSDS module by calling [`StUsdsInit.init`](https://github.com/sky-ecosystem/stusds/blob/09b7eee515866d725955894ce1d00a5c09ce23b0/deploy/StUsdsInit.sol#L82-L143) with the following parameters:
  - `instance.stUsds` being `ERC1967Proxy for StUsds` at [0x99CD4Ec3f88A45940936F469E4bB72A2A701EEB9](https://etherscan.io/address/0x99CD4Ec3f88A45940936F469E4bB72A2A701EEB9)
  - `instance.stUsdsImp` being `StUsds implementation` at [0x7A61B7adCFD493f7CF0F86dFCECB94b72c227F22](https://etherscan.io/address/0x7A61B7adCFD493f7CF0F86dFCECB94b72c227F22)
  - `instance.rateSetter` being `StUsdsRateSetter` at [0x30784615252B13E1DbE2bDf598627eaC297Bf4C5](https://etherscan.io/address/0x30784615252B13E1DbE2bDf598627eaC297Bf4C5)
  - `instance.mom` being `StUsdsMom` at [0xf5DEe2CeDC5ADdd85597742445c0bf9b9cAfc699](https://etherscan.io/address/0xf5DEe2CeDC5ADdd85597742445c0bf9b9cAfc699)
  - `cfg.clip` being `LockstakeClipper` at [0x836F56750517b1528B5078Cba4Ac4B94fBE4A399](https://etherscan.io/address/0x836F56750517b1528B5078Cba4Ac4B94fBE4A399)
  - `cfg.str` being **0 basis points**
  - `cfg.cap` being **200 million USDS**
  - `cfg.line` being **200 million USDS**
  - `cfg.tau` being **57,600 seconds**
  - `cfg.maxLine` being **1 billion USDS**
  - `cfg.maxCap` being **1 billion USDS**
  - `cfg.minStrBps` being **200 basis points**
  - `cfg.maxStrBps` being **5,000 basis points**
  - `cfg.stepStrBps` being **4,000 basis points**
  - `cfg.minDutyBps` being **210 basis points**
  - `cfg.maxDutyBps` being **5,000 basis points**
  - `cfg.stepDutyBps` being **4,000 basis points**
  - `cfg.buds` being [0xBB865F94B8A92E57f79fCc89Dfd4dcf0D3fDEA16](https://etherscan.io/address/0xBB865F94B8A92E57f79fCc89Dfd4dcf0D3fDEA16)
- Increase global `vat.Line` by setting `vat.Line` to `sum(max(debt, line))` for all other ilks + `max(LSEV2-SKY-A debt, stUSDS BEAM maxLine)`

### SKY Token Rewards Rebalance 

- **Authorization**: [Stability Facilitator Approval](https://forum.sky.money/t/sky-token-rewards-usds-to-sky-rewards-normalization-configuration/26638/15)
- **Proposal**: [Forum Post](https://forum.sky.money/t/sky-token-rewards-usds-to-sky-rewards-normalization-configuration/26638/14)

If this executive proposal passes, then the distribution of SKY token rewards to USDS holders will be normalized to ensure the effective yield provided by these rewards equals the Sky Savings Rate (SSR), as per [A.4.3.2 - Token Reward Mechanism](https://sky-atlas.powerhouse.io/A.4.3.2_Token_Reward_Mechanism/2e3e7014-bd66-4e85-b915-b86ae3ceeb16%7Cb3417d54), by executing the following actions:

- `yank()` MCD_VEST_SKY_TREASURY vest with ID 5.
- Distribute the remaining tokens from the old DssVest by calling `VestedRewardsDistribution.distribute()` on REWARDS_DIST_USDS_SKY.
- Create a new MCD_VEST_SKY_TREASURY stream with the following parameters:
  - `res`: 1 (restricted)
  - Increase SKY allowance for MCD_VEST_SKY_TREASURY to the sum of all active streams and the new stream created by this executive vote.
  - `vestBgn`: `block.timestamp`
  - `vestTau`: `block.timestamp` + 15,724,800 seconds (182 days after the spell executes)
  - `tot`: **76,739,938 SKY**
- File the new stream ID on REWARDS_DIST_USDS_SKY

### Core Simplification Buffer Budget Transfer

- **Authorization**: [Governance Poll 1562](https://vote.sky.money/polling/QmQwTjgE)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-09-01/27122)

If this executive proposal passes, then **8 million USDS** will be transferred to [0xD8507ef0A59f37d15B5D7b630FA6EEa40CE4AFdD](https://etherscan.io/address/0xd8507ef0a59f37d15b5d7b630fa6eea40ce4afdd) for the [Core Simplification Buffer Budget](https://github.com/sky-ecosystem/next-gen-atlas/pull/54/files#diff-29fcb684de058590234788c2b217dbc0eb06b3e61aa7bb19a4d0148f38490f28R19747).

### Accessibility Reward Budget Transfer

- **Authorization**: [Governance Poll 1561](https://vote.sky.money/polling/QmXRwLEu)
- **Proposal**: [Forum Post](https://forum.sky.money/t/utilization-of-the-accessibility-reward-budget-a-2-4/27131)

If this executive proposal passes, then **3 million USDS** will be transferred to [0x05F471262d15EECA4059DadE070e5BEd509a4e73](https://etherscan.io/address/0x05F471262d15EECA4059DadE070e5BEd509a4e73) for the [Accessibility Reward](https://sky-atlas.powerhouse.io/A.2.3.8.1.1.1_Purpose/1b3f2ff0-8d73-8083-90b3-e9b92abb01b5%7C9e1ff936eafd750cb0dc) budget.

### Spark Proxy Spell

If this executive proposal passes, then the Prime Agent proxy spell for Spark will be executed at [0xe7782847eF825FF37662Ef2F426f2D8c5D904121](https://etherscan.io/address/0xe7782847eF825FF37662Ef2F426f2D8c5D904121), with the following contents. 

#### [Ethereum] Spark USDS Morpho Vault - Onboard November Ethena PTs

- **Authorization**: [Governance Poll 1569](https://vote.sky.money/polling/QmeLKi1N)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

The following November Ethena PTs will be onboarded to the Spark USDS Morpho vault on mainnet.

##### PT-USDe-Nov2025

- Supply cap: **500 million USDS**
- LLTV: **91.5%**
- Oracle:
  - PT value at redemption: **fixed 1 USD**
  - Linear discount rate: **15%**

##### PT-sUSDe-Nov2025

- Supply cap: **500 million USDS**
- LLTV: **91.5%**
- Oracle:
  - PT value at redemption: **fixed 1 USD**
  - Linear discount rate: **15%**

#### [Ethereum] Spark USDC Morpho Vault - Create Vault and Onboard Pools

- **Authorization**: [Governance Poll 1568](https://vote.sky.money/polling/QmXDwbcJ)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

A Spark USDC Morpho vault will be created on mainnet and pools onboarded with the following details:

- Vault name: **Spark Blue Chip USDC Vault**
- Vault ticker: **sparkUSDCbc**
- Admins:
  - Owner: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Proxy)
  - Guardian: n/a (defaults to owner)
  - Curator: n/a (defaults to owner)
  - Allocator: [0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB](https://etherscan.io/address/0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB) (Spark Liquidity Layer ALM Planner)
- Fee: **1%**
- Markets:
  - cbBTC 86%:
    - Supply cap: **500 million USDC**
  - wstETH 86%:
    - Supply cap: **500 million USDC**

#### [Ethereum] Spark Liquidity Layer - Onboard Spark USDC Morpho Vault

- **Authorization**: [Governance Poll 1566](https://vote.sky.money/polling/QmRLrw8X)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

The Spark USDC Morpho vault will be onboarded to the Spark Liquidity Layer on mainnet with the following deposit [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits):

- maxAmount: **50 million USDC**
- slope: **25 million USDC per day**

#### [Ethereum] Spark Liquidity Layer - Onboard Aave aUSDe

- **Authorization**: [Governance Poll 1565](https://vote.sky.money/polling/QmTS1Jw7)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

Aave aUSDe will be onboarded to the Spark Liquidity Layer on mainnet with the following [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits):

- Deposits:
  - maxAmount: **250 million USDe**
  - slope: **100 million USDe per day**
- Withdrawals:
  - maxAmount: **Unlimited**

#### [Ethereum] Spark Liquidity Layer - Increase Curve Swap Rate Limits

- **Authorization**: [Governance Poll 1563](https://vote.sky.money/polling/QmUKs4Lt)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

The Curve swap [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) will be increased in the Spark Liquidity Layer on mainnet with the following parameters:

- sUSDS/USDT
  - maxAmount: **5 million**
  - slope: **100 million per day**
  - maxSlippage: **0.25%**
- PYUSD/USDC
  - maxAmount: **5 million**
  - slope: **100 million per day**
  - maxSlippage: **0.1%**

#### [Ethereum] Spark Liquidity Layer - Increase SparkLend spUSDt and spPYUSD Rate Limits

- **Authorization**: [Governance Poll 1564](https://vote.sky.money/polling/QmNbTb5v)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

SparkLend spUSDT and spPYUSD deposit [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) will be increased in the Spark Liquidity Layer on mainnet with the following parameters:

- SparkLend spUSDT
  - maxAmount: Increase by 50 million USDT from 50 million USDT to **100 million USDT**
  - slope: Increase by 75 million USDT per day from 25 million USDT per day to **100 million USDT per day**
- SparkLend spPYUSD
  - maxAmount: Increase by 50 million PYUSD from 50 million PYUSD to **100 million PYUSD**
  - slope: Increase by 75 million PYUSD per day from 25 million PYUSD per day to **100 million PYUSD per day**

#### [Ethereum] Spark Treasury - Transfer BUIDL to Grove

- **Authorization**: [Governance Poll 1567](https://vote.sky.money/polling/QmbSeE7t)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

Residual BUIDL tokens will be transferred from Spark to Grove on mainnet with the following details:

- Recipient address: [0x491EDFB0B8b608044e227225C715981a30F3A44E](https://etherscan.io/address/0x491EDFB0B8b608044e227225C715981a30F3A44E) (Grove ALM Proxy)
- Transfer amount: **900,612.89 BUIDL-I** (all BUIDL-I held in [Spark ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E))

#### [Ethereum] Spark Treasury - Withdraw USDS and DAI Reserves from SparkLend

- **Authorization**: [Governance Poll 1570](https://vote.sky.money/polling/QmbHt4Vg)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

All accumulated DAI and USDS reserves will be transferred from the SparkLend Collector to the Spark Proxy on mainnet with the following details:

- Sender address: [0xb137E7d16564c81ae2b0C8ee6B55De81dd46ECe5](https://etherscan.io/address/0xb137E7d16564c81ae2b0C8ee6B55De81dd46ECe5) (SparkLend Collector)
- Recipient address: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Proxy)
- Transfer amount: All spDAI and spUSDS in the SparkLend Collector

#### [Ethereum] Spark Treasury - Transfer USDS to Spark Foundation

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.2.9.1.2.2.5.4.1_Initial_Cash_Grant_To_Spark_Foundation/21ff2ff0-8d73-8018-be75-c28cee3dddb7%7C9e1f80092582d59891b0d93ee881)
- **Proposal**: [Forum Post](https://forum.sky.money/t/september-4-2025-proposed-changes-to-spark-for-upcoming-spell/27102)

The following transfer of USDS from the Spark SubProxy to the Spark Foundation will be executed:

- Transfer **800,000 USDS** from the Spark SubProxy to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec).

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

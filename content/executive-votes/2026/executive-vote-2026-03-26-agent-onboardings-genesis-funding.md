---
title: Template - [Executive Vote] Ozone Onboarding, Amatsu Onboarding, Genesis Funding Transfers, February 2026 Monthly Settlement Cycle, Safe Harbor Update, Prime Agent Proxy Spells - March 26, 2026
summary: Onboard Ozone StarGuard, onboard Amatsu StarGuard, transfer Genesis Capital to Amatsu; Ozone; Keel; and Prysm, execute Monthly Settlement Cycle and Treasury Management Function for February 2026, update Safe Harbor Agreement, whitelist proxy spells for Spark and Grove.
date: 2026-03-26T00:00:00.000Z
address: "0x415396C98A5B42C0D97E4E80cB5C9079369Ea4D8"
---

# [Executive Proposal] Ozone Onboarding, Amatsu Onboarding, Genesis Funding Transfers, February 2026 Monthly Settlement Cycle, Safe Harbor Update, Prime Agent Proxy Spells - March 26, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Ozone will be onboarded with a StarGuard instance.
- Amatsu will be onboarded with a StarGuard instance.
- Genesis Funding will be transferred to Ozone, Amatsu, Keel, and Prysm.
- The Monthly Settlement Cycle and Treasury Management Function for February 2026 will be executed.
- The contract list in the Safe Harbor Agreement will be updated.
- Prime Agent proxy spells for Spark and Grove will be whitelisted in the respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Ozone StarGuard Onboarding

- **Authorization**: [Governance Poll 1623](https://vote.sky.money/polling/QmZRHXrp)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/technical-scope-of-the-new-ozone-executor-agent/27779)

If this executive proposal passes, then the Ozone Prime will be onboarded through the following actions:

Init new StarGuard module by calling [StarGuardInit.init](https://github.com/sky-ecosystem/star-guard/blob/52239d716a89188b303f137fc43fb9288735ba2e/deploy/StarGuardInit.sol#L44-L63) with:

- [`chainlog`](https://chainlog.sky.money/): `DssExecLib.LOG`
- `cfg.subProxy`: [0x9FE628BFc33f0352Bb1f93168881a9Ef93C8d2CF](https://etherscan.io/address/0x9FE628BFc33f0352Bb1f93168881a9Ef93C8d2CF)
- `cfg.subProxyKey`: `OZONE_SUBPROXY`
- `cfg.starGuard`: [0x9803DA8a51Fa02EEbEc3B1b969a9B80f9115cD80](https://etherscan.io/address/0x9803DA8a51Fa02EEbEc3B1b969a9B80f9115cD80)
- `cfg.starGuardKey`: `OZONE_STARGUARD`
- `cfg.maxDelay`: **7 days**

OZONE_STARGUARD will be added to the [StarGuardJob](https://etherscan.io/address/0xB18d211fA69422a9A848B790C5B4a3957F7Aa44E).

### Amatsu StarGuard Onboarding

- **Authorization**: [Governance Poll 1623](https://vote.sky.money/polling/QmZRHXrp)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/technical-scope-of-the-new-amatsu-executor-agent/27780)

If this executive proposal passes, then the Amatsu Prime will be onboarded through the following actions:

Init new StarGuard module by calling [StarGuardInit.init](https://github.com/sky-ecosystem/star-guard/blob/52239d716a89188b303f137fc43fb9288735ba2e/deploy/StarGuardInit.sol#L44-L63) with:

- [`chainlog`](https://chainlog.sky.money/): `DssExecLib.LOG`
- `cfg.subProxy`: [0xF33B14329e7115dD0B40DBb2985E1A0Df10E3fAa](https://etherscan.io/address/0xF33B14329e7115dD0B40DBb2985E1A0Df10E3fAa)
- `cfg.subProxyKey`: `AMATSU_SUBPROXY`
- `cfg.starGuard`: [0xF7469b6db1FDD3354969605e168585b8eeB5F08D](https://etherscan.io/address/0xF7469b6db1FDD3354969605e168585b8eeB5F08D)
- `cfg.starGuardKey`: `AMATSU_STARGUARD`
- `cfg.maxDelay`: **7 days**

AMATSU_STARGUARD will be added to the [StarGuardJob](https://etherscan.io/address/0xB18d211fA69422a9A848B790C5B4a3957F7Aa44E).

### Genesis Funding Transfers

- **Authorization**: [Governance Poll 1623](https://vote.sky.money/polling/QmZRHXrp)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-03-16/27767)

If this executive proposal passes, then Genesis Funding will be distributed to four agents as follows:

- Transfer **25 million USDS** to the [Amatsu SubProxy](https://etherscan.io/address/0xF33B14329e7115dD0B40DBb2985E1A0Df10E3fAa).
- Transfer **25 million USDS** to the [Ozone SubProxy](https://etherscan.io/address/0x9FE628BFc33f0352Bb1f93168881a9Ef93C8d2CF).
- Transfer **10 million USDS** to the [Keel SubProxy](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).
- Transfer **10 million USDS** to the [Launch Agent 6 SubProxy](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3).

### Monthly Settlement Cycle - February 2026

- **Authorization**: [Atlas A.2.4 - Sky Core Monthly Settlement Cycle](https://sky-atlas.io/#A.2.4)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/msc-6-settlement-summary-february-2026/27778)

If this executive proposal passes, then the February 2026 Monthly Settlement Cycle will be executed by taking the following steps.

#### Spark

- Mint **7,746,811 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Send **1,265,132 USDS** from the Surplus Buffer to the [SPARK_SUBPROXY](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **6,346,829 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.
- Send **5,630 USDS** from the Surplus Buffer to the [GROVE_SUBPROXY](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Obex

- Mint **1,948,422 USDS** debt in ALLOCATOR-OBEX-A and transfer the amount to the Surplus Buffer.
- Send **65,719 USDS** from the Surplus Buffer to the [OBEX_SUBPROXY](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **203,134 USDS** from the Surplus Buffer to the [SKYBASE_SUBPROXY](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Treasury Management Function

- Transfer **2,545,907 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).
- Transfer **127,295 USDS** from the Surplus Buffer to the [Aligned Delegates Buffer](https://etherscan.io/address/0x37FC5d447c8c54326C62b697f674c93eaD2A93A3).

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, the Safe Harbor agreement will be updated to include the new SubProxy and StarGuard contracts added by this spell.

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [0xe854CE4A58eC1BAf997ccA483de26B0935Ae0f45](https://etherscan.io/address/0xe854CE4A58eC1BAf997ccA483de26B0935Ae0f45) and codehash `0xc941bea37a2ac710acd87d9c097f9ff23f44d43121857dd8fde7833964c7c280` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [0x78e187473527938211187C85a414b19dD34ECD53](https://etherscan.io/address/0x78e187473527938211187C85a414b19dD34ECD53) and codehash `0xa0162bcb9891a8c322c525502626282d5fc545bfb5ef2251b06c75f674af681f` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark

##### [Ethereum] Spark Treasury - Spark Foundation and Spark Assets Foundation Grants for Q2 2026

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x2ca62cbabf82254f8df685e73a4a7751cf6cf26a8ce8ccfd706c9063f27061c7)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26-2026-proposed-changes-to-spark-for-upcoming-spell/27770)

The following Grant transfers will be made:

- Spark Foundation Grant
  - Recipient address: [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec)
  - Transfer amount: **1,100,000 USDS**
- Spark Assets Foundation Grant
  - Recipient address: [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911)
  - Transfer amount: **100,000 USDS**

##### [Ethereum] SparkLend - Reactivate WBTC

- **Authorization**: [Governance Poll 1625](https://vote.sky.money/polling/QmX7MC2S)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26-2026-proposed-changes-to-spark-for-upcoming-spell/27770)

WBTC will be reactivated on SparkLend Ethereum with the following [risk parameters](https://sky-atlas.io/#b370fb72-57f8-4cf1-aab9-597d08afe403):

- [Cap automator parameters](https://sky-atlas.io/#6ffdb8ee-b083-40f5-b51b-1c91e954b68b)
  - Deposits
    - `max`: **3,000 WBTC**
    - `gap`: **500 WBTC**
    - `ttl`: **12 hours**
  - Borrows
    - `max`: **1 WBTC**
    - `gap`: **1 WBTC**
    - `ttl`: **12 hours**
- [LTV](https://sky-atlas.io/#586478a3-51cb-4a2e-8bb1-b96e6520fdcc): **77%**
- [LT](https://sky-atlas.io/#2dd2045c-6a33-4229-b6c8-e531d6ecd27a): **78%**

##### [Ethereum] Spark Liquidity Layer - Add USAT transferAsset Rate Limit to Anchorage

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x71d2b7802b54a579655ca9c1aca12e6256d2ea3dd8951fdfa39cd7da4524c75e)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26-2026-proposed-changes-to-spark-for-upcoming-spell/27770)

Enabling transferAsset rate limits for both USDT and USAT from SLL into Anchorage will allow Spark to rebalance liquidity efficiently between the two stablecoins. This item adds USAT transferAsset Rate Limit to Anchorage as described below:

- transferAsset: **USAT**
- Address: [0x49506C3Aa028693458d6eE816b2EC28522946872](https://etherscan.io/address/0x49506C3Aa028693458d6eE816b2EC28522946872)
- maxAmount: **5 million USAT**
- slope: **250 million USAT per day**

##### [Ethereum] Spark Liquidity Layer - Add USDT transferAsset Rate Limit to Anchorage

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x71d2b7802b54a579655ca9c1aca12e6256d2ea3dd8951fdfa39cd7da4524c75e)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26-2026-proposed-changes-to-spark-for-upcoming-spell/27770)

Enabling transferAsset rate limits for both USDT and USAT from SLL into Anchorage will allow Spark to rebalance liquidity efficiently between the two stablecoins. This item adds USDT transferAsset Rate Limit to Anchorage as described below:

- transferAsset: **USDT**
- Address: [0x49506C3Aa028693458d6eE816b2EC28522946872](https://etherscan.io/address/0x49506C3Aa028693458d6eE816b2EC28522946872)
- maxAmount: **5 million USDT**
- slope: **250 million USDT per day**

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [Atlas A.6.1.1.1.2.6.1.2.1.2.3 - Token Claim Authorization](https://sky-atlas.io/#A.6.1.1.1.2.6.1.2.1.2.3)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26-2026-proposed-changes-to-spark-for-upcoming-spell/27770)

SparkLend reserves will be claimed as follows:

- Claim all reserves.
- Transfer USD stablecoin reserves to ALM Proxy.
- Transfer non-USD stablecoin reserves to Spark Operations Multisig [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to be liquidated.

##### [Ethereum] Spark Treasury - Transfer Excess USDS from SubDAO Proxy for SPK Buybacks

- **Authorization**: [Atlas A.6.1.1.1.3.4 - SubDAO Proxy Management](https://sky-atlas.io/#A.6.1.1.1.3.4)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26-2026-proposed-changes-to-spark-for-upcoming-spell/27770)

**414,215 USDS** will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) for SPK buybacks.

#### Grove

##### [Ethereum] Onboard Centrifuge ACRDX

- **Authorization**: [Governance Poll 1623](https://vote.sky.money/polling/QmZRHXrp)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26th-2026-proposed-changes-to-grove-for-upcoming-spell/27761)

The ACRDX (Anemoy Tokenized Apollo Diversified Credit Fund) will be onboarded to the Grove Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- ACRDX Vault: [0x74A739EA1Dc67c5a0179ebad665D1D3c4b80B712](https://etherscan.io/address/0x74A739EA1Dc67c5a0179ebad665D1D3c4b80B712)
  - Asset (ACRDX Token): [0x9477724Bb54AD5417de8Baff29e59DF3fB4DA74f](https://etherscan.io/address/0x9477724Bb54AD5417de8Baff29e59DF3fB4DA74f)
  - Underlying Asset: **USDC**
  - Deposits:
    - Max amount: **20 million USDC**
    - Slope: **20 million USDC per day**
  - Withdraws:
    - Amount: **Unlimited**

##### [Ethereum] Onboard Sentora PYUSD Morpho Vault V2

- **Authorization**: [Governance Poll 1623](https://vote.sky.money/polling/QmZRHXrp)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26th-2026-proposed-changes-to-grove-for-upcoming-spell/27761)

The Sentora PYUSD Morpho Vault V2 will be onboarded to the Grove Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- Sentora PYUSD Main V2: [0xb576765fB15505433aF24FEe2c0325895C559FB2](https://etherscan.io/address/0xb576765fB15505433aF24FEe2c0325895C559FB2)
  - Underlying Asset: **PYUSD**
  - Deposits:
    - Max amount: **50 million PYUSD**
    - Slope: **50 million PYUSD per day**
  - Withdraws:
    - Amount: **Unlimited**
  - Max Exchange Rate:
    - `setMaxExchangeRate(SENTORA_PYUSD_MAIN_V2, 1e18, 3e6)`

##### [Ethereum] Onboard Sentora RLUSD Morpho Vault V2

- **Authorization**: [Governance Poll 1623](https://vote.sky.money/polling/QmZRHXrp)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/march-26th-2026-proposed-changes-to-grove-for-upcoming-spell/27761)

The Sentora RLUSD Morpho Vault V2 will be onboarded to the Grove Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- Sentora RLUSD Main V2: [0x6dC58a0FdfC8D694e571DC59B9A52EEEa780E6bf](https://etherscan.io/address/0x6dC58a0FdfC8D694e571DC59B9A52EEEa780E6bf)
  - Underlying Asset: **RLUSD**
  - Deposits:
    - Max amount: **50 million RLUSD**
    - Slope: **50 million RLUSD per day**
  - Withdraws:
    - Amount: **Unlimited**
  - Max Exchange Rate:
    - `setMaxExchangeRate(SENTORA_RLUSD_MAIN_V2, 1e18, 3e18)`

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

---
title: Template - [Executive Vote] Deactivate Spark DAI Morpho Direct Deposit Module, Retire Legacy MKR Oracle, Chainlog Management, Spark Proxy Spell, Grove Proxy Spell - August 7, 2025
summary: Deactivate the legacy Spark DAI Morpho Direct Deposit Module (DDM), remove the legacy MKR oracle and other legacy oracles from the Chainlog, remove offboarded ilks from the Ilk Registry, execute Spark proxy spell, execute Grove proxy spell.
date: 2025-08-07T00:00:00.000Z
address: "0x26009aFf7fE39bF7611d66E0D38CAc43b3A93CD5"
---

# [Executive Proposal] Deactivate Spark DAI Morpho Direct Deposit Module, Retire Legacy MKR Oracle, Chainlog Management, Spark Proxy Spell, Grove Proxy Spell - August 7, 2025

The Governance Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The legacy Spark DAI Morpho Direct Deposit Module (DIRECT-SPARK-MORPHO-DAI) will be deactivated.
- As part of Phase 3 of the MKR-to-SKY upgrade, the offboarding of the LSE-MKR-A vault will be finalized.
- Legacy oracles will be removed from the [Chainlog](https://chainlog.sky.money).
- Offboarded ilks will be removed from the ilk registry.
- A Spark proxy spell at [0xb12057500EB57C3c43B91171D52b6DB141cCa01a](https://etherscan.io/address/0xb12057500EB57C3c43B91171D52b6DB141cCa01a) will be executed.
- A Grove proxy spell at [0xa25127f759B6F07020bf2206D31bEb6Ed04D1550](https://etherscan.io/address/0xa25127f759B6F07020bf2206D31bEb6Ed04D1550) will be executed.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/A.1.9.2.1.2_Pause_Delay_Current_Value/09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**. 

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Deactivate Legacy Spark DAI Morpho Direct Deposit Module

- **Authorization**: [Governance Poll 1545](https://vote.sky.money/polling/QmeLZrZo)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-spark-for-upcoming-spell/26896)

If this executive proposal passes, then the legacy [Spark DAI Morpho Direct Deposit Module (DIRECT-SPARK-MORPHO-DAI)](https://makerburn.com/#/collateral/DIRECT-SPARK-MORPHO-DAI) will be deactivated by taking the following actions:

- Remove DIRECT-SPARK-MORPHO-DAI from the [Debt Ceiling Instant Access Module (DC-IAM)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4_Debt_Ceiling_Instant_Access_Module_(DC_IAM)/071d42e3-8a21-4401-852e-0b52c49768bb%7C57eaf45219bea3b430c2).
- Set the [Debt Ceiling (`line`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.2_Debt_Ceiling_Limit/7ae407d0-ca28-42c8-b307-6448906d7445%7C57eaf45219bea3b430c2) to **0 USDS**.
- Reduce the Global Debt Ceiling to account for this change.

### Finalize LSE-MKR-A Offboarding

- **Authorization**: [Atlas A.4.1.2.1.4.2.2](https://sky-atlas.powerhouse.io/A.4.1.2.1.4.2.2_Offboard_Borrowing_Against_Staked_MKR/1f1f2ff0-8d73-8024-bf88-f0a17374ceea|b341f4c0b83472dc1f9e1a3b)
- **Proposal**: [Forum Post](https://forum.sky.money/t/phase-3-mkr-to-sky-migration-item-housekeeping-august-7th-spell/26919)

If this executive proposal passes, then the following actions will take place as part of the MKR-to-SKY Upgrade Phase 3. Additional listed actions in The Atlas, such as updating the MegaPoker, do not require an Executive Vote to complete:

- Remove [`PIP_MKR`](https://etherscan.io/address/0x4f94e33d0d74cff5ca0d3a66f1a650628551c56b) from the [Chainlog](https://chainlog.sky.money).
- Remove LSE-MKR-A from the ilk registry.

### Remove Legacy Oracle Contracts from the Chainlog

- **Authorization**: [Forum Post](https://forum.sky.money/t/phase-3-mkr-to-sky-migration-item-housekeeping-august-7th-spell/26919/3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/phase-3-mkr-to-sky-migration-item-housekeeping-august-7th-spell/26919)

If this executive proposal passes, then the following legacy oracle contracts will also be removed from the [Chainlog](https://chainlog.sky.money). This is categorized as a housekeeping item according to [A.1.10.1.6](https://sky-atlas.powerhouse.io/A.1.10.1.6.1.1_Definition_Of_Housekeeping_Items/1a7f2ff0-8d73-809a-abbb-ea8bd0b68360|0db303084211b3b5f873) of The Atlas.

- [`PIP_AAVE`](https://etherscan.io/address/0x8df8f06dc2de0434db40dcbb32a82a104218754c)
- [`PIP_ADAI`](https://etherscan.io/address/0x6a858592fc4cbdf432fc9a1bc8a0422b99330bdf)
- [`PIP_BAL`](https://etherscan.io/address/0x3ff860c0f28d69f392543a16a397d0dae85d16de)
- [`PIP_BAT`](https://etherscan.io/address/0xb4eb54af9cc7882df0121d26c5b97e802915abe6)
- [`PIP_COMP`](https://etherscan.io/address/0xbed0879953e633135a48a157718aa791ac0108e4)
- [`PIP_CRVV1ETHSTETH`](https://etherscan.io/address/0xea508f82728927454bd3ce853171b0e2705880d4)
- [`PIP_GNO`](https://etherscan.io/address/0xd800ca44ffabecd159c7889c3bf64a217361aec8)
- [`PIP_GUSD`](https://etherscan.io/address/0xf45ae69cca1b9b043dae2c83a5b65bc605bec5f5)
- [`PIP_KNC`](https://etherscan.io/address/0xf36b79bd4c0904a5f350f1e4f776b81208c13069)
- [`PIP_LINK`](https://etherscan.io/address/0x9b0c694c6939b5ea9584e9b61c7815e8d97d9cc7)
- [`PIP_LRC`](https://etherscan.io/address/0x9eb923339c24c40bef2f4af4961742aa7c23ef3a)
- [`PIP_MANA`](https://etherscan.io/address/0x8067259ea630601f319fcce477977e55c6078c13)
- [`PIP_MATIC`](https://etherscan.io/address/0x8874964279302e6d4e523fb1789981c39a1034ba)
- [`PIP_PAX`](https://etherscan.io/address/0x043b963e1b2214ec90046167ea29c2c8bdd7c0ec)
- [`PIP_PAXUSD`](https://etherscan.io/address/0x043b963e1b2214ec90046167ea29c2c8bdd7c0ec)
- [`PIP_RENBTC`](https://etherscan.io/address/0xf185d0682d50819263941e5f4eacc763cc5c6c42)
- [`PIP_RETH`](https://etherscan.io/address/0xee7f0b350aa119b3d05dc733a4621a81972f7d47)
- [`PIP_RWA003`](https://etherscan.io/address/0xdef7e88447f7d129420fc881b2a854abb52b73b8)
- [`PIP_RWA006`](https://etherscan.io/address/0xb8aecf04fdf22ef6c0c6b6536896e1f2870c41d3)
- [`PIP_RWA007`](https://etherscan.io/address/0x7bb4bca758c4006998a2769776d9e4e6d86e0dab)
- [`PIP_RWA008`](https://etherscan.io/address/0x2623de50d8a6fdc2f0d583327142210b8b464bfd)
- [`PIP_RWA010`](https://etherscan.io/address/0xfbaa6a09a39d485a5be9f5ebfe09c602e63b21ef)
- [`PIP_RWA011`](https://etherscan.io/address/0x8bdc64d73da9631c962c4932a391cb78065ce7a9)
- [`PIP_RWA012`](https://etherscan.io/address/0x4fa7c611bd25da38bc929c2a67290fbe49ddff56)
- [`PIP_RWA013`](https://etherscan.io/address/0x69cf63ed6ed57ad129bf67eb726ae1bd293edbb0)
- [`PIP_RWA014`](https://etherscan.io/address/0xfedab3d532af95b10f064c73bebef68a0d0a5f36)
- [`PIP_RWA015`](https://etherscan.io/address/0xda28e04514e718271b37c9f36fbaf45b4bf42df4)
- [`PIP_TUSD`](https://etherscan.io/address/0xee13831ca96d191b688a670d47173694ba98f1e5)
- [`PIP_UNI`](https://etherscan.io/address/0xf363c7e351c96b910b92b45d34190650df4ae8e7)
- [`PIP_UNIV2AAVEETH`](https://etherscan.io/address/0x32d8416e8538ac36272c44b0cd962cd7e0198489)
- [`PIP_UNIV2DAIETH`](https://etherscan.io/address/0xfc8137e1a45baf0030563ec4f0f851bd36a85b7d)
- [`PIP_UNIV2DAIUSDT`](https://etherscan.io/address/0x9a1cd705dc7ac64b50777bceca3529e58b1292f1)
- [`PIP_UNIV2ETHUSDT`](https://etherscan.io/address/0x5f6dd5b421b8d92c59dc6d907c9271b1dbfe3016)
- [`PIP_UNIV2LINKETH`](https://etherscan.io/address/0xd7d31e62ae5bfc3bfaa24eda33e8c32d31a1746f)
- [`PIP_UNIV2UNIETH`](https://etherscan.io/address/0x8462a88f50122782cc96108f476dedb12248f931)
- [`PIP_UNIV2USDCETH`](https://etherscan.io/address/0xf751f24dd9cfad885984d1ba68860f558d21e52a)
- [`PIP_UNIV2WBTCDAI`](https://etherscan.io/address/0x5bb72127a196392cf4ac00cf57ab278394d24e55)
- [`PIP_UNIV2WBTCETH`](https://etherscan.io/address/0x8400d2edb8b97f780356ef602b1bdbc082c2ad07)
- [`PIP_USDC`](https://etherscan.io/address/0x77b68899b99b686f415d074278a9a16b336085a0)
- [`PIP_USDT`](https://etherscan.io/address/0x7a5918670b0c390ad25f7bee908c1acc2d314a3c)
- [`PIP_YFI`](https://etherscan.io/address/0x5f122465bcf86f45922036970be6dd7f58820214)
- [`PIP_ZRX`](https://etherscan.io/address/0x7382c066801e7acb2299ac8562847b9883f5cd3c)

### Remove Offboarded ilks from the Ilk Registry

- **Authorization**: [Forum Post](https://forum.sky.money/t/phase-3-mkr-to-sky-migration-item-housekeeping-august-7th-spell/26919/3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/phase-3-mkr-to-sky-migration-item-housekeeping-august-7th-spell/26919)

If this executive proposal passes, then the following offboarded vaults will be removed from the [Ilk Registry](https://etherscan.io/address/0x5a464C28D19848f44199D003BeF5ecc87d090F87) to finalize their offboarding. This is categorized as a housekeeping item according to [A.1.10.1.6](https://sky-atlas.powerhouse.io/A.1.10.1.6.1.1_Definition_Of_Housekeeping_Items/1a7f2ff0-8d73-809a-abbb-ea8bd0b68360|0db303084211b3b5f873) of The Atlas.

- AAVE-A
- BAL-A
- BAT-A
- COMP-A
- CRVV1ETHSTETH-A
- GNO-A
- GUSD-A
- KNC-A
- LINK-A
- LRC-A
- MANA-A
- MATIC-A
- PAXUSD-A
- RENBTC-A
- RETH-A
- RWA003-A
- RWA006-A
- RWA007-A
- RWA008-A
- RWA010-A
- RWA011-A
- RWA012-A
- RWA013-A
- RWA014-A
- RWA015-A
- TUSD-A
- UNI-A
- UNIV2AAVEETH-A
- UNIV2DAIETH-A
- UNIV2DAIUSDT-A
- UNIV2ETHUSDT-A
- UNIV2LINKETH-A
- UNIV2UNIETH-A
- UNIV2USDCETH-A
- UNIV2WBTCDAI-A
- UNIV2WBTCETH-A
- USDC-A
- USDC-B
- USDT-A
- YFI-A
- ZRX-A

### Spark and Grove Proxy Spells

If this executive proposal passes, the Star proxy spells for Spark and Grove will be executed at [0xb12057500EB57C3c43B91171D52b6DB141cCa01a](https://etherscan.io/address/0xb12057500EB57C3c43B91171D52b6DB141cCa01a) and [0xa25127f759B6F07020bf2206D31bEb6Ed04D1550](https://etherscan.io/address/0xa25127f759B6F07020bf2206D31bEb6Ed04D1550) respectively with the following contents.

#### Spark Proxy Spell

##### [Mainnet] Onboard pyUSD to SparkLend

- **Authorization**: [Governance Poll 1547](https://vote.sky.money/polling/QmXLExe7)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-spark-for-upcoming-spell/26896)

pyUSD will be onboarded to SparkLend on mainnet with the following parameters:

- [Optimal Utilization](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.11_Optimal_Utilization_Definition/1c1f2ff0-8d73-8173-a52b-d6f86efd3366|7896ed3326389fe3553030cd0a82f68efd49): **95%**.
- [Base](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.3_Interest_Rate_Model_Definition/1c1f2ff0-8d73-81dd-99c0-fc707ce48e01|7896ed3326389fe3553030cd0a82f68efd49): **0%**.
- [Slope1](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.15_Slope_1_Definition/1c1f2ff0-8d73-81be-9f17-d7d4bfc6cb59|7896ed3326389fe3553030cd0a82f68efd49): **SSR + 1.5%**.
- [Slope2](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.17_Slope_2_Definition/1c1f2ff0-8d73-8199-aa99-dde95c3f7130|7896ed3326389fe3553030cd0a82f68efd49): **15%**.
- Stable rate func (deprecated): n/a.
- [Enable Borrow](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.19_Borrowing_Enabled_Definition/1c1f2ff0-8d73-810c-a172-cd5a7da71125|7896ed3326389fe3553030cd0a82f68efd49): **YES**.
- Stable Rate Borrowing: **NO**.
- Isolation Borrowable: **NO**.
- Siloed Borrowing: **NO**.
- [Flash Loan Enabled](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.23_Flash_Loan_Enabled_Definition/1c1f2ff0-8d73-8101-b64f-d89e4238207a|7896ed3326389fe3553030cd0a82f68efd49): **YES**.
- [Loan to Value](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.4_LTV_Definition/1c1f2ff0-8d73-81bb-8385-c4bc0c1ebd30|7896ed3326389fe3553030cd0a82f68efd49): **0%**.
- [Liquidation Threshold](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.5_Liquidation_Threshold_Definition/1c1f2ff0-8d73-81ea-bd7e-feb73a44923a|7896ed3326389fe3553030cd0a82f68efd49): **0%**.
- [Liquidation Bonus](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.7_Liquidation_Bonus_Definition/1c1f2ff0-8d73-81cc-a9e4-d29ba266e7b0|7896ed3326389fe3553030cd0a82f68efd49): **10%**.
- [Reserve Factor](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.8_Reserve_Factor_Definition/1c1f2ff0-8d73-81a0-9436-c819cdd7bbbe|7896ed3326389fe3553030cd0a82f68efd49): **10%**.
- [Supply Cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.9_Supply_Cap_Definition/1c1f2ff0-8d73-81b3-8206-e7b26cebfd73|7896ed3326389fe3553030cd0a82f68efd49): **50 million pyUSD**.
- [Supply Cap (`max`)](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.3_SparkLend_Risk_Parameters_Cap_Automator_Absolute_Maximum_Exposure_Definition/1c1f2ff0-8d73-8118-8297-de5ca8d630bd|7896ed3326389fe3553030cd0a82f68e65d71fb5): **500 million pyUSD**.
- [Supply Cap (`gap`)](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.1_SparkLend_Risk_Parameters_Cap_Automator_Target_Available_Exposure_Definition/1c1f2ff0-8d73-8175-b303-e9cb44557afd|7896ed3326389fe3553030cd0a82f68e65d71fb5): **50 million pyUSD**.
- [Supply Cap (`ttl`)](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.2_SparkLend_Risk_Parameters_Cap_Automator_Cooldown_Period_Definition/1c1f2ff0-8d73-81f7-ba0b-d2da5f735f99|7896ed3326389fe3553030cd0a82f68e65d71fb5): **12 hours**.
- [Borrow Cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.10_Borrow_Cap_Definition/1c1f2ff0-8d73-81ed-b136-d5f9871bc2c2|7896ed3326389fe3553030cd0a82f68efd49): **25 million pyUSD**.
- [Borrow Cap (`max`)](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.3_SparkLend_Risk_Parameters_Cap_Automator_Absolute_Maximum_Exposure_Definition/1c1f2ff0-8d73-8118-8297-de5ca8d630bd|7896ed3326389fe3553030cd0a82f68e65d71fb5): **475 million pyUSD**.
- [Borrow Cap (`gap`)](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.1_SparkLend_Risk_Parameters_Cap_Automator_Target_Available_Exposure_Definition/1c1f2ff0-8d73-8175-b303-e9cb44557afd|7896ed3326389fe3553030cd0a82f68e65d71fb5): **25 million pyUSD**.
- [Borrow Cap (`ttl`)](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.2_SparkLend_Risk_Parameters_Cap_Automator_Cooldown_Period_Definition/1c1f2ff0-8d73-81f7-ba0b-d2da5f735f99|7896ed3326389fe3553030cd0a82f68e65d71fb5): **12 hours**.
- Isolation Mode: **NO**.
- Isolation Mode Debt Ceiling: n/a.
- Liquidation Protocol Fee: **10%**.
- [Emode Category](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.6_High_Efficiency_Mode_Category_Definition/1c1f2ff0-8d73-815c-8a8f-f3a095137e06|7896ed3326389fe3553030cd0a82f68efd49): **2** (stablecoin correlated emode).

##### [Mainnet] Onboard SparkLend pyUSD to the Spark Liquidity Layer

- **Authorization**: [Governance Poll 1544](https://vote.sky.money/polling/QmVGr47c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-spark-for-upcoming-spell/26896)

SparkLend pyUSD will be onboarded to the Spark Liquidity Layer on mainnet with the following [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits):

- Deposit:
  - Max amount: **50 million pyUSD**
  - Slope: **25 million pyUSD per day**
- Withdrawal:
  - Max amount: **Unlimited**

##### [Mainnet] Onboard Curve pyUSD/USDC Pool to the Spark Liquidity Layer for Swaps

- **Authorization**: [Governance Poll 1543](https://vote.sky.money/polling/QmUevv3W)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-spark-for-upcoming-spell/26896)

The Curve pyUSD/USDC pool will be onboarded to the Spark Liquidity Layer on mainnet with the [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits):

- Swap:
  - Max amount: **5 million**
  - Slope: **25 million per day**
  - Max slippage: **0.05%**
- Deposit:
  - Max amount: **0**
- Withdrawal:
  - Max amount: **0**

##### [Mainnet] Update Stablecoin IRMs to Account for Base Rate Spread

- **Authorization**: [Governance Poll 1548](https://vote.sky.money/polling/QmU6L1gS)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-spark-for-upcoming-spell/26896)

The stablecoin interest rate models (IRMs) for SparkLend on mainnet will be updated to account for the base rate spread with the following parameters:

- USDS:
  - [Base Rate](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.3_Interest_Rate_Model_Definition/1c1f2ff0-8d73-81dd-99c0-fc707ce48e01|7896ed3326389fe3553030cd0a82f68efd49): **0%**
  - [Slope1](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.15_Slope_1_Definition/1c1f2ff0-8d73-81be-9f17-d7d4bfc6cb59|7896ed3326389fe3553030cd0a82f68efd49): **SSR + 1%**
  - [Slope2](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.17_Slope_2_Definition/1c1f2ff0-8d73-8199-aa99-dde95c3f7130|7896ed3326389fe3553030cd0a82f68efd49): **15%**
  - [Optimal Utilization](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.11_Optimal_Utilization_Definition/1c1f2ff0-8d73-8173-a52b-d6f86efd3366|7896ed3326389fe3553030cd0a82f68efd49): **80%**
- DAI:
  - [Base Rate](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.3_Interest_Rate_Model_Definition/1c1f2ff0-8d73-81dd-99c0-fc707ce48e01|7896ed3326389fe3553030cd0a82f68efd49): **0%**
  - [Slope1](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.15_Slope_1_Definition/1c1f2ff0-8d73-81be-9f17-d7d4bfc6cb59|7896ed3326389fe3553030cd0a82f68efd49): **SSR + 1%**
  - [Slope2](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.17_Slope_2_Definition/1c1f2ff0-8d73-8199-aa99-dde95c3f7130|7896ed3326389fe3553030cd0a82f68efd49): **15%**
  - [Optimal Utilization](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.11_Optimal_Utilization_Definition/1c1f2ff0-8d73-8173-a52b-d6f86efd3366|7896ed3326389fe3553030cd0a82f68efd49): **80%**
- USDC:
  - [Base Rate](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.3_Interest_Rate_Model_Definition/1c1f2ff0-8d73-81dd-99c0-fc707ce48e01|7896ed3326389fe3553030cd0a82f68efd49): **0%**
  - [Slope1](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.15_Slope_1_Definition/1c1f2ff0-8d73-81be-9f17-d7d4bfc6cb59|7896ed3326389fe3553030cd0a82f68efd49): **SSR + 1.5%**
  - [Slope2](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.17_Slope_2_Definition/1c1f2ff0-8d73-8199-aa99-dde95c3f7130|7896ed3326389fe3553030cd0a82f68efd49): **15%**
  - [Optimal Utilization](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.11_Optimal_Utilization_Definition/1c1f2ff0-8d73-8173-a52b-d6f86efd3366|7896ed3326389fe3553030cd0a82f68efd49): **95%**
- USDT:
  - [Base Rate](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.3_Interest_Rate_Model_Definition/1c1f2ff0-8d73-81dd-99c0-fc707ce48e01|7896ed3326389fe3553030cd0a82f68efd49): **0%**
  - [Slope1](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.15_Slope_1_Definition/1c1f2ff0-8d73-81be-9f17-d7d4bfc6cb59|7896ed3326389fe3553030cd0a82f68efd49): **SSR + 1.5%**
  - [Slope2](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.17_Slope_2_Definition/1c1f2ff0-8d73-8199-aa99-dde95c3f7130|7896ed3326389fe3553030cd0a82f68efd49): **15%**
  - [Optimal Utilization](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.11_Optimal_Utilization_Definition/1c1f2ff0-8d73-8173-a52b-d6f86efd3366|7896ed3326389fe3553030cd0a82f68efd49): **95%**

##### [Mainnet] Enable Flash Loans for USDS on SparkLend

- **Authorization**: [Governance Poll 1546](https://vote.sky.money/polling/QmZu3tVL)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-spark-for-upcoming-spell/26896)

Flash loans for USDS will be **enabled** on SparkLend on mainnet.

#### Grove Proxy Spell

##### [Mainnet and Avalanche] Deploy Grove Liquidity Layer on Avalanche

- **Authorization**: [Governance Poll 1540](https://vote.sky.money/polling/QmX2CAp2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-grove-for-upcoming-spell/26883)

The Grove Liquidity Layer will be deployed to Avalanche with the following contract addresses and parameters:

###### Contract Addresses

- Grove Governance: [0x4b803781828b76EaBF21AaF02e5ce23596b4d60c](https://snowtrace.io/address/0x4b803781828b76EaBF21AaF02e5ce23596b4d60c)
- CCTP MESSENGER: [0x6B25532e1060CE10cc3B0A99e5683b91BFDe6982](https://snowtrace.io/address/0x6B25532e1060CE10cc3B0A99e5683b91BFDe6982)
- ALM Controller: [0xEc4Cb675AF8C8665903025C2812d1234A1708bb6](https://snowtrace.io/address/0xEc4Cb675AF8C8665903025C2812d1234A1708bb6)
- ALM Proxy: [0x7107DD8F56642327945294a18A4280C78e153644](https://snowtrace.io/address/0x7107DD8F56642327945294a18A4280C78e153644)
- ALM Rate Limits: [0x6ba2e6bCCe3d2A31F1e3e1d3e11CDffBaA002A21](https://snowtrace.io/address/0x6ba2e6bCCe3d2A31F1e3e1d3e11CDffBaA002A21)
- Relayer: [0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f](https://snowtrace.io/address/0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f)
- Freezer: [0xB0113804960345fd0a245788b3423319c86940e5](https://snowtrace.io/address/0xB0113804960345fd0a245788b3423319c86940e5)

###### Initial [Rate Limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits)

- CCTP Global: **Unlimited**
- CCTP from Avalanche to Ethereum:
  - max: **50 million USDC**
  - slope: **50 million USDC per day**
- CCTP from Ethereum to Avalanche:
  - max: **50 million USDC**
  - slope: **50 million USDC per day** (Rate Limit on Ethereum)

##### [Mainnet] Onboard Ethena USDe and sUSDe to the GLL

- **Authorization**: [Governance Poll 1542](https://vote.sky.money/polling/QmNsimEt)
- **Proposal**: [Forum Post](https://forum.sky.money/t/august-7-2025-proposed-changes-to-grove-for-upcoming-spell/26883)

USDe and sUSDe will be onboarded to the Grove Liquidity Layer on mainnet with the following parameters:

- Minting USDe - `LIMIT_USDE_MINT`
  - Max amount: **250 million USDC**
  - Slope: **100 million USDC per day**
- Burning USDe - `LIMIT_USDE_BURN` 
  - Max amount: **500 million USDe**
  - Slope: **200 million USDe per day**
- Depositing to sUSDe Address: [0x9D39A5DE30e57443BfF2A8307A4256c8797A3497](https://etherscan.io/address/0x9D39A5DE30e57443BfF2A8307A4256c8797A3497)
  - Max amount: **250 million USDe**
  - Slope: **100 million USDe per day**
- Initiating withdrawal cooldown from sUSDe
  - Max amount: **unlimited**
- Withdrawing from sUSDe after cooldown - `LIMIT_SUSDE_COOLDOWN`
  - Max amount: **unlimited**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

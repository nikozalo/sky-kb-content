---
title: Template - [Executive Vote] Housekeeping Items, Spark Proxy Spell - June 12, 2025
summary: Housekeeping actions concerning three BlockTower RWA vaults, Spark proxy spell execution.
date: 2025-06-12T00:00:00.000Z
address: "0xbF5EF05A578F270C0E54c7f6eF7cCFB5c9cD56b0"
---

# [Executive Proposal] Housekeeping Items, Spark Proxy Spell - June 12, 2025

The Governance Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY Holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Housekeeping actions concerning three BlockTower RWA vaults will be carried out as described below.
- A Spark Proxy Spell will be executed at [0xF485e3351a4C3D7d1F89B1842Af625Fd0dFB90C8](https://etherscan.io/address/0xF485e3351a4C3D7d1F89B1842Af625Fd0dFB90C8).

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/#A.1.8.2.1_Pause_Delay-a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/#A.1.8.2.1.2_Pause_Delay_Current_Value-09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Housekeeping Actions

- **Authorization**: [Spell Team Approval](https://forum.sky.money/t/proposed-housekeeping-item-2025-06-12-executive/26599/6), [Ecosystem Approval](https://forum.sky.money/t/proposed-housekeeping-item-2025-06-12-executive/26599/7)
- **Proposal**: [Forum Post](https://forum.sky.money/t/proposed-housekeeping-item-2025-06-12-executive/26599)

If this executive proposal passes, the following [housekeeping](https://sky-atlas.powerhouse.io/A.1.10.1.6.1.1_Definition_Of_Housekeeping_Items/1a7f2ff0-8d73-809a-abbb-ea8bd0b68360|0db303084211b3b5f873) actions will be taken for the three BlockTower RWA vaults listed below:

#### BlockTower Andromeda (RWA015-A)

- Remove [RWA015-A](https://makerburn.com/#/collateral/RWA015-A) from the [Debt Ceiling Instant Access Module (DC-IAM)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4_Debt_Ceiling_Instant_Access_Module_(DC_IAM)/071d42e3-8a21-4401-852e-0b52c49768bb%7C57eaf45219bea3b430c2).
- Set RWA015-A [Debt Ceiling (line)](https://sky-atlas.powerhouse.io/A.4.4.1.2.4_Debt_Ceiling/1e7f2ff0-8d73-803f-89b8-d6049eb54922%7Cb341740ee6e1974b) to **0 DAI**.
- Reduce Global Debt Ceiling to account for this change.

#### BlockTower S3 (RWA012-A)

- Set [RWA012-A](https://makerburn.com/#/collateral/RWA012-A) [Debt Ceiling (line)](https://sky-atlas.powerhouse.io/A.4.4.1.2.4_Debt_Ceiling/1e7f2ff0-8d73-803f-89b8-d6049eb54922%7Cb341740ee6e1974b) to **0 DAI**.
- Reduce Global Debt Ceiling to account for this change.

#### BlockTower S4 (RWA013-A)

- Set [RWA013-A](https://makerburn.com/#/collateral/RWA013-A) [Debt Ceiling (line)](https://sky-atlas.powerhouse.io/A.4.4.1.2.4_Debt_Ceiling/1e7f2ff0-8d73-803f-89b8-d6049eb54922%7Cb341740ee6e1974b) to **0 DAI**.
- Reduce Global Debt Ceiling to account for this change.

### Execute Spark Proxy Spell

- **Authorization**: [Ecosystem Approval](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559/3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

If this executive proposal passes, then a Spark Proxy Spell will be executed at [0xF485e3351a4C3D7d1F89B1842Af625Fd0dFB90C8](https://etherscan.io/address/0xF485e3351a4C3D7d1F89B1842Af625Fd0dFB90C8) with the following contents.

#### [Mainnet] Spark Liquidity Layer – Onboard Spark DAI Morpho Vault

- **Authorization**: [Governance Poll 1512](https://vote.sky.money/polling/QmTX3KM9)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Onboard the Spark DAI Morpho Vault to the Spark Liquidity Layer on mainnet with the following deposit [rate limit](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) parameters:

- MaxAmount: **200 million DAI**
- Slope: **100 million DAI per day**

#### [Mainnet] Spark DAI Morpho Vault – Add SLL to Vault Allocator Role

- **Authorization**: [Governance Poll 1507](https://vote.sky.money/polling/QmQRCn2K)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Add the Spark Liquidity Layer to the [Allocator Role](https://docs.morpho.org/curation/concepts/roles#allocator) of the Spark DAI Morpho Vault.

#### [Mainnet] Spark DAI Morpho Vault – Onboard New Ethena PTs

- **Authorization**: [Governance Poll 1509](https://vote.sky.money/polling/QmbY2bxz)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Onboard new Ethena PTs with the following parameters:

##### [PT-eUSDe-Aug](https://app.pendle.finance/trade/markets/0xe93b4a93e80bd3065b290394264af5d82422ee70/swap?view=pt&chain=ethereum&tab=info)

- Pool supply cap: **500 million DAI**
- Pool LLTV: **91.5%**
- PT Oracle Discount Rate: **15%**

##### [PT-sUSDe-Sept](https://app.pendle.finance/trade/markets/0xa36b60a14a1a5247912584768c6e53e1a269a9f7/swap?view=pt&chain=ethereum&tab=info)

- Pool supply cap: **500 million DAI**
- Pool LLTV: **91.5%**
- PT Oracle Discount Rate: **15%**

#### [Mainnet] Spark DAI Morpho Vault – Reduce Supply Cap for Inactive Pools

- **Authorization**: [Governance Poll 1510](https://vote.sky.money/polling/Qme3Des6)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Apply the following changes to the inactive Spark DAI Morpho Vault pools that have matured:

- PT-eUSDe-May - Reduce supply cap to **0 DAI**.
- PT-sUSDe-May - Reduce supply cap to **0 DAI**.

#### [Mainnet] Spark Liquidity Layer – Update syrupUSDC Rate Limit

- **Authorization**: [Governance Poll 1511](https://vote.sky.money/polling/QmUa7Au1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Apply the following changes to the syrupUSDC [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) on mainnet:

- slope: Increase by 15 million from 5 million to **20 million**.
- maxAmount: Increase by 75 million from 25 million to **100 million**.

#### [Mainnet] SparkLend – Update Stablecoin Market Reserve Factors

- **Authorization**: [Governance Poll 1516](https://vote.sky.money/polling/QmSZJpsT)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Apply the following changes to the Stablecoin Market Reserve Factors on mainnet:

- Increase DAI [Reserve Factor](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.8_Reserve_Factor_Definition/1c1f2ff0-8d73-81a0-9436-c819cdd7bbbe%7C7896ed3326389fe3553030cd0a82f68efd49) by 10 percentage points from 0% to **10%**.
- Increase USDS [Reserve Factor](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.8_Reserve_Factor_Definition/1c1f2ff0-8d73-81a0-9436-c819cdd7bbbe%7C7896ed3326389fe3553030cd0a82f68efd49) by 10 percentage points from 0% to **10%**.
- Increase USDC [Reserve Factor](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.8_Reserve_Factor_Definition/1c1f2ff0-8d73-81a0-9436-c819cdd7bbbe%7C7896ed3326389fe3553030cd0a82f68efd49) by 5 percentage points from 5% to **10%**.
- Increase USDT [Reserve Factor](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.8_Reserve_Factor_Definition/1c1f2ff0-8d73-81a0-9436-c819cdd7bbbe%7C7896ed3326389fe3553030cd0a82f68efd49) by 5 percentage points from 5% to **10%**.

#### [Mainnet] Morpho DAI Vault – Update Vault Fee

- **Authorization**: [Governance Poll 1513](https://vote.sky.money/polling/QmRsqaaC)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Increase the Spark DAI Morpho Vault [Performance Fee](https://docs.morpho.org/curation/concepts/fee/) by 10 percentage points from 0% to **10%**.

#### [Base] Morpho USDC Vault – Update Vault Fee

- **Authorization**: [Governance Poll 1514](https://vote.sky.money/polling/QmdyVQok)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Increase the Spark USDC Morpho Vault [Performance Fee](https://docs.morpho.org/curation/concepts/fee/) by 10 percentage points from 0% to **10%**.

#### [Mainnet] SparkLend – Update ezETH Parameters

- **Authorization**: [Governance Poll 1515](https://vote.sky.money/polling/QmS3i2S3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-12-2025-proposed-changes-to-spark-for-upcoming-spell/26559)

Apply the following changes to the ezETH parameters on mainnet:

- Increase [supply cap gap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.1_SparkLend_Risk_Parameters_Cap_Automator_Target_Available_Exposure_Definition/1c1f2ff0-8d73-8175-b303-e9cb44557afd%7C7896ed3326389fe3553030cd0a82f68e65d71fb5) by 3,000 ezETH from 2,000 ezETH to **5,000 ezETH**.
- Increase [supply cap max](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3.1.3_SparkLend_Risk_Parameters_Cap_Automator_Absolute_Maximum_Exposure_Definition/1c1f2ff0-8d73-8118-8297-de5ca8d630bd%7C7896ed3326389fe3553030cd0a82f68e65d71fb5) by 20,000 ezETH from 20,000 ezETH to **40,000 ezETH**.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

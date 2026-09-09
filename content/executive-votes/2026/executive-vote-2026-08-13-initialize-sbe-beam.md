---
title: Template - [Executive Vote] Initialize SBE BEAM, Monthly Settlement Cycle for July 2026, LSSKY-SKY Rewards Normalization, Increase Buybacks and Reactivate LSSKY-USDS Farm, Adjust Grove and Osero DC-IAM Parameters, Rename Osero Chainlog Keys, Update Safe Harbor Agreement, Prime Agent Proxy Spells - August 13, 2026
summary: Initialize SBE BEAM, execute the Monthly Settlement Cycle for July 2026 and the associated reconciliation transfers, normalize LSSKY-SKY staking rewards, increase buybacks and reactivate the LSSKY-USDS farm, adjust the Grove and Osero DC-IAM parameters, rename the Osero Chainlog keys, update the Safe Harbor Agreement, and whitelist Prime Agent spells for Spark and Grove.
date: 2026-08-13T00:00:00.000Z
address: "0xB26b9d89776aa9E74ddA0e86e916413def03F59b"
---

# [Executive Proposal] Initialize SBE BEAM, Monthly Settlement Cycle for July 2026, LSSKY-SKY Rewards Normalization, Increase Buybacks and Reactivate LSSKY-USDS Farm, Adjust Grove and Osero DC-IAM Parameters, Rename Osero Chainlog Keys, Update Safe Harbor Agreement, Prime Agent Proxy Spells - August 13, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Smart Burn Engine Bounded External Access Module (SBE BEAM) will be initialized.
- The Monthly Settlement Cycle for July 2026 will be executed.
- LSSKY->SKY staking rewards will be normalized.
- Buybacks will be increased and the LSSKY->USDS farm will be reactivated.
- DC-IAM parameters for Grove and Osero will be updated.
- Osero Chainlog keys will be renamed.
- The Safe Harbor Agreement will be updated.
- Proxy spells for Spark and Grove will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Initialize SBE BEAM

- **Authorization**: [Governance Poll](https://vote.sky.money/polling/QmcVdr3p)
- **Proposal**: [Smart Burn Engine Bounded External Access Module (SBE BEAM) Launch](https://forum.skyeco.com/t/smart-burn-engine-bounded-external-access-module-sbe-beam-launch/28149)

If this executive proposal passes, then SBE BEAM will be initialized through the following actions:

- Call [`FlapperInit.initFarmOwner()`](https://github.com/sky-ecosystem/dss-flappers/blob/655d2dd2c7000235633fec87b763ee0143e85bab/deploy/FlapperInit.sol#L284-L300) with:
  - `farmOwner`: [`0xA3d3A2e9Fe5d0901D720D5382E4a7eA12D4E2b0e`](https://etherscan.io/address/0xA3d3A2e9Fe5d0901D720D5382E4a7eA12D4E2b0e)
  - `chainlogKey`: `OWNER_REWARDS_LSSKY_USDS`
- Call [`FlapperInit.initSBEBeam()`](https://github.com/sky-ecosystem/dss-flappers/blob/655d2dd2c7000235633fec87b763ee0143e85bab/deploy/FlapperInit.sol#L302-L331) with:
  - `beam`: [`0xc8b61d211D3D03A630Fb09199E17953a8c9749a9`](https://etherscan.io/address/0xc8b61d211D3D03A630Fb09199E17953a8c9749a9)
  - `farmOwner`: [`0xA3d3A2e9Fe5d0901D720D5382E4a7eA12D4E2b0e`](https://etherscan.io/address/0xA3d3A2e9Fe5d0901D720D5382E4a7eA12D4E2b0e)
  - [`maxKbump`](https://sky-atlas.io/#53370eb5-8fc7-4600-8f52-46615e03801e): **12,000 USDS**
  - [`minHop`](https://sky-atlas.io/#b1cbaeb4-4e7f-45f4-a033-e338c6855499): **550 seconds**
  - [`maxRate`](https://sky-atlas.io/#f700ba6e-7aa4-4d47-addf-981c32f3c49d): **350 million USDS per year**
  - [`tau`](https://sky-atlas.io/#6c389eb2-8f50-4b6b-ad77-deb27c9f9fb0): **30 minutes** (1,800 seconds)
  - `buds`: [`0x869294B42B80f99CF3Bdac0F44abddAd6cD41330`](https://etherscan.io/address/0x869294B42B80f99CF3Bdac0F44abddAd6cD41330) (The SBE BEAM Operator Multisig)
  - `chainlogKey`: `MCD_SBEBEAM`

### Monthly Settlement Cycle for July 2026

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6f8d5065-d6ff-4add-9a28-eadeffa7ed1a)
- **Proposal**: [MSC 11 Settlement Summary - July 2026](https://forum.skyeco.com/t/msc-11-settlement-summary-july-2026/28151)

If this executive proposal passes, then the Monthly Settlement Cycle for July 2026 will be executed through the following actions:

#### Spark

- Mint **9,465,419 USDS** debt in `ALLOCATOR-SPARK-A` and transfer the amount to the Surplus Buffer.
- Send **4,442,924 USDS** from the Surplus Buffer to [`SPARK_SUBPROXY`](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **9,685,438 USDS** debt in `ALLOCATOR-BLOOM-A` and transfer the amount to the Surplus Buffer.
- Send **1,808,084 USDS** from the Surplus Buffer to [`GROVE_SUBPROXY`](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Keel

- Send **35,328 USDS** from the Surplus Buffer to [`KEEL_SUBPROXY`](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **2,535,968 USDS** debt in `ALLOCATOR-OBEX-A` and transfer the amount to the Surplus Buffer.
- Send **916,736 USDS** from the Surplus Buffer to [`OBEX_SUBPROXY`](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **327,407 USDS** from the Surplus Buffer to [`SKYBASE_SUBPROXY`](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Osero

- Mint **497 USDS** debt in `ALLOCATOR-PRYSM-A` and transfer the amount to the Surplus Buffer.
- Send **12,043 USDS** from the Surplus Buffer to [`PRYSM_SUBPROXY`](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3).

#### Treasury Management Function

- Send **2,103,484 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).

This amount represents **1,051,742 USDS** allocated to the Core Council and **1,051,742 USDS** allocated to the Fortification Foundation, combined into a single transfer.

### LSSKY->SKY Rewards Normalization

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#7932c8f3-ce44-49ea-adc4-f6391c621c6e)
- **Proposal**: [Treasury Management Function (TMF) Configurations](https://forum.skyeco.com/t/treasury-management-function-tmf-configurations/28153/2)

If this executive proposal passes, then the distribution of SKY token rewards to SKY stakers will be normalized by updating the LSSKY->SKY farm vest through [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with the following parameters:

- `dist`: [`0x675671A8756dDb69F7254AFB030865388Ef699Ee`](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
- `vestTot`: **96,903,706 SKY**
- `vestBgn`: `block.timestamp`
- `vestTau`: **90 days**

### Increase Buybacks and Reactivate LSSKY->USDS Farm

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#7932c8f3-ce44-49ea-adc4-f6391c621c6e)
- **Proposal**: [Treasury Management Function (TMF) Configurations](https://forum.skyeco.com/t/treasury-management-function-tmf-configurations/28153/2)

If this executive proposal passes, then buybacks will be increased and the LSSKY->USDS farm will be reactivated through the following parameter changes:

- Decrease `splitter.hop` by 10,039 seconds from 13,787 seconds to **3,748 seconds**.
- Decrease `rewardsDuration` in `REWARDS_LSSKY_USDS` by 10,039 seconds from 13,787 seconds to **3,748 seconds**.
- Decrease `splitter.burn` by 45 percentage points from 100% to **55%**.
- Keep `kicker.kbump` unchanged at **6,000 USDS**.

These changes increase the buyback rate by increasing the frequency of buybacks. 55% of the USDS in each cycle will be used to buy back SKY tokens, while the remaining 45% will be distributed to stakers through the LSSKY->USDS farm.

### Adjust Grove DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [August 13, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-grove-for-upcoming-spell/28126)

If this executive proposal passes, then the following DC-IAM parameters will be updated for `ALLOCATOR-GROVE-A`:

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 5 million USDS from 5 million USDS to **10 million USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 1 million USDS from 1 million USDS to **2 million USDS**.
- Leave the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) unchanged at **86,400 seconds** (24 hours).

### Adjust Osero DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [Osero Requested Changes to Allocator Vault Parameters](https://forum.skyeco.com/t/osero-requested-changes-to-allocator-vault-parameters/28147)

If this executive proposal passes, then the following DC-IAM parameters will be updated for the Osero vault (`ALLOCATOR-PRYSM-A`):

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 5 million USDS from 5 million USDS to **10 million USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 1 million USDS from 1 million USDS to **2 million USDS**.
- Leave the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) unchanged at **86,400 seconds** (24 hours).

### Rename Osero Chainlog Keys

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#0d0e2e1a-0502-4ee3-bc9d-8bd8ddde19ec)
- **Proposal**: [Proposed Housekeeping Item - 2026-08-13 Executive Vote](https://forum.skyeco.com/t/proposed-housekeeping-item-2026-08-13-executive-vote/28148)

If this executive proposal passes, then the following Osero Chainlog keys will be renamed:

- `PRYSM_STARGUARD` to `OSERO_STARGUARD`.
- `PRYSM_SUBPROXY` to `OSERO_SUBPROXY`.

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3 - Safe Harbor Modifications](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, then the Safe Harbor Agreement will be updated to include the following Ethereum accounts:

- SBE BEAM: [`0xc8b61d211D3D03A630Fb09199E17953a8c9749a9`](https://etherscan.io/address/0xc8b61d211D3D03A630Fb09199E17953a8c9749a9)
- SBE farm owner: [`0xA3d3A2e9Fe5d0901D720D5382E4a7eA12D4E2b0e`](https://etherscan.io/address/0xA3d3A2e9Fe5d0901D720D5382E4a7eA12D4E2b0e)

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0xc827237CB91Fa8E78B8dfA4F77838eDf924C04e9`](https://etherscan.io/address/0xc827237CB91Fa8E78B8dfA4F77838eDf924C04e9) and codehash `0x74f56d9a7a918f0410aaf2ecf9ec9023970ec01acb3f83f4f14633a6ffd3454b` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0xb12C687188427d7D1E5253afA5f09A101Fbd9d4b`](https://etherscan.io/address/0xb12C687188427d7D1E5253afA5f09A101Fbd9d4b) and codehash `0x180fc2de506150de525027a135843e91123578dc1f03945b69a489dce863f85c` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/182).

##### [Ethereum] Spark Liquidity Layer - Onboard Uniswap v4 USDG/USDS Pool

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x101ed4ff7ef77f8e4a6db6af4bbf053b703001c0245a1e166babb8ba6ad633fb)
- **Proposal**: [August 13, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-spark-for-upcoming-spell/28135)

If this executive proposal passes, then the Spark proxy spell will onboard the Uniswap v4 USDG/USDS pool to the Spark Liquidity Layer with the following parameters and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Uniswap v4 parameters:
  - Pool ID: `0x28adc7179a8a83c3379955d59563c0fec33eadfa83946b447af289190ff5fcff`
  - Min tick range: **-276,334** (0.999)
  - Max tick range: **-276,314** (1.001)
  - Max tick spacing: **10**
  - Swap fee: **0.0005%**
- Deposit rate limit:
  - `maxAmount`: **10 million**
  - `slope`: **100 million per day**
- Withdrawal rate limit:
  - `maxAmount`: **unlimited**
- Swap rate limit:
  - `maxAmount`: **5 million**
  - `slope`: **200 million per day**
  - `maxSlippage`: **0.1%** (`0.999e18`)

##### [Ethereum] Spark Liquidity Layer - Onboard Uniswap v4 RLUSD/USDS Pool

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xf99d50e34900ea8f54c90053584f758d2a6d1ddbbe77a8c8d751e2c5a8fd0493)
- **Proposal**: [August 13, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-spark-for-upcoming-spell/28135)

If this executive proposal passes, then the Spark proxy spell will onboard the Uniswap v4 RLUSD/USDS pool to the Spark Liquidity Layer with the following parameters and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Uniswap v4 parameters:
  - Pool ID: `0x9035721b23481db3888fd201b9c2b26dbc3af60258bca65e669f2ed98dc8eb4f`
  - Min tick range: **-10** (0.999)
  - Max tick range: **10** (1.001)
  - Max tick spacing: **10**
  - Swap fee: **0.0005%**
- Deposit rate limit:
  - `maxAmount`: **10 million**
  - `slope`: **50 million per day**
- Withdrawal rate limit:
  - `maxAmount`: **unlimited**
- Swap rate limit:
  - `maxAmount`: **5 million**
  - `slope`: **100 million per day**
  - `maxSlippage`: **0.1%** (`0.999e18`)

##### [Ethereum] Spark Liquidity Layer - Onboard Curve RLUSD/USDC for Swaps

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x3240fc78276a2f4898188809464b3357124b2c42065f55a46a7a7254eabd0f82)
- **Proposal**: [August 13, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-spark-for-upcoming-spell/28135)

If this executive proposal passes, then the Spark proxy spell will onboard the Curve RLUSD/USDC StableSwap-NG pool for swaps with the following parameters and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Pool: [`0xD001aE433f254283FeCE51d4ACcE8c53263aa186`](https://etherscan.io/address/0xD001aE433f254283FeCE51d4ACcE8c53263aa186)
- `maxSlippage`: **0.1%** (`0.999e18`)
- Swap rate limit:
  - `maxAmount`: **5 million**
  - `slope`: **25 million per day**

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [August 13, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-spark-for-upcoming-spell/28135)

If this executive proposal passes, then the Spark proxy spell will claim all SparkLend reserves as follows:

- Claim SparkLend reserves of DAI, USDS, USDC, USDT, and PYUSD to the ALM Proxy: [`0x1601843c5E9bC251A3272907010AFa41Fa18347E`](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).
- Claim all other SparkLend reserves to the Spark Operations Multisig: [`0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC`](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

##### [Ethereum] Spark Treasury - Transfer Excess USDS for Buybacks

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6a4870fa-73f1-4d49-b7ee-d531fb59a971)
- **Proposal**: [August 13, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-spark-for-upcoming-spell/28135)

If this executive proposal passes, then the Spark proxy spell will transfer **1,756,359 USDS** to [`Spark Operations Multisig`](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to fund SPK buybacks.

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/69).

##### [Ethereum] Enable the UniswapV3 Facet on the Grove DPAU Controller

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:grovefinance.eth/proposal/0x180c2e7ea0dea1649d9d73dcc7bb53e0be9896e0a750ac10cbba1dc352487d8d)
- **Proposal**: [August 13, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-grove-for-upcoming-spell/28126)

If this executive proposal passes, then the Grove proxy spell will enable the [`UNISWAP_V3_FACET`](https://etherscan.io/address/0x445D9Dc752F269Be48250f1A180CAC4c61cE4bab) on the [`ALLOCATOR-GROVE-A` Diamond PAU (DPAU) Controller](https://etherscan.io/address/0xbf83F5974B932c7D842254042717D6A2706CE5eE) and configure the AUSD/USDC pool with the following parameters:

- `maxSlippage`: **0.1%** (`0.999e18`)
- `maxTickDelta`: **200 ticks**
- `twapSecondsAgo`: **600 seconds**
- Liquidity tick bounds: **-10** to **10**

The following DPAU [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) will be configured:

- Aggregate deposit rate limit:
  - `maxAmount`: **5 million**
  - `slope`: **0**
- AUSD deposit rate limit:
  - `maxAmount`: **5 million AUSD**
  - `slope`: **0 AUSD**
- USDC deposit rate limit:
  - `maxAmount`: **5 million USDC**
  - `slope`: **0 USDC**
- Aggregate, AUSD, and USDC withdrawal rate limits:
  - `maxAmount`: **unlimited**
- AUSD swap rate limit:
  - `maxAmount`: **1 million AUSD**
  - `slope`: **5 million AUSD per day**
- USDC swap rate limit:
  - `maxAmount`: **1 million USDC**
  - `slope`: **5 million USDC per day**

##### [Ethereum] One-Time Collect on the Grove Uniswap V3 Position

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:grovefinance.eth/proposal/0x3bce0bdda59ea54dd6056e772aa7f77880209b0206d11a7345286136d28fba70)
- **Proposal**: [August 13, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-grove-for-upcoming-spell/28126)

If this executive proposal passes, then the Grove proxy spell will collect all accrued fees from Uniswap V3 position NFT `tokenId 1192575` for the AUSD/USDC 0.01% pool and send them to the [Grove ALM Proxy](https://etherscan.io/address/0x491EDFB0B8b608044e227225C715981a30F3A44E).

##### [Ethereum] Set the Grove ALM Maple syrupUSDC Deposit Rate Limit to 0

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:grovefinance.eth/proposal/0x65fa0cfa74a7831c956d87e53dee5f1f6f5950690b9590a040180bff4a0388b9)
- **Proposal**: [August 13, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/august-13-2026-proposed-changes-to-grove-for-upcoming-spell/28126)

If this executive proposal passes, then the Grove proxy spell will set the Maple syrupUSDC `LIMIT_4626_DEPOSIT` [rate limit](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) to zero:

- `maxAmount`: decrease by 50 million syrupUSDC from 50 million syrupUSDC to **0 syrupUSDC**.
- `slope`: decrease by 50 million syrupUSDC per day from 50 million syrupUSDC per day to **0 syrupUSDC per day**.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

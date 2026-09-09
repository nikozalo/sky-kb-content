---
title: Template - [Executive Vote] Monthly Settlement Cycle for June 2026, LSSKY-SKY Rewards Normalization, Complete RWA001-A Offboarding, Add Emergency Spells to the Chainlog, Whitelist Osero ALMProxy, Adjust Vault Parameters, Update Safe Harbor Agreement, Prime Agent Proxy Spells - July 16, 2026
summary: Execute the Monthly Settlement Cycle for June 2026 and the associated reconciliation transfers, normalize LSSKY-SKY staking rewards, complete the offboarding of RWA001-A, add emergency spells for STUSDS_MOM to the Chainlog, whitelist the new Osero ALMProxy on the LitePSM, adjust the Osero DC-IAM parameters, update the Safe Harbor Agreement, whitelist Prime Agent spells for Spark, Grove, and Osero.
date: 2026-07-16T00:00:00.000Z
address: "0xfffc346976c53757BcF7a536be340bc0Ce1d9163"
---

# [Executive Proposal] Monthly Settlement Cycle for June 2026, LSSKY-SKY Rewards Normalization, Complete RWA001-A Offboarding, Add Emergency Spells to the Chainlog, Whitelist Osero ALMProxy, Adjust Vault Parameters, Update Safe Harbor Agreement, Prime Agent Proxy Spells - July 16, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Monthly Settlement Cycle for June 2026 will be executed.
- LSSKY->SKY staking rewards will be normalized.
- The offboarding of RWA001-A will be completed.
- Emergency spells relating to STUSDS_MOM will be added to the [chainlog](https://chainlog.skyeco.com).
- The Osero ALMProxy will be whitelisted on the LitePSM.
- DC-IAM parameters for Osero will be updated.
- The Safe Harbor Agreement will be updated.
- Proxy spells for Spark, Grove, and Osero will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Monthly Settlement Cycle for June 2026

- **Authorization**: [A.2.4](https://sky-atlas.io/#6f8d5065-d6ff-4add-9a28-eadeffa7ed1a)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/msc-10-settlement-summary-june-2026/28038)

If this executive proposal passes, then the Monthly Settlement Cycle for June 2026, and reconciliation for prior months, will be executed through the following actions:

#### Spark

- Mint **16,923,682 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Send **9,746,443 USDS** from the Surplus Buffer to the [SPARK_SUBPROXY](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **12,342,158 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.
- Send **2,328,332 USDS** from the Surplus Buffer to the [GROVE_SUBPROXY](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).
- Send **34,902 USDS** from the Surplus Buffer to the [Demand-Side Buffer](https://etherscan.io/address/0x5e2fEc3a3C4E63A422e45C1BB83EdB3a5aD0543B).

#### Keel

- Send **77,284 USDS** from the Surplus Buffer to the [KEEL_SUBPROXY](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **3,450,783 USDS** debt in ALLOCATOR-OBEX-A and transfer the amount to the Surplus Buffer.
- Send **1,519,539 USDS** from the Surplus Buffer to the [OBEX_SUBPROXY](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **204,242 USDS** from the Surplus Buffer to the [SKYBASE_SUBPROXY](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Treasury Management Function

- Transfer **3,378,069 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).

This amount represents a **635,130 USDS** Grove Core Council Genesis Capital Expenses Repayment, **1,371,470 USDS** allocated to the Core Council, and **1,371,469 USDS** allocated to the Fortification Foundation, with the Fortification Foundation portion to be paid out by the Core Council Multisig. These items have been combined for coding simplicity and gas efficiency.

### Staking Rewards Normalization

- **Authorization**: [Atlas - A.4.4.1.2 - SKY Staking Rewards](https://sky-atlas.io/#a98a1bfe-5713-43f5-a8bd-83c5808900b8)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/26)

If this executive proposal passes, then the distribution of SKY token rewards to SKY stakers will be normalized as per [A.4.4.1.4.2 - Short Term SKY Rewards For SKY Stakers](https://sky-atlas.io/#aed6511f-f5f0-4b46-a56e-9a7bbc6ea310), by executing the following actions:

- Update LSSKY->SKY Farm vest by calling [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with params:
  - dist: [0x675671A8756dDb69F7254AFB030865388Ef699Ee](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - vestTot: **286,714,697 SKY**
  - vestBgn: **block.timestamp**
  - vestTau: **90 days**

### RWA001-A Offboarding Spell 2

- **Authorization**: [Core Facilitator Approval](https://forum.skyeco.com/t/technical-scope-of-rwa001-a-offboarding/27706/16)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-of-rwa001-a-offboarding/27706/5)

If this executive proposal passes, then the offboarding of RWA001-A will be completed through the following actions:

- Call [MIP21_LIQUIDATION_ORACLE.cull()](https://github.com/sky-ecosystem/rwa-toolkit/blob/master/src/oracles/RwaLiquidationOracle.sol#L140) with:
  - `MIP21_LIQUIDATION_ORACLE` being [**0x88f88Bb9E66241B73B84f3A6E197FbBa487b1E30**](https://etherscan.io/address/0x88f88Bb9E66241B73B84f3A6E197FbBa487b1E30)
  - `bytes32 ilk` being **"RWA001-A"**
  - `address urn` being [**RWA001_A_URN**](https://etherscan.io/address/0xa3342059BcDcFA57a13b12a35eD4BBE59B873005)

This will write off any remaining debt attached to the facility.

### Add STUSDS_MOM Emergency Spells to the Chainlog

- **Authorization**: [Core Facilitator Approval](https://forum.skyeco.com/t/technical-scope-of-the-new-stusdsmom-deploy-and-replacement/27967/7)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-of-the-new-stusdsmom-deploy-and-replacement/27967/5)

If this executive proposal passes, then the following standby spell factories and standalone halt spell pertaining to [STUSDS_MOM](https://etherscan.io/address/0x99159d0b885CC6633daC7CD4d82e4247A834b89A) will be added to the [chainlog](https://chainlog.skyeco.com):

- `EMSP_STUSDS_RATE_S_DISS_BUD_FAB`: [**0xb3Fd827F58989cFacFE50d2F8e86A1113b6066D1**](https://etherscan.io/address/0xb3Fd827F58989cFacFE50d2F8e86A1113b6066D1)
- `EMSP_STUSDS_WIPE_PARAM_FAB`: [**0x768D5Ce639c7E7d51E1244E2634d6149bd0d8096**](https://etherscan.io/address/0x768D5Ce639c7E7d51E1244E2634d6149bd0d8096)
- `EMSP_STUSDS_RATE_SETTER_HALT`: [**0x91808ABeCd82495a4a7bf27d80C8c1e89de9effb**](https://etherscan.io/address/0x91808ABeCd82495a4a7bf27d80C8c1e89de9effb)

### Whitelist Osero ALMProxy on LitePSM

- **Authorization**: [Governance Poll ID 1640](https://vote.sky.money/polling/QmUnVyGg)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-osero-for-upcoming-spell/28023)

If this executive proposal passes, then the Osero ALMProxy at [`0x6d370e359e9cbd0Fd35Bb38fAF705D84238CB884`](https://etherscan.io/address/0x6d370e359e9cbd0Fd35Bb38fAF705D84238CB884) will be whitelisted on [`MCD_LITE_PSM_USDC_A`](https://etherscan.io/address/0xf6e72Db5454dd049d0788e411b06CfAF16853042).

### Adjust Osero DC-IAM Parameters

- **Authorization**: [Core Council Risk Advisor Approval](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-osero-for-upcoming-spell/28023/2)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-osero-for-upcoming-spell/28023)

If this executive proposal passes, then the following DC-IAM parameters will be updated for the Osero vault (ALLOCATOR-PRYSM-A):

- Decrease ALLOCATOR-PRYSM-A [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 5 million USDS from 10 million USDS to **5 million USDS**.
- Decrease ALLOCATOR-PRYSM-A [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 9 million USDS from 10 million USDS to **1 million USDS**.
- Leave ALLOCATOR-PRYSM-A [Stability Fee (`duty`)](https://sky-atlas.io/#0257a420-e92e-4942-b794-a559f299365f) and [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) unchanged at **0%** and **24 hours** respectively.

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, then the Safe Harbor Agreement will be updated to include the following contracts added to the chainlog in this spell:

- `EMSP_STUSDS_RATE_S_DISS_BUD_FAB`: [**0xb3Fd827F58989cFacFE50d2F8e86A1113b6066D1**](https://etherscan.io/address/0xb3Fd827F58989cFacFE50d2F8e86A1113b6066D1)
- `EMSP_STUSDS_WIPE_PARAM_FAB`: [**0x768D5Ce639c7E7d51E1244E2634d6149bd0d8096**](https://etherscan.io/address/0x768D5Ce639c7E7d51E1244E2634d6149bd0d8096)
- `EMSP_STUSDS_RATE_SETTER_HALT`: [**0x91808ABeCd82495a4a7bf27d80C8c1e89de9effb**](https://etherscan.io/address/0x91808ABeCd82495a4a7bf27d80C8c1e89de9effb)

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0xC1090e8fEE666868622a2F1e870185F944108Ee2`](https://etherscan.io/address/0xC1090e8fEE666868622a2F1e870185F944108Ee2) and codehash `0xa7b0b6c470169f40016d354a8944f9e5f3f787159fec5192694e8f1ddbc7f26f` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0x4f1318bC0490dC7C7F8230F1dd91A4A2e4694134`](https://etherscan.io/address/0x4f1318bC0490dC7C7F8230F1dd91A4A2e4694134) and codehash `0x38dd6399490f19d7a7e17a6eafda5d2ad92f9395c08efe2fdbacfda3b6d36a89` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then an Osero proxy spell with address [`0x5D9311fcDda62c08EB9F1115Ca804881a6660445`](https://etherscan.io/address/0x5D9311fcDda62c08EB9F1115Ca804881a6660445) and codehash `0x7dca6bc3a3097897198698a674bc824fd3bbb1c9b94c655cd0d78c49db2b9f3e` will be whitelisted in the [Prysm StarGuard](https://etherscan.io/address/0xBfA2D1dA838E55A74c61699e164cDFF8cF0cF0e2).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/174).

##### [Robinhood Chain] Spark Liquidity Layer - Activate SLL and Spark Savings Infrastructure and Enable USDG Bridging to Robinhood Chain

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xd177bc28b65afb23dc39a5e7cfdded7084b3b722b230e08d7067b68fa0f4486a)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will activate the Spark Liquidity Layer, Spark Savings infrastructure, and enable USDG bridging on Robinhood Chain with the following contract addresses and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- SLL roles (Robinhood Chain) - roles apply to ALM Controller and ALM Proxy Freezable:
  - Relayer: [0x0ca8f938Aba2214eA11eb451e795A8ef7B720C18](https://robinhoodchain.blockscout.com/address/0x0ca8f938Aba2214eA11eb451e795A8ef7B720C18)
  - Backstop relayer: [0x52CC27896e641Cbe88F0aD36480839961A47CdF8](https://robinhoodchain.blockscout.com/address/0x52CC27896e641Cbe88F0aD36480839961A47CdF8)
  - Freezer: [0x2d5Aa449FB8C5646C81BC3C1D2034c2d37F17099](https://robinhoodchain.blockscout.com/address/0x2d5Aa449FB8C5646C81BC3C1D2034c2d37F17099)
  - Default admin: [0x826AEaeee9233fA8Ba199518dd8621A5962b1D02](https://robinhoodchain.blockscout.com/address/0x826AEaeee9233fA8Ba199518dd8621A5962b1D02) (Spark Executor on Robinhood Chain, unchanged)
- ALM Proxy Freezable: [0xAEa9f5dE56e6C20383a1fcC2C3629Dca0A92cE41](https://robinhoodchain.blockscout.com/address/0xAEa9f5dE56e6C20383a1fcC2C3629Dca0A92cE41)
- Spark Savings (spUSDG) onchain parameters:
  - Deposit cap and max rate unchanged
  - Setter role: [0xAEa9f5dE56e6C20383a1fcC2C3629Dca0A92cE41](https://robinhoodchain.blockscout.com/address/0xAEa9f5dE56e6C20383a1fcC2C3629Dca0A92cE41) (ALM Proxy Freezable)
- SLL rate limits
  - transferAsset (USDG)
    - recipient: [0x17C0F5345d1144fdF670D14719077be3842E5087](https://robinhoodchain.blockscout.com/address/0x17C0F5345d1144fdF670D14719077be3842E5087)
    - maxAmount: **50 million USDG**
    - slope: **250 million USDG per day**

##### [Ethereum] Spark Liquidity Layer - Enable USDG Bridging to Robinhood Chain

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xd177bc28b65afb23dc39a5e7cfdded7084b3b722b230e08d7067b68fa0f4486a)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will enable bridging of USDG from Ethereum to Robinhood Chain with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- transferAsset (USDG)
  - recipient: [0xf752cF318dfF2C01575c98741AA52e7a34d873Fd](https://etherscan.io/address/0xf752cF318dfF2C01575c98741AA52e7a34d873Fd)
  - destination: [0xfD2fD4B046136B540A56C11c75ac679AE7d1dB24](https://robinhoodchain.blockscout.com/address/0xfD2fD4B046136B540A56C11c75ac679AE7d1dB24)
  - maxAmount: **50 million USDG**
  - slope: **250 million USDG per day**

##### [X Layer] Spark Savings - Deploy spUSDT

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xdde478db4ba5882a5d48d19fdbae057fd703688e4f1e16fb673407fc08476a9f)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will launch spUSDT on X Layer with the following addresses and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- spUSDT parameters
  - Default admin: [0xCF5af6F53ceC74B791cb4182aC778ca9CD323510](https://web3.okx.com/explorer/x-layer/evm/address/0xCF5af6F53ceC74B791cb4182aC778ca9CD323510) (Spark Executor on X Layer)
  - Setter: [0x9449ed367C60ea757544fd990B57e1C2D0Ec3A94](https://web3.okx.com/explorer/x-layer/evm/address/0x9449ed367C60ea757544fd990B57e1C2D0Ec3A94) (ALM Proxy Freezable)
  - Taker: [0x83A914C361bB729EB6BEBC8C7bA993667A0E6Df8](https://web3.okx.com/explorer/x-layer/evm/address/0x83A914C361bB729EB6BEBC8C7bA993667A0E6Df8) (ALM Proxy on X Layer)
  - Max yield: **6%**
  - Current yield (at launch): **0%**
  - Supply cap: **750 million USDT**
- SLL rate limits (X Layer)
  - take
    - maxAmount: **Unlimited**
  - transferAssets
    - recipient: [0xc358c90D32375721Cb3924320Fdc2F8B694347Ca](https://web3.okx.com/explorer/x-layer/evm/address/0xc358c90D32375721Cb3924320Fdc2F8B694347Ca) (spUSDT)
    - maxAmount: **Unlimited**
  - Bridge USDT0 to Ethereum (X Layer → Ethereum return route)
    - destination: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) (ALM Proxy on Ethereum)
    - maxAmount: **Unlimited**
- SLL roles (X Layer) - roles apply to ALM Controller and ALM Proxy Freezable
  - Primary relayer: [0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB](https://web3.okx.com/explorer/x-layer/evm/address/0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB)
  - Backstop relayer: [0x9330edE0Fc6E3E0D47Ebf3C145efd569796aC7F5](https://web3.okx.com/explorer/x-layer/evm/address/0x9330edE0Fc6E3E0D47Ebf3C145efd569796aC7F5)
  - Freezer: [0x90D8c80C028B4C09C0d8dcAab9bbB057F0513431](https://web3.okx.com/explorer/x-layer/evm/address/0x90D8c80C028B4C09C0d8dcAab9bbB057F0513431)
  - Default admin: [0xCF5af6F53ceC74B791cb4182aC778ca9CD323510](https://web3.okx.com/explorer/x-layer/evm/address/0xCF5af6F53ceC74B791cb4182aC778ca9CD323510) (Spark Executor on X Layer)

##### [Ethereum] Spark Liquidity Layer - Enable USDT Bridging to X Layer

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xdde478db4ba5882a5d48d19fdbae057fd703688e4f1e16fb673407fc08476a9f)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will enable USDT bridging to X Layer with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Bridge USDT to X Layer (Ethereum → X Layer route)
  - destination: [0x83A914C361bB729EB6BEBC8C7bA993667A0E6Df8](https://web3.okx.com/explorer/x-layer/evm/address/0x83A914C361bB729EB6BEBC8C7bA993667A0E6Df8) (ALM Proxy on X Layer)
  - maxAmount: **5 million USDT**
  - slope: **100 million USDT per day**

##### [Ethereum] Spark Liquidity Layer - Deactivate Deprecated USDT Morpho V2 Vault

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xf99372ccca4b99dd04dc0ddb038e949b62f4d25810b0203572dc90bce025e805)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will remove the old, non-frontend-listed USDT Morpho V2 vault from the Spark Liquidity Layer by updating the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Vault address: [0xc7CDcFDEfC64631ED6799C95e3b110cd42F2bD22](https://etherscan.io/address/0xc7CDcFDEfC64631ED6799C95e3b110cd42F2bD22)
- Deposit and withdrawal rate limits:
  - maxAmount: **0 USDT**
  - slope: **0 USDT per day**

##### [Ethereum] Spark Treasury - USDS Transfer to Spark Foundation for Incentives

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x2df281a276e0c17eff9a05e65bfc05937c2f600edec1a82386a6efb6dbe9d63d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will transfer **2 million USDS** from the Spark SubProxy to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec) to fund exchange and distributor hold-to-earn initiatives and term deposit boost programs.

##### [Ethereum] Spark Treasury - USDS Transfer to Spark Assets Foundation for Anchorage Fees

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x3cb4165f1357d553445b0de790e4e8b4a71358f42f39d35f7de51b308ade558c)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will transfer **500,000 USDS** from the Spark SubProxy to the Spark Assets Foundation at [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911) to cover Anchorage variable fees.

##### [Ethereum] Spark Liquidity Layer - Transfer USDS to Grove

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x451bb53f80ad2906ff06cc3d03c88a6b09f350db371c4782e0621e26a1d55a43)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will transfer an amount of USDS to the Grove ALMProxy at [0x491EDFB0B8b608044e227225C715981a30F3A44E](https://etherscan.io/address/0x491EDFB0B8b608044e227225C715981a30F3A44E) in exchange for the Grove ALMProxy's balance of syrupUSDC. The precise amount of USDS will be determined by the formula: `85,943,747.637271 * syrupUSDC/USDC conversion rate` at the time of execution.

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will claim all SparkLend reserves. USD stablecoin reserves will be transferred to the Spark ALMProxy and non-USD reserves will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

##### [Ethereum] Spark Treasury - Grants for Spark Foundation and Spark Assets Foundation

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#8dd2eb27-a760-4287-89cf-7b5bdb0c5d7c)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will transfer **1.1 million USDS** to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec) and **155,000 USDS** to the Spark Assets Foundation at [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911).

##### [Ethereum] Spark Treasury - Transfer USDS for Buybacks

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6a4870fa-73f1-4d49-b7ee-d531fb59a971)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-spark-for-upcoming-spell/28029)

If this executive proposal passes, then the Spark proxy spell will transfer **64,231 USDS** to the Spark Operations Multisig at [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to fund SPK buybacks.

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/63).

##### [Ethereum + Robinhood Chain] Onboard the Grove Liquidity Layer on Robinhood Chain

- **Authorization**: [Governance Poll ID 1640](https://vote.sky.money/polling/QmUnVyGg)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-grove-for-upcoming-spell/28024)

If this executive proposal passes, then the Grove proxy spell will onboard the Grove Liquidity Layer to Robinhood Chain with the following contracts and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

###### Contracts

| Contract name | Address with URL |
| --- | --- |
| Grove SubProxy (Mainnet spell executor) | [`eth:0x1369f7b2b38c76B6478c0f0E66D94923421891Ba`](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) |
| Grove ALM Proxy (Mainnet) | [`eth:0x491EDFB0B8b608044e227225C715981a30F3A44E`](https://etherscan.io/address/0x491EDFB0B8b608044e227225C715981a30F3A44E) |
| Grove `MainnetController` v1.8.0 | [`eth:0xfd9dEA9a8D5B955649579Af482DB7198A392A9F5`](https://etherscan.io/address/0xfd9dEA9a8D5B955649579Af482DB7198A392A9F5) |
| Grove `RateLimits` (Mainnet) | [`eth:0x5F5cfCB8a463868E37Ab27B5eFF3ba02112dF19a`](https://etherscan.io/address/0x5F5cfCB8a463868E37Ab27B5eFF3ba02112dF19a) |
| Grove ALM Relayer 1 | [`eth:0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f`](https://etherscan.io/address/0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f) |
| Grove ALM Relayer 2 | [`eth:0x9187807e07112359C481870feB58f0c117a29179`](https://etherscan.io/address/0x9187807e07112359C481870feB58f0c117a29179) |
| Grove Freezer Safe (Mainnet) | [`eth:0xB0113804960345fd0a245788b3423319c86940e5`](https://etherscan.io/address/0xB0113804960345fd0a245788b3423319c86940e5) |
| USDC (Mainnet) | [`eth:0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48`](https://etherscan.io/token/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48) |
| USDG (Mainnet, reference) | [`eth:0xe343167631d89B6Ffc58B88d6b7fB0228795491D`](https://etherscan.io/token/0xe343167631d89B6Ffc58B88d6b7fB0228795491D) |
| Paxos USDC receive address (Mainnet — Item 1) | [`eth:0x8C0A9E5939B97979f85d9aDA3d983C6E713Cc2dB`](https://etherscan.io/address/0x8C0A9E5939B97979f85d9aDA3d983C6E713Cc2dB) |
| syrupUSDC — Maple pool share token (Mainnet — Item 3) | [`eth:0x80ac24aA929eaF5013f6436cdA2a7ba190f5Cc0b`](https://etherscan.io/token/0x80ac24aA929eaF5013f6436cdA2a7ba190f5Cc0b) |
| Spark ALM Proxy (Mainnet — Item 3) | [`eth:0x1601843c5E9bC251A3272907010AFa41Fa18347E`](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) |
| Robinhood Chain ALM Proxy | [`rh:0x29626c2d8Ca49A51E4dECEEc5499e52983c42BD5`](https://robinhoodchain.blockscout.com/address/0x29626c2d8Ca49A51E4dECEEc5499e52983c42BD5) |
| Robinhood Chain `RateLimits` | [`rh:0xC13e5ff7993c5df911aE562a7736B0eBA12b2010`](https://robinhoodchain.blockscout.com/address/0xC13e5ff7993c5df911aE562a7736B0eBA12b2010) |
| Robinhood Chain `ForeignController` v1.8.0 | [`rh:0x2c10885ddec8d52ecF3Ad2B3833765bf36eD80cf`](https://robinhoodchain.blockscout.com/address/0x2c10885ddec8d52ecF3Ad2B3833765bf36eD80cf) |
| Robinhood Chain Executor | [`rh:0x5ff98717a18833de1A49e11B498866d6Fa1c9296`](https://robinhoodchain.blockscout.com/address/0x5ff98717a18833de1A49e11B498866d6Fa1c9296) |
| Robinhood Chain Gov-Relay Receiver (Arbitrum-native `ArbitrumReceiver`) | [`rh:0xa02eC279eEA9E56F4E14449a07C5ca5FDAAdc51d`](https://robinhoodchain.blockscout.com/address/0xa02eC279eEA9E56F4E14449a07C5ca5FDAAdc51d) |
| Robinhood Chain Delayed Inbox (Ethereum Mainnet — Item 1) | [`eth:0x1A07cc4BD17E0118BdB54D70990D2158AbAD7a2D`](https://etherscan.io/address/0x1A07cc4BD17E0118BdB54D70990D2158AbAD7a2D) |
| USDG (Robinhood Chain) | [`rh:0x5fc5360D0400a0Fd4f2af552ADD042D716F1d168`](https://robinhoodchain.blockscout.com/address/0x5fc5360D0400a0Fd4f2af552ADD042D716F1d168) |
| Paxos USDG receive address (Robinhood Chain) | [`rh:0xfC0a7Ed7C5146B26eB38FA92c71F434A7178b06e`](https://robinhoodchain.blockscout.com/address/0xfC0a7Ed7C5146B26eB38FA92c71F434A7178b06e) |

###### Initial Parameters

[Rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) for initial activation:

| Parameter | Max Amount | Slope (Tokens/Day) |
| --- | --- | --- |
| LIMIT_ASSET_TRANSFER (USDC from mainnet ALMProxy to Paxos USDC receive address) | **50 million USDC** | **50 million USDC/day** |
| LIMIT_ASSET_TRANSFER (USDG from Robinhood Chain ALMProxy to Paxos USDG receive address) | **50 million USDG** | **50 million USDG/day** |

These contracts and rate limits will activate the Grove Liquidity Layer on Robinhood Chain and activate bridging of USDG in both directions. The conversion from USDC to USDG is an off-chain conversion handled by Paxos.

##### [Robinhood Chain] Onboard the Robinhood Chain Grove x Steakhouse USDG Morpho Vault for Grove ALM Deposits

- **Authorization**: [Governance Poll ID 1640](https://vote.sky.money/polling/QmUnVyGg)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-grove-for-upcoming-spell/28024)

If this executive proposal passes, then the Grove proxy spell will onboard the Robinhood Chain Grove x Steakhouse USDG Morpho vault with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Vault address: [0xBEEff039907422219Fb367e525954DDC092854d9](https://robinhoodchain.blockscout.com/address/0xBEEff039907422219Fb367e525954DDC092854d9)
- Deposits:
  - maxAmount: **50 million USDG**
  - slope: **50 million USDG/day**
- Withdrawals:
  - maxAmount: **Unlimited**

##### [Ethereum] Transfer ALMProxy syrupUSDC Balance to Spark ALMProxy

- **Authorization**: [Governance Poll ID 1640](https://vote.sky.money/polling/QmUnVyGg)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-grove-for-upcoming-spell/28024)

If this executive proposal passes, then all syrupUSDC held in the Grove ALMProxy will be transferred to the Spark ALMProxy at [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E). In return the Spark spell will send an equivalent amount of USDS to the Grove ALMProxy.

#### Osero Proxy Spell

The Pull Request for the Osero proxy spell can be viewed [here](https://github.com/osero-io/osero-spells/pull/1).

##### [Ethereum] Onboard the Diamond PAU Controller on the ALLOCATOR-PRYSM-A Instance

- **Authorization**: [Governance Poll ID 1640](https://vote.sky.money/polling/QmUnVyGg)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-osero-for-upcoming-spell/28023)

If this executive proposal passes, then the Diamond PAU Controller will be onboarded on the Osero Allocator instance with the following contracts and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5).

###### Contracts

| Contract name | Address with URL |
| --- | --- |
| Osero SubProxy (Mainnet spell executor) | [`0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3`](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3) |
| Osero Allocator Vault (`ALLOCATOR_PRYSM_A`) | [`0x146181Aa9B362EaEC2eC3aDd7429a06D53B43d1a`](https://etherscan.io/address/0x146181Aa9B362EaEC2eC3aDd7429a06D53B43d1a) |
| Osero Allocator Buffer | [`0xD0BB61b34771146e31055f20f329cDf97429F889`](https://etherscan.io/address/0xD0BB61b34771146e31055f20f329cDf97429F889) |
| Osero ALM Proxy | [`0x6d370e359e9cbd0Fd35Bb38fAF705D84238CB884`](https://etherscan.io/address/0x6d370e359e9cbd0Fd35Bb38fAF705D84238CB884) |
| Osero Diamond PAU Controller | [`0x24169Afb34fAe4D4356BC54Bd80319131e35ca38`](https://etherscan.io/address/0x24169Afb34fAe4D4356BC54Bd80319131e35ca38) |
| Osero Diamond PAU RateLimits | [`0xE9a78f34fe497e2186f81B8c014cd93B308BC62a`](https://etherscan.io/address/0xE9a78f34fe497e2186f81B8c014cd93B308BC62a) |
| Osero Diamond PAU AccessControls | [`0x791D2a017532CfAD881c446e6bF93BbC3c0778b2`](https://etherscan.io/address/0x791D2a017532CfAD881c446e6bF93BbC3c0778b2) |
| Osero AdministeredAgent | [`0x1837505D104F7a6D8b7e19452610B0A3D652EF12`](https://etherscan.io/address/0x1837505D104F7a6D8b7e19452610B0A3D652EF12) |
| Osero ALM Relayer / Actor (Prime) | [`0x29c5A20A49A0D522A3714af97C517a908946b6A8`](https://etherscan.io/address/0x29c5A20A49A0D522A3714af97C517a908946b6A8) |
| Core Operator Relayer / Actor (Soter Labs) | [`0x3dE688267Cf099307aBdd85F64D8efe03D0b2b26`](https://etherscan.io/address/0x3dE688267Cf099307aBdd85F64D8efe03D0b2b26) |
| Freezer / Revoker | [`0xF61F90907551a8A23f0f8EEE9658Fa53326de603`](https://etherscan.io/address/0xF61F90907551a8A23f0f8EEE9658Fa53326de603) |

The proxy spell will:

- Set the controller's USDS vault: point the Diamond PAU Controller at the `ALLOCATOR-PRYSM-A` AllocatorVault.
- Authorize the ALMProxy on the AllocatorVault.
- Approve the ALMProxy on the AllocatorBuffer.

###### Initial Parameters

[Rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) for initial activation:

| Parameter | Max Amount | Slope (Tokens/Day) |
| --- | --- | --- |
| LIMIT_USDS_MINT | **5 million USDS** | **5 million USDS/day** |
| LIMIT_USDS_BURN | **Unlimited** | N/A |

##### [Ethereum] Onboard SparkLend USDS (spUSDS)

- **Authorization**: [Governance Poll ID 1640](https://vote.sky.money/polling/QmUnVyGg)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/july-16-2026-proposed-changes-to-osero-for-upcoming-spell/28023)

If this executive proposal passes, then the Osero proxy spell will onboard SparkLend USDS (spUSDS) with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Deposits:
  - maxAmount: **5 million USDS**
  - slope: **5 million USDS per day**
- Withdrawals:
  - maxAmount: **Unlimited**
- maxSlippage: **0.01%**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

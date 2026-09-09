---
title: Template - [Executive Vote] Onboard ALLOCATOR-GROVE-A Vault, Update LitePSM Parameters, Replace STUSDS_MOM, Monthly Settlement Cycle for May 2026, Staking Rewards Normalization, Update Safe Harbor Agreement, Prime Agent Proxy Spell - June 18, 2026
summary: Onboard a new ALLOCATOR-GROVE-A vault, increase LitePSM buf and gap parameters, replace the existing STUSDS_MOM with a new version, execute the Monthly Settlement Cycle for May 2026, normalize LSSKY-SKY staking rewards after MSC execution, update the Safe Harbor Agreement with new contracts, whitelist a proxy spell for Spark.
date: 2026-06-18T00:00:00.000Z
address: "0xC136C3c419746c2e8c0B95100ac866a747e3e04b"
---

# [Executive Proposal] Onboard ALLOCATOR-GROVE-A Vault, Update LitePSM Parameters, Replace STUSDS_MOM, Monthly Settlement Cycle for May 2026, Staking Rewards Normalization, Update Safe Harbor Agreement, Prime Agent Proxy Spell - June 18, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- ALLOCATOR-GROVE-A will be onboarded.
- LitePSM `buf` and `gap` parameters will be increased.
- STUSDS_MOM will be updated to a newer version.
- The Monthly Settlement Cycle for May 2026 will be executed.
- LSSKY->SKY staking rewards will be normalized.
- The Safe Harbor Agreement will be updated with the newly deployed contracts activated by this spell.
- A proxy spell for Spark will be whitelisted in the Spark StarGuard module.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### ALLOCATOR-GROVE-A Onboarding

- **Authorization**: [Governance Poll ID 1637](https://vote.sky.money/polling/QmdYpnYS)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-of-the-new-allocator-instance-for-grove/27966)

If this executive proposal passes, then a new ALLOCATOR-GROVE-A vault will be onboarded through the following actions.

- A new Allocator instance will be onboarded by calling [AllocatorInit.initIlk](https://github.com/makerdao/dss-allocator/blob/226584d3b179d98025497815adb4ea585ea0102d/deploy/AllocatorInit.sol#L97-L164) with:
  - `sharedInstance.oracle` being [**PIP_ALLOCATOR**](https://etherscan.io/address/0xc7B91C401C02B73CBdF424dFaaa60950d5040dB7) from [chainlog](https://chainlog.sky.money)
  - `sharedInstance.roles` being [**ALLOCATOR_ROLES**](https://etherscan.io/address/0x9A865A710399cea85dbD9144b7a09C889e94E803) from [chainlog](https://chainlog.sky.money)
  - `sharedInstance.registry` being [**ALLOCATOR_REGISTRY**](https://etherscan.io/address/0xCdCFA95343DA7821fdD01dc4d0AeDA958051bB3B) from [chainlog](https://chainlog.sky.money)
  - `ilkInstance.owner` being [**MCD_PAUSE_PROXY**](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB) from [chainlog](https://chainlog.sky.money)
  - `ilkInstance.vault` being [**0xf739a30c74927dc6cFA3B67E4933872a1FC5F4EB**](https://etherscan.io/address/0xf739a30c74927dc6cFA3B67E4933872a1FC5F4EB) (AllocatorVault contract)
  - `ilkInstance.buffer` being [**0x436DABce608f73BeA2b75fba35bffe72739697d5**](https://etherscan.io/address/0x436DABce608f73BeA2b75fba35bffe72739697d5) (AllocatorBuffer contract)
  - `cfg.ilk` being **ALLOCATOR-GROVE-A**
  - `cfg.duty` being **0%**
  - `cfg.gap` being **1 million USDS**
  - `cfg.maxLine` being **5 million USDS**
  - `cfg.ttl` being **86,400 seconds** (24 hours)
  - `cfg.allocatorProxy` being [**0x1369f7b2b38c76B6478c0f0E66D94923421891Ba**](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) (existing Grove SubProxy contract)
  - `cfg.ilkRegistry` being [**ILK_REGISTRY**](https://etherscan.io/address/0x5a464C28D19848f44199D003BeF5ecc87d090F87) from [chainlog](https://chainlog.sky.money)
- Remove PIP_ALLOCATOR_GROVE_A from the [chainlog](https://chainlog.sky.money)
- Add ALLOCATOR-GROVE-A to the [LINE_MOM](https://etherscan.io/address/0x9c257e5Aaf73d964aEBc2140CA38078988fB0C10)
- Add ALLOCATOR-GROVE-A ilk to the [MCD_SPBEAM](https://etherscan.io/address/0x36B072ed8AFE665E3Aa6DaBa79Decbec63752b22) with the following parameters:
  - [`max`](https://sky-atlas.io/#67747090-8545-49b4-95e8-673af9836aa5) being **3,000 basis points**
  - [`min`](https://sky-atlas.io/#1896350c-5f87-4be5-b32f-f1114dc2c271) being **0 basis points**
  - [`step`](https://sky-atlas.io/#bcfac0d1-3d17-46e1-bf88-5a7937816d53) being **400 basis points**

### LitePSM Parameter Update

- **Authorization**: [Core Facilitator Approval](https://forum.skyeco.com/t/lite-psm-usdc-a-parameter-change/27961/2), [Atlas Authority](https://sky-atlas.io/#8694e11a-6acd-43f1-90fd-67eb7e7d98d6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/lite-psm-usdc-a-parameter-change/27961)

If this executive proposal passes, then LitePSM parameters will be adjusted as follows:

- Increase LITE-PSM-USDC-A [`buf`](https://sky-atlas.io/#71776219-5425-4eaf-89fe-7dea283d5a7d) by 400 million DAI from 400 million DAI to **800 million DAI**
- Increase LITE-PSM-USDC-A [`gap`](https://sky-atlas.io/#7d56c67d-d358-4641-aa27-ada5066c0579) by 400 million DAI from 400 million DAI to **800 million DAI**

### stUSDS MOM Replacement

- **Authorization**: [Core Facilitator Approval](https://forum.skyeco.com/t/technical-scope-of-the-new-stusdsmom-deploy-and-replacement/27967/4)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-of-the-new-stusdsmom-deploy-and-replacement/27967)

If this executive proposal passes, then STUSDS_MOM will be updated to a new version deployed to [**0x99159d0b885CC6633daC7CD4d82e4247A834b89A**](https://etherscan.io/address/0x99159d0b885CC6633daC7CD4d82e4247A834b89A).

The new contract ensures that `zeroLine(address)` calls `stusds.drip()` before propagating a zero borrow ceiling through the Vat, keeping the stUSDS accounting synchronized when offboarding or disabling a line.

### Monthly Settlement Cycle for May 2026

- **Authorization**: [A.2.4](https://sky-atlas.io/#6f8d5065-d6ff-4add-9a28-eadeffa7ed1a)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/msc-9-settlement-summary-may-2026/27962)

If this executive proposal passes, then the Monthly Settlement Cycle for May 2026 will be executed through the following actions:

#### Spark

- Mint **13,427,874 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Send **4,204,857 USDS** from the Surplus Buffer to the [SPARK_SUBPROXY](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **8,877,823 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.
- Send **271,843 USDS** from the Surplus Buffer to the [GROVE_SUBPROXY](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Keel

- Send **32,279 USDS** from the Surplus Buffer to the [KEEL_SUBPROXY](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **2,461,845 USDS** debt in ALLOCATOR-OBEX-A and transfer the amount to the Surplus Buffer.
- Send **526,204 USDS** from the Surplus Buffer to the [OBEX_SUBPROXY](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **1,806,616 USDS** from the Surplus Buffer to the [SKYBASE_SUBPROXY](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Treasury Management Function

- Transfer **2,946,125 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).

This amount represents **1,473,063 USDS** allocated to the Core Council and **1,473,062 USDS** allocated to the Fortification Conserver, with the Fortification Conserver portion to be paid out by the Core Council Multisig.

### Staking Rewards Normalization

- **Authorization**: [Atlas - A.4.4.1.2 - SKY Staking Rewards](https://sky-atlas.io/#a98a1bfe-5713-43f5-a8bd-83c5808900b8)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/24)

If this executive proposal passes, then the distribution of SKY token rewards to SKY stakers will be normalized as per [A.4.4.1.4.2 - Short Term SKY Rewards For SKY Stakers](https://sky-atlas.io/#aed6511f-f5f0-4b46-a56e-9a7bbc6ea310), by executing the following actions:

- Update LSSKY->SKY Farm vest by calling [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with params:
  - dist: [0x675671A8756dDb69F7254AFB030865388Ef699Ee](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - vestTot: **240,862,942 SKY**
  - vestBgn: **block.timestamp**
  - vestTau: **90 days**

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, the Safe Harbor agreement will be updated to include the ALLOCATOR_GROVE_A_VAULT and ALLOCATOR_GROVE_A_BUFFER added by this spell, and the STUSDS_MOM entry will be updated to the new address.

### Prime Agent Proxy Spell

If this executive proposal passes, then a Spark proxy spell with address [`0xe08BD6D9016EAC522903FC68c80F809664C2692A`](https://etherscan.io/address/0xe08BD6D9016EAC522903FC68c80F809664C2692A) and codehash `0xdf7cca8d640cde5f2f8184ccb03f76031a024cb8ab2c192092acfe329b5aebf5` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/169).

##### [Mainnet] Spark Liquidity Layer - Onboard Binance with OTC-Buffer

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xe556733096975218413695c0bd3905a865a38e4ded7603551b40f49cebfbb9ba)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-18-2026-proposed-changes-to-spark-for-upcoming-spell/27952)

Binance will be onboarded to the Spark Liquidity Layer to enable stablecoin trading between USDC and USDT with the following OTC Buffer parameters:

- maxAmount: **5 million USDC/USDT**
- slope: **100 million USDC/USDT per day**
- maxSlippage: **20 bps**
- rechargeRate: **50,000 USDC/USDT per day**

##### [Mainnet] Claim SparkLend Reserves

- **Authorization**: [Atlas - A.6.1.1.1.2.6.1.2.1.2.3 - Token Claim Authorization](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-18-2026-proposed-changes-to-spark-for-upcoming-spell/27952)

SparkLend reserves will be claimed as follows:

- Claim all reserves.
- Transfer USD stablecoin reserves to ALM Proxy.
- Transfer non-USD stablecoin reserves to Spark Operations Multisig [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to be liquidated.

##### [Mainnet] Spark Treasury - Grants for Spark Foundation and Spark Assets Foundation for Q3 2026

- **Authorization**: [Governance Poll ID 1637](https://vote.sky.money/polling/QmdYpnYS)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-18-2026-proposed-changes-to-spark-for-upcoming-spell/27952)

- Spark Foundation Grant
  - Recipient address: [**0x92e4629a4510AF5819d7D1601464C233599fF5ec**](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec)
  - Transfer amount: **1.1 million USDS**
- Spark Assets Foundation Grant
  - Recipient address: [**0xEabCb8C0346Ac072437362f1692706BA5768A911**](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911)
  - Transfer amount: **155,000 USDS**

##### [Unichain] Spark Liquidity Layer - Remove Excess Liquidity

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x81e46a9c323dafde20fa6104fb93855889217b590335157c3c58be6760735747)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-18-2026-proposed-changes-to-spark-for-upcoming-spell/27952)

- Withdraw **10,000 USDS** from Unichain to Ethereum
- Withdraw **10,000 sUSDS** from Unichain to Ethereum

##### [OP Mainnet] Spark Liquidity Layer - Remove Excess Liquidity

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x81e46a9c323dafde20fa6104fb93855889217b590335157c3c58be6760735747)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-18-2026-proposed-changes-to-spark-for-upcoming-spell/27952)

- Withdraw **10,000 USDS** from OP Mainnet to Ethereum
- Withdraw **10,000 sUSDS** from OP Mainnet to Ethereum

##### [Base] Spark Liquidity Layer - Remove Excess Liquidity

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x81e46a9c323dafde20fa6104fb93855889217b590335157c3c58be6760735747)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-18-2026-proposed-changes-to-spark-for-upcoming-spell/27952)

- Withdraw **10,000 USDS** from Base to Ethereum
- Withdraw **10,000 sUSDS** from Base to Ethereum

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

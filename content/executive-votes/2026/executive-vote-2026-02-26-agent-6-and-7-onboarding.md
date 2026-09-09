---
title: Template - [Executive Vote] Launch Agent Onboardings, January Monthly Settlement Cycle and Treasury Management Function, SKY Staking Rewards Normalization, Prime Agent Proxy Spells - February 26, 2026
summary: Onboard Launch Agents 6 and 7, execute Monthly Settlement Cycle and Treasury Management Function for January, adjust LSSKY->SKY vesting stream, whitelist proxy spells for Spark and Grove.
date: 2026-02-26T00:00:00.000Z
address: "0x4C56b1B1554B1230349d66F665814641A609C569"
---

# [Executive Proposal] Launch Agent Onboardings, January Monthly Settlement Cycles and Treasury Management Function, SKY Staking Rewards Normalization, Prime Agent Proxy Spells - February 26, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Allocator Vaults and associated contracts for Launch Agents 6 and 7 will be initialized.
- The Monthly Settlement Cycle and Treasury Management Function for January 2026 will be executed.
- LSSKY->SKY staking rewards will be normalized.
- Prime Agent proxy spells for Spark and Grove will be whitelisted in the corresponding StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Launch Agent 6 Technical Onboarding

- **Authorization**: [Governance Poll 1609](https://vote.sky.money/polling/QmQ95c8b)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-new-launch-agent-6-allocator-instance/27724)

If this executive proposal passes, then Launch Agent 6 will be onboarded as a Prime Agent. The onboarding will consist of initializing an Allocator Vault, adding the new Allocator Vault to the SP-BEAM, and initializing a StarGuard instance for future proxy spells.

#### Allocator Contracts

Init new Allocator instance by calling [AllocatorInit.initIlk](https://github.com/makerdao/dss-allocator/blob/226584d3b179d98025497815adb4ea585ea0102d/deploy/AllocatorInit.sol#L97-L164) with:

- `sharedInstance.oracle`: `PIP_ALLOCATOR` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.roles`: `ALLOCATOR_ROLES` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.registry`: `ALLOCATOR_REGISTRY` from [Chainlog](https://chainlog.sky.money/);
- `ilkInstance.owner`: `MCD_PAUSE_PROXY` from [Chainlog](https://chainlog.sky.money/);
- `ilkInstance.vault`: [0x146181Aa9B362EaEC2eC3aDd7429a06D53B43d1a](https://etherscan.io/address/0x146181Aa9B362EaEC2eC3aDd7429a06D53B43d1a) (AllocatorVault contract);
- `ilkInstance.buffer`: [0xD0BB61b34771146e31055f20f329cDf97429F889](https://etherscan.io/address/0xD0BB61b34771146e31055f20f329cDf97429F889) (AllocatorBuffer contract);
- `cfg.ilk`: `ALLOCATOR-PRYSM-A`;
- `cfg.duty`: **0%**;
- `cfg.gap`: **10 million USDS**;
- `cfg.maxLine`: **10 million USDS**;
- `cfg.ttl`: **86,400 seconds (24 hours)**;
- `cfg.allocatorProxy`: [0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3) (SubProxy contract);
- `cfg.ilkRegistry`: `ILK_REGISTRY` from [Chainlog](https://chainlog.sky.money/).

The initialization script will create a PIP_ALLOCATOR_PRYSM_A entry in the [Chainlog](https://chainlog.sky.money/); this entry is not necessary and will be removed.

ALLOCATOR-PRYSM-A will be added to the [Debt Ceiling Breaker (LINE_MOM)](https://sky-atlas.io/#A.1.9.3.2.3).

#### Add ALLOCATOR-PRYSM-A to SP-BEAM

The newly created ALLOCATOR-PRYSM-A will be added to the [SP-BEAM](https://sky-atlas.io/#A.3.7.1.2) with the following parameters:

- [max](https://sky-atlas.io/#A.3.7.1.2.1.2): **3,000 basis points**;
- [min](https://sky-atlas.io/#A.3.7.1.2.1.1): **0 basis points**;
- [step](https://sky-atlas.io/#A.3.7.1.2.1.3): **400 basis points**.

#### Add Launch Agent 6 StarGuard Instance

Init new StarGuard module by calling [StarGuardInit.init](https://github.com/sky-ecosystem/star-guard/blob/52239d716a89188b303f137fc43fb9288735ba2e/deploy/StarGuardInit.sol#L44-L63) with:

- [`chainlog`](https://chainlog.sky.money/): `DssExecLib.LOG`;
- `cfg.subProxy`: [0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3);
- `cfg.subProxyKey`: `PRYSM_SUBPROXY`;
- `cfg.starGuard`: [0xBfA2D1dA838E55A74c61699e164cDFF8cF0cF0e2](https://etherscan.io/address/0xBfA2D1dA838E55A74c61699e164cDFF8cF0cF0e2);
- `cfg.starGuardKey`: `PRYSM_STARGUARD`;
- `cfg.maxDelay`: **7 days**.

PRYSM_STARGUARD will be added to the [StarGuardJob](https://etherscan.io/address/0xB18d211fA69422a9A848B790C5B4a3957F7Aa44E).

### Launch Agent 7 Technical Onboarding

- **Authorization**: [Governance Poll 1618](https://vote.sky.money/polling/QmcxUENd)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-new-launch-agent-7-allocator-instance/27725)

If this executive proposal passes, then Launch Agent 7 will be onboarded as a Prime Agent. The onboarding will consist of initializing an Allocator Vault, adding the new Allocator Vault to the SP-BEAM, and initializing a StarGuard instance for future proxy spells.

#### Allocator Contracts

Init new Allocator instance by calling [AllocatorInit.initIlk](https://github.com/makerdao/dss-allocator/blob/226584d3b179d98025497815adb4ea585ea0102d/deploy/AllocatorInit.sol#L97-L164) with:

- `sharedInstance.oracle`: `PIP_ALLOCATOR` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.roles`: `ALLOCATOR_ROLES` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.registry`: `ALLOCATOR_REGISTRY` from [Chainlog](https://chainlog.sky.money/);
- `ilkInstance.owner`: `MCD_PAUSE_PROXY` from [Chainlog](https://chainlog.sky.money/);
- `ilkInstance.vault`: [0xDD3bE7650589E6A6171d454b026C4AD1a2C02720](https://etherscan.io/address/0xDD3bE7650589E6A6171d454b026C4AD1a2C02720) (AllocatorVault contract);
- `ilkInstance.buffer`: [0x67Ac5c8FbFDAc5265c995e9B2ACd830496438AfD](https://etherscan.io/address/0x67Ac5c8FbFDAc5265c995e9B2ACd830496438AfD) (AllocatorBuffer contract);
- `cfg.ilk`: `ALLOCATOR-INTERVAL-A`;
- `cfg.duty`: **0%**;
- `cfg.gap`: **10 million USDS**;
- `cfg.maxLine`: **10 million USDS**;
- `cfg.ttl`: **86,400 seconds (24 hours)**;
- `cfg.allocatorProxy`: [0x56a9bA5FE133EF4Ab1131E8ac7c4312a52284f5B](https://etherscan.io/address/0x56a9bA5FE133EF4Ab1131E8ac7c4312a52284f5B) (SubProxy contract);
- `cfg.ilkRegistry`: `ILK_REGISTRY` from [Chainlog](https://chainlog.sky.money/).

The initialization script will create a PIP_ALLOCATOR_INTERVAL_A entry in the [Chainlog](https://chainlog.sky.money/); this entry is not necessary and will be removed.

ALLOCATOR-INTERVAL-A will be added to the [Debt Ceiling Breaker (LINE_MOM)](https://sky-atlas.io/#A.1.9.3.2.3).

#### Add ALLOCATOR-INTERVAL-A to SP-BEAM

The newly created ALLOCATOR-INTERVAL-A will be added to the [SP-BEAM](https://sky-atlas.io/#A.3.7.1.2) with the following parameters:

- [max](https://sky-atlas.io/#A.3.7.1.2.1.2): **3,000 basis points**;
- [min](https://sky-atlas.io/#A.3.7.1.2.1.1): **0 basis points**;
- [step](https://sky-atlas.io/#A.3.7.1.2.1.3): **400 basis points**.

#### Add Launch Agent 7 StarGuard Instance

Init new StarGuard module by calling [StarGuardInit.init](https://github.com/sky-ecosystem/star-guard/blob/52239d716a89188b303f137fc43fb9288735ba2e/deploy/StarGuardInit.sol#L44-L63) with:

- [`chainlog`](https://chainlog.sky.money/): `DssExecLib.LOG`;
- `cfg.subProxy`: [0x56a9bA5FE133EF4Ab1131E8ac7c4312a52284f5B](https://etherscan.io/address/0x56a9bA5FE133EF4Ab1131E8ac7c4312a52284f5B);
- `cfg.subProxyKey`: `INTERVAL_SUBPROXY`;
- `cfg.starGuard`: [0xB36e88c02E4619Ef34C0Db76C5BCb6655747FB28](https://etherscan.io/address/0xB36e88c02E4619Ef34C0Db76C5BCb6655747FB28);
- `cfg.starGuardKey`: `INTERVAL_STARGUARD`;
- `cfg.maxDelay`: **7 days**.

INTERVAL_STARGUARD will be added to the [StarGuardJob](https://etherscan.io/address/0xB18d211fA69422a9A848B790C5B4a3957F7Aa44E).

### Monthly Settlement Cycle and Treasury Management Function for January 2026

- **Authorization**: [Atlas - A.2.4 - Sky Core Monthly Settlement Cycle](https://sky-atlas.io/#A.2.4)
- **Proposal**: [Forum Post](https://forum.sky.money/t/msc-5-settlement-summary-january-2026-spark-and-grove/27709/4)

If this executive proposal passes, then the January Monthly Settlement Cycle will be executed by taking the following steps.

#### Spark

- Mint **8,079,210 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Send **1,387,824 USDS** from the Surplus Buffer to the SPARK_SUBPROXY located at [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **6,205,320 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.
- Send **6,090 USDS** from the Surplus Buffer to the GROVE_SUBPROXY located at [0x1369f7b2b38c76B6478c0f0E66D94923421891Ba](https://etherscan.io/address/https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Obex

- Mint **2,095,775 USDS debt** in ALLOCATOR-OBEX-A and transfer the amount to the Surplus Buffer.
- Send **71,342 USDS** from the surplus buffer to the OBEX_SUBPROXY located at [0x8be042581f581E3620e29F213EA8b94afA1C8071](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Treasury Management Function

- Transfer **4,808,248 USDS** from the Surplus Buffer to the Core Council Buffer located at [0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).
- Transfer **240,412 USDS** from the Surplus Buffer to the Aligned Delegates Buffer located at [0x37FC5d447c8c54326C62b697f674c93eaD2A93A3](https://etherscan.io/address/0x37FC5d447c8c54326C62b697f674c93eaD2A93A3).

### LSSKY->SKY Staking Rewards Normalization

- **Authorization**: [Atlas - A.4.4.1.4.2.1.3.3 - Vesting Stream Parameter Modification](https://sky-atlas.io/#A.4.4.1.4.2.1.3.3), [Core Facilitator Approval](https://forum.sky.money/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/2)

If this executive proposal passes, then the distribution of SKY token rewards to SKY stakers will be normalized as per [A.4.4.1.4.2 - Short Term SKY Rewards For SKY Stakers](https://sky-atlas.io/#A.4.4.1.4.2), by executing the following actions:

- Distribute the remaining tokens from the old stream by calling `VestedRewardsDistribution.distribute()` on [REWARDS_DIST_LSSKY_SKY](https://etherscan.io/address/0x675671a8756ddb69f7254afb030865388ef699ee).
- Create a new [MCD_VEST_SKY_TREASURY](https://etherscan.io/address/0x67eaDb3288cceDe034cE95b0511DCc65cf630bB6) stream with the following parameters:
  - `res`: **1 (restricted)**;
  - `vestBgn`: **`block.timestamp`**;
  - `vestTau`: **`block.timestamp` + 180 days**;
  - `tot`: **838,182,330 SKY**.
- Adjust the Sky allowance for [MCD_VEST_SKY_TREASURY](https://etherscan.io/address/0x67eadb3288ccede034ce95b0511dcc65cf630bb6), reducing it by the remaining yanked stream amount and increasing it by the new stream total.
- `yank` [MCD_VEST_SKY_TREASURY](https://etherscan.io/address/0x67eadb3288ccede034ce95b0511dcc65cf630bb6) vest with ID 8.
- `file` the new stream ID on [REWARDS_DIST_LSSKY_SKY](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e).

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark Proxy Spell at [0xf655F6E7843685BfD8cfA4523d43F2b9922BBd77](https://etherscan.io/address/0xf655F6E7843685BfD8cfA4523d43F2b9922BBd77) with the codehash `0x56ca6d051fe05ba6a2b3f054aad61ce93e69542faf2ad02b9881bc1c03c8d2bf` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove Proxy Spell at [0xa2BDc0375Fc1C1343f7F6bf6c34c0263df1F0DB8](https://etherscan.io/address/0xa2BDc0375Fc1C1343f7F6bf6c34c0263df1F0DB8) with the codehash `0x2b804a603fbbe25d00f8c19af41fc549b18131f51a30e3e73d1eea55fe994689` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark

##### [Mainnet] Spark Treasury - Spark Foundation Grant for March 

- **Authorization**: [Atlas - A.2.8.2.2.2.5.5.2 - Spark Foundation Grant Authorization: December 2025](https://sky-atlas.io/#A.2.8.2.2.2.5.5.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

**1.1 million USDS** will be transferred to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec).

##### [Mainnet] Spark Treasury - SPK Buybacks Transfer for February 2026

- **Authorization**: [Atlas - A.6.1.1.1.3.4.2.3.2 - Operational Process](https://sky-atlas.io/#A.6.1.1.1.3.4.2.3.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

**571,957 USDS** will be transferred to the Spark Operations Multisig at [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

##### [Mainnet] SparkLend - Claim Reserves

- **Authorization**: [Atlas - A.6.1.1.1.2.6.1.2.1.2.3 - Token Claim Authorization](https://sky-atlas.io/#A.6.1.1.1.2.6.1.2.1.2.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

SparkLend reserves will be claimed as follows:

- Claim all reserves.
- Transfer non-USD stablecoin reserves to Spark Operations Multisig at [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to be liquidated.

##### [Mainnet] Spark Liquidity Layer - Increase Rate Limit for SparkLend USDT

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xdc1931c6f37149183ae2f15b61f56621d5091d1ce4469ad95cc6cdd33963db8c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

The SparkLend USDT [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters will be increased as follows:

- Deposits:
  - maxAmount: Increase by 150 million USDT, from 100 million USDT to **250 million USDT**.
  - slope: Increase by 1.8 billion USDT, from 200 million USDT per day to **2 billion USDT per day**.
- Withdrawals:
  - maxAmount: **Unlimited**.

##### [Mainnet] Spark Liquidity Layer - Adjust Rate Limit for Maple syrupUSDT

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xdc1931c6f37149183ae2f15b61f56621d5091d1ce4469ad95cc6cdd33963db8c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

The Maple syrupUSDT [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters will be adjusted as follows:

- Deposits:
  - maxAmount: Decrease by 25 million USDT, from 50 million USDT to **25 million USDT**.
  - slope: Increase by 90 million USDT, from 10 million USDT to **100 million USDT per day**.
- Request Redemption:
  - maxAmount: **50 million USDT**
  - slope: **500 million USDT per day**
- Withdrawals:
  - maxAmount: **Unlimited**

##### [Mainnet] Spark Liquidity Layer - Adjust Rate Limit for Aave Core USDT

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xdc1931c6f37149183ae2f15b61f56621d5091d1ce4469ad95cc6cdd33963db8c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

The Aave Core USDT [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters will be adjusted as follows:

- Deposits:
  - maxAmount: Decrease by 40 million USDT, from 50 million USDT to **10 million USDT**.
  - slope: Increase by 975 millon USDT, from 25 million USDT per day to **1 billion USDT per day**.
- Withdrawals:
  - maxAmount: **Unlimited**.

##### [Mainnet] Spark Liquidity Layer - Onboard with Paxos

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xf1a95e7ddaf2f95008608d7e27d8bed9ba6e9c7c55060e8e595f414d88e6b5c9)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

Paxos will be onboarded to allow Spark Liquidity Layer the ability to directly swap between Paxos issued stablecoins or mint and redeem in exchange for USDC with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- USDC transferAsset (sell USDC to buy PYUSD):
  - maxAmount: **5 million USDC**;
  - slope: **50 million USDC per day**;
  - address: [0xFb1F749024b4544c425f5CAf6641959da31EdF37](https://etherscan.io/address/0xFb1F749024b4544c425f5CAf6641959da31EdF37).
- PYUSD transferAsset (sell PYUSD to buy USDC):
  - maxAmount: **5 million PYUSD**;
  - slope: **200 million PYUSD per day**;
  - address: [0x2f7BE67e11A4D621E36f1A8371b0a5Fe16dE6B20](https://etherscan.io/address/0x2f7BE67e11A4D621E36f1A8371b0a5Fe16dE6B20).
- PYUSD transferAsset (sell PYUSD to buy USDG):
  - maxAmount: **5 million PYUSD**;
  - slope: **50 million PYUSD per day**;
  - address: [0x227B1912C2fFE1353EA3A603F1C05F030Cc262Ff](https://etherscan.io/address/0x227B1912C2fFE1353EA3A603F1C05F030Cc262Ff).
- USDG transferAsset (sell USDG to buy PYUSD):
  - maxAmount: **5 million USDG**;
  - slope: **100 million USDG per day**;
  - address: [0x035b322D0e79de7c8733CdDA5a7EF8b51a6cfcfa](https://etherscan.io/address/0x035b322D0e79de7c8733CdDA5a7EF8b51a6cfcfa).

##### [Mainnet] Spark Liquidity Layer - Onboard Morpho v2 USDT Vault

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x29be63afc3b7495581259401c68e6dd892e0a8870a45ad66b2d7b224f4b33dde)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-spark-for-upcoming-spell/27719)

The Morpho v2 USDT Vault will be onboarded to the Spark Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- Morpho vault configuration:
  - Address: [0xc7CDcFDEfC64631ED6799C95e3b110cd42F2bD22](https://etherscan.io/address/0xc7CDcFDEfC64631ED6799C95e3b110cd42F2bD22);
  - Allocator: [0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178](https://etherscan.io/address/0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178) (ALM Proxy Freezable);
  - Curator: [0x0f963A8A8c01042B69054e787E5763ABbB0646A3](https://etherscan.io/address/0x0f963A8A8c01042B69054e787E5763ABbB0646A3);
  - Sentinel (Guardian): [0xf5748bBeFa17505b2F7222B23ae11584932C908B](https://etherscan.io/address/0xf5748bBeFa17505b2F7222B23ae11584932C908B);
  - Owner: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (SubDAO Proxy).
- SLL configuration:
  - Deposits:
    - maxAmount: **50 million USDT**;
    - slope: **1 billion USDT per day**.
  - Withdrawals:
    - maxAmount: **Unlimited**.

#### Grove

##### [Base] Onboard Steakhouse Prime Instant USDC Morpho Vault V2

- **Authorization**: [Governance Poll 1618](https://vote.sky.money/polling/QmcxUENd)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-grove-for-upcoming-spell/27712)

The Steakhouse Prime Instant USDC Morpho Vault V2 will be onboarded to the Grove Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- Steakhouse Prime Instant USDC V2: [0xbeef0e0834849aCC03f0089F01f4F1Eeb06873C9](https://basescan.org/address/0xbeef0e0834849aCC03f0089F01f4F1Eeb06873C9):
  - Underlying Asset: **USDC**.
  - Deposits:
    - maxAmount: **20 million USDC**;
    - slope: **20 million USDC per day**.
  - Withdraws:
    - Amount: **Unlimited**.
  - Max Exchange Rate:
    - `setMaxExchangeRate(STEAKHOUSE_PRIME_INSTANT_USDC_V2, 1e18, 2e6)`.

##### [Mainnet] Onboard Galaxy Warehouse

- **Authorization**: [Governance Poll 1618](https://vote.sky.money/polling/QmcxUENd)
- **Proposal**: [Forum Post](https://forum.sky.money/t/february-26-2026-proposed-changes-to-grove-for-upcoming-spell/27712)

Galaxy Warehouse will be onboarded to the Grove Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- USDC: [0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48](https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48):
  - ERC20Transfers:
    - Destination: [0x3E23311f9FF660E3c3d87E4b7c207b3c3D7e04f0](https://etherscan.io/address/0x3E23311f9FF660E3c3d87E4b7c207b3c3D7e04f0);
    - maxAmount: **50 million USDC**;
    - slope: **50 million USDC per day**;
    - Withdraws: **Unlimited**.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

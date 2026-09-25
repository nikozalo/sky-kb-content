---
title: Template - [Executive Vote] Enable Osero cBEAM, Adjust ALLOCATOR-GROVE-A DC-IAM Parameters, DAO Resolution for RWA009-A, Prime Agent Proxy Spells - September 24, 2026
summary: Enable the cBEAM for Osero's DPAU, adjust DC-IAM parameters for the ALLOCATOR-GROVE-A vault, approve a DAO Resolution for RWA009-A, whitelist Prime Agent proxy spells for Spark, Grove, and Osero
date: 2026-09-24T00:00:00.000Z
address: "0xF01b594aF26fC8A8ae1e24DCaF904ECB6Fd1BaDC"
---

# [Executive Proposal] Enable Osero cBEAM, Adjust ALLOCATOR-GROVE-A DC-IAM Parameters, DAO Resolution for RWA009-A, Prime Agent Proxy Spells - September 24, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Configurator Bounded External Access Module (cBEAM) for Osero's Diamond Parallelized Allocation Unit (DPAU) will be enabled.
- Debt Ceiling Instant Access Module (DC-IAM) parameters for ALLOCATOR-GROVE-A will be adjusted.
- A DAO Resolution pertaining to RWA009-A (HVBank) will be approved.
- Proxy spells for Spark, Grove, and Osero will be whitelisted in the respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Enable Osero cBEAM

- **Authorization**: [Governance Poll 1650](https://vote.sky.money/polling/QmeXvxdN)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-of-the-oseros-cbeam-activation/28239), [Atlas Edit Weekly Cycle Proposal](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-09-21/28241)

If this executive proposal passes, then the Osero cBEAM will be enabled on the relevant DPAU through the following actions:

- Call [beamState.addCBeam](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/src/BeamState.sol#L210-L213) with the following arguments:
  - `address cBeam`: [0x42D1038017E466b413aa44Ae798E30FB80b2E180](https://etherscan.io/address/0x42D1038017E466b413aa44Ae798E30FB80b2E180)
- Call [beamState.addRateLimits](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/src/BeamState.sol#L186-L189) with the following arguments:
  - `address rateLimits_`: [0xE9a78f34fe497e2186f81B8c014cd93B308BC62a](https://etherscan.io/address/0xE9a78f34fe497e2186f81B8c014cd93B308BC62a)
- Call [beamState.setCBeamForRateLimits](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/src/BeamState.sol#L225-L230) with the following arguments:
  - `address rateLimits_`: [0xE9a78f34fe497e2186f81B8c014cd93B308BC62a](https://etherscan.io/address/0xE9a78f34fe497e2186f81B8c014cd93B308BC62a)
  - `address cBeam`: [0x42D1038017E466b413aa44Ae798E30FB80b2E180](https://etherscan.io/address/0x42D1038017E466b413aa44Ae798E30FB80b2E180)
- Call [beamState.addController](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/src/BeamState.sol#L198-L201) with the following arguments:
  - `address controller`: [0x24169Afb34fAe4D4356BC54Bd80319131e35ca38](https://etherscan.io/address/0x24169Afb34fAe4D4356BC54Bd80319131e35ca38)
- Call [beamState.setCBeamForController](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/src/BeamState.sol#L237-L242) with the following arguments:
  - `address controller`: [0x24169Afb34fAe4D4356BC54Bd80319131e35ca38](https://etherscan.io/address/0x24169Afb34fAe4D4356BC54Bd80319131e35ca38)
  - `address cBeam`: [0x42D1038017E466b413aa44Ae798E30FB80b2E180](https://etherscan.io/address/0x42D1038017E466b413aa44Ae798E30FB80b2E180)

### Adjust ALLOCATOR-GROVE-A DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [Core GovOps Request](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-grove-for-upcoming-spell/28229/9)

If this executive proposal passes, then the following DC-IAM parameters will be updated for Grove's DPAU-linked vault (`ALLOCATOR-GROVE-A`):

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 400 million USDS, from 100 million USDS to **500 million USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 10 million USDS, from 15 million USDS to **25 million USDS**.
- Leave the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) unchanged at **43,200 seconds** (12 hours).

### DAO Resolution for RWA009-A

- **Authorization**: [Core Facilitator Approval](https://forum.skyeco.com/t/huntingdon-valley-bank-transaction-documents-on-permaweb/16264/33)
- **Proposal**: [Steakhouse Proposal](https://forum.skyeco.com/t/huntingdon-valley-bank-transaction-documents-on-permaweb/16264/32)

If this executive proposal passes, then the DAO Resolution pertaining to RWA009-A (HVBank) with IPFS hash [bafkreickfbtcslmburi6s4q6br6hn3j2cgdykf3ekv5i46r622vo3jzznm](https://gateway.pinata.cloud/ipfs/bafkreickfbtcslmburi6s4q6br6hn3j2cgdykf3ekv5i46r622vo3jzznm) will be approved.

This will facilitate the return of accrued loan and cash interest totaling USD 2,204,481.65, to be converted to DAI, to the Sky Protocol.

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0xdE40689816DA168b0A56f8F22CBD7FfCFA403E6B`](https://etherscan.io/address/0xdE40689816DA168b0A56f8F22CBD7FfCFA403E6B) and codehash `0xf5148b6a9fccbde7f225f4f098c28a112c065205a6bc321418154d41aa384bda` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0xFB1DEBB9CD8eD442103092C6aCd9ACC231224CFb`](https://etherscan.io/address/0xFB1DEBB9CD8eD442103092C6aCd9ACC231224CFb) and codehash `0x0106daf3bc397e10d8ee0b19996928b7a046d1f31bd31dba04c5cc2b2ea84fa6` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then an Osero proxy spell with address [`0xA061628c7f7bD95f571fd41f645746cC0d22f812`](https://etherscan.io/address/0xA061628c7f7bD95f571fd41f645746cC0d22f812) and codehash `0x0c01396cee9cf147f0e4e5a715bf14326a81cd0e11c31d96c963d47bba52f4d8` will be whitelisted in the [Osero StarGuard](https://etherscan.io/address/0xBfA2D1dA838E55A74c61699e164cDFF8cF0cF0e2).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/196).

##### [Ethereum] Spark Treasury - Transfer the October 2026 Monthly Grants to the Spark Foundation and the Spark Assets Foundation

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#1deecbd9-c3d8-45c4-a407-28386735833d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-spark-for-upcoming-spell/28237)

If this executive proposal passes, then the Spark proxy spell will transfer **865,000 USDS** and **45,000 USDS** from the Spark SubProxy to the [Spark Foundation](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec) and the [Spark Assets Foundation](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911) respectively.

##### [Ethereum] Spark Treasury - Transfer USDS to the Buyback Executor to Fund SPK Buybacks

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#dfa483c7-5adb-480e-9f82-c97cf4d0f74e)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-spark-for-upcoming-spell/28237)

If this executive proposal passes, then the Spark proxy spell will transfer **972,485 USDS** from the Spark SubProxy to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to fund SPK buybacks.

##### [Ethereum] SparkLend - Claim Accrued SparkLend Reserves and Route Them to the Spark Liquidity Layer and the Spark Operations Multisig

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-spark-for-upcoming-spell/28237)

If this executive proposal passes, then the Spark proxy spell will claim all accrued SparkLend reserves and transfer them as follows:

- DAI, USDS, PYUSD, RLUSD, USDC, USDG, and USDT reserves will be transferred to the [Spark ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).
- All other reserves will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/78).

##### [Ethereum] Treasury Distribution — 800,000 USDS to the Grove Foundation Multisig

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#bd2d15af-e32a-4ce9-a7ac-5a5ff1665fd4)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-grove-for-upcoming-spell/28229)

If this executive proposal passes, then the Grove proxy spell will transfer **800,000 USDS** from the Grove SubProxy to the [Grove Foundation Multisig](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

##### [Ethereum] Set the Grove DPAU Unwind Rate Limits - USDS Burn and the USDC-to-USDS Swap - to Unlimited

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x4713e4045e8780272aa56f483e54075566b2bdb66df8ed2c9beb6d5086bcbf73)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-grove-for-upcoming-spell/28229)

If this executive proposal passes, then the Grove proxy spell will set the [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) for USDS burn and USDC-to-USDS swaps as follows:

- USDS Burn:
  - `maxAmount`: **Unlimited**
- USDC-to-USDS Swap:
  - `maxAmount`: **Unlimited**

##### [Base] Onboard the New Grove × Steakhouse USDC Morpho Vault on Base with ERC-4626 Deposit and Withdrawal Rate Limits, and Set Its Maximum Exchange Rate

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x014c93a287ea15d98148e0418f5262efa9a7c4c4ec8b8d3505cfac68674b3944)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-grove-for-upcoming-spell/28229)

If this executive proposal passes, then the Grove proxy spell will onboard the [Grove × Steakhouse USDC Morpho Vault](https://basescan.org/address/0xbeef0786756810478b88982DE00F3CD7fdB8e7c7) on Base with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Deposit rate limit:
  - `maxAmount`: **20 million USDC**
  - `slope`: **20 million USDC per day**
- Withdrawal rate limit:
  - `maxAmount`: **Unlimited**
- Maximum exchange rate: **1.15 USDC per vault share**

#### Osero Proxy Spell

The Pull Request for the Osero proxy spell can be viewed [here](https://github.com/osero-io/osero-spells/pull/4).

##### [Ethereum] Authorize the Sky Parallelized Allocation System (PAS) Configurator on the Existing Osero Diamond PAU

- **Authorization**: [Governance Poll 1649](https://vote.sky.money/polling/Qmbk7ZFS)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-osero-for-upcoming-spell/28224)

If this executive proposal passes, the Sky PAS Configurator will be authorized on the Osero DPAU through the following actions:

- Grant `DEFAULT_ADMIN_ROLE` on the Osero [`AccessControls`](https://etherscan.io/address/0x791D2a017532CfAD881c446e6bF93BbC3c0778b2) to the [Sky PAS Configurator](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929).
- Grant `DEFAULT_ADMIN_ROLE` on the Osero [ALM Rate Limits contract (`RateLimits`)](https://etherscan.io/address/0xE9a78f34fe497e2186f81B8c014cd93B308BC62a) to the [Sky PAS Configurator](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929).

##### [Ethereum] Increase the USDS Mint and SparkLend USDS Deposit Rate Limits

- **Authorization**: [Governance Poll 1649](https://vote.sky.money/polling/Qmbk7ZFS)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-24-2026-proposed-changes-to-osero-for-upcoming-spell/28224)

If this executive proposal passes, the [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) for USDS mint and SparkLend USDS deposits will be increased to the following values:

- USDS mint:
  - `maxAmount`: **50 million USDS**
  - `slope`: **50 million USDS per day**
- SparkLend USDS deposit:
  - `maxAmount`: **50 million USDS**
  - `slope`: **50 million USDS per day**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

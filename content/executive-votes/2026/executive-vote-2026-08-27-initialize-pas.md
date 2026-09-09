---
title: Template - [Executive Vote] PAS Initialization, Funding Transfer, Allocator Vault Parameter Updates, Rename Chainlog Key, Update Safe Harbor Agreement, Prime Agent Proxy Spells - August 27, 2026
summary: Initialize the Parallelized Allocation System, transfer funds from Ozone SubProxy to SFF, update DC-IAM parameters for two Allocator vaults, rename a Chainlog key, update the Safe Harbor Agreement, whitelist Spark and Grove Proxy Spells.
date: 2026-08-27T00:00:00.000Z
address: "0x2bf5132EC2F21B079D7591c86D9817f1f18a2E05"
---

# [Executive Proposal] PAS Initialization, Funding Transfer, Allocator Vault Parameter Updates, Rename Chainlog Key, Update Safe Harbor Agreement, Prime Agent Proxy Spells - August 27, 2026

The Core Facilitator, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Parallelized Allocation System (PAS) module will be initialized.
- **16 million USDS** will be transferred from Ozone's SubProxy to Sky Frontier Foundation.
- Debt Ceiling Instant Access Module (DC-IAM) parameters for ALLOCATOR-GROVE-A and ALLOCATOR-PRYSM-A will be updated.
- A Chainlog key will be renamed.
- The Safe Harbor Agreement will be updated.
- Prime Agent Proxy Spells will be whitelisted for Spark and Grove in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Parallelized Allocation System Module Initialization

- **Authorization**: [Governance poll 1647](https://vote.sky.money/polling/Qmas6XKB), [Governance poll 1646](https://vote.sky.money/polling/QmcTCPuC)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-of-the-parallelized-allocation-system-pas-module/28188)

If this executive proposal passes, then the Parallelized Allocation System (PAS) module will be initialized through the following actions:

- Call [PASInit.init](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/deploy/PASInit.sol#L94-L148) with the following arguments:
  - `address pasInstance.beamState`
    - Argument value: [0x1A1879E66547F90bfF87D45A5b0335950E019E02](https://etherscan.io/address/0x1A1879E66547F90bfF87D45A5b0335950E019E02)
  - `address pasInstance.configurator`
    - Argument value: [0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929)
  - `address pasInstance.timelock`
    - Argument value: [0xB50a06Af02dDE44dB6EA7ee729403848c2B35293](https://etherscan.io/address/0xB50a06Af02dDE44dB6EA7ee729403848c2B35293)
  - `uint256 minDelay`
    - Argument value: **14 days** (or 1,209,600 seconds)
  - `address coreCouncil`
    - Argument value: [0x148eF923d764CBdc1597CcADBbbC66499C1A1432](https://etherscan.io/address/0x148eF923d764CBdc1597CcADBbbC66499C1A1432)
  - `address[] cancellers`
    - Argument value: [] (intentionally empty array)
  - `address[] pausers`
    - Argument value: [] (intentionally empty array)
- Call [PASInit.addCoreToChainlog](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/deploy/PASInit.sol#L218-L228) with the following arguments:
  - `address pasInstance.beamState`
    - Argument value: [0x1A1879E66547F90bfF87D45A5b0335950E019E02](https://etherscan.io/address/0x1A1879E66547F90bfF87D45A5b0335950E019E02)
  - `address pasInstance.configurator`
    - Argument value: [0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929)
  - `address pasInstance.timelock`
    - Argument value: [0xB50a06Af02dDE44dB6EA7ee729403848c2B35293](https://etherscan.io/address/0xB50a06Af02dDE44dB6EA7ee729403848c2B35293)
  - `bytes32 stateKey`
    - Argument value: **`PAS_STATE`**
  - `bytes32 configuratorKey`
    - Argument value: **`PAS_CONFIGURATOR`**
  - `bytes32 timelockKey`
    - Argument value: **`PAS_TIMELOCK`**
- Call [PASInit.initMom](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/deploy/PASInit.sol#L230-L257) with the following arguments:
  - `address pasInstance.beamState`
    - Argument value: [0x1A1879E66547F90bfF87D45A5b0335950E019E02](https://etherscan.io/address/0x1A1879E66547F90bfF87D45A5b0335950E019E02)
  - `address pasInstance.configurator`
    - Argument value: [0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929)
  - `address pasInstance.timelock`
    - Argument value: [0xB50a06Af02dDE44dB6EA7ee729403848c2B35293](https://etherscan.io/address/0xB50a06Af02dDE44dB6EA7ee729403848c2B35293)
  - `address mom_`
    - Argument value: [0xD44B8d01D5207aA792C666d0A712A1A161CD6171](https://etherscan.io/address/0xD44B8d01D5207aA792C666d0A712A1A161CD6171)
  - `bytes32 key`
    - Argument value: **`PAS_MOM`**
- Call [PASInit.initExtras](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/deploy/PASInit.sol#L163-L193) with the following arguments:
  - `address pasInstance.beamState`
    - Argument value: [0x1A1879E66547F90bfF87D45A5b0335950E019E02](https://etherscan.io/address/0x1A1879E66547F90bfF87D45A5b0335950E019E02)
  - `address pasInstance.configurator`
    - Argument value: [0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929)
  - `address pasInstance.timelock`
    - Argument value: [0xB50a06Af02dDE44dB6EA7ee729403848c2B35293](https://etherscan.io/address/0xB50a06Af02dDE44dB6EA7ee729403848c2B35293)
  - `uint256 hop`
    - Argument value: **16 hours** (or 57,600 seconds)
  - `uint256 maxChange`
    - Argument value: **1.20** (i.e. a maximum increase of 20% per eligible step)
  - `address[] memory rateLimits`
    - Argument value: A single address [0xE016Ae733A77Ba77E7907aAA749394Fc5e75C0e1](https://etherscan.io/address/0xE016Ae733A77Ba77E7907aAA749394Fc5e75C0e1)
  - `address[] memory controllers`
    - Argument value: A single address [0xbf83F5974B932c7D842254042717D6A2706CE5eE](https://etherscan.io/address/0xbf83F5974B932c7D842254042717D6A2706CE5eE)
  - An array of `cBeamConfigs` with a single item
    - `address cBeamConfigs[0].cBeam`
      - Argument value: [0x91dC2F6DbB8Adf76d373A54D408EDd7D736046C4](https://etherscan.io/address/0x91dC2F6DbB8Adf76d373A54D408EDd7D736046C4)
    - `address[] cBeamConfigs[0].rateLimits`
      - Argument value: A single address [0xE016Ae733A77Ba77E7907aAA749394Fc5e75C0e1](https://etherscan.io/address/0xE016Ae733A77Ba77E7907aAA749394Fc5e75C0e1)
    - `address[] cBeamConfigs[0].controllers`
      - Argument value: A single address [0xbf83F5974B932c7D842254042717D6A2706CE5eE](https://etherscan.io/address/0xbf83F5974B932c7D842254042717D6A2706CE5eE)
- Call [PASInit.pauseTimelock](https://github.com/sky-ecosystem/pas/blob/947e71cd5dbaaf9c5b3840dd1b23e8e99d9a564d/deploy/PASInit.sol#L150-L161) with the following arguments:
  - `address timelock_`
    - Argument value: [0xB50a06Af02dDE44dB6EA7ee729403848c2B35293](https://etherscan.io/address/0xB50a06Af02dDE44dB6EA7ee729403848c2B35293)
  - `address admin`
    - Argument value: [0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB)

### Transfer Funds From Ozone SubProxy to Sky Frontier Foundation

- **Authorization**: [A.2.8.2.9.2.2](https://sky-atlas.io/#9bb85c21-96a3-4f0a-baab-1c3fe340871d)
- **Proposal**: [Agent Request](https://forum.skyeco.com/t/technical-scope-for-transferring-funds-from-the-subproxy/28004/7)

If this executive proposal passes, then [`SUBPROXY_METHODS`](https://etherscan.io/address/0x5162489F4FEa651b76c75193387d08aAAC9CB52C) will be executed in [`OZONE_SUBPROXY`](https://etherscan.io/address/0x9FE628BFc33f0352Bb1f93168881a9Ef93C8d2CF) to transfer **16 million USDS** to Sky Frontier Foundation at [`0xca5183FB9997046fbd9bA8113139bf5a5Af122A0`](https://etherscan.io/address/0xca5183FB9997046fbd9bA8113139bf5a5Af122A0).

### Increase ALLOCATOR-GROVE-A DC-IAM Parameters

- **Authorization**: [A.3.7.1.2.2](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [Prime Request](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-grove-for-upcoming-spell/28164/10)

If this executive proposal passes, then the following DC-IAM parameters will be updated for `ALLOCATOR-GROVE-A`:

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 15 million USDS from 10 million USDS to **25 million USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 3 million USDS from 2 million USDS to **5 million USDS**.
- Leave the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) unchanged at **86,400 seconds** (24 hours).

### Increase ALLOCATOR-PRYSM-A DC-IAM Parameters

- **Authorization**: [A.3.7.1.2.2](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [Prime Request](https://forum.skyeco.com/t/aug-27-2026-osero-requested-changes-to-allocator-vault-parameters/28186)

If this executive proposal passes, then the following DC-IAM parameters will be updated for `ALLOCATOR-PRYSM-A`:

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 15 million USDS from 10 million USDS to **25 million USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 3 million USDS from 2 million USDS to **5 million USDS**.
- Leave the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) unchanged at **86,400 seconds** (24 hours).

### Rename Chainlog Key

- **Authorization**: [A.1.11.1.5.1](https://sky-atlas.io/#0d0e2e1a-0502-4ee3-bc9d-8bd8ddde19ec)
- **Proposal**: [Core Facilitator Post](https://forum.skyeco.com/t/proposed-housekeeping-item-2026-08-27-executive-vote/28194)

If this executive proposal passes, then `OWNER_REWARDS_LSSKY_USDS` will be renamed to **`REWARDS_OWNER_LSSKY_USDS`** in the [Chainlog](https://chainlog.skyeco.com).

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, the Safe Harbor agreement will be updated to include the four following PAS contracts added by this spell:

- [PAS_STATE](https://etherscan.io/address/0x1A1879E66547F90bfF87D45A5b0335950E019E02)
- [PAS_CONFIGURATOR](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929)
- [PAS_TIMELOCK](https://etherscan.io/address/0xB50a06Af02dDE44dB6EA7ee729403848c2B35293)
- [PAS_MOM](https://etherscan.io/address/0xD44B8d01D5207aA792C666d0A712A1A161CD6171)

The previously deactivated [REWARDS_LSSKY_USDS](https://etherscan.io/address/0x38E4254bD82ED5Ee97CD1C4278FAae748d998865) farm will also be added to the Safe Harbor Agreement now that it is active again.

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0xbE35b15Cda9002C1719A9D254B158613BDdE72af`](https://etherscan.io/address/0xbE35b15Cda9002C1719A9D254B158613BDdE72af) and codehash `0xd3d82d87849aa5a7df3105bac5e97518999288f8ce91ed80c83031a058a2fcf8` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0xF3d4F600640a87F4203DF0A554642228a119711e`](https://etherscan.io/address/0xF3d4F600640a87F4203DF0A554642228a119711e) and codehash `0x89f28b693c551c87c8dbd632484c39e8e5e1ac040696ed7839776ba3beae23c5` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/183).

##### [Ethereum] SparkLend - Onboard USDG

- **Authorization**: [Atlas](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-spark-for-upcoming-spell/28181)

If this executive proposal passes, then USDG will be onboarded to SparkLend with the following addresses and parameters:

- Addresses
  - USDG token: Ethereum.USDG ([0xe343167631d89B6Ffc58B88d6b7fB0228795491D](https://etherscan.io/address/0xe343167631d89B6Ffc58B88d6b7fB0228795491D))
  - USDG spToken (aToken): [0x6f335538257ef440F3c51e925a5C820f722a1F9F](https://etherscan.io/address/0x6f335538257ef440F3c51e925a5C820f722a1F9F) (will be deterministically deployed to this address as part of spell at nonce 55)
  - USDG price feed / oracle: [0x42a03F81dd8A1cEcD746dc262e4d1CD9fD39F777](https://etherscan.io/address/0x42a03F81dd8A1cEcD746dc262e4d1CD9fD39F777)
  - USDG interest rate model contract: [0x473fDf9713C9a02A9a9c17173a57d120493F3C6B](https://etherscan.io/address/0x473fDf9713C9a02A9a9c17173a57d120493F3C6B)
- Reserve parameters
  - asset symbol: **USDG**
  - [LTV](https://sky-atlas.io/#586478a3-51cb-4a2e-8bb1-b96e6520fdcc): **0%**
  - [liquidation threshold](https://sky-atlas.io/#2dd2045c-6a33-4229-b6c8-e531d6ecd27a): **0%**
  - [liquidation bonus](https://sky-atlas.io/#173ff961-bf1f-4c6c-992c-4a67b269e544): **0%**
  - [reserve factor](https://sky-atlas.io/#a68d2ffe-e541-4754-b11e-6cafe7b4ae5c): **10%**
  - liquidation protocol fee: **10%**
  - debt ceiling: **0**
  - [supply cap](https://sky-atlas.io/#e222b8da-abda-42f5-8106-20c6f2881dc7): **unlimited**
  - [borrow cap](https://sky-atlas.io/#a2d6a99e-c63a-4f30-87f3-a3d66b1eda92): **unlimited**
  - [cap automator](https://sky-atlas.io/#6ffdb8ee-b083-40f5-b51b-1c91e954b68b): **not configured** (reserve is uncapped)
  - [e-mode category](https://sky-atlas.io/#49159478-90c9-4200-ab33-277a70b924d6): **none**
  - [borrowing enabled](https://sky-atlas.io/#2ec70ad1-f979-4a4a-bce2-cd070e9e283f): **yes**
  - stable rate borrowing: **disabled**
  - [borrowable in isolation](https://sky-atlas.io/#eb779cd6-adeb-490e-b67d-d0854b7a844c): **disabled**
  - [siloed borrowing](https://sky-atlas.io/#f6764325-46d2-4fe4-872e-6e89a1914a5d): **disabled**
  - [flash loans](https://sky-atlas.io/#17d352ee-a54b-43e5-92ee-224a1193c7ee): **enabled**
  - seed deposit amount: **1 USDG**
- Interest rate model
  - [optimal utilization](https://sky-atlas.io/#a6677e8a-7ef1-460b-a5cd-5411319bf2c0): **95%**
  - [base variable borrow rate](https://sky-atlas.io/#9372deb9-5115-4010-bf72-34023b846525): **SSR**
  - [slope 1](https://sky-atlas.io/#c16b2b24-d663-4877-8bb3-cbd32e977360): **0.3%**
  - [slope 2](https://sky-atlas.io/#56bc7808-5ef8-42af-ba17-708b995194cc): **15%**

##### [Ethereum] SparkLend - Onboard RLUSD

- **Authorization**: [Atlas](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-spark-for-upcoming-spell/28181)

If this executive proposal passes, then RLUSD will be onboarded to SparkLend with the following addresses and parameters:

- Addresses
  - RLUSD token: Ethereum.RLUSD ([0x8292Bb45bf1Ee4d140127049757C2E0fF06317eD](https://etherscan.io/address/0x8292Bb45bf1Ee4d140127049757C2E0fF06317eD))
  - RLUSD spToken (aToken): [0x59275Fb72c8004F44BA44432e25082932Fd677f1](https://etherscan.io/address/0x59275Fb72c8004F44BA44432e25082932Fd677f1) (will be deterministically deployed to this address as part of spell at nonce 58)
  - RLUSD price feed / oracle: [0x42a03F81dd8A1cEcD746dc262e4d1CD9fD39F777](https://etherscan.io/address/0x42a03F81dd8A1cEcD746dc262e4d1CD9fD39F777)
  - RLUSD interest rate model contract: [0x473fDf9713C9a02A9a9c17173a57d120493F3C6B](https://etherscan.io/address/0x473fDf9713C9a02A9a9c17173a57d120493F3C6B)
- Reserve parameters
  - asset symbol: **RLUSD**
  - [LTV](https://sky-atlas.io/#586478a3-51cb-4a2e-8bb1-b96e6520fdcc): **0%**
  - [liquidation threshold](https://sky-atlas.io/#2dd2045c-6a33-4229-b6c8-e531d6ecd27a): **0%**
  - [liquidation bonus](https://sky-atlas.io/#173ff961-bf1f-4c6c-992c-4a67b269e544): **0%**
  - [reserve factor](https://sky-atlas.io/#a68d2ffe-e541-4754-b11e-6cafe7b4ae5c): **10%**
  - liquidation protocol fee: **10%**
  - debt ceiling: **0**
  - [supply cap](https://sky-atlas.io/#e222b8da-abda-42f5-8106-20c6f2881dc7): **unlimited**
  - [borrow cap](https://sky-atlas.io/#a2d6a99e-c63a-4f30-87f3-a3d66b1eda92): **unlimited**
  - [cap automator](https://sky-atlas.io/#6ffdb8ee-b083-40f5-b51b-1c91e954b68b): **not configured** (reserve is uncapped)
  - [e-mode category](https://sky-atlas.io/#49159478-90c9-4200-ab33-277a70b924d6): **none**
  - [borrowing enabled](https://sky-atlas.io/#2ec70ad1-f979-4a4a-bce2-cd070e9e283f): **yes**
  - stable rate borrowing: **disabled**
  - [borrowable in isolation](https://sky-atlas.io/#eb779cd6-adeb-490e-b67d-d0854b7a844c): **disabled**
  - [siloed borrowing](https://sky-atlas.io/#f6764325-46d2-4fe4-872e-6e89a1914a5d): **disabled**
  - [flash loans](https://sky-atlas.io/#17d352ee-a54b-43e5-92ee-224a1193c7ee): **enabled**
  - seed deposit amount: **1 RLUSD**
- Interest rate model
  - [optimal utilization](https://sky-atlas.io/#a6677e8a-7ef1-460b-a5cd-5411319bf2c0): **95%**
  - [base variable borrow rate](https://sky-atlas.io/#9372deb9-5115-4010-bf72-34023b846525): **SSR**
  - [slope 1](https://sky-atlas.io/#c16b2b24-d663-4877-8bb3-cbd32e977360): **0.3%**
  - [slope 2](https://sky-atlas.io/#56bc7808-5ef8-42af-ba17-708b995194cc): **15%**

##### [Ethereum] Spark Liquidity Layer - Onboard SparkLend USDG

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xf8a0b03d3638192899495e8d85a272d78f7c61324e3f1c1f320add23ab91bda3)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-spark-for-upcoming-spell/28181)

If this executive proposal passes, then SparkLend USDG will be onboarded to the SLL with the following addresses and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Addresses
  - USDG spToken (aToken): [0x6f335538257ef440F3c51e925a5C820f722a1F9F](https://etherscan.io/address/0x6f335538257ef440F3c51e925a5C820f722a1F9F)
  - controller: [Ethereum.ALM_CONTROLLER](https://etherscan.io/address/0x5c46Fc65855c0C7465a1EA85EEA0B24B601502D3)
  - rate limits: [Ethereum.ALM_RATE_LIMITS](https://etherscan.io/address/0x7A5FD5cf045e010e62147F065cEAe59e5344b188)
- Deposit rate limit:
  - `maxAmount`: **100 million USDG**
  - `slope`: **100 million USDG per day**
- Withdrawal rate limit:
  - `maxAmount`: **unlimited**
- Max slippage:
  - `maxSlippage`: **0.001%** (0.99999e18)

##### [Ethereum] Spark Liquidity Layer - Onboard SparkLend RLUSD

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x01a287ddec297d1ffe1e5c8391431fe1ee1c415e3f7e8b93d437ee9a66f29820)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-spark-for-upcoming-spell/28181)

If this executive proposal passes, then SparkLend RLUSD will be onboarded to the SLL with the following addresses and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Addresses
  - RLUSD spToken (aToken): [0x59275Fb72c8004F44BA44432e25082932Fd677f1](https://etherscan.io/address/0x59275Fb72c8004F44BA44432e25082932Fd677f1)
  - controller: [Ethereum.ALM_CONTROLLER](https://etherscan.io/address/0x5c46Fc65855c0C7465a1EA85EEA0B24B601502D3)
  - rate limits: [Ethereum.ALM_RATE_LIMITS](https://etherscan.io/address/0x7A5FD5cf045e010e62147F065cEAe59e5344b188)
- Deposit rate limit:
  - `maxAmount`: **100 million RLUSD**
  - `slope`: **100 million RLUSD per day**
- Withdrawal rate limit:
  - `maxAmount`: **unlimited**
- Max slippage:
  - `maxSlippage`: **0.001%** (0.99999e18)

##### [Ethereum] Spark Treasury - Grants for Spark Foundation and Spark Asset Foundation

- **Authorization**: [A.2.8.2.2.2.4.5.1.4](https://sky-atlas.io/#8dd2eb27-a760-4287-89cf-7b5bdb0c5d7c)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-spark-for-upcoming-spell/28181)

If this executive proposal passes, then **1.1 million USDS** will be transferred from the Spark SubProxy to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec) and **155,000 USDS** will be transferred from the Spark SubProxy to the Spark Asset Foundation at [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911).

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [A.6.1.1.1.2.6.1.2.1.2.3](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-spark-for-upcoming-spell/28181)

If this executive proposal passes, SparkLend Reserves will be claimed as follows:

- Claim all reserves
- Transfer USD stablecoin reserves to the ALM Proxy: [Ethereum.ALM_PROXY](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E)
- Transfer non-USD-stablecoin reserves to the Spark Operations Multisig to be liquidated: [Ethereum.ALM_OPS_MULTISIG](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC)

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/72).

##### [Ethereum] Treasury Distribution — 800,000 USDS to the Grove Foundation Multisig

- **Authorization**: [Governance Poll 1646](https://vote.sky.money/polling/QmcTCPuC)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-grove-for-upcoming-spell/28164)

If this executive proposal passes, then **800,000 USDS** will be transferred from the Grove SubProxy to the Grove Foundation Multisig at [0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

##### [Ethereum] Raise the UniswapV3 Facet Deposit Rate Limits on the Grove DPAU to the Next Step of the Facet Ramp-Up Plan

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x04f9307629ff22e50d541658790bdfc7d8f2469ece6d1a7585145bbe3b2d4e5b)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-grove-for-upcoming-spell/28164)

If this executive proposal passes, then the deposit [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) for the UniswapV3 Facet AUSD/USDC pool will be adjusted as follows:

- Increase the slope by **350,000 tokens per day** from 0 to **350,000 tokens per day**.
- Leave maxAmount unchanged at **5 million tokens**.

##### [Ethereum] Authorize the Sky PAS Configurator on the Grove DPAU Access-Control Stack

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x760f15647c7ac433a8378b07655e6ab5f48c610f9efd8a925b239f959032d6a6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/august-27-2026-proposed-changes-to-grove-for-upcoming-spell/28164)

If this executive proposal passes, then the Sky Configurator ([PAS_CONFIGURATOR](https://etherscan.io/address/0xb7E61Df6CAb0A51E9A5dab1A7DD3f942dDe5b929)) will be granted admin role on the Grove DPAU [AccessControls](https://etherscan.io/address/0x4F6d1704700cd494DD4cd9bF59c0C39DA1Bc9164) and [RateLimits](https://etherscan.io/address/0xE016Ae733A77Ba77E7907aAA749394Fc5e75C0e1) contracts.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

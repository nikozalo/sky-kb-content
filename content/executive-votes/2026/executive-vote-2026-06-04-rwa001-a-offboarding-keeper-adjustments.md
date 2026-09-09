---
title: Template - [Executive Vote] RWA001-A Offboarding, Keeper Network Adjustments, ALLOCATOR-SPARK-A Parameter Updates, MKR to SKY Delayed Upgrade Penalty Increase, Prime Agent Proxy Spells - June 4, 2026
summary: Spell 1 actions for offboarding RWA001-A, remove Keeper Networks and update protocol name, update ALLOCATOR-SPARK-A DC-IAM risk parameters, increase the MKR to SKY Delayed Upgrade Penalty by 1 percentage point, whitelist proxy spells for Spark and Grove.
date: 2026-06-04T00:00:00.000Z
address: "0x0aE3371e9C4e37515259D124C685fe6722c5e253"
---

# [Executive Proposal] RWA001-A Offboarding, Keeper Network Adjustments, ALLOCATOR-SPARK-A Parameter Updates, MKR to SKY Delayed Upgrade Penalty Increase, Prime Agent Proxy Spells - June 4, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Spell 1 actions for RWA001-A offboarding will be performed.
- The Keeper Network configuration will be updated.
- ALLOCATOR-SPARK-A [DC-IAM parameters](https://sky-atlas.io/#93c9f662-4e0d-477e-8fc9-e3726877e842) will be updated.
- The [MKR-SKY Delayed Upgrade Penalty](https://sky-atlas.io/#ec820ddb-5d12-43d8-81b7-a7602a70332a) will be increased.
- Prime Agent proxy spells for Spark and Grove will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### RWA001-A Offboarding (Spell 1)

- **Authorization**: [Technical Scope Authorization](https://forum.skyeco.com/t/technical-scope-of-rwa001-a-offboarding/27706/7)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/technical-scope-of-rwa001-a-offboarding/27706/5)

If this executive proposal passes, then the Spell 1 actions of the RWA001-A offboarding process will be executed.

The outcome of these actions will be that the USDC received in the PauseProxy will be converted to DAI and used to pay off some of the vault's outstanding debt. The position will be put into a soft liquidation state with a follow-up spell required after a minimum of 30 days to complete the liquidation process.

To mitigate a potential griefing attack that would prevent spell execution, this action will only be executed if the balance of USDC in the PauseProxy is less than the outstanding debt of the RWA001-A position.

Please see the [Technical Scope thread](https://forum.skyeco.com/t/technical-scope-of-rwa001-a-offboarding/27706) for further details.

#### Temporarily Update LITE-PSM-USDC-A AutoLine Parameters

- Call `DssExecLib.setIlkAutoLineDebtCeiling` with:
  - `bytes32 ilk` being `"LITE-PSM-USDC-A"`
  - `uint256 amount` being `10_014_319_244`

#### Force Updated AutoLine Parameters into the Vat Debt Ceiling

- Call `MCD_IAM_AUTO_LINE.exec` for `LITE-PSM-USDC-A`.

#### Fill the LITE-PSM-USDC-A Buffer

- Call `LITE_PSM_USDC_A.fill()` only if `LITE_PSM_USDC_A.rush()` > 0.

#### Approve `LITE_PSM_USDC_A` to pull USDC

- Call `USDC.approve` with:
  - `address spender` being `LITE_PSM_USDC_A`;
  - `uint256 amount` being `14_319_243_510000`, i.e. exactly 14,319,243.51 USDC using 6 decimals.

#### Convert Returned USDC to DAI

- Call `LITE_PSM_USDC_A.sellGemNoFee` with:
  - `LITE_PSM_USDC_A` being [0xf6e72Db5454dd049d0788e411b06CfAF16853042](https://etherscan.io/address/0xf6e72Db5454dd049d0788e411b06CfAF16853042);
  - `address usr` being `RWA001_A_URN`;
  - `uint256 gemAmt` being `14_319_243_510000`, i.e. exactly **14,319,243.51 USDC** using 6 decimals

#### Restore the Original `LITE-PSM-USDC-A` AutoLine Parameters

- Call `DssExecLib.setIlkAutoLineDebtCeiling` with:
  - `bytes32 ilk` being `"LITE-PSM-USDC-A"`
  - `uint256 amount` being `10_000_000_000`

#### Re-execute `MCD_IAM_AUTO_LINE` for `LITE-PSM-USDC-A`

- Call `MCD_IAM_AUTO_LINE.exec` with:
  - `bytes32 ilk` being `"LITE-PSM-USDC-A"`

#### Repay `RWA001_A_URN` Debt

- Call `RWA001_A_URN.wipe` with:
  - `RWA001_A_URN` being [0xa3342059BcDcFA57a13b12a35eD4BBE59B873005](https://etherscan.io/address/0xa3342059BcDcFA57a13b12a35eD4BBE59B873005)
  - `uint256 wad` being the DAI amount returned by `LITE_PSM_USDC_A.sellGemNoFee(RWA001_A_URN, gemAmt)`.

#### Set the `RWA001-A` Debt Ceiling to Zero

- Call `DssExecLib.setIlkDebtCeiling` with:
  - `bytes32 ilk` being `"RWA001-A"`
  - `uint256 amount` being `0`

#### Start Soft Liquidation

- Call `MIP21_LIQUIDATION_ORACLE.tell` with:
  - `MIP21_LIQUIDATION_ORACLE` being [0x88f88Bb9E66241B73B84f3A6E197FbBa487b1E30](https://etherscan.io/address/0x88f88Bb9E66241B73B84f3A6E197FbBa487b1E30)
  - `bytes32 ilk` being `"RWA001-A"`

### Keeper Network Adjustments

- **Authorization**: [Governance Poll 1626](https://vote.sky.money/polling/QmafyxBw)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/technical-scope-of-keeper-network-adjustments/27947)

If this executive proposal passes, then the Keeper Network configuration will be updated through the following actions.

#### Remove GELATO Keeper Lane

- Remove the `GELATO` lane from `CRON_SEQUENCER`.
- Disable the claim path for the Gelato adapter located at [0x0B5a34D084b6A5ae4361de033d1e6255623b41eD](https://etherscan.io/address/0x0B5a34D084b6A5ae4361de033d1e6255623b41eD).

#### Remove KEEP3R Keeper Lane

- Remove the `KEEP3R` lane from `CRON_SEQUENCER`.
- Disable the claim path for the Keep3r adapter located at [0xaeFed819b6657B3960A8515863abe0529Dfc444A](https://etherscan.io/address/0xaeFed819b6657B3960A8515863abe0529Dfc444A).

#### Rename MAKER Lane

- Rename the `MAKER` lane to `SKY`.

### ALLOCATOR-SPARK-A DC-IAM Parameter Updates

- **Authorization**: [Atlas - A.3.7.1.2.2 - Update Process](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

If this executive proposal passes, then the ALLOCATOR-SPARK-A [DC-IAM parameters](https://sky-atlas.io/#93c9f662-4e0d-477e-8fc9-e3726877e842) will be updated as follows:

- Increase `gap` by 1 billion USDS, from 500 million USDS to **1.5 billion USDS**.
- Decrease `ttl` by 12 hours, from 24 hours to **12 hours**.
- Keep `line` unchanged at **10 billion USDS**.

### MKR to SKY Delayed Upgrade Penalty Increase

- **Authorization**: [Atlas - A.4.1.2.1.1.1.1 - MKR To SKY Upgrade Penalty](https://sky-atlas.io/#ec820ddb-5d12-43d8-81b7-a7602a70332a)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/delayed-migration-penalty-update-june-4th-spell/27940)

If this executive proposal passes, then the Delayed Upgrade Penalty applied to [MKR to SKY conversions](https://etherscan.io/address/0xA1Ea1bA18E88C381C724a75F23a130420C403f9a) will increase by 1 percentage point, from 3% to **4%**.

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0xAb385eC0Df225D5A37F5245D2aE43D53Fe4Fed20`](https://etherscan.io/address/0xAb385eC0Df225D5A37F5245D2aE43D53Fe4Fed20) and codehash `0x7801a877c029ce6ec7dcde0d16183eef2f81fd6e8fbd04a6433f0d6c3c0ed267` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0xbE5E67C516074ba0807A3535035868cE7F2Bd372`](https://etherscan.io/address/0xbE5E67C516074ba0807A3535035868cE7F2Bd372) and codehash `0xb14f6d21bb231192c44f9b868d915f8f541213a6834a72c6158efbd64ff3223c` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/167).

##### [Mainnet] SparkLend - Deprecate BTC eMode

- **Authorization**: [Core Council Risk Advisor Approval](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931/5)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

BTC-correlated [eMode](https://docs.spark.fi/dev/sparklend/features/efficiency-mode-emode) will be deprecated on SparkLend by making the following parameter updates:

- cbBTC
  - emode category: **0**
- LBTC
  - emode category: **0**

##### [Mainnet] SparkLend - Update Cap Automator Parameters

- **Authorization**: [Core Council Risk Advisor Approval](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931/5)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

[Cap Automator parameters](https://sky-atlas.io/#6ffdb8ee-b083-40f5-b51b-1c91e954b68b) will be updated to support Spark's new Liquidity Layer-based cap management framework as follows:

- WETH
  - Supply cap
    - `max`: **Unlimited**
    - `gap`: **100,000 WETH**
    - `ttl`: **4 hours**
  - Borrow cap
    - `max`: **Unlimited**
    - `gap`: **10,000 WETH**
    - `ttl`: **4 hours**
- wstETH
  - Supply cap
    - `max`: **Unlimited**
    - `gap`: **50,000 wstETH**
    - `ttl`: **4 hours**
- weETH
  - Supply cap
    - `max`: **500,000 weETH**
    - `gap`: **10,000 weETH**
    - `ttl`: **4 hours**
- WBTC
  - Supply cap
    - `max`: **50,000 WBTC**
    - `gap`: **500 WBTC**
    - `ttl`: **4 hours**
  - Borrow cap
    - `max`: **50,000 WBTC**
    - `gap`: **100 WBTC**
    - `ttl`: **4 hours**
- cbBTC
  - Supply cap
    - `max`: **50,000 cbBTC**
    - `gap`: **500 cbBTC**
    - `ttl`: **4 hours**
  - Borrow cap
    - `max`: **50,000 cbBTC**
    - `gap`: **100 cbBTC**
    - `ttl`: **4 hours**

##### [Mainnet] SparkLend - Update Parameters for Deprecated Assets

- **Authorization**: [Core Council Risk Advisor Approval](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931/5)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

[LTV](https://sky-atlas.io/#586478a3-51cb-4a2e-8bb1-b96e6520fdcc) and [Liquidation Threshold](https://sky-atlas.io/#2dd2045c-6a33-4229-b6c8-e531d6ecd27a) parameters for deprecated assets on SparkLend will be updated to the following amounts:

- rsETH
  - LTV: **0%**
  - Liquidation Threshold: **70%**
- ezETH
  - LTV: **0%**
  - Liquidation Threshold: **70%**
- tBTC
  - LTV: **0%**
  - Liquidation Threshold: **70%**
- rETH
  - Liquidation Threshold: **70%**

##### [Mainnet] SparkLend - Increase USDC and USDT Reserve Factors

- **Authorization**: [Core Council Risk Advisor Approval](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931/5)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

[Reserve factors](https://sky-atlas.io/#a68d2ffe-e541-4754-b11e-6cafe7b4ae5c) for SparkLend stablecoin markets will be increased to the following levels:

- Increase the USDC reserve factor to **10%**.
- Increase the USDT reserve factor to **10%**.

##### [Mainnet] Spark Liquidity Layer - Update Rate Limits

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xe09e63d9eb11a7a89cb28801e060443b5a098a262f17171e77f5e33202f0ffdb)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

Spark Liquidity Layer [rate limits](https://sky-atlas.io/#85106bf0-7367-4355-acf1-5fb22199d135) will be increased to the following amounts:

- Anchorage USDC
  - `maxAmount`: **50 million USDC**
  - `slope`: **250 million USDC per day**
- Uniswap v4 USDT/USDS swap
  - `maxAmount`: **25 million USDT/USDS**
  - `slope`: **250 million USDT/USDS per day**
  - `maxSlippage`: **0.2%**
- USDS mint
  - `maxAmount`: **1 billion USDS**
  - `slope`: **1 billion USDS per day**
- USDC PSM swap
  - `maxAmount`: **1 billion USDC/USDS**
  - `slope`: **1 billion USDC/USDS per day**

##### [Mainnet] Spark Liquidity Layer - Update ALM Proxy Freezable Configuration

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x75c80c3b462ab1efe3aa2cb919e97e487ae66d0c62265d204fe9499499cc7e6d)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

The Ethereum ALM Proxy Freezable contract will be upgraded to version 1.1 at [0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178](https://etherscan.io/address/0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178).

The upgrade will maintain freeze authority over the Spark Savings USDC vault while introducing routine operational improvements.

##### [Mainnet] SparkLend - Claim Reserves

- **Authorization**: [Atlas - A.6.1.1.1.2.6.1.2.1.2.3 - Token Claim Authorization](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

SparkLend reserves will be claimed as follows:

- Claim all available SparkLend reserves.
- Transfer USD stablecoin reserves to the Spark ALM Proxy.
- Transfer non-USD stablecoin reserves to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) for liquidation.

##### [Mainnet] Spark Treasury - Transfer Excess USDS for SPK Buybacks

- **Authorization**: [Atlas - A.6.1.1.1.3.4.2.3 - Excess SubDAO Proxy Funds Disposition Policy](https://sky-atlas.io/#6a4870fa-73f1-4d49-b7ee-d531fb59a971)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

**663,354 USDS** will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) for SPK buybacks as communicated in this [forum post](https://forum.skyeco.com/t/spark-subdao-proxy-management-updates/27734/4).

##### [Avalanche] Spark Liquidity Layer - Update ALM Proxy Freezable Configuration

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x75c80c3b462ab1efe3aa2cb919e97e487ae66d0c62265d204fe9499499cc7e6d)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

The Avalanche ALM Proxy Freezable contract will be upgraded to version 1.1 at [0x45d91340B3B7B96985A72b5c678F7D9e8D664b62](https://snowscan.xyz/address/0x45d91340B3B7B96985A72b5c678F7D9e8D664b62).

The upgrade will maintain freeze authority over the Spark Savings USDC vault while introducing routine operational improvements.

##### [Base] Spark Liquidity Layer - Update ALM Proxy Freezable Configuration

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x75c80c3b462ab1efe3aa2cb919e97e487ae66d0c62265d204fe9499499cc7e6d)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-spark-for-upcoming-spell/27931)

The Base ALM Proxy Freezable contract will be upgraded to version 1.1 at [0xCBA0C0a2a0B6Bb11233ec4EA85C5bFfea33e724d](https://basescan.org/address/0xCBA0C0a2a0B6Bb11233ec4EA85C5bFfea33e724d).

The upgrade will maintain freeze authority over the Spark USDC Morpho vault while introducing routine operational improvements.

#### Grove

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/55).

##### [Mainnet] Grove Treasury - Monthly Grant for Grove Foundation

- **Authorization**: [Atlas - A.2.8.2.2.2.4.5.2.1 - Grove Foundation Grant Authorization: Q2 2026](https://sky-atlas.io/#85f7d545-d56c-40b9-b1b4-05663cd7772a)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-grove-for-upcoming-spell/27924)

The Grove Foundation will receive a combined disbursement covering Months 2 and 3 of the previously approved three-month Foundation grant program.

**1,600,000 USDS** will be transferred from the Grove SubProxy to the [Grove Foundation Multisig](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

##### [Mainnet] Grove Treasury - Swap USDC to USDS

- **Authorization**: [Core Facilitator Approval](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-grove-for-upcoming-spell/27924/4)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-grove-for-upcoming-spell/27924)

**753,649 USDC** currently held by the Grove SubProxy will be converted into **753,649 USDS**.

##### [Mainnet] Grove Treasury - Transfer GROVE Tokens to Grove Foundation

- **Authorization**: [Governance Poll 1634](https://vote.sky.money/polling/QmeS7Hm2)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-grove-for-upcoming-spell/27924)

**500,000,000 GROVE** from the Grove SubProxy will be transferred to the [Grove Foundation Multisig](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

##### [Avalanche] Grove Governance Relay - Add CCTPv2 Receiver

- **Authorization**: [Governance Poll 1634](https://vote.sky.money/polling/QmeS7Hm2)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/june-4-2026-proposed-changes-to-grove-for-upcoming-spell/27924)

A new audited CCTPv2 governance relay receiver at [0x8Ea8Dff8c29f568eA1E716E2C3AfbD003EB83cfA](https://snowscan.xyz/address/0x8Ea8Dff8c29f568eA1E716E2C3AfbD003EB83cfA) will be added on Avalanche while retaining the existing CCTPv1 receiver as a fallback path.

This action will:

- Grant `SUBMISSION_ROLE` on the Avalanche Executor to the newly deployed CCTPv2 Receiver.
- Retain the existing CCTPv1 Receiver and its current permissions.
- Enable governance messages to be delivered through either relay implementation.
- Make CCTPv2 the preferred path for future governance operations.
- Preserve CCTPv1 as a known-good recovery mechanism during the CCTPv2 validation period.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

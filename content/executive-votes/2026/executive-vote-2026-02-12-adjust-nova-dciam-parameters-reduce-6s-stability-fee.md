---
title: Template - [Executive Vote] Adjust ALLOCATOR-NOVA-A DC-IAM Parameters, Reduce RWA001-A Stability Fee, Prime Agent Proxy Spells - February 12, 2026
summary: Update the DC-IAM parameters for ALLOCATOR-NOVA-A, reduce the RWA001-A Stability Fee to prepare for offboarding, whitelist proxy spells for Spark and Grove.
date: 2026-02-12T00:00:00.000Z
address: "0x97bD98F46D0d0769745883E76c05483f9aa15Ca6"
---

# [Executive Proposal] Adjust ALLOCATOR-NOVA-A DC-IAM Parameters, Reduce RWA001-A Stability Fee, Prime Agent Proxy Spells - February 12, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- DC-IAM parameters for ALLOCATOR-NOVA-A will be adjusted.
- Stability Fee for RWA001-A will be set to 0% to prepare for unwinding of the position.
- Prime proxy spells for Spark and Grove will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### ALLOCATOR-NOVA-A DC-IAM Parameter Update

- **Authorization**: [A.3.7.1.2.2](https://sky-atlas.io/#A.3.7.1.2.2)
- **Proposal**: [Core GovOps Request](https://forum.sky.money/t/allocator-nova-a-parameter-changes/27692)

If this executive proposal passes, then the [Debt Ceiling Instant Access Module (DC-IAM)](https://sky-atlas.io/#A.3.7.1.1.2.4) parameters for [ALLOCATOR-NOVA-A](https://info.sky.money/collateral/keel) will be updated as follows:

- Remove ALLOCATOR-NOVA-A from the DC-IAM
- Set ALLOCATOR-NOVA-A [Debt Ceiling](https://sky-atlas.io/#A.3.7.1.1.2.2) to **0 USDS**
- Reduce Global Debt Ceiling to account for this change

### Reduce RWA001-A Stability Fee

- **Authorization**: [Core Facilitator Approval](https://forum.sky.money/t/technical-scope-of-rwa001-a-offboarding/27706/2)
- **Proposal**: [Technical Scope](https://forum.sky.money/t/technical-scope-of-rwa001-a-offboarding/27706)

If this executive proposal passes, then the [Stability Fee](https://sky-atlas.io/#A.3.7.1.1.2.3)for [RWA001-A (6s Capital)](https://info.sky.money/collateral/legacy-rwa/RWA001-A) will be adjusted as follows:

- Reduce the Stability Fee by 9 percentage points from 9% to **0%**

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell at [0x42dB2A32C5F99034C90DaC07BF790f738b127e93](https://etherscan.io/address/0x42dB2A32C5F99034C90DaC07BF790f738b127e93) with the codehash `0x1921fcf54407302328fe5dfa4b48ab0802a5607edcfdace144e62e27f26ffff5` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell at [0xe045AA2065FDba35a0e0B5283e7f36a8ca96886a](https://etherscan.io/address/0xe045AA2065FDba35a0e0B5283e7f36a8ca96886a) with the codehash `0x5fd619a8b7922b59d639fc5b47f736e8590cf174ac070f2943bef4266304ffeb` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark Proxy Spell

##### [Ethereum] Recurring Claim of SparkLend Reserves

- **Authorization**: [A.6.1.1.1.2.6.1.2.1.2.3](https://sky-atlas.io/#A.6.1.1.1.2.6.1.2.1.2.3)
- **Proposal**: [Spell Technical Scope](https://forum.sky.money/t/february-12-2026-proposed-changes-to-spark-for-upcoming-spell/27674)

SparkLend reserves will be claimed as follows:

- Claim SparkLend reserves of DAI, USDS, USDC, USDT, and PYUSD to the ALM Proxy: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E)
- Claim all other SparkLend reserves to the Spark Operations Multisig: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC)

##### [Ethereum] Transfer Remaining Share of Ethena Net Revenue to Grove

- **Authorization**: [Snapshot poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x444abfce22102793c25d85d659ff69747fdc56091e41dd6e7c67a9ac5d1b1b15)
- **Proposal**: [Spell Technical Scope](https://forum.sky.money/t/february-12-2026-proposed-changes-to-spark-for-upcoming-spell/27674)

The remaining share of Ethena net revenue will be transferred to Grove as follows:

- **78,394 USDS** will be transferred to Grove at [0x1369f7b2b38c76B6478c0f0E66D94923421891Ba](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

##### [Ethereum] Initiate DssVest for SPK Contributor Vesting

- **Authorization**: [Snapshot poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x3ffd7702f9f23b9dabbb6297e6690f9f648e9968fc88fbfc4fe3aee41d764569)
- **Proposal**: [Spell Technical Scope](https://forum.sky.money/t/february-12-2026-proposed-changes-to-spark-for-upcoming-spell/27674)

A DssVest contract to convey SPK tokens for contributor rewards will be initiated as follows:

- DssVest
  - Recipient address(s): [0xEFF097C5CC7F63e9537188FE381D1360158c1511](https://etherscan.io/address/0xEFF097C5CC7F63e9537188FE381D1360158c1511)
  - Start date: **17 June 2025**
  - Cliff date: **17 June 2026**
  - End date: **16 June 2029**
  - Vesting method: **linear per block with cliff**
  - Claim auth: **Permissionless**
- SubDAO Proxy actions
  - Approve SPK
    - Address: [0x6Bad07722818Ceff1deAcc33280DbbFdA4939A09](https://etherscan.io/address/0x6Bad07722818Ceff1deAcc33280DbbFdA4939A09)
    - Amount: **1.2 billion SPK** (12% of total supply)

#### Grove Proxy Spell

##### [Ethereum] Onboard Grove x Steakhouse AUSD Morpho Vault V2

- **Authorization**: [A.6.1.1.2.2.6.1.3.1.7.5](https://sky-atlas.io/#A.6.1.1.2.2.6.1.3.1.7.5)
- **Proposal**: [Spell Technical Scope](https://forum.sky.money/t/february-12-2026-proposed-changes-to-grove-for-upcoming-spell/27662)

The Grove x Steakhouse AUSD Morpho Vault V2 will be onboarded to the Grove Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- **Grove x Steakhouse AUSD Morpho Vault V2**: [0xBEEfF0d672ab7F5018dFB614c93981045D4aA98a](https://etherscan.io/address/0xBEEfF0d672ab7F5018dFB614c93981045D4aA98a)
  - AUSD: [0x00000000eFE302BEAA2b3e6e1b18d08D69a9012a](https://docs.agora.finance/developer/contract-deployments)
    - Deposits:
      - maxAmount: **20 million AUSD**
      - slope: **20 million AUSD per day**
    - Withdrawals:
      - maxAmount: **Unlimited**
    - MaxExchangeRate:
      - **`setMaxExchangeRate(GROVE_X_STEAKHOUSE_AUSD_V2, 1e18, 2e6)`** (1 share can represent at most 2 AUSD)

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

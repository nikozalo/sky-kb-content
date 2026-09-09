---
title: Template - [Executive Vote] SKY Buyback Reduction, Delayed Upgrade Penalty Increase, Safe Harbor Adoption, Spark Proxy Spell - March 12, 2026
summary: Reduce the rate of SKY buybacks, increase the Delayed Upgrade Penalty, adopt and initialize the Safe Harbor Agreement, whitelist a Spark proxy spell.
date: 2026-03-12T00:00:00.000Z
address: "0x396122c087Aa23BeE53B38e14237B3C0C10DdDbc"
---

# [Executive Proposal] SKY Buyback Reduction, Delayed Upgrade Penalty Increase, Safe Harbor Adoption, Spark Proxy Spell - March 12, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The rate of SKY buybacks will be reduced.
- The Delayed Upgrade Penalty will be increased.
- Safe Harbor will be formally adopted.
- A Spark proxy spell will be whitelisted in the Spark StarGuard.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Reduce SKY Token Buyback Rate

- **Authorization**: [Governance Poll ID 1620](https://vote.sky.money/polling/QmRjnvHa)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2026-03-09/27750)

If this executive proposal passes, then the SKY token buyback rate will be reduced through the following parameter changes:

- Reduce the [kicker lot size parameter](https://sky-atlas.io/#A.3.5.2.2.1.1) (`kbump`) by 4,000 USDS from 10,000 USDS to **6,000 USDS**.
- Increase the [splitter interval parameter (`hop`)](https://sky-atlas.io/#A.3.5.2.1.1.1) by 10,907 seconds from 2,880 seconds to **13,787 seconds**.

The LSEV2-SKY-A USDS rewardsDuration will also increase by 10,907 seconds from 2,880 seconds to **13,787 seconds** to match the new `splitter.hop` value.

### Delayed Upgrade Penalty Increase

- **Authorization**: [A.4.1.2.1.1.1.1](https://sky-atlas.io/#A.4.1.2.1.1.1.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/delayed-migration-penalty-update-march-12th-spell/27752)

If this executive proposal passes, then the following change will be made to the MKR to SKY Delayed Upgrade Penalty:

- Increase the [MKR to SKY Delayed Upgrade Penalty](https://sky-atlas.io/#A.4.1.2.1.1.1.1) by 1 percentage point from 2% to **3%**.

### Safe Harbor Adoption

- **Authorization**: [A.2.11.1.2](https://sky-atlas.io/#A.2.11.1.2)
- **Proposal**: [Technical Scope](https://forum.sky.money/t/technical-scope-safe-harbor-adoption/27753)

If this executive proposal passes, then the Safe Harbor adoption will be actioned by calling `adoptSafeHarbor` on the [SEAL Safe Harbor Registry](https://etherscan.io/address/0x326733493E143b8904716E7A64A9f4fb6A185a2c) with the following parameters:

- `Registry Contract`: [0x326733493E143b8904716E7A64A9f4fb6A185a2c](https://etherscan.io/address/0x326733493E143b8904716E7A64A9f4fb6A185a2c) (SEAL Safe Harbor Registry)
- `Caller`: [0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB) (Sky Pause Proxy)
- `Function`: `adoptSafeHarbor(address _agreement)`
- `Input Argument`: [0xf17bB418B4EC251f300Aa3517Cb37349f17697A1](https://etherscan.io/address/0xf17bB418B4EC251f300Aa3517Cb37349f17697A1) (Deployed Sky Agreement)

The Agreement Contract will be added to the Chainlog with the key **SAFE_HARBOR_AGREEMENT**.

This will adopt the Safe Harbor agreement with the following bounty terms:

- Percentage: **10**
- Cap (USD): **10,000,000**
- Aggregate Cap (USD): **10,000,000**
- Retainable: **False**. When retainable is False, whitehats are required to return all recovered funds to the protocol, which then pays out the bounty after verification.
- Identity: **Named**.
- Diligence Requirements: **"KYC and Sanctions Screening. Sky and Stars require all eligible whitehats to undergo Know Your Customer (KYC) verification and be screened against global sanctions lists, including OFAC, UK, and EU regulations. This ensures that bounty recipients meet legal and regulatory standards before qualifying for payment. The verification process shall be conducted by a trusted third-party provider at Sky and Stars discretion, and all data is deleted, if successful, within 30 days post-verification."**

### Spark Proxy Spell

If this executive proposal is approved then the Spark Proxy Spell at [0x9fFadcf3aFb43c1Af4Ec1D9B6B0405f1FBCf94D6](https://etherscan.io/address/0x9fFadcf3aFb43c1Af4Ec1D9B6B0405f1FBCf94D6) with the codehash `0xe38e933caa0aff99a63bd81b28a9cbd4d8af359c603545af5c3af9e457241733` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E) module.

The Spark spell contains the following actions.

#### [Ethereum] Upgrade Mainnet Controller

- **Authorization**: [Snapshot poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xeb2f5f08ec6ab8a2ff5302453ac7383f7519a09cf7e1e56cbb7fc8244f15cfa2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/march-12-2026-proposed-changes-to-spark-for-upcoming-spell/27741)

The Spark Liquidity Layer's Mainnet Controller will be updated to **v1.10**.

#### [Ethereum] Upgrade SparkLend Cap Automators

- **Authorization**: [Snapshot poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xdc686a9bc77b44cb323c23dce2cc091ebd34d7876d6e1f4413786f17e0739726)
- **Proposal**: [Forum Post](https://forum.sky.money/t/march-12-2026-proposed-changes-to-spark-for-upcoming-spell/27741)

The SparkLend Cap Automators will be updated to **v1.1**.

ALM Proxy Freezable ([0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178](https://etherscan.io/address/0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178)) will be authorized on the new Cap Automator.

#### [Ethereum] Add Assets to the Killswitch Oracle Mechanism

- **Authorization**: [Snapshot poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x9aebbe69e8555d03dc97b55475dac08225e157b3fd475d7a29848b8631627367)
- **Proposal**: [Forum Post](https://forum.sky.money/t/march-12-2026-proposed-changes-to-spark-for-upcoming-spell/27741)

weETH, rETH, cbBTC, and WBTC will be added to the SparkLend KillSwitch Oracle Mechanism with a Deviation Threshold of **0.95** (5% price deviation vs reference price).

#### [Ethereum] Transfer SparkLend DAI and SparkLend USDS from SubDAO Proxy to ALM Proxy

- **Authorization**: [Snapshot poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xf8c2f98cb39912a22457522c445c453b5f796f24c1886d1687dc96648ffa4c16)
- **Proposal**: [Forum Post](https://forum.sky.money/t/march-12-2026-proposed-changes-to-spark-for-upcoming-spell/27741)

All SparkLend DAI and SparkLend USDS will be transferred from the Spark SubProxy to the [ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).

#### [Ethereum] Claim SparkLend Reserves

- **Authorization**: [A.6.1.1.1.2.6.1.2.1.2.3](https://sky-atlas.io/#A.6.1.1.1.2.6.1.2.1.2.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/march-12-2026-proposed-changes-to-spark-for-upcoming-spell/27741)

SparkLend reserves will be claimed as follows:

- Claim all reserves.
- Transfer USD stablecoin reserves to [ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).
- Transfer non-USD stablecoin reserves to [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to be liquidated.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

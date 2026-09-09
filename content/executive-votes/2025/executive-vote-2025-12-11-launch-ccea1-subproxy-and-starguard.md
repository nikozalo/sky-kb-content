---
title: Template - [Executive Vote] Initialize and Fund Core Council Executor Agent 1 SubProxy and StarGuard, USDS-SKY Farm Normalization, Increase Delayed Upgrade Penalty, Adjust stUSDS Liquidation Ratio and Capped OSM, Adjust stUSDS BEAM step Parameters, DAO Resolution, Ranked Delegate and Atlas Core Development Compensation, Star Proxy Spells - December 11, 2025
summary: Initialize and fund the SubProxy and StarGuard for Core Council Executor Agent 1, normalize the USDS-SKY farm vesting stream, increase the Delayed Upgrade Penalty to 2%, decrease the stUSDS Liquidation Ratio and Capped Oracle price, increase the stUSDS BEAM step parameters, approve a DAO Resolution for HVBank (RWA009-A), distribute November Ranked Delegate and December Atlas Core Development compensation, whitelist proxy spells for Spark and Grove in their respective StarGuard modules.
date: 2025-12-11T00:00:00.000Z
address: "0x0D2BDA9a446527238E802708B370DD66f375E4d1"
---

# [Executive Proposal] Initialize and Fund Core Council Executor Agent 1 SubProxy and StarGuard, USDS-SKY Farm Normalization, Increase Delayed Upgrade Penalty, Adjust stUSDS Liquidation Ratio and Capped OSM, Adjust stUSDS BEAM step Parameters, DAO Resolution, Ranked Delegate and Atlas Core Development Compensation, Star Proxy Spells - December 11, 2025

The Core Facilitator, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Core Council Executor Agent 1 SubProxy and StarGuard will be initialized.
- The Core Council Executor Agent 1 Genesis Capital Allocation will be distributed.
- The USDS -> SKY Farm will be normalized.
- The Delayed Upgrade Penalty for conversion from MKR to SKY will be increased.
- The stUSDS Liquidation Ratio and OSM `cap` parameters will be updated.
- The stUSDS BEAM `step` parameters will be increased.
- A DAO Resolution relating to HV-BANK (RWA009-A) will be approved.
- A total of **22,815 USDS** will be distributed to six Ranked Delegates as compensation for November 2025.
- A total of **66,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development compensation for December 2025.
- Star proxy spells for Spark and Grove will be whitelisted in the corresponding StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Core Council Executor Agent 1 SubProxy and StarGuard Initialization

- **Authorization**: [A.2.9.2.5.2.2](https://sky-atlas.io/#A.2.9.2.5.2.2), [A.1.9.2.3.2.2.3.1.1](https://sky-atlas.io/#A.1.9.2.3.2.2.3.1.1)
- **Proposal**: [Technical Scope](https://forum.sky.money/t/technical-scope-of-the-core-council-executor-agent-1-launch/27514)

If this executive proposal passes, then a SubProxy and StarGuard for Core Council Executor Agent 1 (CCEA1) will be initialized as detailed.

#### SubProxy Deployment

A SubProxy for CCEA1 has been deployed to [0x64a2b7CfA832fE83BE6a7C1a67521B350519B9c1](https://etherscan.io/address/0x64a2b7CfA832fE83BE6a7C1a67521B350519B9c1) using the code from the [endgame-toolkit](https://github.com/sky-ecosystem/endgame-toolkit/) GitHub repository.

#### StarGuard Initialization

Initialize the new StarGuard module by calling [StarGuardInit.init](https://github.com/sky-ecosystem/star-guard/blob/52239d716a89188b303f137fc43fb9288735ba2e/deploy/StarGuardInit.sol#L44-L63) with the following parameters:

- [`chainlog`](https://chainlog.sky.money/): **`DssExecLib.LOG`**
- `cfg.subProxy`: **[0x64a2b7CfA832fE83BE6a7C1a67521B350519B9c1](https://etherscan.io/address/0x64a2b7CfA832fE83BE6a7C1a67521B350519B9c1)**
- `cfg.subProxyKey`: **`CCEA1_SUBPROXY`**
- `cfg.starGuard`: **[0x13D95B35248D04FB60597dd1b27BE13E73Fe0a12](https://etherscan.io/address/0x13D95B35248D04FB60597dd1b27BE13E73Fe0a12)**
- `cfg.starGuardKey`: **`CCEA1_STARGUARD`**
- [`cfg.maxDelay`](https://sky-atlas.io/#A.1.9.2.3.2.2.3.1.1.1.4): **7 days**

The new StarGuard module will be added to the [StarGuardJob](https://etherscan.io/address/0xb18d211fa69422a9a848b790c5b4a3957f7aa44e).

### Core Council Executor Agent 1 Genesis Capital Allocation Distribution

- **Authorization**: [A.2.9.2.5.2.2](https://sky-atlas.io/#A.2.9.2.5.2.2)
- **Proposal**: [Atlas Edit Weekly Cycle Proposal](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-24/27452)

If this executive proposal passes, then the Genesis Capital Allocation for Core Council Executor Agent 1 will be distributed as follows:

- Transfer **20 million USDS** to the Core Council Executor Agent 1 SubProxy at [0x64a2b7CfA832fE83BE6a7C1a67521B350519B9c1](https://etherscan.io/address/0x64a2b7CfA832fE83BE6a7C1a67521B350519B9c1)
- Transfer **5 million USDS** to the Core Council Buffer Multisig at [0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364)

### USDS -> SKY Farm Normalization

- **Authorization**: [A.4.3.2.1](https://sky-atlas.io/#A.4.3.2.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/sky-token-rewards-usds-to-sky-rewards-normalization-configuration/26638/24)

If this executive proposal passes, then the distribution of SKY token rewards to USDS holders will be normalized to ensure the effective yield provided by these rewards equals the Sky Savings Rate (SSR), as per [A.4.3.2 - Token Reward Mechanism](https://sky-atlas.io/#A.4.3.2), by executing the following actions:

- `yank` [MCD_VEST_SKY_TREASURY](https://etherscan.io/address/0x67eadb3288ccede034ce95b0511dcc65cf630bb6) vest with ID 7.
- Distribute the remaining tokens from the old DssVest by calling `VestedRewardsDistribution.distribute()` on [REWARDS_DIST_USDS_SKY](https://etherscan.io/address/0xc8d67fcf101d3f89d0e1f3a2857485a84072a63f)
- Create a new [MCD_VEST_SKY_TREASURY](https://etherscan.io/address/0x67eadb3288ccede034ce95b0511dcc65cf630bb6) stream with the following parameters:
  - `res`: 1 (restricted)
  - `vestBgn`: **`block.timestamp`**
  - `vestTau`: **`block.timestamp` + 182 days**
  - `tot`: **60,297,057 SKY**
- Adjust the Sky allowance for [MCD_VEST_SKY_TREASURY](https://etherscan.io/address/0x67eadb3288ccede034ce95b0511dcc65cf630bb6), reducing it by the remaining yanked stream amount and increasing it by the new stream total.
- `file` the new stream ID on [REWARDS_DIST_USDS_SKY](https://etherscan.io/address/0xc8d67fcf101d3f89d0e1f3a2857485a84072a63f)

### Delayed Upgrade Penalty Increase

- **Authorization**: [A.4.1.2.1.1.1.1](https://sky-atlas.io/#A.4.1.2.1.1.1.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/delayed-migration-penalty-update-december-11th-spell/27520)

If this executive proposal passes, then the [Delayed Upgrade Penalty](https://sky-atlas.io/#A.4.1.2.1.1.1.1) in the [MKR_SKY](https://etherscan.io/address/0xa1ea1ba18e88c381c724a75f23a130420c403f9) conversion contract will be increased as follows:

- Increase the Delayed Upgrade Penalty (`fee`) by 1 percentage point from 1% to **2%**.

### stUSDS Risk Parameter Updates

- **Authorization**: [Governance Poll ID 1609](https://vote.sky.money/polling/QmQ95c8b)
- **Proposal**: [Atlas Edit Weekly Cycle Proposal](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-12-08/27524)

If this executive proposal passes, then stUSDS risk parameters will be updated as follows:

- Decrease the stUSDS [Liquidation Ratio (`mat`)](https://sky-atlas.io/#A.3.7.1.1.2.1) by 25 percentage points from 145% to **120%**. 
- Decrease the SKY-Backed Borrowing Capped OSM Wrapper [`cap`](https://sky-atlas.io/#A.4.4.1.3.9.1.1) parameter by 0.015 USDS from 0.04 USDS to **0.025 USDS**.

### stUSDS BEAM Parameter Updates

- **Authorization**: [Governance Poll ID 1610](https://vote.sky.money/polling/QmTpQ7KW)
- **Proposal**: [Core Council Risk Advisor Proposal](https://forum.sky.money/t/stusds-beam-rate-setter-configuration/27161/76)

If this executive proposal passes, then the stUSDS BEAM parameters will be updated as follows:

- Increase [`stepStrBps`](https://sky-atlas.io/#A.4.4.1.3.8.1.3) by 1,000 basis points from 500 bps to **1,500 bps**
- Increase [`stepDutyBps`](https://sky-atlas.io/#A.4.4.1.3.8.1.3) by 1,000 basis points from 500 bps to **1,500 bps**

### DAO Resolution

- **Authorization**: [Core Facilitator Approval](https://forum.sky.money/t/huntingdon-valley-bank-transaction-documents-on-permaweb/16264/30)
- **Proposal**: [Steakhouse Proposal](https://forum.sky.money/t/huntingdon-valley-bank-transaction-documents-on-permaweb/16264/29)

If this executive proposal passes, then the DAO Resolution with IPFS hash [bafkreifaflhcwe7jd5r3v7wmsq5tx7b56w5bcxjmgzgzqd6gwl3zrmkviq](https://gateway.pinata.cloud/ipfs/bafkreifaflhcwe7jd5r3v7wmsq5tx7b56w5bcxjmgzgzqd6gwl3zrmkviq) will be approved. This DAO Resolution authorizes the return of Excess Collateral from the HVBank (RWA009-A) structure to the Sky Protocol.

### Ranked Delegate Compensation for November 2025

- **Authorization**: [A.1.5.3.5.1](https://sky-atlas.io/#A.1.5.3.5.1)
- **Proposal**: [Core Facilitator Forum Post](https://forum.sky.money/t/november-2025-ranked-delegate-compensation/27506)

If this executive proposal passes, then a total of **22,815 USDS** will be distributed to six Ranked Delegates as follows:

| Delegate    | Amount (USDS) | Address                                                                                                               |
|-------------|---------------|-----------------------------------------------------------------------------------------------------------------------|
| AegisD      | 4,000         | [0x78C180CF113Fe4845C325f44648b6567BC79d6E0](https://etherscan.io/address/0x78C180CF113Fe4845C325f44648b6567BC79d6E0) |
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| Tango       | 3,788         | [0xB2B86A130B1EC101e4Aed9a88502E08995760307](https://etherscan.io/address/0xB2B86A130B1EC101e4Aed9a88502E08995760307) |
| Sky Staking | 3,027         | [0x05c73AE49fF0ec654496bF4008d73274a919cB5C](https://etherscan.io/address/0x05c73AE49fF0ec654496bF4008d73274a919cB5C) |

### Atlas Core Development Payments

- **Authorization**: [Core GovOps Approval](https://forum.sky.money/t/atlas-core-development-payment-requests-december-2025/27496/6), [A.2.2.1.1](https://sky-atlas.io/#A.2.2.1.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-core-development-payment-requests-december-2025/27496)

If this executive proposal passes, then a total of **66,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for December 2025 as follows.

#### USDS Payments

| Recipient | Amount (USDS) | Address                                                                                                               |
|-----------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 50,167        | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 16,417        | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |

#### SKY Payments

| Recipient | Amount (SKY) | Address                                                                                                               |
|-----------|-------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 330,000      | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 288,000      | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark Proxy Spell at [0x2cB9Fa737603cB650d4919937a36EA732ACfe963](https://etherscan.io/address/0x2cB9Fa737603cB650d4919937a36EA732ACfe963) with the codehash `0x5fdec666ca088e84b1e330ce686b9b4bb84d01022c8de54529dc90cacfd56e37` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove Proxy Spell at [0x6772d7eaaB1c2e275f46B99D8cce8d470fA790Ab](https://etherscan.io/address/0x6772d7eaaB1c2e275f46B99D8cce8d470fA790Ab) with the codehash `0x62e0ddd487406519e23c4c6e26414e898c2442dd90365ee1a4a7cb188114e614` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark

##### [Mainnet] Spark Treasury - Spark Foundation Grants

- **Authorization**: [A.2.9.2.2.2.5.5.1](https://sky-atlas.io/#A.2.9.2.2.2.5.5.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

- Transfer **1.1 million USDS** to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec)
- Transfer **150,000 USDS** to the Spark Asset Foundation at [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911)

##### [Mainnet] SparkLend - Withdraw Reserves

- **Authorization**: [A.6.1.1.1.2.6.1.2.1.2.3](https://sky-atlas.io/#A.6.1.1.1.2.6.1.2.1.2.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

All accrued reserves for SparkLend USDS and SparkLend DAI will be claimed.

##### [Mainnet] Spark Liquidity Layer - Onboarding with Anchorage for OTC Lending

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x1fe374e0ba506993768069bb856f91da7d854c9ea6ea9a31cc342267b79993d7)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

Onboard Anchorage to the SLL with the following `transferAsset` parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- Asset: **USDC**
- Address: [0x49506C3Aa028693458d6eE816b2EC28522946872](https://etherscan.io/address/0x49506C3Aa028693458d6eE816b2EC28522946872)
- maxAmount: **5 million USDC**
- slope: **50 million USDC per day**

##### [Mainnet] Spark Liquidity Layer - Onboard Spark Prime / Arkis

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x121b44858123a32f49d8c203ba419862f633c642ac2739030763433a8e756d61)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

Onboard Spark Prime, powered by Arkis, to the SLL with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2).

- Pool Address: [0x38464507E02c983F20428a6E8566693fE9e422a9](https://etherscan.io/address/0x38464507E02c983F20428a6E8566693fE9e422a9)
  - Asset: **USDC**
- Deposit:
  - maxAmount: **5 million USDC**
  - slope: **5 million USDC per day**
- Withdrawal:
  - maxAmount: **unlimited**
- Set maxExchangeRate: **10**

##### [Mainnet] Spark Savings - Launch Spark Savings spPYUSD

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x2cb808bb15c7f85e6759467c715bf6bd96b1933109b7540f87dfbbcba0e57914)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

Spark Savings PYUSD (spPYUSD) will be launched with the following parameters.

- Spark Savings PYUSD (spPYUSD)
  - spPYUSD address: [0x80128DbB9f07b93DDE62A6daeadb69ED14a7D354](https://etherscan.io/address/0x80128DbB9f07b93DDE62A6daeadb69ED14a7D354)
  - Roles
    - Default admin: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Subdao Proxy)
    - Setter: [0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178](https://etherscan.io/address/0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178) (ALM Proxy Freezable)
    - Taker: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) (ALM Proxy)
  - Yield
    - Max yield: **10%**
    - Current yield (at launch): **0%**
  - Supply cap: **250 million PYUSD**
  - SLL [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2)
    - take
      - maxAmount: **unlimited**
    - transferAssets
      - maxAmount: **unlimited**

##### [Mainnet] Spark Savings - Update Setter Role to ALM Proxy Freezable for spUSDC, spUSDT, spETH

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x007a555d46f2c215b7d69163e763f03c3b91f31cd43dd08de88a1531631a4766)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

The `setter` role for spUSDC, spUSDT, and spETH will be updated to ALM Proxy Freezable at [0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178](https://etherscan.io/address/0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178).

##### [Mainnet] Spark USDC Morpho Vault & Spark USDS Morpho Vault - Update Allocator Role to ALM Proxy Freezable

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x9b21777dfa9f7628060443a046b76a5419740f692557ef45c92f6fac1ff31801)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

The Allocator role for the Spark USDC Morpho Vault and the Spark USDS Morpho Vault will be updated to ALM Proxy Freezable at [0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178](https://etherscan.io/address/0x9Ad87668d49ab69EEa0AF091de970EF52b0D5178).

##### [Avalanche] Spark Savings - Update Setter Role to ALM Proxy Freezable for spUSDC

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x007a555d46f2c215b7d69163e763f03c3b91f31cd43dd08de88a1531631a4766)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

The `setter` role for spUSDC will be updated to ALM Proxy Freezable at [0x45d91340B3B7B96985A72b5c678F7D9e8D664b62](https://arbiscan.io/address/0x45d91340B3B7B96985A72b5c678F7D9e8D664b62).

##### [Base] Spark USDC Morpho Vault - Update Allocator Role to ALM Proxy Freezable

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x9b21777dfa9f7628060443a046b76a5419740f692557ef45c92f6fac1ff31801)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11-2025-proposed-changes-to-spark-for-upcoming-spell/27481)

The Allocator role for the Spark USDC Morpho Vault will be updated to ALM Proxy Freezable at [0xCBA0C0a2a0B6Bb11233ec4EA85C5bFfea33e724d](https://basescan.org/address/0xCBA0C0a2a0B6Bb11233ec4EA85C5bFfea33e724d).

#### Grove

##### [Mainnet] Onboard Securitize Tokenized AAA CLO Fund (STAC)

- **Authorization**: [A.6.1.1.2.2.6.1.3.1.8.1.2](https://sky-atlas.io/#A.6.1.1.2.2.6.1.3.1.8.1.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11th-2025-proposed-changes-to-grove-for-upcoming-spell/27459)

Onboard STAC to the Grove Liquidity Layer with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- USDC destination address: [0x51e4C4A356784D0B3b698BFB277C626b2b9fe178](https://etherscan.io/address/0x51e4C4A356784D0B3b698BFB277C626b2b9fe178)
- Deposit rate limits:
  - maxAmount: **50 million USDC**
  - slope: **50 million USDC per day**
- Redemptions:
  - Destination address: [0xbb543C77436645C8b95B64eEc39E3C0d48D4842b](https://etherscan.io/address/0xbb543C77436645C8b95B64eEc39E3C0d48D4842b)
  - maxAmount: **unlimited**

##### [Mainnet] Onboard Galaxy Arch CLOs

- **Authorization**: [A.6.1.1.2.2.6.1.3.1.9.1.2](https://sky-atlas.io/#A.6.1.1.2.2.6.1.3.1.9.1.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11th-2025-proposed-changes-to-grove-for-upcoming-spell/27459)

Onboard Galaxy Arch CLOs to the Grove Liquidity Layer with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- USDC destination address: [0x2E3A11807B94E689387f60CD4BF52A56857f2eDC](https://etherscan.io/address/0x2E3A11807B94E689387f60CD4BF52A56857f2eDC)
- Transfer rate limits:
  - maxAmount: **50 million USDC**
  - slope: **50 million USDC per day**

##### [Mainnet] Onboard Morpho Grove x Steakhouse High Yield Vault USDC

- **Authorization**: [A.6.1.1.2.2.6.1.3.1.7.1.2](https://sky-atlas.io/#A.6.1.1.2.2.6.1.3.1.7.1.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11th-2025-proposed-changes-to-grove-for-upcoming-spell/27459)

Onboard Morpho Grove x Steakhouse High Yield Vault USDC to the Grove Liquidity Layer with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- Pool Address: [0xBEEf2B5FD3D94469b7782aeBe6364E6e6FB1B709](https://app.morpho.org/ethereum/vault/0xBEEf2B5FD3D94469b7782aeBe6364E6e6FB1B709/grove-x-steakhouse-usdc-high-yield)
- Deposits:
  - maxAmount: **20 million USDC**
  - slope: **20 million USDC per day**
- Withdrawals:
  - maxAmount: **unlimited**

##### [Mainnet] Onboard Ripple RLUSD

- **Authorization**: [A.6.1.1.2.2.6.1.3.1.10.1.2](https://sky-atlas.io/#A.6.1.1.2.2.6.1.3.1.10.1.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11th-2025-proposed-changes-to-grove-for-upcoming-spell/27459)

Onboard Ripple RLUSD to the Grove Liquidity Layer with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- Deposits:
  - Deposit Address: [0xD178a90C41ff3DcffbfDEF7De0BAF76Cbfe6a121](https://etherscan.io/address/0xD178a90C41ff3DcffbfDEF7De0BAF76Cbfe6a121)
  - maxAmount: **50 million USDC**
  - slope: **50 million USDC per day**
- Redemptions:
  - Redemption Address: [0xD178a90C41ff3DcffbfDEF7De0BAF76Cbfe6a121](https://etherscan.io/address/0xD178a90C41ff3DcffbfDEF7De0BAF76Cbfe6a121)
  - maxAmount: **50 million RLUSD**
  - slope: **50 million RLUSD per day**

##### [Mainnet] Onboard Agora AUSD

- **Authorization**: [A.6.1.1.2.2.6.1.3.1.11.1.2](https://sky-atlas.io/#A.6.1.1.2.2.6.1.3.1.11.1.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-11th-2025-proposed-changes-to-grove-for-upcoming-spell/27459)

Onboard Agora AUSD to the Grove Liquidity Layer with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- Deposits:
  - Deposit Address: [0xfEa17E5f0e9bF5c86D5d553e2A074199F03B44E8](https://etherscan.io/address/0xfEa17E5f0e9bF5c86D5d553e2A074199F03B44E8)
  - maxAmount: **50 million USDC**
  - slope: **50 million USDC per day**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

---
title: Template - [Executive Vote] March 2026 Monthly Settlement Cycle, Update Staking Rewards, Adjust ALLOCATOR-BLOOM-A and ALLOCATOR-PATTERN-A DC-IAM Parameters, Whitelist Pattern ALMProxy, Prime Agent Proxy Spells - April 23, 2026
summary: Execute Monthly Settlement Cycle and Treasury Management Function for March 2026, update LSSKY->SKY staking rewards, increase ALLOCATOR-BLOOM-A target available debt; increase ALLOCATOR-PATTERN-A target available debt and maximum debt ceiling, whitelist Pattern ALMProxy on the LitePSM, whitelist proxy spells for Spark, Grove, and Pattern.
date: 2026-04-23T00:00:00.000Z
address: "0x06851b5235Cefb29C60EF3b29EB1f661D960B125"
---

# [Executive Proposal] March 2026 Monthly Settlement Cycle, Update Staking Rewards, Adjust ALLOCATOR-BLOOM-A and ALLOCATOR-PATTERN-A DC-IAM Parameters, Whitelist Pattern ALMProxy on the LitePSM, Prime Agent Proxy Spells - April 23, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Monthly Settlement Cycle and Treasury Management Function for March 2026 will be executed.
- LSSKY->SKY staking rewards will be updated.
- The [Debt Ceiling Instant Access Module (DC-IAM) parameters](https://sky-atlas.io/#93c9f662-4e0d-477e-8fc9-e3726877e842) for ALLOCATOR-BLOOM-A and ALLOCATOR-PATTERN-A will be adjusted.
- Pattern ALMProxy will be whitelisted on the LitePSM.
- Prime Agent proxy spells for Spark, Grove, and Pattern will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Monthly Settlement Cycle for March 2026

- **Authorization**: [Atlas A.2.4 - Sky Core Monthly Settlement Cycle](https://sky-atlas.io/#A.2.4)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/msc-7-settlement-summary-march-2026/27844)

If this executive proposal passes, then the March 2026 Monthly Settlement Cycle will be executed by taking the following steps.

#### Spark

- Mint **7,662,339 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Send **1,725,726 USDS** from the Surplus Buffer to the [SPARK_SUBPROXY](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **6,290,684 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.
- Send **138,412 USDS** from the Surplus Buffer to the [GROVE_SUBPROXY](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Keel

- Send **30,241 USDS** from the surplus buffer to the [KEEL_SUBPROXY](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **2,075,648 USDS** debt in ALLOCATOR-OBEX-A and transfer the amount to the Surplus Buffer.
- Send **69,793 USDS** from the Surplus Buffer to the [OBEX_SUBPROXY](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **225,299 USDS** from the Surplus Buffer to the [SKYBASE_SUBPROXY](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Treasury Management Function

- Transfer **678,176 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).
- Transfer **33,908 USDS** from the Surplus Buffer to the [Aligned Delegates Buffer](https://etherscan.io/address/0x37FC5d447c8c54326C62b697f674c93eaD2A93A3).

### LSSKY->SKY Staking Rewards Normalization

- **Authorization**: [Atlas A.2.3.1.4.2.2.2 - SKY Staking Rewards](https://sky-atlas.io/#293e4c9f-1e26-4d4b-b769-650a02eca8b8), [Core Facilitator Authorization](https://forum.skyeco.com/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/15)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/14)

If this executive proposal passes, then the distribution of SKY token rewards to SKY stakers will be normalized as per [A.4.4.1.4.2 - Short Term SKY Rewards For SKY Stakers](https://sky-atlas.io/#A.4.4.1.4.2), by executing the following actions:

- Update LSSKY->SKY Farm vest by calling [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with params:
  - dist: [0x675671A8756dDb69F7254AFB030865388Ef699Ee](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - vestTot: **53,960,949 SKY**
  - vestBgn: **block.timestamp**
  - vestTau: **90 days**

### [Debt Ceiling Instant Access Module (DC-IAM)](https://sky-atlas.io/#93c9f662-4e0d-477e-8fc9-e3726877e842) Parameters Update

- **Authorization**: [Governance Poll 1629](https://vote.sky.money/polling/QmNXSS7H)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-20/27851)

If this executive proposal passes, then the following [Debt Ceiling Instant Access Module (DC-IAM)](https://sky-atlas.io/#93c9f662-4e0d-477e-8fc9-e3726877e842) parameters will be updated as follows.

#### Grove (ALLOCATOR-BLOOM-A) Update

- Increase ALLOCATOR-BLOOM-A [Target Available Debt (gap)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 250 million USDS from 250 million USDS to **500 million USDS**.
- Leave other parameters at current values; [Maximum Debt Ceiling (line)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) 5 billion USDS, [Ceiling Increase Cooldown (ttl)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) 24 hours.

#### Pattern (ALLOCATOR-PATTERN-A) Updates

- Increase ALLOCATOR-PATTERN-A [Target Available Debt (gap)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 40 million USDS from 10 million USDS to **50 million USDS**.
- Increase ALLOCATOR-PATTERN-A [Maximum Debt Ceiling (line)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 2.49 billion USDS from 10 million USDS to **2.5 billion USDS**.
- Leave [Ceiling Increase Cooldown (ttl)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) at current value (24 hours).

### Whitelist Pattern ALMProxy

- **Authorization**: [Governance Poll 1629](https://vote.sky.money/polling/QmNXSS7H)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-20/27851)

If this executive proposal passes, then the Pattern ALMProxy at [0xbA43325E91C79E500486a23E953ab3d8C46f169F](https://etherscan.io/address/0xbA43325E91C79E500486a23E953ab3d8C46f169F) will be whitelisted on the [LitePSM](https://etherscan.io/address/0xf6e72Db5454dd049d0788e411b06CfAF16853042).

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [0x160158d029697FEa486dF8968f3Be17a706dF0F0](https://etherscan.io/address/0x160158d029697FEa486dF8968f3Be17a706dF0F0) and codehash `0x96a0d4068774d80f3790f489aa1bbd37e45d6a019161743ad00eaf61e26466b6` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [0x76Ba24676e1055D3E6b160086f0bc9BaffF76929](https://etherscan.io/address/0x76Ba24676e1055D3E6b160086f0bc9BaffF76929) and codehash `0x43fa1611223445715e33c2ad7baf836cb4c8a00a0ede6fff428b742baefa12c6` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then a Pattern proxy spell with address [0x31831aE3C13f72afcCcf0aAF49b6f9319ed9C4C0](https://etherscan.io/address/0x31831aE3C13f72afcCcf0aAF49b6f9319ed9C4C0) and codehash `0x1478866625ae91e3ca50fa4ff871f5721862e24b9428f15f49b093cc3305587b` will be whitelisted in the [Pattern StarGuard](https://etherscan.io/address/0x2fb18b28fB39Ec3b26C3B5AF5222e2ca3B8B2269).

#### Spark

##### [Ethereum] SparkLend - Update ETH Interest Rate Model

- **Authorization**: [Atlas A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-spark-for-upcoming-spell/27831)

The SparkLend ETH Interest Rate model will be updated as follows:

- [slope1](https://sky-atlas.io/#f22da959-a76e-477a-a87b-a32c429d2ec0): **Lido stETH yield - 0.1%**.
- [slope2](https://sky-atlas.io/#fb127571-4e01-4deb-b4cf-8fad2f7c9b71): **75%**.

##### [Ethereum] SparkLend - Update USDT Interest Rate Model

- **Authorization**: [Atlas A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-spark-for-upcoming-spell/27831)

The SparkLend USDT Interest Rate model will be updated as follows:

- [slope1](https://sky-atlas.io/#f22da959-a76e-477a-a87b-a32c429d2ec0): Decrease by 0.75% from (SSR + 1.25%) to **SSR + 0.5%**.

##### [Ethereum] SparkLend - Deprecate rETH

- **Authorization**: [Atlas A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-spark-for-upcoming-spell/27831)

rETH will be deprecated by applying the following parameters:

- Freeze rETH supply and borrow.
- Set rETH [LTV](https://sky-atlas.io/#586478a3-51cb-4a2e-8bb1-b96e6520fdcc) to **0%**.

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [Atlas A.6.1.1.1.2.6.1.2.1.2.3 - Token Claim Authorization](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-spark-for-upcoming-spell/27831)

SparkLend reserves will be claimed as follows:

- Claim all reserves.
- Transfer USD stablecoin reserves to ALM Proxy.
- Transfer non-USD stablecoin reserves to Spark Operations Multisig [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to be liquidated.

##### [Ethereum] Spark Treasury - Monthly Grants for Spark Foundation and Spark Assets Foundation

- **Authorization**: [Atlas A.2.8.2.2.2.5.5.3 - Spark Foundation Grant Authorization: Q2 2026](https://sky-atlas.io/#b69158da-476a-4d4b-b7ef-2f8b96b73d23)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-spark-for-upcoming-spell/27831)

The following grant transfers will be made:

- Spark Foundation Grant
  - Recipient address: [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec).
  - Transfer amount: **1,100,000 USDS**.
- Spark Asset Foundation Grant
  - Recipient address: [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911).
  - Transfer amount: **100,000 USDS**.

#### Grove

##### [Ethereum] Increase USDS Mint Rate Limits

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-grove-for-upcoming-spell/27829)

The following [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) changes will be made to the Grove Liquidity Layer:

- USDS Mint (LIMIT_USDS_MINT):
  - Max amount: **500 million USDS**.
  - Slope: **500 million USDS per day**.

##### [Ethereum] Onboard USDS to Centrifuge JTRSY

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-grove-for-upcoming-spell/27829)

USDS will be onboarded to Centrifuge JTRSY with the following [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- JTRSY (USDS Vault): [0x381f4F3B43C30B78C1f7777553236e57bB8AE9ff](https://etherscan.io/address/0x381f4F3B43C30B78C1f7777553236e57bB8AE9ff)
  - Underlying Asset: USDS
  - Deposits:
    - Max amount: **500 million USDS**
    - Slope: **500 million USDS per day**.
  - Withdrawals:
    - Amount: **Unlimited**.

##### [Ethereum] Onboard USDS SkyLink Transfers to Avalanche

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-grove-for-upcoming-spell/27829)

USDS will be onboarded to for Skylink transfers to Avalanche with the following [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- USDS SkyLink (Ethereum → Avalanche):
  - Max amount: **50 million USDS**.
  - Slope: **50 million USDS per day**.

##### [Avalanche] Upgrade ForeignController to v1.8.0

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-grove-for-upcoming-spell/27829)

The Avalanche ForeignController will be upgraded from v1.6.0 to **v1.8.0**.

##### [Avalanche] Onboard USDS SkyLink Transfers to Ethereum

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-grove-for-upcoming-spell/27829)

USDS will be onboarded to for Skylink transfers from Avalanche to Ethereum with the following [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- USDS SkyLink (Avalanche → Ethereum):
  - Max amount: **20 million USDS**.
  - Slope: **20 million USDS per day**.

##### [Avalanche] Increase CCTP USDC Transfer to Ethereum Rate Limit

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-grove-for-upcoming-spell/27829)

The CCTP USDC transfer [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) from Avalanche to Ethereum will be updated as follows:

- CCTP USDC (Avalanche → Ethereum):
  - Max amount: **Unlimited**.
  - Slope: **Unlimited**.

##### [Avalanche] Onboard USDS/USDC Curve Stableswap Swaps & LP

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-23-2026-proposed-changes-to-grove-for-upcoming-spell/27829)

USDS/USDC Curve Stableswap Swaps and LP will onboarded with the following [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- Pool: [0xA9d7d3D7e68a0cae89FB33c736199172f405C8D3](https://snowscan.xyz/address/0xA9d7d3D7e68a0cae89FB33c736199172f405C8D3)
- Swaps:
  - **5 million USDS max**
  - **100 million USDS per day slope**
  - **0.1% maxSlippage**
- LP Deposits
  - **50 million USDS max**
  - **50 million USDS per day slope**
- LP Withdrawals
  - **Unlimited**

#### Pattern

##### [Ethereum] Deploy Pattern Liquidity Layer

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/proposed-changes-to-pattern-for-upcoming-spell/27835)

The Pattern Liquidity Layer will be deployed on mainnet with the following contracts and [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2).

###### Contracts

| Contract Name | Address | Deployed By
|---------------|---------|-------------|
| Allocator Buffer     | [0x823459b55D79F0421f24a4828237F7ecb8D7F1ef](https://forum.skyeco.com/t/technical-scope-of-the-new-pattern-allocator-instance/27641) | Core |
| Allocator Vault      | [0xbd34fc6AAa1d3F52B314CB9D78023dd23eAc3B0E](https://forum.skyeco.com/t/technical-scope-of-the-new-pattern-allocator-instance/27641) | Core |
| SubProxy             | [0xbC8959Ae2d4E9B385Fe620BEF48C2FD7f4A84736](https://forum.skyeco.com/t/technical-scope-of-the-new-pattern-allocator-instance/27641) | Core |
| Mainnet Controller   | [0x8739a869E41e828c83EA45575fBDf9FfcC0962b1](https://etherscan.io/address/0x8739a869E41e828c83EA45575fBDf9FfcC0962b1) | Pattern |
| ALM Proxy            | [0xbA43325E91C79E500486a23E953ab3d8C46f169F](https://etherscan.io/address/0xbA43325E91C79E500486a23E953ab3d8C46f169F) | Pattern
| Rate Limits          | [0xa77f69f90646A4c0e44cEe1D44Fab08bEb4EA204](https://etherscan.io/address/0xa77f69f90646A4c0e44cEe1D44Fab08bEb4EA204) | Pattern
| Relayer          | [0xd00665Df77E0b1294Ae2bdC3662F870092f6737B](https://etherscan.io/address/0xd00665Df77E0b1294Ae2bdC3662F870092f6737B) | Soter (GovOps)
| Freezer          | [0xe728D67bca6cb18dE249325792b6379Eef4618bB](https://etherscan.io/address/0xe728D67bca6cb18dE249325792b6379Eef4618bB) | Soter (GovOps)

###### Initial Parameters

Pattern Liquidity Layer [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) for initial activation:

| Parameter |            Max Amount          |   Slope (Tokens/Day)    |
|----------|------------|-------------------|
|LIMIT_USDS_MINT        |100,000,000      |	50,000,000   |
|LIMIT_USDS_TO_USDC	    |100,000,000	  |   50,000,000 |
|LIMIT_4626_DEPOSIT (Maple Finance)       |100,000,000   |  20,000,000 |
| LIMIT_MAPLE_REDEEM    | type(uint256).max | 0 |

##### [Ethereum] Onboard Maple syrupUSDC

- **Authorization**: [Governance Poll 1628](https://vote.sky.money/polling/QmVAKhR6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/proposed-changes-to-pattern-for-upcoming-spell/27835)

syrupUSDC will be onboarded to the Pattern Liquidity Layer with the following [rate limits]((https://sky-atlas.io/#A.2.2.9.1.1.1.2.2)):

- Max amount: **100 million USDC**.
- Slope: **20 million USDC per day**.
- Notes: Adheres to the RRC constraints. Withdrawals only.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

---
title: Template - [Executive Vote] Initialize GROVE Token Rewards, Whitelist New Grove ALMProxy on LitePSM, Add PAU Beacon to Chainlog, Transfer USDS from Amatsu SubProxy to SFF, Update Safe Harbor Agreement, Prime Agent Proxy Spells - July 2, 2026
summary: Initialize GROVE token rewards farm, whitelist the new Grove ALMProxy on LitePSM, add PAU_BEACON to the Chainlog, transfer 14 million USDS from the Amatsu SubProxy to the Sky Frontier Foundation, update the Safe Harbor Agreement, and whitelist Spark, Grove, and Skybase proxy spells.
date: 2026-07-02T00:00:00.000Z
address: "0xEbf156fB6C87cBE0a962944eC254b519c1441A51"
---

# [Executive Proposal] Initialize GROVE Token Rewards, Whitelist New Grove ALMProxy on LitePSM, Add PAU Beacon to Chainlog, Transfer USDS from Amatsu SubProxy to SFF, Update Safe Harbor Agreement, Prime Agent Proxy Spells - July 2, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If this executive proposal passes, then the following actions will occur within the Sky Protocol:

## Executive Summary

- GROVE token rewards for USDS stakers will be initialized, with an initial stream of 2.45 billion GROVE tokens over 2 years.
- The [new Grove ALMProxy](https://etherscan.io/address/0x0DcD9298e163dFD3c0B5b00F0d9093C36e40A153) will be whitelisted on `MCD_LITE_PSM_USDC_A`.
- `PAU_BEACON` will be added to the [chainlog](https://chainlog.skyeco.com/).
- **14 million USDS** will be transferred from Amatsu's SubProxy to Sky Frontier Foundation.
- The Safe Harbor Agreement will be updated.
- Spark, Grove, and Skybase proxy spells will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your MKR/SKY in support of the changes outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal **has its earliest execution date set to Monday, July 6, 2026 at 18:00 UTC**. This means that it cannot be executed before that date.

This executive proposal includes an office-hours modifier that ensures the proposal can only be executed between 14:00 and 21:00 UTC, Monday through Friday. This is to ensure that at least some auction keepers are available to react to unforeseen market events that may occur as a result of the changes included in this executive proposal.

This executive proposal will be valid for 30 days from its creation. This means that if this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Initialize GROVE Token Rewards

- **Authorization**: [Governance Poll ID 1639](https://vote.sky.money/polling/Qmd3gCcD)
- **Proposal**: [Technical Scope: Grove Farm](https://forum.skyeco.com/t/technical-scope-grove-farm/27999)

If this executive proposal passes, then a USDS -> GROVE farm will be initialized, enabling users to stake USDS and receive GROVE rewards.

The following actions will occur:

- Add [`0xcBCfCD450de686894d3C5E7E8975cF23EEF077B2`](https://etherscan.io/address/0xcBCfCD450de686894d3C5E7E8975cF23EEF077B2) to the [chainlog](https://chainlog.skyeco.com/) as `MCD_VEST_GROVE_TREASURY`.
- Add [`0xB30FE1Cf884B48a22a50D22a9282004F2c5E9406`](https://etherscan.io/address/0xB30FE1Cf884B48a22a50D22a9282004F2c5E9406) to the [chainlog](https://chainlog.skyeco.com/) as `GROVE`.
- Initialize the USDS -> GROVE farm with [`TreasuryFundedFarmingInit.initFarm`](https://github.com/sky-ecosystem/endgame-toolkit/blob/4f238f9b23298190150d49482bad56c00f0af825/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L59) using the following parameters:
  - `stakingToken`: [**USDS**](https://etherscan.io/address/0xdC035D45d973E3EC169d2276DDab16f1e407384F)
  - `rewardsToken`: [**GROVE**](https://etherscan.io/address/0xB30FE1Cf884B48a22a50D22a9282004F2c5E9406)
  - `rewards`: [**0x4E41488C19cD35EB4de3083Fc3e204854c75c86a**](https://etherscan.io/address/0x4E41488C19cD35EB4de3083Fc3e204854c75c86a)
  - `rewardsKey`: **"REWARDS_USDS_GROVE"**
  - `dist`: [**0xAf7a108B4fB0b2F65E1Acc9E1a548abe482559C4**](https://etherscan.io/address/0xAf7a108B4fB0b2F65E1Acc9E1a548abe482559C4)
  - `distKey`: **"REWARDS_DIST_USDS_GROVE"**
  - `distJob`: [**CRON_REWARDS_DIST_JOB**](https://etherscan.io/address/0x6464C34A02DD155dd0c630CE233DD6e21C24F9A5)
  - `distJobInterval`: **7 days - 1 hours**
  - `vest`: [**MCD_VEST_GROVE_TREASURY**](https://etherscan.io/address/0xcBCfCD450de686894d3C5E7E8975cF23EEF077B2)
  - `vestTot`: **2.45 billion GROVE**
  - `vestBgn`: **block.timestamp - 7 days**
  - `vestTau`: **730 days**

### Whitelist New Grove ALMProxy on LitePSM

- **Authorization**: [Governance Poll ID 1638](https://vote.sky.money/polling/QmdXjfm6)
- **Proposal**: [July 2, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-grove-for-upcoming-spell/27976)

If this executive proposal passes, then the new Grove ALMProxy at [`0x0DcD9298e163dFD3c0B5b00F0d9093C36e40A153`](https://etherscan.io/address/0x0DcD9298e163dFD3c0B5b00F0d9093C36e40A153) will be whitelisted on [`MCD_LITE_PSM_USDC_A`](https://etherscan.io/address/0xf6e72Db5454dd049d0788e411b06CfAF16853042).

### Add PAU Beacon to Chainlog

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#fd030da6-1a4d-4df6-8e87-043d4b9666d5)
- **Proposal**: [Diamond PAU and Beacon Launch](https://forum.skyeco.com/t/diamond-pau-and-beacon-launch/27997)

If this executive proposal passes, then the Beacon for the Diamond Parallelized Allocation Unit (PAU) at [`0x829dC2b7E94B1954F0764E573f2E0d45Afa28199`](https://etherscan.io/address/0x829dC2b7E94B1954F0764E573f2E0d45Afa28199) will be added to the [chainlog](https://chainlog.skyeco.com/) as `PAU_BEACON`.

The Beacon has been preconfigured with the following facets:

- [AAVE_FACET](https://etherscan.io/address/0x8CE890A96a193ff2DD4B2eA3C682326F655f6b62)
- [BASIN_FACET](https://etherscan.io/address/0xC84825BCD13AEddc372400239499380376a44A39)
- [CCTP_FACET](https://etherscan.io/address/0xADf62692340e46EF90336f2e75ce3b37f1148873)
- [CENTRIFUGE_FACET](https://etherscan.io/address/0xa0A10BA97be1412730D694B8dE1afe7eff20eC31)
- [CURVE_FACET](https://etherscan.io/address/0x139D81d7d6040fAeF7cF0EF5A2636Ca8a97a30d8)
- [DAIUSDS_FACET](https://etherscan.io/address/0x3817F734CAe6AD2BDb79F9ff23091F2AD478da5F)
- [ERC4626_FACET](https://etherscan.io/address/0x1dCA18608c89174181153E786778705b4A0E1a06)
- [ERC7540_FACET](https://etherscan.io/address/0x4f7e0E3612b0e1E156A2B6570a51d4BD709F1315)
- [ETHENA_FACET](https://etherscan.io/address/0xEc48D773CEef1c6b07CdA1afA2716C478b55187B)
- [FARM_FACET](https://etherscan.io/address/0xF24E91f5D8529436c9fB92dd94F80d4A6C25d0f0)
- [LAYER_ZERO_FACET](https://etherscan.io/address/0xA0c323a0acb20F259eA4ff343319D450BE6472e5)
- [MAPLE_FACET](https://etherscan.io/address/0x691b5c26aD2B74d2376f4eD87904E9D3E47bD630)
- [MERKL_FACET](https://etherscan.io/address/0x321138Db5E056e9d0080D4c278e10A1EdC091Eb0)
- [OTC_FACET](https://etherscan.io/address/0x46b24ba00B65CB4f603447590e539b08097fb7Ac)
- [PENDLE_FACET](https://etherscan.io/address/0xcC9dD4c9B2a9c08f2692e7060F43d29A03E87348)
- [PSM_FACET](https://etherscan.io/address/0xE4A5dAc768a310cc2316f258901b32E499653064)
- [SPARK_VAULT_FACET](https://etherscan.io/address/0xff0d19920E207e3A17eb5A2E5bA3AFA44836362b)
- [SUPERSTATE_FACET](https://etherscan.io/address/0xeE197475607E9a27cCAA4786e740d2F0d0E706A7)
- [TRANSFER_ASSET_FACET](https://etherscan.io/address/0x4DA7608C331b8f135df5b985018933780eCd089D)
- [UNISWAP_V3_FACET](https://etherscan.io/address/0x445D9Dc752F269Be48250f1A180CAC4c61cE4bab)
- [UNISWAP_V4_FACET](https://etherscan.io/address/0x75D35ffB8e6B871E12EB549CcF6afD324c46E47D)
- [USDS_FACET](https://etherscan.io/address/0x1221CC4B85Ab260660aD21C2829e0EB516dffBc7)
- [WEETH_FACET](https://etherscan.io/address/0x1d8D089EB7D558F5dc6aA0cf98DDe13B77b3F641)
- [WRAP_PROXY_ETH_FACET](https://etherscan.io/address/0x081506DE21C695Af5e61a81aD288C8A96B6b59B9)
- [WSTETH_FACET](https://etherscan.io/address/0x3a82D11Cd37Fb0098363262Dc69425d07Fa05516)

### Transfer USDS from Amatsu SubProxy to SFF

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#06bac1e1-ae52-4c67-8ca9-0dcec22dddee)
- **Proposal**: [Technical Scope for Transferring Funds from the SubProxy](https://forum.skyeco.com/t/technical-scope-for-transferring-funds-from-the-subproxy/28004)

If this executive proposal passes, then the following actions will occur:

- [`0x5162489F4FEa651b76c75193387d08aAAC9CB52C`](https://etherscan.io/address/0x5162489F4FEa651b76c75193387d08aAAC9CB52C) will be added to the [chainlog](https://chainlog.skyeco.com/) as `SUBPROXY_METHODS`.
- `SUBPROXY_METHODS` will be executed in `AMATSU_SUBPROXY` to transfer **14 million USDS** to Sky Frontier Foundation at [`0xca5183FB9997046fbd9bA8113139bf5a5Af122A0`](https://etherscan.io/address/0xca5183FB9997046fbd9bA8113139bf5a5Af122A0).

### Safe Harbor Update

- **Authorization**: [Sky Atlas - A.2.11.1.2.3 - Safe Harbor Modifications](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, then the Safe Harbor Agreement will be updated to include the following Sky Core contracts added to the chainlog in this spell:

- [MCD_VEST_GROVE_TREASURY](https://etherscan.io/address/0xcBCfCD450de686894d3C5E7E8975cF23EEF077B2)
- [REWARDS_USDS_GROVE](https://etherscan.io/address/0x4E41488C19cD35EB4de3083Fc3e204854c75c86a)
- [REWARDS_DIST_USDS_GROVE](https://etherscan.io/address/0xAf7a108B4fB0b2F65E1Acc9E1a548abe482559C4)
- [PAU_BEACON](https://etherscan.io/address/0x829dC2b7E94B1954F0764E573f2E0d45Afa28199)
- [SUBPROXY_METHODS](https://etherscan.io/address/0x5162489F4FEa651b76c75193387d08aAAC9CB52C)

Additionally the 25 pre-configured facets listed above and three factory contracts listed below for Diamond PAU deployments that have not been added to the chainlog will be added. The additional contracts are:

- [PAU Factory](https://etherscan.io/address/0x69A5d548830AC2A4Ba90A44a2C75BDA71f97fc66)
- [Administered Agent Factory](https://etherscan.io/address/0x2968c3b5478cF93B70aB1e24255d4EDBBd27a089)
- [Default PAU Assembler](https://etherscan.io/address/0xc812aAD3FaE2D3511C664374B601a9BeBFeCCa2E)

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0xcc7529473B850103524905D3914470898aDe8747`](https://etherscan.io/address/0xcc7529473B850103524905D3914470898aDe8747) and codehash `0xf952ba1ea1df8c42217cecd3c4e88abcde2864fbf1e4465b1a13af0bf05e00f0` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0xa21d2E301D50AfF797143deb5a7C400482E9122C`](https://etherscan.io/address/0xa21d2E301D50AfF797143deb5a7C400482E9122C) and codehash `0xb3377dba77dfd8bce7c272e7c4c445ab48b3d0ec3fd0a52f512a39974f059a0f` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then a Skybase proxy spell with address [`0xd3e4e16ED515Be794fd181D7d2cEB0447A6f2cb5`](https://etherscan.io/address/0xd3e4e16ED515Be794fd181D7d2cEB0447A6f2cb5) and codehash `0x09c387eed3e4373a4cc91fc28686e103cfc704335279f65f2f7308f474c002d9` will be whitelisted in the [Skybase StarGuard](https://etherscan.io/address/0xA170086AeF9b3b81dD73897A0dF56B55e4C2a1F7).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/170).

##### [Ethereum] SparkLend - Set USDC Interest Rate Model to Target Very Low Liquidity

- **Authorization**: [Sky Atlas - A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#A.6.1.1.1.3.2.1.2.1)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will update the SparkLend USDC interest rate model by deploying a new `RateTargetKinkInterestRateStrategy` and setting it as the USDC reserve interest rate strategy using `PoolConfigurator.setReserveInterestRateStrategyAddress`.

The following SparkLend USDC interest rate parameters will be updated:

- [Optimal utilization (`kink`)](https://sky-atlas.io/#a6677e8a-7ef1-460b-a5cd-5411319bf2c0) will be increased from **95%** to **98%**.
- Slope1 spread above the rate source will be decreased from **125 bps** to **100 bps**.
- [Base variable borrow rate](https://sky-atlas.io/#9006fd8d-bd13-48fc-bf2f-04f47579b3b0), variable slope2, and [reserve factor](https://sky-atlas.io/#a68d2ffe-e541-4754-b11e-6cafe7b4ae5c) will remain unchanged.
- Rate source (sUSDS/SSR) anchor: [0x57027B6262083E3aC3c8B2EB99f7e8005f669973](https://etherscan.io/address/0x57027B6262083E3aC3c8B2EB99f7e8005f669973)

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will claim all SparkLend reserves. USD stablecoin reserves will be transferred to the Spark ALMProxy and non-USD reserves will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

##### [Ethereum] Spark Liquidity Layer - Enable USDT Bridging to Arbitrum

- **Authorization**: [Snapshot Poll 0xcd464acf44fc25d8f5514dd55e4861171eff163256deeea7ab6280b4fa36d342](https://snapshot.box/#/s:sparkdao.eth/proposal/0xcd464acf44fc25d8f5514dd55e4861171eff163256deeea7ab6280b4fa36d342)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will enable USDT bridging from Ethereum to Arbitrum.

The following rate limit parameters will be applied:

- Bridge USDT0 to Arbitrum (Ethereum → Arbitrum route)
  - destination: ALM Proxy on Arbitrum ([0x92afd6F2385a90e44da3a8B60fe36f6cBe1D8709](https://arbiscan.io/address/0x92afd6F2385a90e44da3a8B60fe36f6cBe1D8709))
  - maxAmount: **5,000,000 USDT**
  - slope: **50,000,000 USDT/day**

##### [Base] Spark Liquidity Layer - Remove Excess Liquidity

- **Authorization**: [Snapshot Poll 0x4f6d3e7f769d8fe5c7713338274a24bb7932f0fb0d46ce0bc0c0f0087172fa2b](https://snapshot.box/#/s:sparkdao.eth/proposal/0x4f6d3e7f769d8fe5c7713338274a24bb7932f0fb0d46ce0bc0c0f0087172fa2b)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will withdraw all USDS and sUSDS in the [Base ALMProxy](https://basescan.org/address/0x2917956eFF0B5eaF030abDB4EF4296DF775009cA) back to the [Ethereum ALMProxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).

##### [OP Mainnet] Spark Liquidity Layer - Remove Excess Liquidity

- **Authorization**: [Snapshot Poll 0x4f6d3e7f769d8fe5c7713338274a24bb7932f0fb0d46ce0bc0c0f0087172fa2b](https://snapshot.box/#/s:sparkdao.eth/proposal/0x4f6d3e7f769d8fe5c7713338274a24bb7932f0fb0d46ce0bc0c0f0087172fa2b)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will withdraw all USDS and sUSDS in the [OP Mainnet ALMProxy](https://optimistic.etherscan.io/address/0x876664f0c9Ff24D1aa355Ce9f1680AE1A5bf36fB) back to the [Ethereum ALMProxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).

##### [Unichain] Spark Liquidity Layer - Remove Excess Liquidity

- **Authorization**: [Snapshot Poll 0x4f6d3e7f769d8fe5c7713338274a24bb7932f0fb0d46ce0bc0c0f0087172fa2b](https://snapshot.box/#/s:sparkdao.eth/proposal/0x4f6d3e7f769d8fe5c7713338274a24bb7932f0fb0d46ce0bc0c0f0087172fa2b)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will withdraw all USDS and sUSDS in the [Unichain ALMProxy](https://uniscan.xyz/address/0x345E368fcCd62266B3f5F37C9a131FD1c39f5869) back to the [Ethereum ALMProxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).

##### [Arbitrum] Spark Savings - Deploy spUSDT

- **Authorization**: [Snapshot Poll 0xbf916af7e6765a7d0ebd1d8d09cf58856bac0d46e7c5d597e411fb86f4f7c004](https://snapshot.box/#/s:sparkdao.eth/proposal/0xbf916af7e6765a7d0ebd1d8d09cf58856bac0d46e7c5d597e411fb86f4f7c004)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will deploy `spUSDT` on Arbitrum with the following address, parameters, and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- spUSDT addresses
  - Spark Vaults v2 Implementation: [0x282dAfE8B97e2Db5053761a4601ab2E1CB976318](https://arbiscan.io/address/0x282dAfE8B97e2Db5053761a4601ab2E1CB976318)
  - spUSDT: [0x45d91340B3B7B96985A72b5c678F7D9e8D664b62](https://arbiscan.io/address/0x45d91340B3B7B96985A72b5c678F7D9e8D664b62)
- Roles
  - Default admin: [0x65d946e533748A998B1f0E430803e39A6388f7a1](https://arbiscan.io/address/0x65d946e533748A998B1f0E430803e39A6388f7a1) (Spark Executor on Arbitrum)
  - Setter: [0x4eE67c8Db1BAa6ddE99d936C7D313B5d31e8fa38](https://arbiscan.io/address/0x4eE67c8Db1BAa6ddE99d936C7D313B5d31e8fa38) (ALM Proxy Freezable)
  - Taker: [0x92afd6F2385a90e44da3a8B60fe36f6cBe1D8709](https://arbiscan.io/address/0x92afd6F2385a90e44da3a8B60fe36f6cBe1D8709) (ALM Proxy on Arbitrum)
- Yield
  - Max yield: **6%**
  - Current yield (at launch): **0%**
- Supply cap: **250 million USDT**
- SLL rate limits
  - take
    - maxAmount: **unlimited**
  - transferAssets
    - recipient: spUSDT address
    - maxAmount: **unlimited**
  - Bridge USDT0 to Ethereum (Arbitrum → Ethereum return route)
    - destination: ALM Proxy on Ethereum [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E)
    - maxAmount: **unlimited**
- ALM Proxy Freezable roles
  - Allocator (primary relayer): [0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB](https://arbiscan.io/address/0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB)
  - Allocator (backstop relayer): [0x8Cc0Cb0cfB6B7e548cfd395B833c05C346534795](https://arbiscan.io/address/0x8Cc0Cb0cfB6B7e548cfd395B833c05C346534795)
  - Freezer: [0x90D8c80C028B4C09C0d8dcAab9bbB057F0513431](https://arbiscan.io/address/0x90D8c80C028B4C09C0d8dcAab9bbB057F0513431)

##### [Avalanche] Spark Liquidity Layer - Add Timelock and Guardian to Avalanche Governance Bridge

- **Authorization**: [Snapshot Poll 0x5f3a987f3537ca167cccb614c46168e0f04e8cbfc2236c553b2ba5d858a18e22](https://snapshot.box/#/s:sparkdao.eth/proposal/0x5f3a987f3537ca167cccb614c46168e0f04e8cbfc2236c553b2ba5d858a18e22)
- **Proposal**: [July 2, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-spark-for-upcoming-spell/27982)

If this executive proposal passes, then the Spark proxy spell will add a timelock and guardian to the Avalanche governance bridge.

The following parameters will be used:

- Timelock delay: **3 days**
- Planned guardian multisig: [`0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC`](https://snowtrace.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC)

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/61).

##### [Ethereum] Onboard the Diamond PAU Controller on the New Grove Allocator Instance

- **Authorization**: [Governance Poll ID 1638](https://vote.sky.money/polling/QmdXjfm6)
- **Proposal**: [July 2, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-grove-for-upcoming-spell/27976)

If this executive proposal passes, then the Diamond PAU Controller will be onboarded on the new Grove Allocator instance with the following contracts and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5).

###### Contracts

| Contract Name | Address |
| --- | --- |
| Grove Allocator Vault (`ALLOCATOR-GROVE-A`)  | [0xf739a30c74927dc6cFA3B67E4933872a1FC5F4EB](https://etherscan.io/address/0xf739a30c74927dc6cFA3B67E4933872a1FC5F4EB) |
| Grove Allocator Buffer | [0x436DABce608f73BeA2b75fba35bffe72739697d5](https://etherscan.io/address/0x436DABce608f73BeA2b75fba35bffe72739697d5) |
| New ALMProxy | [0x0DcD9298e163dFD3c0B5b00F0d9093C36e40A153](https://etherscan.io/address/0x0DcD9298e163dFD3c0B5b00F0d9093C36e40A153) |
| Grove Diamond PAU Controller | [0xbf83F5974B932c7D842254042717D6A2706CE5eE](https://etherscan.io/address/0xbf83F5974B932c7D842254042717D6A2706CE5eE) |
| Grove PAU Rate Limits | [0xE016Ae733A77Ba77E7907aAA749394Fc5e75C0e1](https://etherscan.io/address/0xE016Ae733A77Ba77E7907aAA749394Fc5e75C0e1) |
| Grove PAU AccessControls | [0x4F6d1704700cd494DD4cd9bF59c0C39DA1Bc9164](https://etherscan.io/address/0x4F6d1704700cd494DD4cd9bF59c0C39DA1Bc9164) |
| Grove ALM Relayer 1 | [0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f](https://etherscan.io/address/0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f) |
| Grove Secondary Relayer Operator | [0x9187807e07112359C481870feB58f0c117a29179](https://etherscan.io/address/0x9187807e07112359C481870feB58f0c117a29179) |
| Core Operator Relayer (Soter Labs) | [0x4364D17B578b0eD1c42Be9075D774D1d6AeAFe96](https://etherscan.io/address/0x4364D17B578b0eD1c42Be9075D774D1d6AeAFe96) |
| Grove Freezer Proxy | [0xB0113804960345fd0a245788b3423319c86940e5](https://etherscan.io/address/0xB0113804960345fd0a245788b3423319c86940e5) |

The proxy spell will:

- Set the controller's USDS vault: point the Diamond PAU Controller at the `ALLOCATOR-GROVE-A` AllocatorVault.
- Authorize the DPAU ALMProxy on the AllocatorVault.
- Approve the DPAU ALMProxy on the AllocatorBuffer.

###### Initial Parameters

[Rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) for initial activation:

| Parameter | Max Amount | Slope (Tokens/Day) |
| --- | --- | --- |
| LIMIT_USDS_MINT | **5,000,000 USDS** | **5,000,000 USDS/day** |
| LIMIT_USDS_BURN | **5,000,000 USDS** | **5,000,000 USDS/day** |
| LIMIT_USDS_TO_USDC | **5,000,000 USDS** | **5,000,000 USDS/day** |
| LIMIT_USDC_TO_USDS | **5,000,000 USDC** | **5,000,000 USDC/day** |

##### [Ethereum] Onboard the Tokenized Treasury Instances (Basin: JTRSY + BUIDL)

- **Authorization**: [Governance Poll ID 1638](https://vote.sky.money/polling/QmdXjfm6)
- **Proposal**: [July 2, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-grove-for-upcoming-spell/27976)

If this executive proposal passes, then the tokenized treasury instances for Basin: JTRSY and BUIDL will be onboarded with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- JTRSY-USDS:
  - LIMIT_BASIN_DEPOSIT:
    - maxAmount: **5,000,000 USDS**
    - slope: **5,000,000 USDS/day**
  - LIMIT_BASIN_WITHDRAW:
    - maxAmount: **Unlimited**
- BUIDL-USDS:
  - LIMIT_BASIN_DEPOSIT:
    - maxAmount: **5,000,000 USDS**
    - slope: **5,000,000 USDS/day**
  - LIMIT_BASIN_WITHDRAW:
    - maxAmount: **Unlimited**

##### [Ethereum] Swap USDC to USDS in Grove SubProxy

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#aa16daa3-ee62-49eb-851e-cb0708670144)
- **Proposal**: [July 2, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-grove-for-upcoming-spell/27976)

If this executive proposal passes, then **1,102,056.359999 USDC** will be swapped to USDS in the [Grove SubProxy](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

##### [Ethereum] Treasury Distribution - 800,000 USDS to the Grove Foundation Multisig

- **Authorization**: [Governance Poll ID 1638](https://vote.sky.money/polling/QmdXjfm6)
- **Proposal**: [July 2, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-grove-for-upcoming-spell/27976)

If this executive proposal passes, then **800,000 USDS** will be transferred from the [Grove SubProxy](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) to the [Grove Foundation Multisig](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

#### Skybase Proxy Spell

The Pull Request for the Skybase proxy spell can be viewed [here](https://github.com/skybase-foundation/skybase-spells/pull/1).

##### [Ethereum] Transfer 700,000 USDS from the Skybase SubProxy to the Skybase Foundation Operational Multisig

- **Authorization**: [Governance Poll ID 1638](https://vote.sky.money/polling/QmdXjfm6)
- **Proposal**: [July 2, 2026 Proposed Changes to Skybase for Upcoming Spell](https://forum.skyeco.com/t/july-2-2026-proposed-changes-to-skybase-for-upcoming-spell/27973)

If this executive proposal passes, then **700,000 USDS** will be transferred from the [Skybase SubProxy](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140) to the [Skybase Foundation Operational Multisig](https://etherscan.io/address/0x58B945c8Ce34BD8cEA3Fc0437626F9F87d58A621).

## Review

Community debate on this executive proposal can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com/). The [Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar) also shows upcoming votes and votes that are currently active.

To participate in voting, please follow the [Voting Guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance).

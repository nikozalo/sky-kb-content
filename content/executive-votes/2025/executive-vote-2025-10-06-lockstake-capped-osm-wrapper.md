---
title: Template - [Executive Vote] Launch Lockstake Capped OSM Wrapper, SKY Token Rewards Rebalance, Whitelist Keel ALM Proxy, Execute Prime Agent Proxy Spells - October 6, 2025
summary: Launch Lockstake Capped Oracle Security Module for SKY, normalize SKY Token Rewards, whitelist Keel ALM Proxy on the LitePSM, execute Proxy Spells for Spark, Grove, and Keel Prime Agents. 
date: 2025-10-06T00:00:00.000Z
address: "0x0727FFA3221a8D3cDaAaBc7d19Ed0583847496e1"
---

# [Executive Proposal] Launch Lockstake Capped OSM Wrapper, SKY Token Rewards Rebalance, Whitelist Keel ALM Proxy, Execute Prime Agent Proxy Spells - October 6, 2025

The Governance Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Lockstake Capped OSM Wrapper will be launched as described below. 
- The reward rate for the USDS-SKY farm will be updated with the actions described below.
- The Keel ALM Proxy will be whitelisted on the LitePSM. 
- Prime Agent proxy spells for Spark, Grove, and Keel will be executed.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/A.1.9.2.1.2_Pause_Delay_Current_Value/09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**. 

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Launch Lockstake Capped OSM Wrapper

- **Authorization**: Forum Post [1](https://forum.sky.money/t/technical-scope-of-the-lockstake-capped-osm-wrapper-launch/27246/4), [2](https://forum.sky.money/t/technical-scope-of-the-lockstake-capped-osm-wrapper-launch/27246/6), [Atlas](https://sky-atlas.powerhouse.io/A.0.1.2.1_Facilitators%E2%80%99_Broad_Discretionary_Capacity/9baf179a-ac10-4ed1-b4f2-1cb2cbb7daf1%7C693d9aad475a)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-lockstake-capped-osm-wrapper-launch/27246)

If this executive proposal passes, then the Lockstake Capped OSM Wrapper for SKY will be launched. The Lockstake Capped OSM Wrapper wraps an OSM contract, and reports prices up to a pre set `cap`. The contract will wrap PIP_SKY to be used on LOCKSTAKE_ENGINE, aiming to prevent SKY price spikes from allowing excessive USDS debt generation on the module. This executive proposal will launch Lockstake Capped OSM Wrapper with the following calls and parameters:

-Call [LockstakeInit.updateOSM](https://github.com/sky-ecosystem/lockstake/blob/7db951621c7ac49e6d459a91ffbc0a8a43a4b12f/deploy/LockstakeInit.sol#L376-L407) with:
  - dss: **A DssInstance** (from [dss-test/MCD.sol](https://github.com/sky-ecosystem/dss-test/blob/master/src/MCD.sol))
  - cappedOSM: [0x0C13fF3DC02E85aC169c4099C09c9B388f2943Fd](https://etherscan.io/address/0x0C13fF3DC02E85aC169c4099C09c9B388f2943Fd)
  - cap: **0.04 USDS**

### SKY Token Rewards Rebalance

- **Authorization**: [Forum Post](https://forum.sky.money/t/sky-token-rewards-usds-to-sky-rewards-normalization-configuration/26638/20), [Atlas](https://sky-atlas.powerhouse.io/A.4.3.2.1_SKY_Token_Rewards/1d6f2ff0-8d73-809b-9088-d11181182d17%7Cb3417d54eb16)
- **Proposal**: [Forum Post](https://forum.sky.money/t/sky-token-rewards-usds-to-sky-rewards-normalization-configuration/26638/19)

If this executive proposal passes, then the distribution of SKY token rewards to USDS holders will be normalized to ensure the effective yield provided by these rewards equals the Sky Savings Rate (SSR), as per [A.4.3.2 - Token Reward Mechanism](https://sky-atlas.powerhouse.io/A.4.3.2_Token_Reward_Mechanism/2e3e7014-bd66-4e85-b915-b86ae3ceeb16%7Cb3417d54), by executing the following actions:

- Distribute the remaining tokens from the old DssVest by calling `VestedRewardsDistribution.distribute()` on REWARDS_DIST_USDS_SKY.
- Create a new MCD_VEST_SKY_TREASURY stream with the following parameters:
  - `res`: 1 (restricted)
  - Adjust the Sky allowance for MCD_VEST_SKY_TREASURY, reducing it by the remaining yanked stream amount and increasing it by the new stream total.
  - `vestBgn`: `block.timestamp`
  - `vestTau`: `block.timestamp` + 15,724,800 seconds (182 days after the spell executes)
  - `tot`: **68,379,376 SKY**
- `yank()` MCD_VEST_SKY_TREASURY vest with ID 6.
- File the new stream ID on REWARDS_DIST_USDS_SKY

### Whitelist Keel ALM Proxy on litePSM

- **Authorization**: [Governance Poll 1596](https://vote.sky.money/polling/QmWfqZRS)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-02-2025-prime-technical-scope-keel-initialization-for-upcoming-spell/27192)

If this executive proposal passes, then the Keel ALM Proxy will be whitelisted on the LitePSM with the following call:

- `MCD_LITE_PSM_USDC_A.kiss(0xa5139956eC99aE2e51eA39d0b57C42B6D8db0758)`

### Prime Agent Proxy Spells 

If this executive proposal passes, then Prime Agent proxy spells for Spark, Grove, and Keel will be executed at the following addresses:

- Spark: [0x4a3a40957CDc47552E2BE2012d127A5f4BD7f689](https://etherscan.io/address/0x4a3a40957CDc47552E2BE2012d127A5f4BD7f689)
- Grove: [0x67e7b3bFAb1Fb6267baECEc034Bbf7592F6B4E9b](0x67e7b3bFAb1Fb6267baECEc034Bbf7592F6B4E9b)
- Keel: [0x7ae136b7e677C6A9B909a0ef0a4E29f0a1c3c7fE](https://etherscan.io/address/0x7ae136b7e677C6A9B909a0ef0a4E29f0a1c3c7fE)

The expected contents of each proxy spell are listed below.

#### Spark Proxy Spell

##### [Ethereum] Spark USDS Morpho Vault - Increase PT-USDe-27Nov Supply Cap

- **Authorization**: [Governance Poll 1592](https://vote.sky.money/polling/QmXYRjmQ)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

The [PT-USDe-27Nov2025 pool](https://morpho.blockanalitica.com/ethereum/markets/8cdb63a27a48ac27fadc0f158a732104bcc4e10bb61c9a5095ea7c127204e26c/) supply cap will be increased by 500 million USDS from 500 million USDS to **1 billion USDS**.

##### [Ethereum] SparkLend - Increase LBTC Supply Cap Automator Parameters

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.2.1_SparkLend_Risk_Parameters_Modification/1c1f2ff0-8d73-819c-9641-d87ad5b7058b|7896ed3326389fe3553030cd0a822213)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

Supply [Cap Automator Parameters](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3_SparkLend_Risk_Parameters_Cap_Automators/1c1f2ff0-8d73-81ec-bc16-e2f85c0765d7%7C7896ed3326389fe3553030cd0a82f68e) for LBTC will be increased as follows:

- Supply cap `max`: Increase by 7,500 LBTC, from 2,500 LBTC to **10,000 LBTC**
- Supply cap `gap`: Increase by 250 LBTC, from 250 LBTC to **500 LBTC**
- Supply cap `ttl`: **12 hours** (no change)

##### [Ethereum] SparkLend - Reduce Stablecoin Market Reserve Factors

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.2.1_SparkLend_Risk_Parameters_Modification/1c1f2ff0-8d73-819c-9641-d87ad5b7058b|7896ed3326389fe3553030cd0a822213)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

[Reserve Factors](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.8_Reserve_Factor_Definition/1c1f2ff0-8d73-81a0-9436-c819cdd7bbbe%7C7896ed3326389fe3553030cd0a82f68efd49) for Stablecoin Markets will be reduced as follows:

###### USDC

- Reserve factor: Reduce by 9 percentage points from 10% to **1%**.

###### USDT

- Reserve factor: Reduce by 9 percentage points from 10% to **1%**.

##### [Ethereum] SparkLend - Claim Reserves for USDS and DAI

- **Authorization**: [Governance Poll 1593](https://vote.sky.money/polling/QmeKTbg6)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

All accumulated DAI and USDS reserves will be transferred from the SparkLend Collector to the Spark ALM Proxy on mainnet with the following details:

- Sender address: [0xb137E7d16564c81ae2b0C8ee6B55De81dd46ECe5](https://etherscan.io/address/0xb137E7d16564c81ae2b0C8ee6B55De81dd46ECe5) (SparkLend Collector)
- Recipient address: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) (Spark ALM Proxy)
- Transfer amount: All accumulated USDS and DAI reserves.

##### [Ethereum] Spark Savings v2 - Launch Savings Vaults for USDC, USDT, and ETH

- **Authorization**: [Governance Poll 1586](https://vote.sky.money/polling/QmUn84ag)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

The following Spark Savings v2 vaults will be launched:

###### ETH

- Spark Savings ETH (spETH)
  - spETH address: [0xfE6eb3b609a7C8352A241f7F3A21CEA4e9209B8f](https://etherscan.io/address/0xfE6eb3b609a7C8352A241f7F3A21CEA4e9209B8f)
  - Roles
    - Default admin: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Subdao Proxy)
    - Setter: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) (Spark operations safe)
    - Taker: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) (Spark ALM Proxy)
  - Yield
    - Max yield: **5%**
    - Current yield (at launch): **0%**
  - Supply cap: **10,000 WETH**
  - SLL [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de)
    - take
      - maxAmount: **unlimited**
    - transferAssets
      - maxAmount: **unlimited**

###### USDC

- Spark Savings USDC (spUSDC)
  - spUSDC address: [0x28B3a8fb53B741A8Fd78c0fb9A6B2393d896a43d](https://etherscan.io/address/0x28B3a8fb53B741A8Fd78c0fb9A6B2393d896a43d)
  - Roles
    - Default admin: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Subdao Proxy)
    - Setter: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) (Spark operations safe)
    - Taker: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) (Spark ALM Proxy)
  - Yield
    - Max yield: **10%**
    - Current yield (at launch): **0%**
  - Supply cap: **50 million USDC**
  - SLL [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de)
    - take
      - maxAmount: **unlimited**
    - transferAssets
      - maxAmount: **unlimited**

###### USDT

- Spark Savings USDT (spUSDT)
  - spUSDT address: [0xe2e7a17dFf93280dec073C995595155283e3C372](https://etherscan.io/address/0xe2e7a17dFf93280dec073C995595155283e3C372)
  - Roles
    - Default admin: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Subdao Proxy)
    - Setter: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) (Spark operations safe)
    - Taker: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) (Spark ALM Proxy)
  - Yield
    - Max yield: **10%**
    - Current yield (at launch): **0%**
  - Supply cap: **50 million USDT**
  - SLL [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de)
    - take
      - maxAmount: **unlimited**
    - transferAssets
      - maxAmount: **unlimited**

##### [Ethereum] Spark Liquidity Layer - Onboard SparkLend ETH

- **Authorization**: [Governance Poll 1590](https://vote.sky.money/polling/QmREvn1i)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

SparkLend ETH will be onboarded to the [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) on mainnet with the following [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de):

- Deposits
  - maxAmount: **50,000 ETH**
  - slope: **10,000 ETH per day**
- Withdrawals
  - maxAmount: **unlimited**

##### [Ethereum] Spark Liquidity Layer - Claim Aave Core aUSDS Rewards

- **Authorization**: [Governance Poll 1588](https://vote.sky.money/polling/QmdY24Cm)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

All aEthUSDS rewards earned by the Spark ALM Proxy in the Aave Core market (roughly 243,167 aUSDS) will be claimed to the [Spark ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).

##### [Ethereum] Spark Liquidity Layer - Add transferAsset Rate Limit for SYRUP

- **Authorization**: [Governance Poll 1587](https://vote.sky.money/polling/QmSaMJWy)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

A transferAsset [rate limit](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de) for SYRUP will be added to the [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) on mainnet with the following parameters:

- Transfer
  - Recipient address: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) (Spark liquidation multisig)
  - maxAmount: **200,000 SYRUP**
  - slope: **200,000 SYRUP per day**

##### [Ethereum] Spark Treasury - Transfer Share of Ethena Direct Allocation Net Profit to Grove

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.2.9.1.1.2.9.1_Revenue_Share/248f2ff0-8d73-8039-a678-ce5cefe826d0|9e1f80092582d098de0cf76e)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

Spark will transfer Grove’s share of the net profit attributable to the Ethena Direct Allocation to the Grove Subdao Proxy.

- Recipient address: [0x1369f7b2b38c76B6478c0f0E66D94923421891Ba](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba)
- Transfer amount: **1,031,866 USDS**

##### [Ethereum] Spark Treasury - Spark Foundation Grant

- **Authorization**: [Governance Poll 1597](https://vote.sky.money/polling/QmcuRr3c)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191), [2](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-09-29/27222)

A transfer from the SubDAO Proxy to the Spark Foundation will be made to enable the Spark Foundation to fulfill its mandate of promoting the growth and development of Spark.

- Recipient address: [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec)
- Transfer amount: **1,100,000 USDS**

##### [Ethereum] SPK Staking - Configure Symbiotic Instance

- **Authorization**: [Governance Poll 1594](https://vote.sky.money/polling/QmPsHirj)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-spark-for-upcoming-spell/27191)

SPK staking will be configured through the Symbiotic Instance with the following details:

- Owner: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) (Spark Subdao Proxy)
- Operator: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4)
- Network: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4)
- maxNetworkLimit: **unlimited**

#### Grove Proxy Spell

##### [Mainnet + Plume] Grove Liquidity Layer - Plume Deployment

- **Authorization**: [Governance Poll 1591](https://vote.sky.money/polling/QmerdKkX)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-grove-for-upcoming-spell/27190)

The Grove Liquidity Layer will be deployed to Plume with the following contract addresses and parameters.

###### Contract Addresses

- Grove Governance: plume:[0x3048386E09c72C20FB268a37d2B630D7f2Ee9138](https://explorer.plume.org/address/0x3048386E09c72C20FB268a37d2B630D7f2Ee9138)

- Receiver: plume:[0x7D592085847558A97695DDC1CD6E8FEe818510E8](https://explorer.plume.org/address/0x7D592085847558A97695DDC1CD6E8FEe818510E8)

- ALM Controller: plume:[0x0C462Fff7Cc975bC9F2B0aEB8270febA5FD71e1B](https://explorer.plume.org/address/0x0C462Fff7Cc975bC9F2B0aEB8270febA5FD71e1B)
- ALM Proxy: plume:[0x1DB91ad50446a671e2231f77e00948E68876F812](https://explorer.plume.org/address/0x1DB91ad50446a671e2231f77e00948E68876F812)
- ALM Rate Limits: plume:[0x7f8408eBbBC3504F83eeDa52910dd75Eba92C955](https://explorer.plume.org/address/0x7f8408eBbBC3504F83eeDa52910dd75Eba92C955)

- Relayer: plume:[0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f](https://explorer.plume.org/address/0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f)
- Freezer: plume:[0xB0113804960345fd0a245788b3423319c86940e5](https://explorer.plume.org/address/0xB0113804960345fd0a245788b3423319c86940e5)

###### Parameters

- Plume.GROVE_EXECUTOR.delay = **0 days**
- Plume.GROVE_EXECUTOR.gracePeriod = **7 days**


##### [Mainnet + Plume] Grove Liquidity Layer - Onboard Apollo ACRDX

- **Authorization**: [Governance Poll 1595](https://vote.sky.money/polling/QmTE1YTn)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2-2025-proposed-changes-to-grove-for-upcoming-spell/27190)

Apollo ACRDX will be onboarded to the Grove Liquidity Layer on Plume. A risk assessment for this deployment has been produced and can be found [here](https://forum.sky.money/t/anemoy-tokenized-apollo-diversified-credit-fund-risk-assessment/27186).

A poll wherein Sky Governance approved the DAO Resolution authorizing the subscription to the Anemoy Tokenized Apollo Diversified Credit Fund by Aspen Grove Ltd with the IPFS hash [bafkreiefed2vyibzwd7ajacaezuq5r422z4zoo4lnbk3ximd5mzktwjzfi](https://gateway.pinata.cloud/ipfs/bafkreiefed2vyibzwd7ajacaezuq5r422z4zoo4lnbk3ximd5mzktwjzfi) can be found [here](https://vote.sky.money/polling/QmTE1YTn).

###### [Plume] Apollo ACRDX [Rate Limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de)

- ACRDX: plume:[0x354a9222571259457B2e98b2285B62e6a9bf4eD3](https://explorer.plume.org/address/0x354a9222571259457B2e98b2285B62e6a9bf4eD3)
  - Deposits:
    - Max amount: **20 million USDC**
    - Slope: **20 million USDC per day**
  - Withdrawals:
    - Max amount: **Unlimited**

###### [Mainnet and Plume] JTRSY Transfer and Redemption [Rate Limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de)

Grove will be redeeming JTRSY on Plume for the USDC liquidity necessary to purchase 50M of ACRDX. The following rate parameters will be necessary to transfer JTRSY shares to Plume and redeem it for USDC.

###### [Mainnet] LIMIT_CENTRIFUGE_TRANSFER [Rate Limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de)

- JTRSY token: eth:[0xFE6920eB6C421f1179cA8c8d4170530CDBdfd77A](https://etherscan.io/address/0xFE6920eB6C421f1179cA8c8d4170530CDBdfd77A)
- Plume destinationCentrifugeId: **4**
  - Max amount: **20 million JTRSY**
  - Slope: **20 million JTRSY per day**

###### [Mainnet] setCentrifugeRecipient

- centrifugeId: **4**
- recipient: Plume.ALM_PROXY

###### JTRSY Withdrawl [Rate Limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de)

- JTRSY token: plume:[0x818A3593340622c1D6A51B039e191F2f8C99A1F2](https://explorer.plume.org/address/0x818A3593340622c1D6A51B039e191F2f8C99A1F2)
- Max amount: **20 million USDC**
- Slope: **20 million USDC per day**

#### Keel Proxy Spell

##### Initialize Keel Mainnet ALM Controller

- **Authorization**: [Governance Poll 1596](https://vote.sky.money/polling/QmWfqZRS)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-02-2025-prime-technical-scope-keel-initialization-for-upcoming-spell/27192)

The Keel ALM controller will be initialized on mainnet with the following addresses and rate limit parameters.

###### Contract Addresses

- ALM Proxy: [0xa5139956eC99aE2e51eA39d0b57C42B6D8db0758](https://etherscan.io/address/0xa5139956eC99aE2e51eA39d0b57C42B6D8db0758)
  - admin: [Keel Subproxy](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310)
- RateLimits: [0x65E7B39e508944F7C4278d3e4580f84Eb20b26a7](https://etherscan.io/address/0x65E7B39e508944F7C4278d3e4580f84Eb20b26a7)
  - admin: [Keel Subproxy](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310)
- ALM Controller: [0xEF26BDc34F35669C235345aeF24A251B1EE80EF3](https://etherscan.io/address/0xEF26BDc34F35669C235345aeF24A251B1EE80EF3
  - admin: [Keel Subproxy](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310)
  - proxy: ALM Proxy listed above
  - rateLimits_: RateLimits listed above
  - vault_: [ALLOCATOR_NOVA_A_VAULT](https://etherscan.io/address/0xe4470dd3158f7a905cdea07260551f72d4bb0e77)
  - psm_: [MCD_LITE_PSM_USDC_A](https://etherscan.io/address/0xf6e72db5454dd049d0788e411b06cfaf16853042)
  - daiUsds_: [DAI_USDS](https://etherscan.io/address/0x3225737a9bbb6473cb4a45b7244aca2befdb276a)
  - cctp_: [CCTP Token Messenger](https://etherscan.io/address/0xbd3fa81b58ba92a82136038b25adec7066af3155)

###### [Rate Limit](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de) Parameters

- LIMIT_USDS_MINT:
  - Max amount: **10,000 USDS** (Onboarding)
  - Slope: **5,000 USDS per day**
- LIMIT_USDS_TO_USDC:
  - Max amount: **10,000 USDS** (Onboarding)
  - Slope: **5,000 USDS per day**
- sUSDS (LIMIT_4626_DEPOSIT) Deposits:
  - Max amount: **10,000 sUSDS** (Onboarding)
  - Slope: **5,000 sUSDS per day**
- sUSDS (LIMIT_4626_WITHDRAW) Withdrawals:
  - Max amount: **Unlimited**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

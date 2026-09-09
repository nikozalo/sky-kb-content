---
title: Template - [Executive Vote] Sky Token Rewards Rebalance, Aligned Delegate Compensation for June 2025, Atlas Core Development Payments for July 2025, HV Bank (RWA009-A) DAO Resolution, Auxiliary Actions for Token Transfer Between Spark and Grove, Star Proxy Spells - July 24, 2025
summary: Sky Token Rewards rebalance, Aligned Delegate compensation for June 2025, Atlas Core Development USDS and SKY payments for July 2025, Huntingdon Valley Bank DAO Resolution, Auxiliary Actions for Token Transfer Between Spark and Grove,  Grove proxy spell execution, Spark proxy spell execution.
date: 2025-07-24T00:00:00.000Z
address: "0x12a79fAcd8D6Bbb1583593ef414897A9bA8f0D26"
---

# [Executive Proposal] Sky Token Rewards Rebalance, Aligned Delegate Compensation for June 2025, Atlas Core Development Payments for July 2025, HV Bank (RWA009-A) DAO Resolution, Auxiliary Actions for Token Transfer Between Spark and Grove, Star Proxy Spells - July 24, 2025

The Governance Facilitators, Sidestream and Dewiz have placed an executive proposal into the voting system. SKY Holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Actions to rebalance the Sky Token Rewards will be executed.
- A total of **21,062 USDS** will be distributed as Aligned Delegate compensation for June 2025.
- A total of **77,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for July 2025.
- A Huntingdon Valley Bank DAO Resolution will be approved.
- Auxiliary actions for the transfer of tokenized T-bills from Spark to Grove will be executed.
- Star proxy spells for Grove and Spark will be executed at [0xe069f56033Ed646aF3B4024501FF47BBce67CfD1](https://etherscan.io/address/0xe069f56033Ed646aF3B4024501FF47BBce67CfD1) and [0x41EdbF09cd2f272175c7fACB857B767859543D15](https://etherscan.io/address/0x41EdbF09cd2f272175c7fACB857B767859543D15) respectively.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/A.1.9.2.1.2_Pause_Delay_Current_Value/09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Sky Token Rewards Rebalance

- **Authorization**: [Ecosystem Approval](https://forum.sky.money/t/sky-token-rewards-usds-to-sky-rewards-normalization-configuration/26638/9)
- **Proposal**: [Forum Post](https://forum.sky.money/t/sky-token-rewards-usds-to-sky-rewards-normalization-configuration/26638/8)

If this executive proposal passes, then the distribution of SKY token rewards to USDS holders will be normalized to ensure the effective yield provided by these rewards equals the Sky Savings Rate (SSR), as per [A.4.3.2 - Token Reward Mechanism](https://sky-atlas.powerhouse.io/A.4.3.2_Token_Reward_Mechanism/2e3e7014-bd66-4e85-b915-b86ae3ceeb16%7Cb3417d54), by executing the following actions:

- `yank()` MCD_VEST_SKY_TREASURY vest with ID 4.
- Claim the remaining tokens from the old DssVest by calling `VestedRewardsDistribution.distribute()` on REWARDS_DIST_USDS_SKY.
- Create a new MCD_VEST_SKY_TREASURY stream with the following parameters:
  - res: 1 (restricted)
  - Increase SKY allowance for MCD_VEST_SKY_TREASURY to the sum of all active streams and the new stream created by this executive vote.
  - vestBgn: block.timestamp
  - vestTau: block.timestamp + 15,724,800 seconds (182 days after the spell executes)
  - tot: **100,851,495 SKY**
- File the new stream ID on REWARDS_DIST_USDS_SKY

### Aligned Delegate Compensation for June 2025

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/Budget_And_Participation_Requirements/4c698938-1a11-4486-a568-e54fc6b0ce0c%7C0db3af4e)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-2025-aligned-delegate-compensation/26816)

If this executive proposal passes, then a total of **21,062 USDS** will be distributed to eight Aligned Delegates as compensation for June 2025 as follows:

| Delegate    | Amount (USDS) | Address                                                                                                               |
|-------------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| JuliaChang  | 4,000         | [0x252abAEe2F4f4b8D39E5F12b163eDFb7fac7AED7](https://etherscan.io/address/0x252abAEe2F4f4b8D39E5F12b163eDFb7fac7AED7) |
| WBC         | 3,733         | [0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47](https://etherscan.io/address/0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47) |
| PBG         | 800           | [0x8D4df847dB7FfE0B46AF084fE031F7691C6478c2](https://etherscan.io/address/0x8D4df847dB7FfE0B46AF084fE031F7691C6478c2) |
| Excel       | 400           | [0x0F04a22B62A26e25A29Cba5a595623038ef7AcE7](https://etherscan.io/address/0x0F04a22B62A26e25A29Cba5a595623038ef7AcE7) |
| AegisD      | 129           | [0x78C180CF113Fe4845C325f44648b6567BC79d6E0](https://etherscan.io/address/0x78C180CF113Fe4845C325f44648b6567BC79d6E0) |

### Atlas Core Development Payments for July 2025

- **Authorization**: [Ecosystem Authorization](https://forum.sky.money/t/atlas-core-development-payment-requests-july-2025/26779/6), [Atlas Axis Authorization](https://forum.sky.money/t/atlas-core-development-payment-requests-july-2025/26779/5)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-core-development-payment-requests-july-2025/26779)

If this executive proposal passes, then a total of **77,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for July 2025 as follows:

#### USDS Payments

| Recipient | Amount (USDS) | Address                                                                                                               |
|-----------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 50,167        | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 16,417        | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| Kohla     | 11,000        | [0x73dFC091Ad77c03F2809204fCF03C0b9dccf8c7a](https://etherscan.io/address/0x73dFC091Ad77c03F2809204fCF03C0b9dccf8c7a) |

#### SKY Payments

| Recipient | Amount (SKY) | Address                                                                                                               |
|-----------|-------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 330,000      | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 288,000      | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |

### Huntingdon Valley Bank DAO Resolution

- **Authorization**: [Ecosystem Authorization](https://forum.sky.money/t/huntingdon-valley-bank-transaction-documents-on-permaweb/16264/28)
- **Proposal**: [Forum Post](https://forum.sky.money/t/huntingdon-valley-bank-transaction-documents-on-permaweb/16264/27)

If this executive proposal passes, the Huntingdon Valley Bank (RWA009-A) DAO Resolution with IPFS hash [bafkreidm3bqfiwv224m6w4zuabsiwqruy22sjfaxfvgx4kgcnu3wndxmva](https://gateway.pinata.cloud/ipfs/bafkreidm3bqfiwv224m6w4zuabsiwqruy22sjfaxfvgx4kgcnu3wndxmva), to amend the Trust Agreement governing the RWA Master Participation Trust will be approved. The amendment allows the Trust to make tax payments directly, outside the standard distribution waterfall.

### Auxiliary Actions for Token Transfer between Spark and Grove

- **Authorization**: [Governance Poll 1533](https://vote.sky.money/polling/Qme5qebN)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796#p-103150-mainnet-spark-liquidity-layer-transfer-buidl-and-jtrsy-tokens-to-grove-5)

If this executive proposal passes, the following auxiliary actions will be carried out to allow Grove to mint and transfer USDS to Spark in exchange for the tokenized T-bills, BUIDL, and JTRSY:

- Increase ALLOCATOR-BLOOM-A DC-IAM [`gap`](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.2_Target_Available_Debt_(gap)/c1e17312-3744-4360-81f4-03564f0dd09d|57eaf45219bea3b430c268bb) by 1.2 billion USDS from 50 million USDS to **1.25 billion USDS**.
  - [`line`](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.1_Maximum_Debt_Ceiling_(line)/6f1a913d-9436-4b70-816b-e317672737d6|57eaf45219bea3b430c268bb) remains unchanged at **2.5 billion USDS**.
  - [`ttl`](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.3_Ceiling_Increase_Cooldown_(ttl)/58f5315f-938f-464c-b2d2-f611145d469a|57eaf45219bea3b430c268bb) remains unchanged at **86,400 seconds**.
- Apply ALLOCATOR-BLOOM-A auto-line changes.
- Execute Grove Proxy Spell at address [0xe069f56033Ed646aF3B4024501FF47BBce67CfD1](https://etherscan.io/address/0xe069f56033Ed646aF3B4024501FF47BBce67CfD1) - further details below.
- Decrease ALLOCATOR-BLOOM-A `gap` by 1.2 billion USDS from 1.25 billion USDS to **50 million USDS**.
  - [`line`](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.1_Maximum_Debt_Ceiling_(line)/6f1a913d-9436-4b70-816b-e317672737d6|57eaf45219bea3b430c268bb) remains unchanged at **2.5 billion USDS**.
  - [`ttl`](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.3_Ceiling_Increase_Cooldown_(ttl)/58f5315f-938f-464c-b2d2-f611145d469a|57eaf45219bea3b430c268bb) remains unchanged at **86,400 seconds**.

### Star Proxy Spells for Grove and Spark

If this executive proposal passes, then Star proxy spells for Grove and Spark will be executed at [0xe069f56033Ed646aF3B4024501FF47BBce67CfD1](https://etherscan.io/address/0xe069f56033Ed646aF3B4024501FF47BBce67CfD1) and at [0x41EdbF09cd2f272175c7fACB857B767859543D15](https://etherscan.io/address/0x41EdbF09cd2f272175c7fACB857B767859543D15) respectively with the following contents.

#### Grove Proxy Spell

##### [Mainnet] Mint USDS for BUIDL and JTRSY Tokens and Send it to Spark Allocator Buffer

- **Authorization**: [Governance Poll 1533](https://vote.sky.money/polling/Qme5qebN)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

The [Grove Allocator Buffer](https://etherscan.io/address/0x629ad4d779f46b8a1491d3f76f7e97cb04d8b1cd) will mint an amount of USDS equal to the BUIDL-I balance of the [Spark ALMProxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) at the time of Spell execution plus 404,016,484 USDS to account for Spark's JTRSY balance. This USDS will be transferred to the [Spark Allocator Buffer](https://etherscan.io/address/0xc395d150e71378b47a1b8e9de0c1a83b75a08324) to close the balance related to these tokenized T-bill holdings. Consequently, Grove will assume the associated debt positions for these collateral tokens.

##### [Mainnet] Grove Liquidity Layer - Onboard BlackRock BUIDL-I

- **Authorization**: [Governance Poll 1536](https://vote.sky.money/polling/QmdkNnmE)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

Onboard BlackRock BUIDL-I to the Grove Liquidity Layer on Mainnet with the following [rate limit](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) parameters:

- Deposits
  - Max amount: **50 million USDC**
  - Slope: **50 million USDC per day**
- Withdrawals
  - Max amount: **Unlimited**

Token address: [0x6a9DA2D710BB9B700acde7Cb81F10F1fF8C89041](https://etherscan.io/token/0x6a9DA2D710BB9B700acde7Cb81F10F1fF8C89041)

##### [Mainnet] Grove Liquidity Layer - Onboard Centrifuge JTRSY

- **Authorization**: [Governance Poll 1537](https://vote.sky.money/polling/QmdKd2se)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

Onboard Centrifuge JTRSY to the Grove Liquidity Layer on Mainnet with the following [rate limit](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) parameters:

- Deposits
  - Max amount: **50 million USDC**
  - Slope: **50 million USDC per day**
- Withdrawals
  - Max amount: **Unlimited**

Token address: [0x36036fFd9B1C6966ab23209E073c68Eb9A992f50](https://etherscan.io/token/0x36036fFd9B1C6966ab23209E073c68Eb9A992f50)

#### Spark Proxy Spell

##### [Mainnet] SparkLend - Reduce WBTC Liquidation Threshold

- **Authorization**: [Governance Poll 1531](https://vote.sky.money/polling/QmUYJ9YQ)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

Reduce the WBTC [Liquidation Threshold](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.5_Liquidation_Threshold_Definition/1c1f2ff0-8d73-81ea-bd7e-feb73a44923a%7C7896ed3326389fe3553030cd0a82f68efd49) by 5 percentage points from 40% to **35%**.

##### [Base] Spark Liquidity Layer - Increase Spark USDC Morpho Vault Rate Limits

- **Authorization**: [Governance Poll 1529](https://vote.sky.money/polling/QmSnpq5K)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

Increase the Spark USDC Morpho vault [rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) on Base as follows:

- `max`: Increase by 50 million from 50 million to **100 million USDC**.
- `slope`: Increase by 25 million per day from 25 million per day to **50 million USDC per day**.

##### [Mainnet] Spark Liquidity Layer - Transfer of BUIDL and JTRSY Tokens to Grove

- **Authorization**: [Governance Poll 1533](https://vote.sky.money/polling/Qme5qebN)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

Transfer of all BUIDL and JTRSY tokenized T-bills held by Spark to [Grove ALMProxy](https://etherscan.io/address/0x491EDFB0B8b608044e227225C715981a30F3A44E). Grove will assume the associated debt positions for these collateral tokens.

Additional information about this transfer can be found in [this forum post](https://forum.sky.money/t/tokenized-t-bills-transfer-from-spark-to-grove/26785).

##### [Mainnet] SparkLend - Transfer Accumulated SparkLend ETH to Multisig to be Liquidated

- **Authorization**: [Governance Poll 1532](https://vote.sky.money/polling/QmaLxz19)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

Transfer the accumulated ETH earned from SparkLend's Reserve Factor held in the [Spark Treasury](https://etherscan.io/address/0xb137e7d16564c81ae2b0c8ee6b55de81dd46ece5) to the following multisig to be liquidated into USDS:

Liquidation multisig: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2e1b01adabb8d4981863394bea23a1263cbaedfc)

Any received USDS will later be transferred to the Spark Proxy and serve as additional Risk Capital.

##### [Mainnet] Spark USDS Vault - Onboard PT-SPK-USDS Farm

- **Authorization**: [Governance Poll 1530](https://vote.sky.money/polling/QmP7RB2p)
- **Proposal**: [Forum Post](https://forum.sky.money/t/july-24-2025-proposed-changes-to-spark-for-upcoming-spell/26796)

Deploy a Spark USDS Morpho Vault and onboard the [PT USDS-SPK](https://app.pendle.finance/trade/markets/0xff43e751f2f07bbf84da1fc1fa12ce116bf447e5/swap?view=pt&chain=ethereum&tab=info) Farm with the following parameters.

###### Spark Liquidity Layer Vault [Rate Limit](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) Parameters

- `Max amount`: **200 million USDS**
- `Slope`: **100 million USDS per day**

###### PT-USDS-24Sep2025 Market Parameters

- Pool LLTV: **96.5%**
- Oracle base value (value at maturity): **1 USDS per PT token**
- Oracle discount rate: **15%**
- Pool supply cap: **500 million USDS**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

---
title: Template - [Executive Vote] Initialize Kicker, Recalibrate Smart Burn Engine, Initialize lsSKY to SKY Farm, Initialize Spark StarGuard, Fund Core Council Multisigs, Fund Integration Boost Multisig, Adjust stUSDS BEAM Step Parameters, Execute Prime Agent Proxy Spells - October 30, 2025
summary: Upgrade Smart Burn Engine by initializing the Kicker contract, update several parameters related to the Smart Burn Engine, add lsSKY to SKY farm, initialize StarGuard for Spark Proxy Spells, transfer funds to Core Council multisigs, transfer funds to Integration Boost multisig, reduce str step and duty step in the stUSDS Bounded External Access Module (stUSDS BEAM), execute proxy spells for Spark and Grove.
date: 2025-10-30T00:00:00.000Z
address: "0xa1D35e93d5BfAF300e0327d73143529f19B3DA78"
---

# [Executive Proposal] Initialize Kicker, Recalibrate Smart Burn Engine, Initialize lsSKY to SKY Farm, Initialize Spark StarGuard, Fund Core Council Multisigs, Fund Integration Boost Multisig, Adjust stUSDS Beam step parameters, Execute Prime Agent Proxy Spells - October 30, 2025

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Kicker contract will be initialized as described below.
- Smart Burn Engine parameters will be updated.
- SKY farm for lsSKY stakers will be initialized.
- A StarGuard instance will be initialized for Spark Proxy Spells.
- Two Core Council multisigs will be funded with a total of **4,070,207 USDS**.
- **1,000,000 USDS** will be transferred to fund the Integration Boost multisig at [0xD6891d1DFFDA6B0B1aF3524018a1eE2E608785F7](https://etherscan.io/address/0xD6891d1DFFDA6B0B1aF3524018a1eE2E608785F7).
- The stUSDS Bounded External Access Module (stUSDS BEAM) `step` parameters will be adjusted as described below.
- Prime Agent proxy spells for Spark and Grove will be executed.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/A.1.9.2.1.2_Pause_Delay_Current_Value/09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Initialize Kicker

- **Authorization**: [Governance Poll 1601](https://vote.sky.money/polling/Qmbs7wEM)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/technical-scope-of-the-kicker-launch/27350), [2](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-10-27/27362)

If this executive proposal passes, then the following actions required to initialize the Kicker module will be executed:

Init Kicker by calling [FlapperInit.initKicker](https://github.com/sky-ecosystem/dss-flappers/blob/f4f4f22b3eae6c912551b00ad64a56862ad61f86/deploy/FlapperInit.sol#L226-L249) with the following parameters:

- `dss`: **A DssInstance** (from [dss-test/MCD.sol](https://github.com/sky-ecosystem/dss-test/blob/master/src/DssTest.sol))
- `kicker`: [0xD889477102e8C4A857b78Fcc2f134535176Ec1Fc](https://etherscan.io/address/0xD889477102e8C4A857b78Fcc2f134535176Ec1Fc#code)
- `cfg.khump`: **-200 million USDS** - the minimum Surplus Buffer value that must be reached before the Kicker can activate.
- `cfg.kbump`: **10,000 USDS** - the amount of USDS that will be transferred from the Surplus Buffer to the Splitter each time the Kicker is activated.
- `cfg.chainlogKey`: **MCD_KICK**

Other required actions:

- Remove old `FlapJob` ([0xc32506E9bB590971671b649d9B8e18CB6260559F](https://etherscan.io/address/0xc32506E9bB590971671b649d9B8e18CB6260559F) from the Sequencer.
- Add new `FlapJob` deployed at [0xE564C4E237f4D7e0130FdFf6ecC8a5E931C51494](https://etherscan.io/address/0xE564C4E237f4D7e0130FdFf6ecC8a5E931C51494) to the Sequencer.
- Update `CRON_FLAP_JOB` in the [Chainlog](https://chainlog.sky.money) to [0xE564C4E237f4D7e0130FdFf6ecC8a5E931C51494](https://etherscan.io/address/0xE564C4E237f4D7e0130FdFf6ecC8a5E931C51494).

### Recalibrate Smart Burn Engine

- **Authorization**: [Governance Poll 1601](https://vote.sky.money/polling/Qmbs7wEM)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-10-27/27362)

If this executive proposal passes, then the following [Smart Burn Engine](https://sky-atlas.powerhouse.io/A.3.5_Surplus_Buffer_and_Smart_Burn_Engine/c58d38dc-4b17-4c0a-a1df-546a06612c54%7C57ea) parameters will be updated:

- Increase `splitter.burn` by 75 percentage points from 25% to **100%**.
- Increase `splitter.hop` by 720 seconds from 2,160 seconds to **2,880 seconds**.
- Increase `rewardsDuration` in REWARDS_LSSKY_USDS by 720 seconds from 2,160 seconds to **2,880 seconds**.

### Initialize lsSKY->SKY Farm

- **Authorization**: [Governance Poll 1601](https://vote.sky.money/polling/Qmbs7wEM)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/technical-scope-lssky-sky-farm/27312), [2](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-10-27/27362)

If this executive proposal passes, then the lsSKY->SKY Farm will be initialized by executing the following actions.

Call [TreasuryFundedFarmingInit.initLockstakeFarm](https://github.com/sky-ecosystem/endgame-toolkit/blob/fe734bea271e87c0b8e772d7adcccb46c4df1939/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L111) with the following parameters:

- `stakingToken`: **LOCKSTAKE_SKY** from the [Chainlog](https://chainlog.sky.money)
- `rewardsToken`: **SKY** from the [Chainlog](https://chainlog.sky.money)
- `rewards`: [0xB44C2Fb4181D7Cb06bdFf34A46FdFe4a259B40Fc](https://etherscan.io/address/0xB44C2Fb4181D7Cb06bdFf34A46FdFe4a259B40Fc#code)
- `rewardsKey`: **REWARDS_LSSKY_SKY**
- `dist`: [0x675671A8756dDb69F7254AFB030865388Ef699Ee](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee#code)
- `distKey`: **REWARDS_DIST_LSSKY_SKY**
- `distJob`: **CRON_REWARDS_DIST_JOB** from the [Chainlog](https://chainlog.sky.money)
- `distJobInterval`: **7 days - 1 hours**
- `vest`: **MCD_VEST_SKY_TREASURY** from the [Chainlog](https://chainlog.sky.money)
- `vestTot`: **1 billion SKY**
- `vestBgn`: **block.timestamp - 7 days**
- `vestTau`: **180 days**
- `lockstakeEngine`: **LOCKSTAKE_ENGINE** from the [Chainlog](https://chainlog.sky.money)

Be advised that the SKY for the lsSKY->SKY Farm will be provided by the Sky Frontier Foundation and the funding rate will be reviewed after three months, as detailed in this [Atlas Edit](https://vote.sky.money/polling/Qmbs7wEM).

### Initialize Spark StarGuard

- **Authorization**: [Governance Poll 1601](https://vote.sky.money/polling/Qmbs7wEM)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/launching-starguard-an-upgrade-to-the-sky-agents-governance-payload-execution/27364), [2](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-10-27/27362)

If this executive proposal passes, then [StarGuard](https://forum.sky.money/t/launching-starguard-an-upgrade-to-the-sky-agents-governance-payload-execution/27364) will be initialized for Spark proxy spells by executing the following actions.

Call [StarGuardInit.init](https://github.com/sidestream-tech/sky-star-guard/blob/7398ffb283c4490c6e29bea28b92cd57285d4889/deploy/StarGuardInit.sol#L44-L63) with the following parameters:

- address chainlog: **DssExecLib.LOG**
- `cfg.subProxy`: [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4#code)
- `cfg.subProxyKey`: **SPARK_SUBPROXY**
- `cfg.starGuard`: [0x6605aa120fe8b656482903E7757BaBF56947E45E](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E#code)
- `cfg.starGuardKey`: **SPARK_STARGUARD**
- `cfg.maxDelay`: **7 days**

Other required actions:

- Add `StarGuardJob` deployed at [0xB18d211fA69422a9A848B790C5B4a3957F7Aa44E](https://etherscan.io/address/0xB18d211fA69422a9A848B790C5B4a3957F7Aa44E) to the Sequencer.
- Add `SPARK_STARGUARD` to the `StarGuardJob`.
- Add `StarGuardJob` to the [Chainlog](https://chainlog.sky.money) as `CRON_STARGUARD_JOB`.

### Fund Core Council Multisigs

- **Authorization**: [Governance Poll 1601](https://vote.sky.money/polling/Qmbs7wEM)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-10-27/27362)

If this executive proposal passes, then the following USDS transfers to the listed Core Council Multisigs will occur:

- Transfer **3,876,387 USDS** to the Core Council Buffer Multisig at [0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).
- Transfer **193,820 USDS** to the Aligned Delegates Buffer Multisig at [0x37FC5d447c8c54326C62b697f674c93eaD2A93A3](https://etherscan.io/address/0x37FC5d447c8c54326C62b697f674c93eaD2A93A3).

### Fund Integration Boost Multisig

- **Authorization**: [Atlas - Near Term Process](https://sky-atlas.powerhouse.io/A.2.3.8.2.2.1.3.2.1_Near_Term_Process/1b3f2ff0-8d73-8006-8d52-f441b4e85f5b|9e1ff936eafd46ecfcbb87335192b6fc)
- **Proposal**: [Forum Post](https://forum.sky.money/t/utilization-of-the-integration-boost-budget-a-5-2-1-2/25536/13)

If this executive proposal passes, then the following USDS transfer to the Integration Boost Multisig will occur:

- Transfer **1 million USDS** to [0xD6891d1DFFDA6B0B1aF3524018a1eE2E608785F7](https://etherscan.io/address/0xD6891d1DFFDA6B0B1aF3524018a1eE2E608785F7).

### Adjust stUSDS BEAM `step` parameters

- **Authorization**: [Governance Poll 1602](https://vote.sky.money/polling/QmbzWao8)
- **Proposal**: [Forum Post](https://forum.sky.money/t/stusds-beam-rate-setter-configuration/27161/20)

If this executive proposal passes, then the following parameter updates to the [stUSDS Bounded External Access Module (stUSDS BEAM)](https://sky-atlas.powerhouse.io/A.4.4.1.2.8_stUSDS_Bounded_External_Access_Module/264f2ff0-8d73-8043-9ce4-ee69a1cb4078%7Cb341740ee6e1974b) will occur:

- Reduce `stepStrBps` parameter by 3,500 bps from 4,000 bps to **500 bps**.
- Reduce `stepDutyBps` parameter by 3,500 bps from 4,000 bps to **500 bps**.

### Prime Agent Proxy Spells

If this executive proposal passes, then Prime Agent proxy spells for Spark and Grove will be executed at the following addresses:

- Spark: [0x71059EaAb41D6fda3e916bC9D76cB44E96818654](https://etherscan.io/address/0x71059EaAb41D6fda3e916bC9D76cB44E96818654)
- Grove: [0x8b4A92f8375ef89165AeF4639E640e077d7C656b](https://etherscan.io/address/0x8b4A92f8375ef89165AeF4639E640e077d7C656b)

The expected contents of each proxy spell are listed below.

#### Spark

##### [Mainnet] SparkLend - Remove Supply and Borrow Caps for Non Collateral Stablecoins (USDC, USDT, PYUSD)

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0xeea0e2648f55df4e57f8717831a5949f2a35852e32aa0f98a7e16e7ed56268a8)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

The SparkLend Supply and Borrow Caps for Non Collateral Stablecoins (USDC, USDT, PYUSD) on Ethereum will be removed by setting the following parameters:

- SparkLend USDC
  - Remove supply and borrow cap automation
  - [Supply cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.9_Supply_Cap_Definition/1c1f2ff0-8d73-81b3-8206-e7b26cebfd73%7C7896ed3326389fe3553030cd0a82f68efd49): **0 USDC** (no cap)
  - [Borrow cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.10_Borrow_Cap_Definition/1c1f2ff0-8d73-81ed-b136-d5f9871bc2c2%7C7896ed3326389fe3553030cd0a82f68efd49): **0 USDC** (no cap)
- SparkLend USDT
  - Remove supply and borrow cap automation
  - [Supply cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.9_Supply_Cap_Definition/1c1f2ff0-8d73-81b3-8206-e7b26cebfd73%7C7896ed3326389fe3553030cd0a82f68efd49): **0 USDT** (no cap)
  - [Borrow cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.10_Borrow_Cap_Definition/1c1f2ff0-8d73-81ed-b136-d5f9871bc2c2%7C7896ed3326389fe3553030cd0a82f68efd49): **0 USDT** (no cap)
- SparkLend PYUSD
  - Remove supply and borrow cap automation
  - [Supply cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.9_Supply_Cap_Definition/1c1f2ff0-8d73-81b3-8206-e7b26cebfd73%7C7896ed3326389fe3553030cd0a82f68efd49): **0 PYUSD** (no cap)
  - [Borrow cap](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.1.10_Borrow_Cap_Definition/1c1f2ff0-8d73-81ed-b136-d5f9871bc2c2%7C7896ed3326389fe3553030cd0a82f68efd49): **0 PYUSD** (no cap)

##### [Mainnet] SparkLend - Increase cbBTC Supply and Borrow Caps

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0x95138f104ff84defb64985368f348af4d7500b2641b88b396e37426126f5ce0d)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

The SparkLend cbBTC Supply and Borrow Caps on Ethereum will be increased as described below:

- [Supply cap max](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3_SparkLend_Risk_Parameters_Cap_Automators/1c1f2ff0-8d73-81ec-bc16-e2f85c0765d7%7C7896ed3326389fe3553030cd0a82f68e): **20,000 cbBTC**
- [Borrow cap max](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3_SparkLend_Risk_Parameters_Cap_Automators/1c1f2ff0-8d73-81ec-bc16-e2f85c0765d7%7C7896ed3326389fe3553030cd0a82f68e): **10,000 cbBTC**

##### [Mainnet] SparkLend - Increase tBTC Supply and Borrow Caps

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0x14300684fb44685ad27270745fa6780e8083f3741de2119b98cf6bb1e44b4617)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

The SparkLend tBTC Supply and Borrow Caps on Ethereum will be increased as described below:

- [Supply cap max](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3_SparkLend_Risk_Parameters_Cap_Automators/1c1f2ff0-8d73-81ec-bc16-e2f85c0765d7%7C7896ed3326389fe3553030cd0a82f68e): **1,000 tBTC**
- [Borrow cap max](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.1.3_SparkLend_Risk_Parameters_Cap_Automators/1c1f2ff0-8d73-81ec-bc16-e2f85c0765d7%7C7896ed3326389fe3553030cd0a82f68e): **900 tBTC**

##### [Mainnet] SparkLend - Claim Reserves for USDS and DAI Markets

- **Authorization**: [Atlas - Token Claim Authorization](https://sky-atlas.powerhouse.io/A.AG1.2.6.P15.2.1.2.3_Token_Claim_Authorization/280f2ff0-8d73-8040-9e11-d79eb710596b%7C7896ed3326389fe3185c95c7594595c36ff152ce)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

All accrued reserves for SparkLend USDS and SparkLend DAI will be claimed.

##### [Mainnet] Spark Savings - Increase Vault Deposit Caps

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0xf289dbc26dc0380bfab16a5d6c12b6167d8a47a348891797ea8bc3b752a4ce7a)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

The Vault Deposit Caps will be increased for the following markets on Spark Savings:

- Ethereum Spark Savings USDC (spUSDC)
  - [Deposit cap](https://docs.spark.fi/dev/savings/spark-vaults-v2#deposit-cap): **250 million USDC**
- Ethereum Spark Savings USDT (spUSDT)
  - [Deposit cap](https://docs.spark.fi/dev/savings/spark-vaults-v2#deposit-cap): **250 million USDT**
- Ethereum Spark Savings ETH (spETH)
  - [Deposit cap](https://docs.spark.fi/dev/savings/spark-vaults-v2#deposit-cap): **50,000 wETH**

##### [Mainnet] Spark Liquidity Layer - Onboard syrupUSDT

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0xab448e3d135620340da30616c0dabaa293f816a9edd4dc009f29b0ffb5bcbad2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

syrupUSDT will be onboarded to the Spark Liquidity Layer (SLL) with the following parameters:

- syrupUSDT address: [0x356B8d89c1e1239Cbbb9dE4815c39A1474d5BA7D](https://etherscan.io/address/0x356B8d89c1e1239Cbbb9dE4815c39A1474d5BA7D)
- Deposits
  - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **50 million USDT**
  - [slope](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.2_Slope/264f2ff0-8d73-80ff-9ba4-f25914f61e14%7C9e1ff936a6cb63b1903ca2d845de28dc): **10 million USDT per day**
- Withdrawals
  - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **unlimited**

##### [Mainnet] Spark-Aave Revenue Share Payment

- **Authorization**: [Atlas - Standard Agreement Post SPK Launch](https://sky-atlas.powerhouse.io/A.AG1.3.2.1.2.3.2_Standard_Agreement_Post_SPK_Launch/1c1f2ff0-8d73-81f6-8b1e-cb3bac92d9b3|7896ed3326389fe3553030cd0a82221360c2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/spark-aave-revenue-share-calculations-payments-9-q3-2025/27296)

The Q3-2025 SparkLend profit-sharing payment with the Aave community for the FOSS work done on Aave v3 will be transferred as detailed below:

- Spark Obligation: **150,042 USDS**
- Payment Source: **Spark SubProxy**
- Payment Receipt Address: [0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c](https://etherscan.io/address/0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c)

##### [Mainnet] Pay Spark Foundation Grant

- **Authorization**: [Atlas - Subsequent Cash Grant To Spark Foundation](https://sky-atlas.powerhouse.io/A.2.9.2.2.2.5.5.1_Subsequent_Cash_Grant_To_Spark_Foundation/280f2ff0-8d73-8019-baf3-cefdd05d4a14|9e1f80092582d59891b0d93ee539)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

Spark will transfer funding for the November Spark Foundation Grant to the Spark Foundation as approved in [Governance Poll 1597](https://vote.sky.money/polling/QmcuRr3c):

- Payment Amount: **1.1 million USDS**
- Payment Source: **Spark SubProxy**
- Payment Receipt Address: [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec) (Spark Foundation)

##### [Avalanche] Spark Savings - Increase spUSDC Vault Deposit Cap

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0x58549e11044e7c8dfecd9a60c8ecb8e77d42dbef46a1db64c09e7d9540102b1c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

Avalanche Spark Savings spUSDC Vault Deposit Cap will be increased to the following amount:

- [Deposit cap](https://docs.spark.fi/dev/savings/spark-vaults-v2#deposit-cap): **150 million USDC**

##### [Arbitrum] Spark Liquidity Layer - Update Controller to v1.7

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0x86f6b4e728e943fedf8ff814808e2d9bc0220f57edae40e3cf3711fb72d2e097)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

The Arbitrum ALM Controller will be updated to v1.7.

##### [OP Mainnet] Spark Liquidity Layer - Update Controller to v1.7

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0x86f6b4e728e943fedf8ff814808e2d9bc0220f57edae40e3cf3711fb72d2e097)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

The Optimism ALM Controller will be updated to v1.7.

##### [Unichain] Spark Liquidity Layer - Update Controller to v1.7

- **Authorization**: [Snapshot Proposal](https://snapshot.box/#/s:sparkfi.eth/proposal/0x86f6b4e728e943fedf8ff814808e2d9bc0220f57edae40e3cf3711fb72d2e097)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-30-2025-proposed-changes-to-spark-for-upcoming-spell/27309)

The Unichain ALM Controller will be updated to v1.7.

#### Grove

##### [Mainnet] GLL - Onboard Aave Core RLUSD and USDC

- **Authorization**: [Governance Poll 1600](https://vote.sky.money/polling/Qmef8C3a)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/october-30th-2025-proposed-changes-to-grove-for-upcoming-spell/27321), [2](https://forum.sky.money/t/october-30th-2025-sky-prime-technical-scope-param-changes/27325)

Aave Core RLUSD and USDC will be onboarded to the Grove Liquidity Layer (GLL) with the following parameters:

- Aave Core v3 USDC
  - aEthUSDC Address: [0x98C23E9d8f34FEFb1B7BD6a91B7FF122F4e16F5c](https://etherscan.io/address/0x98C23E9d8f34FEFb1B7BD6a91B7FF122F4e16F5c)
  - Underlying asset: **USDC**
  - Deposits
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **50 million USDC**
    - [slope](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.2_Slope/264f2ff0-8d73-80ff-9ba4-f25914f61e14%7C9e1ff936a6cb63b1903ca2d845de28dc): **25 million per day USDC**
  - Withdrawals
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **unlimited**
- Aave Core v3 RLUSD
  - aEthRLUSD Address: [0xFa82580c16A31D0c1bC632A36F82e83EfEF3Eec0](https://etherscan.io/address/0xFa82580c16A31D0c1bC632A36F82e83EfEF3Eec0)
  - Underlying asset: **RLUSD**
  - Deposits
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **50 million RLUSD**
    - [slope](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.2_Slope/264f2ff0-8d73-80ff-9ba4-f25914f61e14%7C9e1ff936a6cb63b1903ca2d845de28dc): **25 million per day RLUSD**
  - Withdrawals
  - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **unlimited**

##### [Mainnet] GLL - Onboard Aave Horizon RLUSD and USDC

- **Authorization**: [Governance Poll 1600](https://vote.sky.money/polling/Qmef8C3a)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/october-30th-2025-proposed-changes-to-grove-for-upcoming-spell/27321), [2](https://forum.sky.money/t/october-30th-2025-sky-prime-technical-scope-param-changes/27325)

Aave Horizon RLUSD and USDC will be onboarded to the Grove Liquidity Layer (GLL) with the following parameters:

- Aave Horizon USDC
  - Address: [0x68215B6533c47ff9f7125aC95adf00fE4a62f79e](https://etherscan.io/address/0x68215B6533c47ff9f7125aC95adf00fE4a62f79e)
  - Underlying asset: **USDC**
  - Deposits
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **50 million USDC**
    - [slope](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.2_Slope/264f2ff0-8d73-80ff-9ba4-f25914f61e14%7C9e1ff936a6cb63b1903ca2d845de28dc): **25 million per day USDC**
  - Withdrawals
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **unlimited**
- Aave Horizon RLUSD
  - Address: [0xE3190143Eb552456F88464662f0c0C4aC67A77eB](https://etherscan.io/address/0xE3190143Eb552456F88464662f0c0C4aC67A77eB)
  - Underlying asset: **RLUSD**
  - Deposits
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **50 million RLUSD**
    - [slope](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.2_Slope/264f2ff0-8d73-80ff-9ba4-f25914f61e14%7C9e1ff936a6cb63b1903ca2d845de28dc): **25 million per day RLUSD**
  - Withdrawals
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **unlimited**

##### [Mainnet] GLL - Onboard Curve RLUSD and USDC Swaps

- **Authorization**: [Governance Poll 1600](https://vote.sky.money/polling/Qmef8C3a)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/october-30th-2025-proposed-changes-to-grove-for-upcoming-spell/27321), [2](https://forum.sky.money/t/october-30th-2025-sky-prime-technical-scope-param-changes/27325)

Curve RLUSD and USDC Swaps will be onboarded to the Grove Liquidity Layer (GLL) with the following parameters:

- Curve RLUSD<>USDC
  - Pool Address: [0xD001aE433f254283FeCE51d4ACcE8c53263aa186](https://etherscan.io/address/0xD001aE433f254283FeCE51d4ACcE8c53263aa186)
  - Underlying assets: **USDC** and **RLUSD**
  - Swaps
    - [maxAmount](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.1_MaxAmount/264f2ff0-8d73-80cf-a4d0-c55dd7dc0138%7C9e1ff936a6cb63b1903ca2d845de28dc): **20 million**
    - [slope](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.2.2_Slope/264f2ff0-8d73-80ff-9ba4-f25914f61e14%7C9e1ff936a6cb63b1903ca2d845de28dc): **100 million per day**
    - [maxSlippage](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.2.6_MaxSlippage/264f2ff0-8d73-80c8-be69-ced9b40cb5ce%7C9e1ff936a6cb63b1903ca2d845de): **0.1%**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

---
title: Template - [Executive Vote] Reduce Rewards Emissions, Complete GUNI Vault Offboardings, Whitelist Keel SubProxy to Send Cross-Chain Messages, Adjust Grove DC-IAM Parameters, Delegate Compensation, Star Agent Proxy Spells - January 15, 2026
summary: Reduce emissions to the USDS-SKY and LSSKY-SPK farms, finalize the offboarding of GUNIV3DAIUSDC1-A and GUNIV3DAIUSDC2-A, whitelist the Keel SubProxy to send cross-chain messages using the Solana governance bridge, adjust the ALLOCATOR-BLOOM-A DC-IAM parameters, Ranked Delegate compensation for December 2025, whitelist Star Agent proxy spells in the respective StarGuard modules.
date: 2026-01-15T00:00:00.000Z
address: "0xE91C453B7e1f4DF94fb4Cb69E1F4836E62718D76"
---

# [Executive Proposal] Reduce Rewards Emissions, Complete GUNI Vault Offboardings, Whitelist Keel SubProxy to Send Cross-Chain Messages, Adjust Grove DC-IAM Parameters, Delegate Compensation, Star Agent Proxy Spells - January 15, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The USDS-SKY and LSSKY-SPK rewards streams will be terminated.
- The offboarding of GUNIV3DAIUSDC1-A and GUNIV3DAIUSDC2-A will be completed.
- The Keel SubProxy will be whitelisted to send cross-chain messages to Solana.
- ALLOCATOR-BLOOM-A DC-IAM parameters will be adjusted.
- Ranked Delegate compensation for December 2025, totaling **20,755 USDS**, will be distributed.
- Star Agent proxy spells for Spark, Grove, and Keel will be whitelisted in the respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Reduce Reward Emissions

- **Authorization**: [Governance Poll 1613](https://vote.sky.money/polling/QmYmaVVc)
- **Proposal**: [Forum Proposal](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2026-01-12/27606)

If this executive proposal passes, then rewards to the USDS-SKY and LSSKY-SPK farms will be terminated through the following actions.

#### USDS-SKY

- Call `VestedRewardsDistribution.distribute()` on [REWARDS_DIST_USDS_SKY](https://etherscan.io/address/0xC8d67Fcf101d3f89D0e1F3a2857485A84072a63F)
- `yank` [MCD_VEST_SKY_TREASURY](https://etherscan.io/address/0x67eaDb3288cceDe034cE95b0511DCc65cf630bB6) stream with `id` of **9**

#### LSSKY-SPK

- Call `VestedRewardsDistribution.distribute()` on [REWARDS_DIST_LSSKY_SPK](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e)
- `yank` [MCD_VEST_SPK_TREASURY](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078) stream with `id` of **2**

### Complete GUNI Vault Offboardings

- **Authorization**: [Core Facilitator Approval](https://forum.sky.money/t/guni-offboarding/27420/4)
- **Proposal**: [Forum Proposal](https://forum.sky.money/t/guni-offboarding/27420)

If this executive proposal passes, then the offboarding of GUNIV3DAIUSDC1-A and GUNIV3DAIUSDC2-A will be completed through the following parameter changes.

#### GUNIV3DAIUSDC1-A

- [Liquidation Ratio (`mat`)](https://sky-atlas.io/#A.3.7.1.1.2.1): increase by 898 percentage points, from 102% to **1000%**
- [Liquidation Penalty (`chop`)](https://sky-atlas.io/#A.3.7.1.1.2.5.7): reduce by 13 percentage points, from 13% to **0%**
- [Flat Kick Incentive (`tip`)](https://sky-atlas.io/#A.3.7.1.1.2.5.6): reduce by 300 DAI, from 300 DAI to **0 DAI**
- [Proportional Kick Incentive (`chip`)](https://sky-atlas.io/#A.3.7.1.1.2.5.5): reduce by 0.1 percentage points, from 0.1% to **0%**
- [Auction Price Multiplier (`buf`)](https://sky-atlas.io/#A.3.7.1.1.2.5.2): reduce by 3 percentage points, from 105% to **102%**
- [Max Auction Drawdown (`cusp`)](https://sky-atlas.io/#A.3.7.1.1.2.5.3): increase by 5 percentage points, from 90% to **95%**
- [Auction Price Function (`step`)](https://sky-atlas.io/#A.3.7.1.1.2.5.1.2): reduce by 60 seconds, from 120 seconds to **60 seconds**
- [Max Auction Duration (`tail`)](https://sky-atlas.io/#A.3.7.1.1.2.5.4): reduce by 9,900 seconds, from 13,200 seconds to **3,300 seconds**
- Update the value of [`stopped`](https://github.com/sky-ecosystem/governance-manual/blob/main/governance/gsm-exceptions.md#liquidations-circuit-breaker) to **0** on [MCD_CLIP_GUNIV3DAIUSDC1_A](https://etherscan.io/address/0x5048c5Cd3102026472f8914557A1FD35c8Dc6c9e)

#### GUNIV3DAIUSDC2-A

- [Liquidation Ratio (`mat`)](https://sky-atlas.io/#A.3.7.1.1.2.1): increase by 898 percentage points, from 102% to **1000%**
- [Liquidation Penalty (`chop`)](https://sky-atlas.io/#A.3.7.1.1.2.5.7): reduce by 13 percentage points, from 13% to **0%**
- [Flat Kick Incentive (`tip`)](https://sky-atlas.io/#A.3.7.1.1.2.5.6): reduce by 300 DAI, from 300 DAI to **0 DAI**
- [Proportional Kick Incentive (`chip`)](https://sky-atlas.io/#A.3.7.1.1.2.5.5): reduce by 0.1 percentage points, from 0.1% to **0%**
- [Auction Price Multiplier (`buf`)](https://sky-atlas.io/#A.3.7.1.1.2.5.2): reduce by 3 percentage points, from 105% to **102%**
- [Max Auction Drawdown (`cusp`)](https://sky-atlas.io/#A.3.7.1.1.2.5.3): increase by 5 percentage points, from 90% to **95%**
- [Auction Price Function (`step`)](https://sky-atlas.io/#A.3.7.1.1.2.5.1.2): reduce by 60 seconds, from 120 seconds to **60 seconds**
- [Max Auction Duration (`tail`)](https://sky-atlas.io/#A.3.7.1.1.2.5.4): reduce by 9,900 seconds, from 13,200 seconds to **3,300 seconds**
- Update the value of [`stopped`](https://github.com/sky-ecosystem/governance-manual/blob/main/governance/gsm-exceptions.md#liquidations-circuit-breaker) to **0** on [MCD_CLIP_GUNIV3DAIUSDC2_A](https://etherscan.io/address/0xB55da3d3100C4eBF9De755b6DdC24BF209f6cc06)

### Whitelist the Keel SubProxy to Send Cross-Chain Messages to Solana

- **Authorization**: [A.6.1.1.3.2.6.1.2.1.1.4.3](https://sky-atlas.io/#A.6.1.1.3.2.6.1.2.1.1.4.3)
- **Proposal**: [Technical Details Forum Post](https://forum.sky.money/t/executive-inclusion-whitelisting-the-keel-subproxy-to-send-cross-chain-messages-to-solana/27447)

If this executive proposal passes, then the Keel SubProxy will be whitelisted to send messages to Solana to control the following programs:

- SVM Controller program: [ALM1JSnEhc5PkNecbSZotgprBuJujL5objTbwGtpTgTd](https://solscan.io/account/ALM1JSnEhc5PkNecbSZotgprBuJujL5objTbwGtpTgTd)
- BPF Loader V3: [BPFLoaderUpgradeab1e11111111111111111111111](https://solscan.io/account/BPFLoaderUpgradeab1e11111111111111111111111)

This will be done by calling the [`setCanCallTarget`](https://github.com/sky-ecosystem/sky-oapp-oft/blob/main/contracts/GovernanceOAppSender.sol#L45-L50) function on [LZ_GOV_SENDER](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) twice, passing these programs as the `_dstTarget`.

### Grove (ALLOCATOR-BLOOM-A) DC-IAM Parameter Adjustment

- **Authorization**: [Governance Poll 1613](https://vote.sky.money/polling/QmYmaVVc)
- **Proposal**: [Forum Proposal](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2026-01-12/27606)

If this executive proposal passes, then the ALLOCATOR-BLOOM-A Debt Ceiling Instant Access Module (DC-IAM) parameters will be adjusted as follows:

- Increase ALLOCATOR-BLOOM-A DC-IAM [Target Available Debt (`gap`)](https://sky-atlas.io/#A.3.7.1.1.2.4.2) by 200 million USDS, from 50 million USDS to **250 million USDS**
- Increase ALLOCATOR-BLOOM-A DC-IAM [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#A.3.7.1.1.2.4.1) by 2.5 billion USDS, from 2.5 billion USDS to **5 billion USDS**

### Ranked Delegate Compensation for December 2025

- **Authorization**: [A.1.5.3](https://sky-atlas.io/#A.1.5.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/december-2025-ranked-delegate-compensation/27605)

If this executive proposal passes, then the following distributions totaling **20,755 USDS** will be distributed to 6 Aligned Delegates.

| Delegate    | Amount (USDS) | Address                                                                                                               |
| ----------- | ------------- | --------------------------------------------------------------------------------------------------------------------- |
| AegisD      | 4,000         | [0x78C180CF113Fe4845C325f44648b6567BC79d6E0](https://etherscan.io/address/0x78C180CF113Fe4845C325f44648b6567BC79d6E0) |
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| Tango       | 3,723         | [0xB2B86A130B1EC101e4Aed9a88502E08995760307](https://etherscan.io/address/0xB2B86A130B1EC101e4Aed9a88502E08995760307) |
| Sky Staking | 1,032         | [0x05c73AE49fF0ec654496bF4008d73274a919cB5C](https://etherscan.io/address/0x05c73AE49fF0ec654496bF4008d73274a919cB5C) |

### Star Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell at [0xCE352d9429A5e10b29D3d610C7217f9333e04aB4](https://etherscan.io/address/0xCE352d9429A5e10b29D3d610C7217f9333e04aB4) with the codehash `0x10d1055c82acd9d6804cfb64a80decf3880a257b8af6adad603334325d2586ed` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell at [0x90230A17dcA6c0b126521BB55B98f8C6Cf2bA748](https://etherscan.io/address/0x90230A17dcA6c0b126521BB55B98f8C6Cf2bA748) with the codehash `0x9317fd876201f5a1b08658b47a47c8980b8c8aa7538e059408668b502acfa5fb` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then a Keel proxy spell at [0x10AF705fB80bc115FCa83a6B976576Feb1E1aaca](https://etherscan.io/address/0x10AF705fB80bc115FCa83a6B976576Feb1E1aaca) with the codehash `0xa231c2a3fa83669201d02335e50f6aa379a6319c5972cc046b588c08d91fd44d` will be whitelisted in the [Keel StarGuard](https://etherscan.io/address/0xe8fF70481d653Ec31AB9E0cB2A8B316afF8D84ee).

#### Spark Proxy Spell

##### [Ethereum Mainnet] SparkLend - Add LBTC to Oracle Killswitch

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xdd79e0fc0308fd0e4393b88cccb8e9b23237c9c398e0458c8c5c43198669e4bb)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

LBTC will be added to the SparkLend [oracle kill switch mechanism](https://forum.sky.money/t/mar-21-2024-proposed-changes-to-sparklend-for-upcoming-spell/23918) with the following parameters:

- Market price oracle: **Chainlink LBTC/BTC**
- Deviation threshold: **0.95 BTC per LBTC**

##### [Ethereum Mainnet] Spark USDS Morpho Vault - Update Vault Roles

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x85f242a3d35252380a21ae3e5c80b023122e74af95698a301b541c7b610ffee8)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

A new curator and guardian multisig for the Morpho vault will be added with the following details:

- Curator role: [**0x0f963A8A8c01042B69054e787E5763ABbB0646A3**](https://etherscan.io/address/0x0f963A8A8c01042B69054e787E5763ABbB0646A3)
  - Threshold: **3 of 5**
- Guardian role: [**0xf5748bBeFa17505b2F7222B23ae11584932C908B**](https://etherscan.io/address/0xf5748bBeFa17505b2F7222B23ae11584932C908B)
  - Threshold: **3 of 5**
- Timelock: **10 days (240 hours)**

##### [Ethereum Mainnet] Spark Blue Chip USDC Morpho Vault - Update Vault Roles

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x85f242a3d35252380a21ae3e5c80b023122e74af95698a301b541c7b610ffee8)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

A new curator and guardian multisig for the Morpho vault will be added with the following details:

- Curator role: [**0x0f963A8A8c01042B69054e787E5763ABbB0646A3**](https://etherscan.io/address/0x0f963A8A8c01042B69054e787E5763ABbB0646A3)
  - Threshold: **3 of 5**
- Guardian role: [**0xf5748bBeFa17505b2F7222B23ae11584932C908B**](https://etherscan.io/address/0xf5748bBeFa17505b2F7222B23ae11584932C908B)
  - Threshold: **3 of 5**
- Timelock: **10 days (240 hours)**

##### [Base] Spark USDC Morpho Vault - Update Vault Roles

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x85f242a3d35252380a21ae3e5c80b023122e74af95698a301b541c7b610ffee8)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

A new curator and guardian multisig for the Morpho vault will be added with the following details:

- Curator role: [**0x0f963A8A8c01042B69054e787E5763ABbB0646A3**](https://basescan.org/address/0x0f963A8A8c01042B69054e787E5763ABbB0646A3)
  - Threshold: **3 of 5**
- Guardian role: [**0xf5748bBeFa17505b2F7222B23ae11584932C908B**](https://basescan.org/address/0xf5748bBeFa17505b2F7222B23ae11584932C908B)
  - Threshold: **3 of 5**
- Timelock: **10 days (240 hours)**

##### [Ethereum Mainnet] Spark Savings - Increase spUSDC Deposit Cap

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x994d54ecdadc8f4a69de921207afe3731f3066f086e63ff6a1fd0d4bbfb51b53)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

The spUSDC Deposit Cap will be increased by 500 million USDC from 500 million USDC to **1 billion USDC**.

##### [Ethereum Mainnet] Spark Savings - Increase spETH Deposit Cap

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x994d54ecdadc8f4a69de921207afe3731f3066f086e63ff6a1fd0d4bbfb51b53)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

The spETH Deposit Cap will be increased by 150,000 ETH from 100,000 ETH to **250,000 ETH**.

##### [Avalanche] Spark Savings - Increase spUSDC Deposit Cap

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x994d54ecdadc8f4a69de921207afe3731f3066f086e63ff6a1fd0d4bbfb51b53)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

The spUSDC Deposit Cap will be increased by 250 million USDC from 250 million USDC to **500 million USDC**.

##### [Arbitrum] Spark Liquidity Layer - Mint sUSDS to Arbitrum PSM3

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x994d54ecdadc8f4a69de921207afe3731f3066f086e63ff6a1fd0d4bbfb51b53)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

**250 million USDS** worth of sUSDS will be minted to the [PSM3 on Arbitrum](https://arbiscan.io/address/0x2B05F8e1cACC6974fD79A673a341Fe1f58d27266).

##### [OP Mainnet] Spark Liquidity Layer - Mint sUSDS to OP Mainnet PSM3

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x994d54ecdadc8f4a69de921207afe3731f3066f086e63ff6a1fd0d4bbfb51b53)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

**100 million USDS** worth of sUSDS will be minted to the [PSM3 on OP Mainnet](https://optimistic.etherscan.io/address/0xe0F9978b907853F354d79188A3dEfbD41978af62).

##### [Ethereum Mainnet] Spark Liquidity Layer - Onboard Curve weETH/WETH-ng for Swaps

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x7eb3a86a4da21475e760e2b2ed0d82fd72bbd4d33c99a0fbedf3d978e472f362)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-proposed-changes-to-spark-for-upcoming-spell/27585)

The Curve weETH/WETH-ng pool will be onboarded for swaps only with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- Pool address: [**0xDB74dfDD3BB46bE8Ce6C33dC9D82777BCFc3dEd5**](https://etherscan.io/address/0xDB74dfDD3BB46bE8Ce6C33dC9D82777BCFc3dEd5)
- Swaps:
  - maxAmount: **100 WETH**
  - slope: **1,000 WETH per day**
  - maxSlippage: **0.25%**

#### Grove Proxy Spell

##### [Ethereum Mainnet + Base ] Onboard Grove Liquidity Layer and CCTP for Base

- **Authorization**: [A.6.1.1.2.2.6.1.2.1.1.1.1.2.3](https://sky-atlas.io/#A.6.1.1.2.2.6.1.2.1.1.1.1.2.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15th-2026-proposed-changes-to-grove-for-upcoming-spell/27570)

The Grove Liquidity Layer will be onboarded to Base with the following contract addresses and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

###### Contract Addresses

- Executor: Base: [**0x491EDFB0B8b608044e227225C715981a30F3A44E**](https://basescan.org/address/0x491EDFB0B8b608044e227225C715981a30F3A44E)
- Receiver: Base: [**0x5F5cfCB8a463868E37Ab27B5eFF3ba02112dF19a**](https://basescan.org/address/0x5F5cfCB8a463868E37Ab27B5eFF3ba02112dF19a)
- ALM Controller: Base: [**0x491EDFB0B8b608044e227225C715981a30F3A44E**](https://basescan.org/address/0x491EDFB0B8b608044e227225C715981a30F3A44E)
- ALM Proxy: Base: [**0x9B746dBC5269e1DF6e4193Bcb441C0FbBF1CeCEe**](https://basescan.org/address/0x9B746dBC5269e1DF6e4193Bcb441C0FbBF1CeCEe)
- ALM Rate Limits: Base: [**0xAc8BF0669223197ac8B94Cbb53E725e40B3919E8**](https://basescan.org/address/0xAc8BF0669223197ac8B94Cbb53E725e40B3919E8)
- Relayer: Base: [**0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f**](https://basescan.org/address/0x0eEC86649E756a23CBc68d9EFEd756f16aD5F85f)
- Relayer 2: Base: [**0x9187807e07112359C481870feB58f0c117a29179**](https://basescan.org/address/0x9187807e07112359C481870feB58f0c117a29179)
- Freezer: Base: [**0xB0113804960345fd0a245788b3423319c86940e5**](https://basescan.org/address/0xB0113804960345fd0a245788b3423319c86940e5)

###### Parameters

- Base.GROVE_EXECUTOR.delay = **0 days**
- Base.GROVE_EXECUTOR.gracePeriod = **7 days**
- CCTP v2 Mainnet to Base:
  - Transfers:
    - maxAmount: **50 million USDC**
    - Slope: **50 million USDC per day**
- CCTP v2 Base to Mainnet:
  - Transfers:
    - maxAmount: **50 million USDC**
    - Slope: **50 million USDC per day**

##### [Ethereum Mainnet] Upgrade MainnetController to v1.8.0

- **Authorization**: [Governance Poll 1612](https://vote.sky.money/polling/QmcJnbbu)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15th-2026-proposed-changes-to-grove-for-upcoming-spell/27570)

The MainnetController will be upgraded to v1.8.0.

##### [Base] Onboard Morpho Grove x Steakhouse USDC High Yield Vault

- **Authorization**: [Governance Poll 1608](https://vote.sky.money/polling/QmWNWJLS)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15th-2026-proposed-changes-to-grove-for-upcoming-spell/27570)

[Morpho Grove x Steakhouse High Yield USDC](https://app.morpho.org/base/vault/0xBeEf2d50B428675a1921bC6bBF4bfb9D8cF1461A/grove-x-steakhouse-usdc-high-yield) will be onboarded to the Grove Liquidity Layer on Base with the following parameters and [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- Address: [0xBEEf2B5FD3D94469b7782aeBe6364E6e6FB1B709](https://basescan.org/address/0xBEEf2B5FD3D94469b7782aeBe6364E6e6FB1B709)
  - Underlying asset: **USDC**
  - Deposits
    - maxAmount: **20 million**
    - slope: **20 million per day**
  - Withdrawals
    - maxAmount: **unlimited**

#### Keel Proxy Spell

##### [Ethereum Mainnet] Correct CCTP Transfer Recipient on Solana

- **Authorization**: [Governance Poll 1612](https://vote.sky.money/polling/QmcJnbbu)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-15-2026-prime-technical-scope-parameter-change-for-upcoming-spell/27567)

The CCTP mintRecipient address on Solana will be updated to the Keel Solana ALM Controller’s USDC token account at [4UA2CC9fQDTbX1SnJcanYn2QU5PtyB1MGfezDvGFPVwd](https://solscan.io/account/4UA2CC9fQDTbX1SnJcanYn2QU5PtyB1MGfezDvGFPVwd).

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

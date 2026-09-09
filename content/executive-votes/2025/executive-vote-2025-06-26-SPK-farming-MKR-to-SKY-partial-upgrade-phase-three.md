---
title: Template - [Executive Vote] SPK Farming Initialization, Partial Phase 3 MKR-to-SKY Migration, Smart Burn Engine Parameter Updates, ALLOCATOR-BLOOM-A Maximum Debt Ceiling Increase, Spark USDS Transfer, Launch Project Funding, Delegate Compensation for May 2025, Atlas Core Development Payments for June 2025, Spark Proxy Spell - June 26, 2025
summary: Initialize SPK farming using USDS and SKY tokens, perform a subset of actions for Phase 3 of the MKR-to-SKY Migration, update several parameters related to the Smart Burn Engine, increase the ALLOCATOR-BLOOM-A Maximum Debt Ceiling, execute the transfer of the Genesis Capital Allocation to Spark, transfer SKY tokens to the Launch Project, transfer Aligned Delegate and Atlas Core Development payments, execute a Spark Proxy Spell.
date: 2025-06-26T00:00:00.000Z
address: "0xC9c4ddF824e4fF80158aB7862D168a35ce616e8E"
---

# [Executive Proposal] SPK Farming Initialization, Partial Phase 3 MKR-to-SKY Migration, Smart Burn Engine Parameter Updates, ALLOCATOR-BLOOM-A Maximum Debt Ceiling Increase, Spark USDS Transfer, Launch Project Funding, Delegate Compensation for May 2025, Atlas Core Development Payments for June 2025, Spark Proxy Spell - June 26, 2025

The Governance Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- A new DssVestTransferrable contract for SPK tokens will be initialized.
- SPK farms for USDS and SKY stakers will be initialized.
- A subset of actions relating to phase 3 of the MKR-to-SKY upgrade process will be taken:
	- Uncommitted MKR held in the PauseProxy contract will be converted to SKY.
	- The legacy MKR-to-SKY converter will be disabled.
	- Excess SKY tokens in the MKR-to-SKY converter will be burned to offset tokens minted through the legacy converter.
	- A proportion of SKY tokens held in the PauseProxy will be burned to offset minted SKY tokens.
- Smart Burn Engine parameters will be updated.
- The ALLOCATOR-BLOOM-A Maximum Debt Ceiling (`line`) will be increased.
- **20.6 million USDS** will be transferred to the Spark SubProxy.
- **8.4 million SKY** will be transferred to the Launch Project.
- A total of **20,443 USDS** will be distributed as Aligned Delegate compensation for May 2025.
- A total of **77,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for June 2025.
- A Spark Proxy Spell with the address [0x74e1ba852C864d689562b5977EedCB127fDE0C9F](https://etherscan.io/address/0x74e1ba852C864d689562b5977EedCB127fDE0C9F) will be executed.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/#A.1.8.2.1_Pause_Delay-a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/#A.1.8.2.1.2_Pause_Delay_Current_Value-09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal **has its earliest execution date set to June 30, 2025 at 14:00 UTC**. This means that it cannot be executed before that date.

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**. 

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### SPK Token Farming Initialization

- **Authorization**: [Atlas entry](https://sky-atlas.powerhouse.io/A.2.9.1.2.2.1.2.2.2_Spark_Token_Reward_Distribution_Schedule/1fef2ff0-8d73-809d-ac41-eb9753c05d41|9e1f80092582d59891b002d4366698bb), [Governance Poll 1504](https://vote.sky.money/polling/QmXpG84B)
- **Proposal**: [Technical Scope](https://forum.sky.money/t/technical-scope-of-spk-farms/26703), [Atlas Edit Proposal](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-05-26/26454)

If this executive proposal passes, then the following actions required to implement SPK farming will be taken.

#### Pre-Deployed Contracts

##### SPK Vesting Contract Deployment

In order to stream SPK tokens from the PauseProxy to the farming contracts, a new [DssVestTransferrable](https://github.com/sky-ecosystem/dss-vest/blob/41728f0361418ff4831d0987c2b8aadffbf2f539/src/DssVest.sol) contract for SPK vesting has been deployed to [0xF9A2002b471f600A5484da5a735a2A053d377078](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078) with the following constructor parameters:

- `_czar`: [MCD_PAUSE_PROXY](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB).
- `_gem`: [SPK Token](https://etherscan.io/token/0xC20059E0317De91738D13AF027DfC4a50781b066).

##### USDS -> SPK Farm

A new [StakingRewards](https://github.com/makerdao/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/src/synthetix/StakingRewards.sol) contract to permit farming of SPK tokens with USDS tokens has been deployed to [0x173e314C7635B45322cd8Cb14f44b312e079F3af](https://etherscan.io/address/0x173e314C7635B45322cd8Cb14f44b312e079F3af) with the following constructor parameters:

- `_owner`: [MCD_PAUSE_PROXY](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB).
- `_rewardsDistribution`: address(0).
- `_rewardsToken`: [SPK](https://etherscan.io/token/0xC20059E0317De91738D13AF027DfC4a50781b066).
- `_stakingToken`: [USDS](https://etherscan.io/token/0xdC035D45d973E3EC169d2276DDab16f1e407384F).

A new [VestedRewardsDistribution](https://github.com/makerdao/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/src/VestedRewardsDistribution.sol) contract to permit farming of SPK tokens with USDS tokens has been deployed to [0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c](https://etherscan.io/address/0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c) with the following constructor parameters:

- `_dssVest`: The newly created SPK vesting contract deployed at [0xF9A2002b471f600A5484da5a735a2A053d377078](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078).
- `_stakingRewards`: The newly created staking rewards contract deployed at [0x173e314C7635B45322cd8Cb14f44b312e079F3af](https://etherscan.io/address/0x173e314C7635B45322cd8Cb14f44b312e079F3af).

##### LSSKY -> SPK Farm

A new [StakingRewards](https://github.com/makerdao/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/src/synthetix/StakingRewards.sol) contract to permit farming of SPK tokens with Staked SKY has been deployed to [0x99cBC0e4E6427F6939536eD24d1275B95ff77404](https://etherscan.io/address/0x99cBC0e4E6427F6939536eD24d1275B95ff77404) with the following constructor parameters:

- `_owner`: [MCD_PAUSE_PROXY](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB).
- `_rewardsDistribution`: address(0).
- `_rewardsToken`: [SPK](https://etherscan.io/token/0xC20059E0317De91738D13AF027DfC4a50781b066).
- `_stakingToken`: [LSSKY](https://etherscan.io/token/0xf9a9cfd3229e985b91f99bc866d42938044ffa1c).

A new [VestedRewardsDistribution](https://github.com/makerdao/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/src/VestedRewardsDistribution.sol) contract to permit farming of SPK tokens with Staked SKY has been deployed to [0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e) with the following constructor parameters:

- `_dssVest`: The newly created SPK vesting contract deployed at [0xF9A2002b471f600A5484da5a735a2A053d377078](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078).
- `_stakingRewards`: The newly created staking rewards contract deployed at [0x99cBC0e4E6427F6939536eD24d1275B95ff77404](https://etherscan.io/address/0x99cBC0e4E6427F6939536eD24d1275B95ff77404).

#### Contract Initialization

##### SPK Vest Initialization

If this executive proposal passes the SPK vesting contract will be initialized by performing the following actions:

- The vesting contract will be approved to spend SPK held in the PauseProxy with the following parameters:
	- `spender`: [0xF9A2002b471f600A5484da5a735a2A053d377078](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078)
	- `amount`: **3_250_000_000 * WAD** (This is the total amount of SPK tokens being streamed by vests created in this spell)
- The `cap` of the vesting contract will be set to **2_502_500_000 * WAD / 730 days** (This value is the maximum amount of SPK that can be vested per second per vesting stream. It should be greater than or equal to the largest vesting stream rate. In this spell we are adding the conventional 10% buffer to avoid any issues.)
- Add MCD_VEST_SPK_TREASURY to the [Chainlog](https://chainlog.sky.money/) with the value [0xF9A2002b471f600A5484da5a735a2A053d377078](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078).
- Add SPK to the [Chainlog](https://chainlog.sky.money/) with the value [0xC20059E0317De91738D13AF027DfC4a50781b066](https://etherscan.io/token/0xC20059E0317De91738D13AF027DfC4a50781b066).

##### USDS -> SPK Farm Initialization

If this executive proposal passes the USDS -> SPK farm will be initialized through the following actions:

###### Create the Vesting Stream

Call [VestInit.create()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/script/dependencies/VestInit.sol#L28-L39) with the following parameters:

- `vest`: [0xF9A2002b471f600A5484da5a735a2A053d377078](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078).
- `p.usr`: [0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c](https://etherscan.io/address/0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c).
- `p.tot`: 2_275_000_000 * WAD.
- `p.bgn`: block.timestamp - 7 days.
- `p.tau`: 730 days.
- `p.eta`: 0.
- `restricted`: true (VestInit.create() restricts the stream by default).

This will create a vesting stream vesting 2.275 billion SKY over 2 years to the relevant VestedRewardsDistribution contract.

###### Initialize the StakingRewards Contract

Call [StakingRewardsInit.init()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/script/dependencies/StakingRewardsInit.sol#L27-L29) with the following parameters:

- `rewards`: [0x173e314C7635B45322cd8Cb14f44b312e079F3af](https://etherscan.io/address/0x173e314C7635B45322cd8Cb14f44b312e079F3af).
- `p.dist`: [0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c](https://etherscan.io/address/0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c).
- `duration`: 7 days (this is the default value for StakingRewards contracts).

###### Initialize the VestedRewardsDistribution Contract

Call [VestedRewardsDistributionInit.init()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/script/dependencies/VestedRewardsDistributionInit.sol#L23-L25) with the following parameters:

- `dist`: [0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c](https://etherscan.io/address/0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c).
- `p.vestId`: vestIdUsdsSpk (the ID of the vesting stream created for this farm).

###### Call distribute() on The VestedRewardsDistribution Contract

[distribute()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/src/VestedRewardsDistribution.sol#L152-L165) will be called on the new VestedRewardsDistribution contract.

###### Add the VestedRewardsDistribution Contract to the Keeper Job

The new VestedRewardsDistribution contract will be added to the keeper job by calling set() on [CRON_REWARDS_DIST_JOB](https://etherscan.io/address/0x6464c34a02dd155dd0c630ce233dd6e21c24f9a5) with the following parameters:

- `dist`: [0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c](https://etherscan.io/address/0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c).
- `period`: 7 days - 1 hours (the default farm rewards epoch duration minus 1 hour is used to avoid disruption in the rewards distribution schedule in cases where the chain is too busy or the keepers fail to execute the jobs on time).

###### Add New Contracts to the Chainlog

The new VestedRewardsDistribution and StakingRewards contracts will be added to the [Chainlog](https://chainlog.sky.money/) with the following key-value pairs:

- REWARDS_USDS_SPK: [0x173e314C7635B45322cd8Cb14f44b312e079F3af](https://etherscan.io/address/0x173e314C7635B45322cd8Cb14f44b312e079F3af).
- REWARDS_DIST_USDS_SPK: [0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c](https://etherscan.io/address/0x3959e23A63CA7ac12D658bb44F90cb1f7Ee4C02c).

##### LSSKY -> SPK Farm Initialization

If this executive proposal passes the LSSKY -> SPK farm will be initialized through the following actions:

###### Create the Vesting Stream

Call [VestInit.create()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/script/dependencies/VestInit.sol#L28-L39) with the following parameters:

- `vest`: [0xF9A2002b471f600A5484da5a735a2A053d377078](https://etherscan.io/address/0xF9A2002b471f600A5484da5a735a2A053d377078).
- `p.usr`: [0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e).
- `p.tot`: 975_000_000 * WAD.
- `p.bgn`: block.timestamp - 7 days.
- `p.tau`: 730 days.
- `p.eta`: 0.
- `restricted`: true (VestInit.create() restricts the stream by default).

This will create a vesting stream vesting 975 million SKY over 2 years to the relevant VestedRewardsDistribution contract.

###### Initialize the StakingRewards Contract

Call [StakingRewardsInit.init()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/script/dependencies/StakingRewardsInit.sol#L27-L29) with the following parameters:

- `rewards`: [0x99cBC0e4E6427F6939536eD24d1275B95ff77404](https://etherscan.io/address/0x99cBC0e4E6427F6939536eD24d1275B95ff77404).
- `p.dist`: [0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e).
- `duration`: 7 days (this is the default value for StakingRewards contracts).

###### Initialize the VestedRewardsDistribution Contract

Call [VestedRewardsDistributionInit.init()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/script/dependencies/VestedRewardsDistributionInit.sol#L23-L25) with the following parameters:

- `dist`: [0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e).
- `p.vestId`: vestIdLsskySpk (the ID of the vesting stream created for this farm).

###### Call distribute() on The VestedRewardsDistribution Contract

[distribute()](https://github.com/sky-ecosystem/endgame-toolkit/blob/5bf4b1771b99f5f8758fd40a4ac567f797b5405b/src/VestedRewardsDistribution.sol#L152-L165) will be called on the new VestedRewardsDistribution contract.

###### Add the VestedRewardsDistribution Contract to the Keeper Job

The new VestedRewardsDistribution contract will be added to the keeper job by calling set() on [CRON_REWARDS_DIST_JOB](https://etherscan.io/address/0x6464c34a02dd155dd0c630ce233dd6e21c24f9a5) with the following parameters:

- `dist`: [0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e).
- `period`: 7 days - 1 hours (the default farm rewards epoch duration minus 1 hour is used to avoid disruption in the rewards distribution schedule in cases where the chain is too busy or the keepers fail to execute the jobs on time).

###### Add LSSKY -> SPK farm to the Lockstake Engine

The new StakingRewards contract will be added as a farm to the Lockstake Engine by calling [addFarm()](https://github.com/sky-ecosystem/lockstake/blob/master/src/LockstakeEngine.sol#L198-L201) with the following parameter:

- `farm`: [0x99cBC0e4E6427F6939536eD24d1275B95ff77404](https://etherscan.io/address/0x99cBC0e4E6427F6939536eD24d1275B95ff77404).

###### Add New Contracts to the Chainlog

The new VestedRewardsDistribution and StakingRewards contracts will be added to the [Chainlog](https://chainlog.sky.money/) with the following key-value pairs:

- REWARDS_LSSKY_SPK: [0x99cBC0e4E6427F6939536eD24d1275B95ff77404](https://etherscan.io/address/0x99cBC0e4E6427F6939536eD24d1275B95ff77404).
- REWARDS_DIST_LSSKY_SPK: [0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e](https://etherscan.io/address/0xa3Ee378BdD0b7DD403cEd3a0A65B2B389A2eaB7e).

### Phase 3 MKR-to-SKY Migration Actions

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.4.1.2.1.4_MKR_To_SKY_Upgrade_Phase_Three/1f1f2ff0-8d73-80f8-9345-f50e357c1f9e|b341f4c0b83472dc)
- **Proposal**: [Forum Post](https://forum.sky.money/t/phase-3-mkr-to-sky-migration-items-june-26-spell/26710)

If this executive proposal passes, then the following actions that form part of Phase 3 of the MKR-to-SKY migration process will be performed.

#### Convert MKR balance of the PauseProxy to SKY

- **Atlas document**: [A.4.1.2.1.4.2.3 - Upgrade MKR In Pause Proxy to SKY](https://sky-atlas.powerhouse.io/A.4.1.2.1.4.2.3_Upgrade_MKR_In_Pause_Proxy_To_SKY/1f1f2ff0-8d73-8064-ab0e-d51c96127c19|b341f4c0b83472dc1f9e1a3b)

If this executive proposal passes the MKR balance of the PauseProxy will be upgraded to SKY by calling mkrToSky() on MKR_SKY with the MKR balance of the PauseProxy minus the unpaid() MKR for MCD_VEST_MKR_TREASURY ids 9, 18, 24, 35, 37, and 39.

These vesting streams represent committed expenses in MKR. The required amount of MKR to honor these commitments will therefore remain in the PauseProxy after this spell executes. Some of this MKR may be converted in a future spell once the future of these vesting streams has been clarified.

#### Disable MKR_SKY_LEGACY Converter

- **Atlas document**: [A.4.1.2.2.4.2.1 - Disabling Legacy Conversion Contract](https://sky-atlas.powerhouse.io/A.4.1.2.2.4.2.1_Disabling_Legacy_Conversion_Contract/210f2ff0-8d73-80d4-a983-f9217c9b244a|b341f4c0b834477b310e7381)

If this executive proposal passes MKR_SKY_LEGACY will be disabled by calling disableOldConverterMkrSky(). The audited code for this function can be found on [GitHub](https://github.com/sky-ecosystem/sky/pull/21/files#diff-f6cbf09833eed835c52b0a1c5be7dd9e84213d278c958843725af6a77faa77d4R69-R75).

#### Burn Excess SKY from MKR_SKY Converter

- **Atlas document**: [A.4.1.2.2.4.2](https://sky-atlas.powerhouse.io/A.4.1.2.2.4.2_MKR_To_SKY_Conversion_Emissions/209f2ff0-8d73-80c7-80e7-e61690dc7381|b341f4c0b834477b310e)

If this executive proposal passes excess SKY held within the MKR_SKY converter will be burned by calling burnExtraSky(). The audited code for this function can be found on [GitHub](https://github.com/sky-ecosystem/sky/pull/21/files#diff-f6cbf09833eed835c52b0a1c5be7dd9e84213d278c958843725af6a77faa77d4R81-R88).

This excess SKY is a result of the legacy contract continuing to mint new SKY after a balance of SKY was pre-minted to the new MKR_SKY conversion contract.

#### Burn PauseProxy SKY to Offset Minted Tokens

- **Atlas document**: [A.4.1.2.2.4.1 - SKY Token Rewards Emissions](https://sky-atlas.powerhouse.io/A.4.1.2.2.4.1_SKY_Token_Rewards_Emissions/209f2ff0-8d73-80ee-bc70-f5cbed9c2664|b341f4c0b834477b310e)

If this executive proposal passes, **426,292,860.23 SKY** tokens will be burned from the PauseProxy to offset emissions of SKY that were minted to fund SKY rewards and Early Bird Rewards.

The breakdown of tokens is:

- Mintable vest 1: 366,713,025.327023887843223231 SKY
- Mintable vest 2: 36,951,526.251526251526251526 SKY
- Early Bird Boosted Reward Total: 22,628,308.646484409734345358 SKY
- Total to be burned: **426,292,860.225034549103820115 SKY** (note this is being rounded to 2 decimal places to streamline the crafting and reviewing process).

### Smart Burn Engine Parameter Updates

- **Authorization**: [Facilitator Approval](https://forum.sky.money/t/smart-burn-engine-parameter-update-proposals-june-26-2025-spell-contents/26702/3), [Governance Poll 1524](https://vote.sky.money/polling/QmajvKnz)
- **Proposal**: [Forum Post](https://forum.sky.money/t/smart-burn-engine-parameter-update-proposals-june-26-2025-spell-contents/26702)

If this executive proposal passes, then the following Smart Burn Engine parameters will be updated:

- Reduce [vow.hump](https://sky-atlas.powerhouse.io/A.3.6.2_Surplus_Buffer_Splitter_Parameters/122f2ff0-8d73-80f8-9a2a-d221794f73f5|57ea2c54) by 20 million USDS from 70 million USDS to **50 million USDS**.
- Increase [splitter.hop](https://sky-atlas.powerhouse.io/A.3.6.2_Surplus_Buffer_Splitter_Parameters/122f2ff0-8d73-80f8-9a2a-d221794f73f5|57ea2c54) by 432 seconds from 1,728 seconds to **2,160 seconds**.
- Increase rewardsDuration in `REWARDS_LSSKY_USDS` by 432 seconds from 1,728 seconds to **2,160 seconds** (this must be updated so the rewardsDuration of the Lockstake Engine matches the frequency of distributions by the Smart Burn Engine).

### ALLOCATOR-BLOOM-A Maximum Debt Ceiling (`line`) Increase

- **Authorization**: [Governance Poll 1520](https://vote.sky.money/polling/Qmcy6Lug)
- **Proposal**: [Forum Post](https://forum.sky.money/t/parameter-changes-proposal-june-16-2025/26653)

If this executive proposal passes, then the following parameter change will occur:

- Increase the ALLOCATOR-BLOOM-A [Maximum Debt Ceiling (`line`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.1_Maximum_Debt_Ceiling_(line)/6f1a913d-9436-4b70-816b-e317672737d6%7C57eaf45219bea3b430c268bb) by 2.4 billion USDS, from 100 million USDS to **2.5 billion USDS**.

### Spark USDS Transfer

- **Authorization**: [Governance Poll 1525](https://vote.sky.money/polling/QmbwyUbo)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-06-23/26701)

If this executive proposal passes, then the following USDS transfer will occur:

- Transfer **20.6 million USDS** to the Spark SubProxy at [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

### Launch Project Funding

- **Authorization**: [Atlas A.5.5.1.6 - Budget](https://sky-atlas.powerhouse.io/A.5.5.1.6_Budget/8a88d69e-33cf-459f-8e1c-de4ac965d76b|8d5aeb778e7c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/utilization-of-the-launch-project-under-the-accessibility-scope/21468/46)

If this executive proposal passes, then the following SKY transfer to the Launch Project will occur:

- Transfer **8.4 million SKY** to the Launch Project at [0x3C5142F28567E6a0F172fd0BaaF1f2847f49D02F](https://etherscan.io/address/0x3C5142F28567E6a0F172fd0BaaF1f2847f49D02F).

### Delegate Compensation for May 2025

- **Authorization**: [Atlas A.1.5.3 - Eligibility to Receive Budget](https://sky-atlas.powerhouse.io/A.1.5.3_Eligibility_To_Receive_Budget/5c9662be-9fc4-4b58-aef0-ca3e0bf56039|0db3af4ece0c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-2025-aligned-delegate-compensation/26698)

If this executive proposal passes, then the following USDS transfers totaling **20,443 USDS** will be distributed as Aligned Delegate Compensation for May 2025:

| Delegate    | Amount (USDS) | Address                                                                                                               |
|-------------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| PBG         | 4,000         | [0x8D4df847dB7FfE0B46AF084fE031F7691C6478c2](https://etherscan.io/address/0x8D4df847dB7FfE0B46AF084fE031F7691C6478c2) |
| JuliaChang  | 2,323         | [0x252abAEe2F4f4b8D39E5F12b163eDFb7fac7AED7](https://etherscan.io/address/0x252abAEe2F4f4b8D39E5F12b163eDFb7fac7AED7) |
| Excel       | 1,088         | [0x0F04a22B62A26e25A29Cba5a595623038ef7AcE7](https://etherscan.io/address/0x0F04a22B62A26e25A29Cba5a595623038ef7AcE7) |
| WBC         | 1,032         | [0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47](https://etherscan.io/address/0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47) |

### Atlas Core Development Payments for June 2025

- **Authorization**: [Atlas 2.2.1.1 - Funding](https://sky-atlas.powerhouse.io/A.2.2.1.1_Funding/8ea8dcb0-7261-4c1a-ae53-b7f3eb5362e5%7C9e1f3b569af1), [Facilitator Approval](https://forum.sky.money/t/atlas-core-development-payment-requests-june-2025/26585/7)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-core-development-payment-requests-june-2025/26585)

If this executive proposal passes, then a total of **77,584 USDS** and **618,000 SKY** will be distributed for Atlas Core Development funding.

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

### Spark Proxy Spell

If this executive proposal passes, a Spark proxy spell at [0x74e1ba852C864d689562b5977EedCB127fDE0C9F](https://etherscan.io/address/0x74e1ba852C864d689562b5977EedCB127fDE0C9F) will be executed. The expected contents are as follows:

#### Onboard syrupUSDC August PT to the Spark DAI Morpho Vault

- **Authorization**: [Governance Poll 1522](https://vote.sky.money/polling/QmcGPTMX)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-26-2025-proposed-changes-to-spark-for-upcoming-spell/26663)

If this executive proposal passes, PT-syrupUSDC-28Aug2025 will be onboarded to the Spark DAI Morpho Vault with the following parameters:

- Pool supply cap: **300 million DAI**.
- Pool LLTV: **91.5%**.
- PT Oracle Discount Rate: **15%**.

#### Onboard USDe September PT to the Spark DAI Morpho Vault

- **Authorization**: [Governance Poll 1523](https://vote.sky.money/polling/QmWtGgPH)
- **Proposal**: [Forum Post](https://forum.sky.money/t/june-26-2025-proposed-changes-to-spark-for-upcoming-spell/26663)

If this executive proposal passes, PT-USDe-25Sept2025 will be onboarded to the Spark DAI Morpho Vault with the following parameters:

- Pool supply cap: **500 million DAI**.
- Pool LLTV: **91.5%**.
- PT Oracle Discount Rate: **15%**.

#### USDS Transfer to the Spark Foundation

- **Authorization**: [Governance Poll 1525](https://vote.sky.money/polling/QmbwyUbo)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-06-23/26701)

If this executive proposal passes, the following transfer of USDS from the Spark SubProxy to the Spark Foundation will be executed:

- Transfer **800,000 USDS** from the Spark SubProxy to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec).

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

---
title: Template - [Executive Vote] MKR-to-SKY Upgrade Phase Two, Switch SKY Token Rewards Vesting Stream Source, Initialize Unichain and Optimism Native Bridges, Deactivate SparkLend DDM, Transfer Ownership of SPK Token to SPK Company Multisig, Increase ALLOCATOR-SPARK-A Maximum Debt Ceiling, Launch Project Funding, Delegate Compensation for April 2025, Atlas Core Development Payments for May 2025, Spark Proxy Spell - May 29, 2025
summary: Phase Two actions for MKR-to-SKY Upgrade, change source of SKY For USDS Rewards to the Pause Proxy, initialization of Native Bridges on Unichain and Optimism, SparkLend Direct Deposit Module deactivation and removal from AutoLine, transfer ownership of SPK Token to SPK Company multisig, increase ALLOCATOR-SPARK-A Maximum Debt Ceiling, Launch Project funding, distribute Delegate Compensation for April 2025, distribute Atlas Core Development payments for May 2025, execute a Spark Proxy Spell.
date: 2025-05-29T00:00:00.000Z
address: "0x86F5A13C95ecf7263634b6e14E483d05D7d4aA0B"
---

# [Executive Proposal] MKR-to-SKY Upgrade Phase Two, Switch SKY Token Rewards Vesting Stream Source, Initialize Unichain and Optimism Native Bridges, Deactivate SparkLend DDM, Transfer Ownership of SPK Token to SPK Company Multisig, Increase ALLOCATOR-SPARK-A Maximum Debt Ceiling, Launch Project Funding, Delegate Compensation for April 2025, Atlas Core Development Payments for May 2025, Spark Proxy Spell - May 29, 2025

The Governance Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY Holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Actions for MKR-to-SKY Upgrade Phase Two will be performed.
- The source for Sky Token Rewards (SKY to USDS) will be changed to the PauseProxy.
- Unichain Native Bridge will be launched with initial listed parameters.
- Optimism Native Bridge will be launched with initial listed parameters.
- The SparkLend Direct Deposit Module (DDM) Debt Ceiling will be deactivated.
- Ownership of SPK Token will be transferred to the SPK Company Multisig.
- ALLOCATOR-SPARK-A Maximum Debt Ceiling (`line`) will be increased.
- **5 million USDS** will be distributed to the Launch Project at [0x3C5142F28567E6a0F172fd0BaaF1f2847f49D02F](https://etherscan.io/address/0x3C5142F28567E6a0F172fd0BaaF1f2847f49D02F).
- A total of **26,267 USDS** will be distributed as Aligned Delegate compensation for April 2025.
- A total of **77,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for May 2025.
- A Spark proxy spell will be executed at [0x3968a022D955Bbb7927cc011A48601B65a33F346](https://etherscan.io/address/0x3968a022D955Bbb7927cc011A48601B65a33F346).

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/#A.1.8.2.1_Pause_Delay-a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.powerhouse.io/#A.1.8.2.1.2_Pause_Delay_Current_Value-09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**. 

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### MKR-to-SKY Upgrade Phase Two

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.4.1.2.1.2_MKR_To_SKY_Upgrade_Phase_Two/1f1f2ff0-8d73-80ee-81e9-f508c45f90ed|b341f4c0b83472dc), [Governance Poll 1245](https://vote.makerdao.com/polling/QmcZNZg3)  
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-may-5-2025/26319)

If this executive proposal passes, the following actions will complete Phase Two of the MKR-to-SKY Upgrade.

#### Activate USDS Rewards on the LSEV2-SKY-A Contract

- Reduce the [Surplus Buffer Splitter burn (splitter.burn)](https://sky-atlas.powerhouse.io/A.3.6.2_Surplus_Buffer_Splitter_Parameters/122f2ff0-8d73-80f8-9a2a-d221794f73f5|57ea2c54) parameter by 50 percentage points from 100% to **50%**.

#### LSEV2-SKY-A AutoLine Addition

- Add LSEV2-SKY-A to the [Debt Ceiling Instant Access Module (DC-IAM)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4_Debt_Ceiling_Instant_Access_Module_(DC_IAM)/071d42e3-8a21-4401-852e-0b52c49768bb%7C57eaf45219bea3b430c2).
- Set the [Maximum Debt Ceiling (`line`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.1_Maximum_Debt_Ceiling_(line)/6f1a913d-9436-4b70-816b-e317672737d6%7C57eaf45219bea3b430c268bb) to **50 million USDS**.
- Set the [Target Available Debt (`gap`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.2_Target_Available_Debt_(gap)/c1e17312-3744-4360-81f4-03564f0dd09d%7C57eaf45219bea3b430c268bb) to **25 million USDS**.
- Set the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.3_Ceiling_Increase_Cooldown_(ttl)/58f5315f-938f-464c-b2d2-f611145d469a%7C57eaf45219bea3b430c268bb) to **86,400 seconds**.

#### Adjust GSM Pause Delay

- Reduce the [GSM (Governance Security Module) Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0%7C0db30758e055) by 24 hours from 48 hours to **24 hours**.

#### Revoke Migrator Authority Over Vat Contract

- Revoke LOCKSTAKE_MIGRATOR's authority over the vat.

### Change the Source of Sky Token Rewards (SKY to USDS) to the Pause Proxy

- **Authorization**: [Ecosystem Approval](https://forum.sky.money/t/proposed-housekeeping-item-upcoming-executive-spell-2025-05-29/26448/5)
- **Proposal**: [Forum Post](https://forum.sky.money/t/proposed-housekeeping-item-upcoming-executive-spell-2025-05-29/26448)

If this executive proposal passes, then a new vesting stream will be initialized for Sky Token Rewards. This stream will be adjusted to match the SSR by changing the rewards distribution rate, and its source of SKY will be switched from minting new tokens to transferring tokens from the PauseProxy. These changes will be achieved by executing the following actions:

- `yank` MCD_VEST_SKY stream ID 2.
- Claim the remaining tokens from the old DssVest by calling `VestedRewardsDistribution.distribute()` on REWARDS_DIST_USDS_SKY
- Set cap on MCD_VEST_SKY_TREASURY to `151,250,000 * WAD / 182 days`.
- Increase `sky.approve(MCD_VEST_SKY_TREASURY, ...)` by 137.5 million SKY to account for new vesting stream.
- Remove old REWARDS_DIST_USDS_SKY from the keeper job by calling `CRON_REWARDS_DIST_JOB.rem()` with the current REWARDS_DIST_USDS_SKY. 
- Update [Chainlog](https://chainlog.sky.money) value for REWARDS_DIST_USDS_SKY to the new VestedRewardsDistribution contract at [0xC8d67Fcf101d3f89D0e1F3a2857485A84072a63F](https://etherscan.io/address/0xC8d67Fcf101d3f89D0e1F3a2857485A84072a63F).
- Add new REWARDS_DIST_USDS_SKY to the keeper job by calling `CRON_REWARDS_DIST_JOB.set()` with the new REWARDS_DIST_USDS_SKY and frequency of 601,200 seconds.
- Deploy new MCD_VEST_SKY_TREASURY stream with the following parameters:
    - usr: REWARDS_DIST_USDS_SKY
    - tot: 137,500,000 SKY
    - bgn:  block.timestamp
    - tau: 182 days
    - cliff: none
    - manager: none.
- Restrict the new stream, res: 1.
- File the id of the newly created stream to the new REWARDS_DIST_USDS_SKY contract.
- Set rewardsDistribution on REWARDS_USDS_SKY to the new REWARDS_DIST_USDS_SKY contract.

### Init Unichain Native Bridge

- **Authorization**: [Governance Poll 1253](https://vote.makerdao.com/polling/QmXjeJtw)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

If this executive proposal passes, then the Unichain Token Bridge for USDS and sUSDS will be initialized by calling [`TokenBridgeInit.initBridges`](https://github.com/makerdao/op-token-bridge/blob/0f935505c0dc74ce3db2a9998320a56119321814/deploy/TokenBridgeInit.sol#L63) using the following parameters.

#### Set l1BridgeInstance 

- Set parameter l1BridgeInstance.govRelay: (L1GovernanceRelay: [0xb383070Cf9F4f01C3a2cfD0ef6da4BC057b429b7](https://etherscan.io/address/0xb383070Cf9F4f01C3a2cfD0ef6da4BC057b429b7))
- Set parameter l1BridgeInstance.escrow: (Escrow: [0x1196F688C585D3E5C895Ef8954FFB0dCDAfc566A](https://etherscan.io/address/0x1196F688C585D3E5C895Ef8954FFB0dCDAfc566A))
- Set parameter l1BridgeInstance.bridge: (ERC1967Proxy: [0xDF0535a4C96c9Cd8921d8FeC92A7680b281681d2](https://etherscan.io/address/0xDF0535a4C96c9Cd8921d8FeC92A7680b281681d2))
- Set parameter l1BridgeInstance.bridgeImp: (L1TokenBridge: [0x8A925ccFd5F7f46332E2D719A916f8b4a643599F](https://etherscan.io/address/0x8A925ccFd5F7f46332E2D719A916f8b4a643599F))

#### Set l2BridgeInstance (Unichain Network)

- Set parameter l2BridgeInstance.govRelay: (L2GovernanceRelay: [0x3510a7F16F549EcD0Ef018DE0B3c2ad7c742990f](https://uniscan.xyz/address/0x3510a7F16F549EcD0Ef018DE0B3c2ad7c742990f))
- Set parameter l2BridgeInstance.bridge: (ERC1967Proxy: [0xa13152006D0216Fe4627a0D3B006087A6a55D752](https://uniscan.xyz/address/0xa13152006D0216Fe4627a0D3B006087A6a55D752))
- Set parameter l2BridgeInstance.bridgeImp: (L2TokenBridge: [0xd78292C12707CF28E8EB7bf06fA774D1044C2dF5](https://uniscan.xyz/address/0xd78292C12707CF28E8EB7bf06fA774D1044C2dF5))
- Set parameter l2BridgeInstance.spell: (L2TokenBridgeSpell: [0x32760698c87834c02ED9AFF2d4FC3e16c029B936](https://uniscan.xyz/address/0x32760698c87834c02ED9AFF2d4FC3e16c029B936))

#### Set cfg 

- Set parameter cfg.l1Messenger: (l1messenger [0x9A3D64E386C18Cb1d6d5179a9596A4B5736e98A6](https://etherscan.io/address/0x9A3D64E386C18Cb1d6d5179a9596A4B5736e98A6))
- Set parameter cfg.l2Messenger: (l2messenger [0x4200000000000000000000000000000000000007](https://uniscan.xyz/address/0x4200000000000000000000000000000000000007))
- Set parameter cfg.l1Tokens: (USDS, SUSDS on mainnet)
- Set parameter cfg.l2Tokens: (USDS: [0x7E10036Acc4B56d4dFCa3b77810356CE52313F9C](https://uniscan.xyz/address/0x7E10036Acc4B56d4dFCa3b77810356CE52313F9C), sUSDS: [0xA06b10Db9F390990364A3984C04FaDf1c13691b5](https://uniscan.xyz/address/0xA06b10Db9F390990364A3984C04FaDf1c13691b5) on Unichain)
- Set parameter cfg.maxWithdraws: (type(uint256).max for each token)
- Set parameter cfg.minGasLimit: (500,000)
- Set parameter cfg.govRelayCLKey: (chainlog key for govRelay -> UNICHAIN_GOV_RELAY)
- Set parameter cfg.escrowCLKey: (chainlog key for Escrow -> UNICHAIN_ESCROW)
- Set parameter cfg.l1BridgeCLKey: (chainlog key for L1TokenBridge -> UNICHAIN_TOKEN_BRIDGE)
- Set parameter cfg.l1BridgeImpCLKey: (chainlog key for L1TokenBridgeImp -> UNICHAIN_TOKEN_BRIDGE_IMP)

### Init Optimism Native Bridge

- **Authorization**: [Governance Poll 1254](https://vote.makerdao.com/polling/QmNe8Erm)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

If this executive proposal passes, then the Optimism Token Bridge for USDS and sUSDS will be initialized by calling [`TokenBridgeInit.initBridges`](https://github.com/makerdao/op-token-bridge/blob/0f935505c0dc74ce3db2a9998320a56119321814/deploy/TokenBridgeInit.sol#L63) using the following parameters.

#### Set l1BridgeInstance 

- Set parameter l1BridgeInstance.govRelay: (L1GovernanceRelay: [0x09B354CDA89203BB7B3131CC728dFa06ab09Ae2F](https://etherscan.io/address/0x09B354CDA89203BB7B3131CC728dFa06ab09Ae2F))
- Set parameter l1BridgeInstance.escrow: (Escrow: [0x467194771dAe2967Aef3ECbEDD3Bf9a310C76C65](https://etherscan.io/address/0x467194771dAe2967Aef3ECbEDD3Bf9a310C76C65))
- Set parameter l1BridgeInstance.bridge: (ERC1967Proxy: [0x3d25B7d486caE1810374d37A48BCf0963c9B8057](https://etherscan.io/address/0x3d25B7d486caE1810374d37A48BCf0963c9B8057))
- Set parameter l1BridgeInstance.bridgeImp: (L1TokenBridge: [0xA50adBad34c1e9786979bD44220F8fd46e43A6B0](https://etherscan.io/address/0xA50adBad34c1e9786979bD44220F8fd46e43A6B0))

#### Set l2BridgeInstance (Optimism Network)

- Set parameter l2BridgeInstance.govRelay: (L2GovernanceRelay: [0x10E6593CDda8c58a1d0f14C5164B376352a55f2F](https://optimistic.etherscan.io/address/0x10E6593CDda8c58a1d0f14C5164B376352a55f2F))
- Set parameter l2BridgeInstance.bridge: (ERC1967Proxy: [0x8F41DBF6b8498561Ce1d73AF16CD9C0d8eE20ba6](https://optimistic.etherscan.io/address/0x8F41DBF6b8498561Ce1d73AF16CD9C0d8eE20ba6))
- Set parameter l2BridgeInstance.bridgeImp: (L2TokenBridge: [0xc2702C859016db756149716cc4d2B7D7A436CF04](https://optimistic.etherscan.io/address/0xc2702C859016db756149716cc4d2B7D7A436CF04))
- Set parameter l2BridgeInstance.spell: (L2TokenBridgeSpell: [0x99892216eD34e8FD924A1dBC758ceE61a9109409](https://optimistic.etherscan.io/address/0x99892216eD34e8FD924A1dBC758ceE61a9109409))

#### Set cfg 

- Set parameter cfg.l1Messenger: (l1messenger: [0x25ace71c97B33Cc4729CF772ae268934F7ab5fA1](https://etherscan.io/address/0x25ace71c97B33Cc4729CF772ae268934F7ab5fA1))
- Set parameter cfg.l2Messenger: (l2messenger: [0x4200000000000000000000000000000000000007](https://optimistic.etherscan.io/address/0x4200000000000000000000000000000000000007))
- Set parameter cfg.l1Tokens: (USDS, SUSDS on mainnet)
- Set parameter cfg.l2Tokens: (USDS: [0x4F13a96EC5C4Cf34e442b46Bbd98a0791F20edC3](https://optimistic.etherscan.io/address/0x4F13a96EC5C4Cf34e442b46Bbd98a0791F20edC3), sUSDS: [0xb5B2dc7fd34C249F4be7fB1fCea07950784229e0](https://optimistic.etherscan.io/address/0xb5B2dc7fd34C249F4be7fB1fCea07950784229e0) on Optimism)
- Set parameter cfg.maxWithdraws: (type(uint256).max for each token)
- Set parameter cfg.minGasLimit: (500,000)
- Set parameter cfg.govRelayCLKey: (chainlog key for govRelay -> OPTIMISM_GOV_RELAY)
- Set parameter cfg.escrowCLKey: (chainlog key for Escrow -> OPTIMISM_ESCROW)
- Set parameter cfg.l1BridgeCLKey: (chainlog key for L1TokenBridge -> OPTIMISM_TOKEN_BRIDGE)
- Set parameter cfg.l1BridgeImpCLKey: (chainlog key for L1TokenBridgeImp -> OPTIMISM_TOKEN_BRIDGE_IMP)

### Deactivate SparkLend DDM

- **Authorization**: [Ecosystem Approval](https://forum.sky.money/t/proposed-housekeeping-item-upcoming-executive-spell-2025-05-29/26448/5)
- **Proposal**: [Forum Post](https://forum.sky.money/t/proposed-housekeeping-item-upcoming-executive-spell-2025-05-29/26448)

If this executive proposal passes, then The SparkLend Direct Deposit Module (DDM) Debt Ceiling will be deactivated. This is achieved through the following parameter changes:

- Remove DIRECT-SPARK-DAI from the [Debt Ceiling Instant Access Module (DC-IAM)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4_Debt_Ceiling_Instant_Access_Module_(DC_IAM)/071d42e3-8a21-4401-852e-0b52c49768bb%7C57eaf45219bea3b430c2).
- Set the [Maximum Debt Ceiling (`line`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.1_Maximum_Debt_Ceiling_(line)/6f1a913d-9436-4b70-816b-e317672737d6%7C57eaf45219bea3b430c268bb) to **0 USDS**.
- Reduce the Global Debt Ceiling to account for this change.

### Transfer Ownership of SPK Token to SPK Company Multisig

- **Authorization**: [Ecosystem Approval](https://forum.sky.money/t/proposed-housekeeping-item-upcoming-executive-spell-2025-05-29/26448/5)
- **Proposal**: [Forum Post](https://forum.sky.money/t/proposed-housekeeping-item-upcoming-executive-spell-2025-05-29/26448/3)

If this executive proposal passes, then ownership of SPK Token will be transferred to the SPK Company Multisig. This is achieved through the following actions:

- Rely [0x6FE588FDCC6A34207485cc6e47673F59cCEDF92B](https://etherscan.io/address/0x6FE588FDCC6A34207485cc6e47673F59cCEDF92B) on [0xc20059e0317DE91738d13af027DfC4a50781b066](https://etherscan.io/address/0xc20059e0317DE91738d13af027DfC4a50781b066).
- Deny MCD_PAUSE_PROXY on [0xc20059e0317DE91738d13af027DfC4a50781b066](https://etherscan.io/address/0xc20059e0317DE91738d13af027DfC4a50781b066).

### Increase ALLOCATOR-SPARK-A Maximum Debt Ceiling

- **Authorization**: [Governance Poll 1251](https://vote.makerdao.com/polling/QmVMBXm8)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

If this executive proposal passes, then the ALLOCATOR-SPARK-A [Maximum Debt Ceiling (`line`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.1_Maximum_Debt_Ceiling_(line)/6f1a913d-9436-4b70-816b-e317672737d6%7C57eaf45219bea3b430c268bb) will be increased by 5 billion USDS from 5 billion USDS to **10 billion USDS**. The [Target Available Debt (`gap`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.2_Target_Available_Debt_(gap)/c1e17312-3744-4360-81f4-03564f0dd09d|57eaf45219bea3b430c268bb) and [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.powerhouse.io/A.3.8.1.1.2.4.3_Ceiling_Increase_Cooldown_(ttl)/58f5315f-938f-464c-b2d2-f611145d469a|57eaf45219bea3b430c268bb) parameters for ALLOCATOR-SPARK-A will remain unchanged, at 500 million USDS and 86,400 seconds respectively. 

### Launch Project Funding

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.5.6_Launch_Project/1f433d9d-7cdb-406f-b7e8-f9bc4855eb77%7C8d5a)
- **Proposal**: [Forum Post](https://forum.sky.money/t/utilization-of-the-launch-project-under-the-accessibility-scope/21468/43)

If this executive proposal passes, then **5 million USDS** will be distributed to the Launch Project at [0x3C5142F28567E6a0F172fd0BaaF1f2847f49D02F](https://etherscan.io/address/0x3C5142F28567E6a0F172fd0BaaF1f2847f49D02F).

### Delegate Compensation for April 2025

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/Budget_And_Participation_Requirements/4c698938-1a11-4486-a568-e54fc6b0ce0c|0db3af4e)
- **Proposal**: [Forum Post](https://forum.sky.money/t/april-2025-aligned-delegate-compensation/26441)

If this executive proposal passes, then a total of **26,267 USDS** will be distributed as Aligned Delegate compensation for April 2025 as follows:

| Delegate    | Amount (USDS) | Address                                                                                                               |
|-------------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Byteron     | 4,000         | [0xc2982e72D060cab2387Dba96b846acb8c96EfF66](https://etherscan.io/address/0xc2982e72D060cab2387Dba96b846acb8c96EfF66) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| JuliaChang  | 4,000         | [0x252abAEe2F4f4b8D39E5F12b163eDFb7fac7AED7](https://etherscan.io/address/0x252abAEe2F4f4b8D39E5F12b163eDFb7fac7AED7) |
| PBG         | 3,867         | [0x8D4df847dB7FfE0B46AF084fE031F7691C6478c2](https://etherscan.io/address/0x8D4df847dB7FfE0B46AF084fE031F7691C6478c2) |
| WBC         | 2,400         | [0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47](https://etherscan.io/address/0xeBcE83e491947aDB1396Ee7E55d3c81414fB0D47) |

### Atlas Core Development Payments for May 2025

- **Authorization**: [Atlas](https://sky-atlas.powerhouse.io/A.2.2.1.1_Funding/8ea8dcb0-7261-4c1a-ae53-b7f3eb5362e5|9e1f3b569af1), [Ecosystem Approval](https://forum.sky.money/t/atlas-core-development-payment-requests-may-2025/26344/6)  
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-core-development-payment-requests-may-2025/26344)

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

### Execute Spark Proxy Spell

- **Authorization**: [Ecosystem Approval](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372/3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

If this executive proposal passes, then a Spark Proxy Spell will be executed at [0x3968a022D955Bbb7927cc011A48601B65a33F346](https://etherscan.io/address/0x3968a022D955Bbb7927cc011A48601B65a33F346) with the following contents.

#### Onboard Unichain to the Spark Liquidity Layer

- **Authorization**: [Governance Poll 1253](https://vote.makerdao.com/polling/QmXjeJtw)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

Onboard Unichain to the Spark Liquidity Layer with the following addresses and parameters.

##### Addresses

- L1_TOKEN_BRIDGE: [0xDF0535a4C96c9Cd8921d8FeC92A7680b281681d2](https://etherscan.io/address/0xDF0535a4C96c9Cd8921d8FeC92A7680b281681d2)
- L2_TOKEN_BRIDGE: [0xa13152006D0216Fe4627a0D3B006087A6a55D752](https://uniscan.xyz/address/0xa13152006D0216Fe4627a0D3B006087A6a55D752)
- L2_USDS: [0x7E10036Acc4B56d4dFCa3b77810356CE52313F9C](https://uniscan.xyz/address/0x7E10036Acc4B56d4dFCa3b77810356CE52313F9C)
- L2_SUSDS: [0xA06b10Db9F390990364A3984C04FaDf1c13691b5](https://uniscan.xyz/address/0xA06b10Db9F390990364A3984C04FaDf1c13691b5)

- L1_SSR_FORWARDER: [0x45d91340B3B7B96985A72b5c678F7D9e8D664b62](https://etherscan.io/address/0x45d91340B3B7B96985A72b5c678F7D9e8D664b62)
- L2_SSR_RECEIVER: [0x4A71f81C6109230932978bAB7CA746f0be0C4580](https://uniscan.xyz/address/0x4A71f81C6109230932978bAB7CA746f0be0C4580)
- L2_SSR_AUTH_ORACLE: [0x1566BFA55D95686a823751298533D42651183988](https://uniscan.xyz/address/0x1566BFA55D95686a823751298533D42651183988)

- L2_GOV_RECEIVER: [0x7B8ee8b0fD62662F7FB1ac9e5E6cEAad5195A3bF](https://uniscan.xyz/address/0x7B8ee8b0fD62662F7FB1ac9e5E6cEAad5195A3bF)
- L2_GOV_EXECUTOR: [0xb037C43b433964A2017cd689f535BEb6B0531473](https://uniscan.xyz/address/0xb037C43b433964A2017cd689f535BEb6B0531473)

- L2_PSM: [0x7b42Ed932f26509465F7cE3FAF76FfCe1275312f](https://uniscan.xyz/address/0x7b42Ed932f26509465F7cE3FAF76FfCe1275312f)

- L2_ALM_PROXY: [0x345E368fcCd62266B3f5F37C9a131FD1c39f5869](https://uniscan.xyz/address/0x345E368fcCd62266B3f5F37C9a131FD1c39f5869)
- L2_ALM_CONTROLLER: [0x9B1BEB11CFE05117029a30eb799B6586125321FF](https://uniscan.xyz/address/0x9B1BEB11CFE05117029a30eb799B6586125321FF)
- L2_ALM_RATE_LIMITS: [0x5A1a44D2192Dd1e21efB9caA50E32D0716b35535](https://uniscan.xyz/address/0x5A1a44D2192Dd1e21efB9caA50E32D0716b35535)

##### Initial [Rate Limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits)

###### PSM3

- USDC deposit: **50 million** max, **50 million** slope per day.
- USDC withdrawal: **50 million** max, **50 million** slope per day.
- USDS deposit: **Unlimited**.
- USDS withdrawal: **Unlimited**.
- sUSDS deposit: **Unlimited**.
- sUSDS withdrawal: **Unlimited**.

###### CCTP

- Global: **Unlimited**.
- Unichain to Mainnet: **50 million** max, **25 million** slope per day.
- Mainnet to Unichain: **50 million** max, **25 million** slope per day.

###### Initial Liquidity Bridged to Unichain

- USDS: **100 million USDS**.
- sUSDS: **100 million USDS worth of sUSDS**.

#### Onboard OP Mainnet to the Spark Liquidity Layer

- **Authorization**: [Governance Poll 1254](https://vote.makerdao.com/polling/QmNe8Erm)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

Onboard Optimism Mainnet to the Spark Liquidity Layer with the following addresses and parameters.

##### Addresses

- L1_TOKEN_BRIDGE: [0x3d25B7d486caE1810374d37A48BCf0963c9B8057](https://etherscan.io/address/0x3d25B7d486caE1810374d37A48BCf0963c9B8057)
- L2_TOKEN_BRIDGE: [0x8F41DBF6b8498561Ce1d73AF16CD9C0d8eE20ba6](https://optimistic.etherscan.io/address/0x8F41DBF6b8498561Ce1d73AF16CD9C0d8eE20ba6)
- L2_USDS: [0x4F13a96EC5C4Cf34e442b46Bbd98a0791F20edC3](https://optimistic.etherscan.io/address/0x4F13a96EC5C4Cf34e442b46Bbd98a0791F20edC3)
- L2_SUSDS: [0xb5B2dc7fd34C249F4be7fB1fCea07950784229e0](https://optimistic.etherscan.io/address/0xb5B2dc7fd34C249F4be7fB1fCea07950784229e0)

- L1_SSR_FORWARDER: [0x6Ac25B8638767a3c27a65597A74792d599038724](https://etherscan.io/address/0x6Ac25B8638767a3c27a65597A74792d599038724)
- L2_SSR_RECEIVER: [0xE2868095814c2714039b3A9eBEE035B9E2c411E5](https://optimistic.etherscan.io/address/0xE2868095814c2714039b3A9eBEE035B9E2c411E5)
- L2_SSR_AUTH_ORACLE: [0x6E53585449142A5E6D5fC918AE6BEa341dC81C68](https://optimistic.etherscan.io/address/0x6E53585449142A5E6D5fC918AE6BEa341dC81C68)

- L2_GOV_RECEIVER: [0x61Baf0Ce69D23C8318c786e161D1cAc285AA4EA3](https://optimistic.etherscan.io/address/0x61Baf0Ce69D23C8318c786e161D1cAc285AA4EA3)
- L2_GOV_EXECUTOR: [0x205216D89a00FeB2a73273ceecD297BAf89d576d](https://optimistic.etherscan.io/address/0x205216D89a00FeB2a73273ceecD297BAf89d576d)

- L2_PSM: [0xe0F9978b907853F354d79188A3dEfbD41978af62](https://optimistic.etherscan.io/address/0xe0F9978b907853F354d79188A3dEfbD41978af62)

- L2_ALM_PROXY: [0x876664f0c9Ff24D1aa355Ce9f1680AE1A5bf36fB](https://optimistic.etherscan.io/address/0x876664f0c9Ff24D1aa355Ce9f1680AE1A5bf36fB)
- L2_ALM_CONTROLLER: [0x1d54A093b8FDdFcc6fBB411d9Af31D96e034B3D5](https://optimistic.etherscan.io/address/0x1d54A093b8FDdFcc6fBB411d9Af31D96e034B3D5)
- L2_ALM_RATE_LIMITS: [0x6B34A6B84444dC3Fc692821D5d077a1e4927342d](https://optimistic.etherscan.io/address/0x6B34A6B84444dC3Fc692821D5d077a1e4927342d)

##### Initial [Rate Limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits)

###### PSM3

- USDC deposit: **50 million** max, **50 million** slope per day.
- USDC withdrawal: **50 million** max, **50 million** slope per day.
- USDS deposit: **Unlimited**.
- USDS withdrawal: **Unlimited**.
- sUSDS deposit: **Unlimited**.
- sUSDS withdrawal: **Unlimited**.

###### CCTP

- Global: **Unlimited**.
- OP Mainnet to Mainnet: **50 million** max, **25 million** slope per day.
- Mainnet to OP Mainnet: **50 million** max, **25 million** slope per day.

###### Initial Liquidity Bridged to OP Mainnet

- USDS: **100 million USDS**.
- sUSDS: **100 million USDS worth of sUSDS**.

#### Adjust USDS Interest Rate Model

- **Authorization**: [Governance Poll 1248](https://vote.makerdao.com/polling/QmUnygNr)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

Update USDS [Interest Rate Model](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.3_Interest_Rate_Model_Definition/1c1f2ff0-8d73-81dd-99c0-fc707ce48e01%7C7896ed3326389fe3553030cd0a82f68efd49) on Mainnet as follows:

- [Base Rate](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.13_Base_Rate_Definition/1c1f2ff0-8d73-81c1-9b9b-ef4b84c1450f%7C7896ed3326389fe3553030cd0a82f68efd49): **0%**
- [Slope 1](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.15_Slope_1_Definition/1c1f2ff0-8d73-81be-9f17-d7d4bfc6cb59%7C7896ed3326389fe3553030cd0a82f68efd49): **SSR + 0.75%**
- [Slope 2](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.17_Slope_2_Definition/1c1f2ff0-8d73-8199-aa99-dde95c3f7130%7C7896ed3326389fe3553030cd0a82f68efd49): **15% (Unchanged)**
- [Optimal Utilization Ratio](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.11_Optimal_Utilization_Definition/1c1f2ff0-8d73-8173-a52b-d6f86efd3366%7C7896ed3326389fe3553030cd0a82f68efd49): **80% (Unchanged)**

#### Adjust DAI Interest Rate Model

- **Authorization**: [Governance Poll 1247](https://vote.makerdao.com/polling/QmVt1spi)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

Update DAI [Interest Rate Model](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.3_Interest_Rate_Model_Definition/1c1f2ff0-8d73-81dd-99c0-fc707ce48e01%7C7896ed3326389fe3553030cd0a82f68efd49) on Mainnet as follows:

- [Base Rate](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.13_Base_Rate_Definition/1c1f2ff0-8d73-81c1-9b9b-ef4b84c1450f%7C7896ed3326389fe3553030cd0a82f68efd49): **0%**
- [Slope 1](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.15_Slope_1_Definition/1c1f2ff0-8d73-81be-9f17-d7d4bfc6cb59%7C7896ed3326389fe3553030cd0a82f68efd49): **SSR + 0.75%**
- [Slope 2](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.17_Slope_2_Definition/1c1f2ff0-8d73-8199-aa99-dde95c3f7130%7C7896ed3326389fe3553030cd0a82f68efd49): **15% (Unchanged)**
- [Optimal Utilization Ratio](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.11_Optimal_Utilization_Definition/1c1f2ff0-8d73-8173-a52b-d6f86efd3366%7C7896ed3326389fe3553030cd0a82f68efd49): **80% (Unchanged)**

#### Reduce WBTC Liquidation Threshold

- **Authorization**: [Governance Poll 1249](https://vote.makerdao.com/polling/QmX16hA3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

Reduce the WBTC [Liquidation Threshold](https://sky-atlas.powerhouse.io/A.AG1.3.2.2.1.1.5_Liquidation_Threshold_Definition/1c1f2ff0-8d73-81ea-bd7e-feb73a44923a|7896ed3326389fe3553030cd0a82f68efd49) by 5 percentage points from 45% to **40%**.

#### [Base] Spark USDC Morpho Vault - Increase cbBTC Pool Supply Cap

- **Authorization**: [Governance Poll 1252](https://vote.makerdao.com/polling/QmfPc8Ub)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

Increase cbBTC/USDC market [(0x9103c3b4e834476c9a62ea009ba2c884ee42e94e6e314a26f04d312434191836)](https://app.morpho.org/base/market/0x9103c3b4e834476c9a62ea009ba2c884ee42e94e6e314a26f04d312434191836/cbbtc-usdc) Supply Cap in the Spark USDC Morpho Vault on Base by 500 million USDC from 500 million USDC to **1 billion USDC**.

#### Increase USDS Mint and USDC Swap Rate Limits

- **Authorization**: [Governance Poll 1250](https://vote.makerdao.com/polling/QmUYRV1H)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell/26372)

Increase the Mint and Swap [Rate Limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits) for USDS and USDC as follows.

##### USDS Mint Rate Limits

- Increase max by 300 million USDS from 200 million USDS to **500 million USDS**.
- Increase slope by 300 million USDS per day from 200 million USDS per day to **500 million USDS per day**.

##### USDC Swap Rate Limits

- Increase max by 300 million USDC from 200 million USDC to **500 million USDC**.
- Increase slope by 100 million USDC from 200 million USDC to **300 million USDC per day**.

#### Onboard August PT-USDS to Morpho Spark DAI Vault

- **Authorization**: [Governance Poll 1505](https://vote.sky.money/polling/QmRtLuL2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell-2/26440)

Onboard `PT-USDS-14Aug2025` to the Morpho DAI vault with the following parameters:

- Pool LLTV: **96.5%**
- Oracle base value (value at maturity): **1 USDS per PT token**
- Oracle discount rate: **15%**
- Pool supply cap: **500 million DAI**


#### Increase USDe Mint and Staking Rate Limits

- **Authorization**: [Governance Poll 1506](https://vote.sky.money/polling/QmcN7anL)
- **Proposal**: [Forum Post](https://forum.sky.money/t/may-29-2025-proposed-changes-to-spark-for-upcoming-spell-2/26440)

Increase USDe mint and staking rate limits on the [Spark Liquidity Layer](https://docs.spark.fi/user-guides/spark-liquidity-layer/) on Mainnet as follows:

- Minting USDe
  - Max amount: **250 million**
  - Slope: **100 million**
- Burning USDe
  - Max amount: **500 million**
  - Slope: **200 million**
- Depositing to sUSDe
  - Max amount: **250 million**
  - Slope: **100 million**
- Initiating withdrawal cooldown from sUSDe
  - Max amount: **unlimited**
- Withdrawing from sUSDe after cooldown
  - Max amount: **unlimited**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

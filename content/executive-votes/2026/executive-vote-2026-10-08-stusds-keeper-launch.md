---
title: Template - [Executive Vote] stUSDS Keeper Launch, Monthly Settlement Cycle for September 2026, Treasury Management Function Parameter Updates, Adjust ALLOCATOR-GROVE-A DC-IAM Parameters, Update Safe Harbor Agreement, Prime Agent Proxy Spells - October 8, 2026
summary: Launch the stUSDS Keeper, execute the Monthly Settlement Cycle for September 2026 and the associated reconciliation transfers, burn SKY from the Pause Proxy balance, update LSSKY->SKY staking rewards and lengthen the buyback and LSSKY->USDS reward cycles, adjust the ALLOCATOR-GROVE-A DC-IAM parameters, update the Safe Harbor Agreement, and whitelist Prime Agent proxy spells for Spark, Grove, and Osero.
date: 2026-10-08T00:00:00.000Z
address: "0x4bdD1Cc8540E4c43ee210a6ff0EE96ad0Bba297A"
---

# [Executive Proposal] stUSDS Keeper Launch, Monthly Settlement Cycle for September 2026, Treasury Management Function Parameter Updates, Adjust ALLOCATOR-GROVE-A DC-IAM Parameters, Update Safe Harbor Agreement, Prime Agent Proxy Spells - October 8, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The stUSDS Keeper will be launched and stUSDS rate-setter parameters will be updated.
- The Monthly Settlement Cycle for September 2026 will be executed.
- The Treasury Management Function will be executed, including burning SKY from the Pause Proxy, updating LSSKY->SKY staking rewards, and lengthening the buyback and LSSKY->USDS reward cycles.
- Debt Ceiling Instant Access Module (DC-IAM) parameters for `ALLOCATOR-GROVE-A` will be updated.
- The Safe Harbor Agreement will be updated.
- Proxy spells for Spark, Grove, and Osero will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### stUSDS Keeper Launch

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#bddf50ca-02ef-4991-abb0-53e09831ee6f)
- **Proposal**: [stUSDS Keeper Launch](https://forum.skyeco.com/t/stusds-keeper-launch/28282)

If this executive proposal passes, then the stUSDS Keeper will be launched through the following actions:

- Grant authorization (`kiss`) to [`0x068F9c8F33E13c18B852877A5D8Ec61504971376`](https://etherscan.io/address/0x068F9c8F33E13c18B852877A5D8Ec61504971376) on `STUSDS_RATE_SETTER`.
- Add [`0xcDb55A799A9B9eAe22Ed0E13037bb6D2E3f1d080`](https://etherscan.io/address/0xcDb55A799A9B9eAe22Ed0E13037bb6D2E3f1d080) to the Chainlog as `STUSDS_VALUE_REGISTRY`.
- Decrease [`stepStrBps` (`StUsdsRateSetter.strCfg.step`)](https://sky-atlas.io/#91152a4b-6f97-4b8a-831a-0f85c16a78ab) by 1,000 basis points, from 1,500 basis points to **500 basis points**.
- Decrease [`stepDutyBps` (`StUsdsRateSetter.dutyCfg.step`)](https://sky-atlas.io/#91152a4b-6f97-4b8a-831a-0f85c16a78ab) by 1,000 basis points, from 1,500 basis points to **500 basis points**.

The rate-setter parameter changes are described in the [stUSDS BEAM Rate Setter Configuration](https://forum.skyeco.com/t/stusds-beam-rate-setter-configuration/27161/99) thread.

### Monthly Settlement Cycle for September 2026

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6f8d5065-d6ff-4add-9a28-eadeffa7ed1a)
- **Proposal**: [MSC 13 Settlement Summary - September 2026](https://forum.skyeco.com/t/msc-13-settlement-summary-september-2026/28274)

If this executive proposal passes, then the Monthly Settlement Cycle for September 2026 will be executed through the following actions:

#### Spark

- Mint **11,627,438 USDS** debt in `ALLOCATOR-SPARK-A` and transfer the amount to the Surplus Buffer.
- Send **4,218,121 USDS** from the Surplus Buffer to [`SPARK_SUBPROXY`](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **6,806,996 USDS** debt in `ALLOCATOR-BLOOM-A` and transfer the amount to the Surplus Buffer.
- Send **1,148,408 USDS** from the Surplus Buffer to [`GROVE_SUBPROXY`](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Keel

- Send **31,472 USDS** from the Surplus Buffer to [`KEEL_SUBPROXY`](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **1,643,358 USDS** debt in `ALLOCATOR-OBEX-A` and transfer the amount to the Surplus Buffer.
- Send **480,680 USDS** from the Surplus Buffer to [`OBEX_SUBPROXY`](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **320,926 USDS** from the Surplus Buffer to [`SKYBASE_SUBPROXY`](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Osero

- Mint **76,824 USDS** debt in `ALLOCATOR-PRYSM-A` and transfer the amount to the Surplus Buffer.
- Send **27,661 USDS** from the Surplus Buffer to [`OSERO_SUBPROXY`](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3).

#### Treasury Management Function

- Send **2,927,190 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).

This amount represents **1,463,595 USDS** allocated to the Core Council and **1,463,595 USDS** allocated to the Fortification Foundation, combined into a single transfer.

### Treasury Management Function

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#f67a5780-11d5-4014-8254-795080c77133)
- **Proposal**: [Treasury Management Function (TMF) Configurations](https://forum.skyeco.com/t/treasury-management-function-tmf-configurations/28153/8)

If this executive proposal passes, then Treasury Management Function configurations will be updated through the following actions:

- Burn **7,372,288 SKY** from the [Pause Proxy](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB) balance.
- Update the LSSKY->SKY farm vest by calling [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with the following parameters:
  - `dist`: [`0x675671A8756dDb69F7254AFB030865388Ef699Ee`](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - `vestTot`: **99,525,882 SKY**
  - `vestBgn`: `block.timestamp`
  - `vestTau`: **90 days**
- Increase `splitter.hop` by 189 seconds from 2,504 seconds to **2,693 seconds**.
- Increase `rewardsDuration` in [`REWARDS_LSSKY_USDS`](https://etherscan.io/address/0x38E4254bD82ED5Ee97CD1C4278FAae748d998865) by 189 seconds from 2,504 seconds to **2,693 seconds**.

### Adjust ALLOCATOR-GROVE-A DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [October 8, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255/7), [Core Council Risk Advisor Recommendation](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255/8)

If this executive proposal passes, then the following DC-IAM parameters will be updated for Grove's DPAU-linked vault (`ALLOCATOR-GROVE-A`):

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 1 billion USDS, from 500 million USDS to **1.5 billion USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 125 million USDS, from 25 million USDS to **150 million USDS**.
- Increase the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) by 43,200 seconds, from 43,200 seconds (12 hours) to **86,400 seconds** (24 hours), as approved by the Core Council Risk Advisor.

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3 - Safe Harbor Modifications](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, then the Safe Harbor Agreement will be updated to include the following accounts:

#### Ethereum

- `stUSDS Value Registry`: [`0xcDb55A799A9B9eAe22Ed0E13037bb6D2E3f1d080`](https://etherscan.io/address/0xcDb55A799A9B9eAe22Ed0E13037bb6D2E3f1d080)

#### Arbitrum

- `PAS BeamState`: [`0x11CFefeA67B18de9046a6250555D438854fFEEDa`](https://arbiscan.io/address/0x11CFefeA67B18de9046a6250555D438854fFEEDa)
- `PAS Configurator`: [`0xd11Dc57F3eF23bb7b3142588a461F68460a7C474`](https://arbiscan.io/address/0xd11Dc57F3eF23bb7b3142588a461F68460a7C474)
- `PAS Timelock`: [`0x66d3653e66F7edb973549CFA3b46F22298B8f983`](https://arbiscan.io/address/0x66d3653e66F7edb973549CFA3b46F22298B8f983)
- `CCTP V2 Facet`: [`0xeCCA0D296Cb133081d41E9772B60D57F5fd2798E`](https://arbiscan.io/address/0xeCCA0D296Cb133081d41E9772B60D57F5fd2798E)
- `Spark Beacon`: [`0x86036CE5d2f792367C0AA43164e688d13c5A60A8`](https://arbiscan.io/address/0x86036CE5d2f792367C0AA43164e688d13c5A60A8)
- `PAU Factory`: [`0x3968a022D955Bbb7927cc011A48601B65a33F346`](https://arbiscan.io/address/0x3968a022D955Bbb7927cc011A48601B65a33F346)
- `Administered Agent Factory`: [`0xCBA0C0a2a0B6Bb11233ec4EA85C5bFfea33e724d`](https://arbiscan.io/address/0xCBA0C0a2a0B6Bb11233ec4EA85C5bFfea33e724d)

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0x796eE21eb57C8BE71be7F75770f534D249bC555b`](https://etherscan.io/address/0x796eE21eb57C8BE71be7F75770f534D249bC555b) and codehash `0x06af8f55b18ae1bb19a13b9cd3531a164a53da94db01586499d9d2a22009cddb` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0x262E8baA6bFbECDD8d483d13C37c1BA7b4a861A5`](https://etherscan.io/address/0x262E8baA6bFbECDD8d483d13C37c1BA7b4a861A5) and codehash `0xb67edac3b73c41231aaa73bb69dcf7731ac1830d6af66b80be930513dc7de0b4` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then an Osero proxy spell with address [`0x0ABdd6cbb1802Ce980FE4b628a682c70727978D2`](https://etherscan.io/address/0x0ABdd6cbb1802Ce980FE4b628a682c70727978D2) and codehash `0xf80be0f506aab4e137a867a1c289f34254e845ecadbb92b33104660c6349a7fd` will be whitelisted in the [Osero StarGuard](https://etherscan.io/address/0xBfA2D1dA838E55A74c61699e164cDFF8cF0cF0e2).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/204).

##### [Arbitrum] Spark Liquidity Layer - Diamond PAU Parallel Controller with CCTP V2

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xff837d7434b33bc2d74a133e5c2acbcdf2ff17e6b76005621cfd43794f0d85cb)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-spark-for-upcoming-spell/28265)

If this executive proposal passes, then the Spark proxy spell will configure the Arbitrum Diamond PAU parallel controller for CCTP V2, including the following changes:

- Grant the controller role to the [PAU Controller](https://arbiscan.io/address/0x04ACB9e9bbd64A425677edC535D6B30cfD74E42f) on the [Arbitrum ALM Proxy](https://arbiscan.io/address/0x92afd6F2385a90e44da3a8B60fe36f6cBe1D8709).
- Reconfigure the [PAU Administered Agent](https://arbiscan.io/address/0x0745aae633E8318a063D383791bCc0d8C82F46C6) by replacing the existing grantor with the [Soter Labs Grantor Multisig](https://arbiscan.io/address/0x97EC6398e5dD047BA3223cFC017bFC6436Ac3Fe7), adding the [Soter Labs Freezer Multisig](https://arbiscan.io/address/0x747BF29B189e2a070a921Af7Cf65681E3d5F5967) as a revoker, and adding the [Spark hot wallet](https://arbiscan.io/address/0x062cE42caE04c51D04E77e3D64cc8953a2296FfE) as an actor. The existing ALM Relayer Multisig actor and ALM Freezer Multisig revoker will remain unchanged.
- Set the aggregate CCTP rate limit to **Unlimited**.
- Configure the Arbitrum-to-Ethereum CCTP route with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):
  - `maxAmount`: **5 million USDC**
  - `slope`: **50 million USDC per day**
  - Recipient: [Spark Ethereum ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E)
  - Minimum fee cap rate: **0 basis points**
  - Maximum fee cap rate: **0 basis points**

##### [Arbitrum] Spark Liquidity Layer - Return Excess USDS to Ethereum

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x93fd7352008805e27da235e51c02e7c987ff5d0ee3feccd3cd157e09a2e9adfe)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-spark-for-upcoming-spell/28265)

If this executive proposal passes, then the Spark proxy spell will bridge the full USDS balance held by the Arbitrum ALM Proxy at execution to the [Spark Ethereum ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).

##### [Arbitrum] Spark Liquidity Layer - Authorize the PAS Configurator on the Diamond PAU

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x4680fb4b5717156b6e53f858ab6a267190deab0d51380b5fb9d27910e09d4e74)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-spark-for-upcoming-spell/28265)

If this executive proposal passes, then the Spark proxy spell will grant the `DEFAULT_ADMIN_ROLE` to the [PAS Configurator](https://arbiscan.io/address/0xd11Dc57F3eF23bb7b3142588a461F68460a7C474) on the Arbitrum PAU Access Controls and Rate Limits contracts.

##### [Arbitrum] Spark Liquidity Layer - Transfer Beacon Admin to the Sky Governance Relay

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x84f74256a6f0e41078483b5c7ce8dad4b885f5bc656a5bcaccb84f36d74e536c)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-spark-for-upcoming-spell/28265)

If this executive proposal passes, then the Spark proxy spell will transfer administration of the [Spark Beacon](https://arbiscan.io/address/0x86036CE5d2f792367C0AA43164e688d13c5A60A8) from the Spark Executor to the [Sky Governance Relay](https://arbiscan.io/address/0x10E6593CDda8c58a1d0f14C5164B376352a55f2F).

##### [X Layer] Spark Savings - Add spUSDC to the Savings Vault Intents Contract

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xeaab1672f63e49d6075eefbede7cab3fac3db3bba3c2f486eee7bb492d82ff3e)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-spark-for-upcoming-spell/28265)

If this executive proposal passes, then the Spark proxy spell will add the [spUSDC vault](https://www.oklink.com/xlayer/address/0xf90E63079D97a0A1f479b2b168457F420CAFf6ba) to the X Layer Savings Vault Intents system with the following configuration:

- Grant the `RELAYER` role to the [spUSDC PAU Administered Agent](https://www.oklink.com/x-layer/evm/address/0x79b4055Eda153f739B5EA63C9B647c1a095059f5).
- Whitelist spUSDC for intents.
- Minimum intent amount: **1 million USDC**.
- Maximum intent amount: **500 million USDC**.

##### [Ethereum] SparkLend - Claim Accrued SparkLend Reserves

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-spark-for-upcoming-spell/28265)

If this executive proposal passes, then the Spark proxy spell will claim all accrued SparkLend reserves and transfer them as follows:

- DAI, USDS, USDC, PYUSD, USDT, USDG, and RLUSD reserves will be transferred to the [Spark ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).
- All other reserves will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/82).

##### [Ethereum] Migrate Grove × Steakhouse Vaults to the Atlas Morpho Vault Curation Framework

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x515fa8cf35a8ee5bd39a8a5b55dfad3f1e8f0ecb1e4678f8de83bfe892f28dc3)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will approve the queued Safe transaction that brings the Grove × Steakhouse USDC, AUSD, and RLUSD Morpho Vault V2s into the role configuration required by the Atlas Morpho Vault Curation Framework.

##### [Ethereum] Set the Morpho Grove × Steakhouse High Yield Vault USDC Deposit Rate Limit to 0

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xf97cae9eb7937f48c92b268b3f28886f9dcc5fd05e3d39fb1b67ccf2ec16ca4d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will set the [`maxAmount`](https://sky-atlas.io/#8b5f1ffd-9dfd-4aa0-8fc2-638a79d9fadb) and [`slope`](https://sky-atlas.io/#ae8674bc-44ac-4b95-b5df-c6322a1d6e9a) parameters for [`0xBEEf2B5FD3D94469b7782aeBe6364E6e6FB1B709`](https://etherscan.io/address/0xBEEf2B5FD3D94469b7782aeBe6364E6e6FB1B709) to **0**, while leaving withdrawals unchanged.

##### [Ethereum] Set the Steakhouse PYUSD Morpho Vault Deposit Rate Limit to 0

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xf97cae9eb7937f48c92b268b3f28886f9dcc5fd05e3d39fb1b67ccf2ec16ca4d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will set the [`maxAmount`](https://sky-atlas.io/#8b5f1ffd-9dfd-4aa0-8fc2-638a79d9fadb) and [`slope`](https://sky-atlas.io/#ae8674bc-44ac-4b95-b5df-c6322a1d6e9a) parameters for [`0xd8A6511979D9C5D387c819E9F8ED9F3a5C6c5379`](https://etherscan.io/address/0xd8A6511979D9C5D387c819E9F8ED9F3a5C6c5379) to **0**, while leaving withdrawals unchanged.

##### [Ethereum] Set the Sentora PYUSD Morpho Vault V2 Deposit Rate Limit to 0

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xf97cae9eb7937f48c92b268b3f28886f9dcc5fd05e3d39fb1b67ccf2ec16ca4d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will set the [`maxAmount`](https://sky-atlas.io/#8b5f1ffd-9dfd-4aa0-8fc2-638a79d9fadb) and [`slope`](https://sky-atlas.io/#ae8674bc-44ac-4b95-b5df-c6322a1d6e9a) parameters for [`0xb576765fB15505433aF24FEe2c0325895C559FB2`](https://etherscan.io/address/0xb576765fB15505433aF24FEe2c0325895C559FB2) to **0**, while leaving withdrawals unchanged.

##### [Ethereum] Set the Sentora RLUSD Morpho Vault V2 Deposit Rate Limit to 0

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xf97cae9eb7937f48c92b268b3f28886f9dcc5fd05e3d39fb1b67ccf2ec16ca4d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will set the [`maxAmount`](https://sky-atlas.io/#8b5f1ffd-9dfd-4aa0-8fc2-638a79d9fadb) and [`slope`](https://sky-atlas.io/#ae8674bc-44ac-4b95-b5df-c6322a1d6e9a) parameters for [`0x6dC58a0FdfC8D694e571DC59B9A52EEEa780E6bf`](https://etherscan.io/address/0x6dC58a0FdfC8D694e571DC59B9A52EEEa780E6bf) to **0**, while leaving withdrawals unchanged.

##### [Ethereum] Onboard the Grove × Steakhouse PYUSD Morpho Vault V2

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xf11bc85d5b66a8e8a4a6793c348d266a0af816dfbc332b905317344d9d375ef1)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will onboard the [Grove × Steakhouse PYUSD Morpho Vault V2](https://etherscan.io/address/0xbeef08Db223ad823164A4B13CBD6bd8b5d507b41) with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Deposit rate limit:
  - `maxAmount`: **20 million PYUSD**
  - `slope`: **20 million PYUSD per day**
- Withdrawal rate limit:
  - `maxAmount`: **Unlimited**
- Maximum exchange rate: **4 PYUSD per vault share**

##### [Base] Set the Steakhouse Prime Instant USDC Morpho Vault V2 Deposit Rate Limit to 0

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xf97cae9eb7937f48c92b268b3f28886f9dcc5fd05e3d39fb1b67ccf2ec16ca4d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will set the [`maxAmount`](https://sky-atlas.io/#8b5f1ffd-9dfd-4aa0-8fc2-638a79d9fadb) and [`slope`](https://sky-atlas.io/#ae8674bc-44ac-4b95-b5df-c6322a1d6e9a) parameters for [`0xbeef0e0834849aCC03f0089F01f4F1Eeb06873C9`](https://basescan.org/address/0xbeef0e0834849aCC03f0089F01f4F1Eeb06873C9) to **0**, while leaving withdrawals unchanged.

##### [Base] Set the Morpho Grove × Steakhouse High Yield Vault USDC Deposit Rate Limit to 0

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xf97cae9eb7937f48c92b268b3f28886f9dcc5fd05e3d39fb1b67ccf2ec16ca4d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-grove-for-upcoming-spell/28255)

If this executive proposal passes, then the Grove proxy spell will set the [`maxAmount`](https://sky-atlas.io/#8b5f1ffd-9dfd-4aa0-8fc2-638a79d9fadb) and [`slope`](https://sky-atlas.io/#ae8674bc-44ac-4b95-b5df-c6322a1d6e9a) parameters for [`0xBeEf2d50B428675a1921bC6bBF4bfb9D8cF1461A`](https://basescan.org/address/0xBeEf2d50B428675a1921bC6bBF4bfb9D8cF1461A) to **0**, while leaving withdrawals unchanged.

#### Osero Proxy Spell

The Pull Request for the Osero proxy spell can be viewed [here](https://github.com/osero-io/osero-spells/pull/5).

##### [Ethereum] Onboard the Osero × Gauntlet USDC Prime Vault

- **Authorization**: [Governance Poll](https://vote.sky.money/polling/Qmb2Cmnf)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-8-2026-proposed-changes-to-osero-for-upcoming-spell/28253)

If this executive proposal passes, then the Osero proxy spell will onboard the [Osero × Gauntlet USDC Prime Vault](https://etherscan.io/address/0x802148D518A6De2aF866f9A61ffB5e5C39156dB2) to the Osero PAU with the following configuration:

- Enable the `ERC4626_FACET` and `PSM_FACET` integrations on the Osero Controller.
- Set the maximum exchange rate to **2 USDC per vault share**.
- Configure the PSM USDS-to-USDC [rate limit](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) with:
  - `maxAmount`: **50 million USDC**
  - `slope`: **50 million USDC per day**
- Configure the PSM USDC-to-USDS rate limit as **Unlimited**.
- Configure the vault deposit rate limit with:
  - `maxAmount`: **5 million USDC**
  - `slope`: **0 USDC per day**
- Configure the vault withdrawal rate limit as **Unlimited**.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

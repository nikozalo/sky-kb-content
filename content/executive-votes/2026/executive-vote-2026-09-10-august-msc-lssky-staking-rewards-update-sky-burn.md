---
title: Template - [Executive Vote] Monthly Settlement Cycle for August 2026, Treasury Management Function Parameter Updates, Increase MKR-SKY Delayed Upgrade Penalty, Adjust Allocator Vault DC-IAM Parameters, Prime Agent Proxy Spells - September 10, 2026
summary: Execute the Monthly Settlement Cycle for August 2026 and the associated reconciliation transfers, burn SKY from the Pause Proxy balance, update LSSKY->SKY staking rewards and shorten the buyback and LSSKY->USDS reward cycles, increase the MKR-SKY Delayed Upgrade Penalty, adjust the Grove and Osero DC-IAM parameters, and whitelist Prime Agent spells for Spark and Grove.
date: 2026-09-10T00:00:00.000Z
address: "0x86d6CdD0D259AAAfb8134D47464b77743F50380B"
---

# [Executive Proposal] Monthly Settlement Cycle for August 2026, Treasury Management Function Parameter Updates, Increase MKR-SKY Delayed Upgrade Penalty, Adjust Allocator Vault DC-IAM Parameters, Prime Agent Proxy Spells - September 10, 2026

The Core Facilitator, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Monthly Settlement Cycle for August 2026 will be executed.
- The Treasury Management Function will be executed, including burning SKY from the Pause Proxy, updating LSSKY->SKY staking rewards, and shortening the buyback and LSSKY->USDS reward cycles.
- The MKR-SKY Delayed Upgrade Penalty will be increased.
- Debt Ceiling Instant Access Module (DC-IAM) parameters for `ALLOCATOR-GROVE-A` and `ALLOCATOR-PRYSM-A` will be updated.
- Proxy spells for Spark and Grove will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Monthly Settlement Cycle for August 2026

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6f8d5065-d6ff-4add-9a28-eadeffa7ed1a)
- **Proposal**: [MSC 12 Settlement Summary - August 2026](https://forum.skyeco.com/t/msc-12-settlement-summary-august-2026/28217)

If this executive proposal passes, then the Monthly Settlement Cycle for August 2026 will be executed through the following actions:

#### Spark

- Mint **6,357,912 USDS** debt in `ALLOCATOR-SPARK-A` and transfer the amount to the Surplus Buffer.
- Send **937,436 USDS** from the Surplus Buffer to [`SPARK_SUBPROXY`](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **9,574,714 USDS** debt in `ALLOCATOR-BLOOM-A` and transfer the amount to the Surplus Buffer.
- Send **1,342,064 USDS** from the Surplus Buffer to [`GROVE_SUBPROXY`](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Keel

- Send **31,776 USDS** from the Surplus Buffer to [`KEEL_SUBPROXY`](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **1,631,729 USDS** debt in `ALLOCATOR-OBEX-A` and transfer the amount to the Surplus Buffer.
- Send **458,340 USDS** from the Surplus Buffer to [`OBEX_SUBPROXY`](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **101,204 USDS** from the Surplus Buffer to [`SKYBASE_SUBPROXY`](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Osero

- Mint **7,006 USDS** debt in `ALLOCATOR-PRYSM-A` and transfer the amount to the Surplus Buffer.
- Send **30,156 USDS** from the Surplus Buffer to [`OSERO_SUBPROXY`](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3).

#### Treasury Management Function

- Send **3,149,060 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).

This amount represents **1,574,530 USDS** allocated to the Core Council and **1,574,530 USDS** allocated to the Fortification Foundation, combined into a single transfer.

### Treasury Management Function

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#f67a5780-11d5-4014-8254-795080c77133)
- **Proposal**: [Treasury Management Function (TMF) Configurations](https://forum.skyeco.com/t/treasury-management-function-tmf-configurations/28153/5)

If this executive proposal passes, then Treasury Management Function configurations will be updated through the following actions:

- Burn **2,860,943.76 SKY** from the [Pause Proxy](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB) balance.
- Update the LSSKY->SKY farm vest by calling [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with the following parameters:
  - `dist`: [`0x675671A8756dDb69F7254AFB030865388Ef699Ee`](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - `vestTot`: **143,208,393 SKY**
  - `vestBgn`: `block.timestamp`
  - `vestTau`: **90 days**
- Decrease `splitter.hop` by 1,244 seconds from 3,748 seconds to **2,504 seconds**.
- Decrease `rewardsDuration` in [`REWARDS_LSSKY_USDS`](https://etherscan.io/address/0x38E4254bD82ED5Ee97CD1C4278FAae748d998865) by 1,244 seconds from 3,748 seconds to **2,504 seconds**.

### Increase the MKR-SKY Delayed Upgrade Penalty

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ec820ddb-5d12-43d8-81b7-a7602a70332a)
- **Proposal**: [Delayed Migration Penalty Update - September 10th Spell](https://forum.skyeco.com/t/delayed-migration-penalty-update-september-10th-spell/28218)

If this executive proposal passes, then the Delayed Upgrade Penalty applied to [MKR to SKY conversions](https://etherscan.io/address/0xA1Ea1bA18E88C381C724a75F23a130420C403f9a) will increase by 1 percentage point, from 4% to **5%**.

### Adjust ALLOCATOR-GROVE-A DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [September 10, 2026 Proposed Changes to Grove for Upcoming Spell](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-grove-for-upcoming-spell/28207/6)

If this executive proposal passes, then the following DC-IAM parameters will be updated for Grove's DPAU-linked vault (`ALLOCATOR-GROVE-A`):

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 75 million USDS, from 25 million USDS to **100 million USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 10 million USDS, from 5 million USDS to **15 million USDS**.
- Decrease the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) by 43,200 seconds, from 86,400 seconds (24 hours) to **43,200 seconds** (12 hours).

### Adjust ALLOCATOR-PRYSM-A DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [Osero Requested Changes to Allocator Vault Parameters](https://forum.skyeco.com/t/sep-10-2026-osero-requested-changes-to-allocator-vault-parameters/28211)

If this executive proposal passes, then the following DC-IAM parameters will be updated for Osero's DPAU-linked vault (`ALLOCATOR-PRYSM-A`):

- Increase the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) by 75 million USDS, from 25 million USDS to **100 million USDS**.
- Increase the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) by 10 million USDS, from 5 million USDS to **15 million USDS**.
- Leave the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) unchanged at **86,400 seconds** (24 hours).

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0x7602cc457786c06778258A0b004f2D66c54386fC`](https://etherscan.io/address/0x7602cc457786c06778258A0b004f2D66c54386fC) and codehash `0xb3b1f22f29ef3d269404004599f13b840e45ec98909ac3de529e27c155bed088` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0x73F9798B24b7843B8028f905373124EfCAF25Da4`](https://etherscan.io/address/0x73F9798B24b7843B8028f905373124EfCAF25Da4) and codehash `0xc72bda25146c6225b10ee085a10e21b0126b34dde6036a24d7023142846d34c0` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/185).

##### [Ethereum] Spark Liquidity Layer - Offboard Unused Integrations

- **Authorization**: [Snapshot Poll 1](https://snapshot.org/#/s:sparkfi.eth/proposal/0xce102fe51d0f9dffa64c47df88974e52899ce5347375854adfe3547225489421), [Snapshot Poll 2](https://snapshot.org/#/s:sparkfi.eth/proposal/0xcf6b2556093cca153cba5c986da1c43265d0267ae6fa501c20b6f2862a138927)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-spark-for-upcoming-spell/28208)

If this executive proposal passes, then the Spark proxy spell will set the `maxAmount` and `slope` parameters to **0** to functionally offboard 35 rate limit keys from the following unused Spark Liquidity Layer integrations:

- Morpho v1 DAI and USDS vaults
- Aave Core `aEthUSDe`
- Ethena USDe minting and burning, sUSDe cooldown, and sUSDe ERC-4626 deposits
- Maple syrupUSDT and syrupUSDC vaults
- Curve PYUSD/USDS, PYUSD/USDC, sUSDS/USDT, USDC/USDT, and weETH/WETH-ng integrations
- Superstate USTB and USCC integrations
- B2C2 OTC USDC, USDT, and PYUSD integrations
- Anchorage USDT and USAT integrations

##### [Ethereum] SparkLend - Deprecate LBTC

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-spark-for-upcoming-spell/28208)

If this executive proposal passes, then the Spark proxy spell will further deprecate LBTC on SparkLend by setting its [Maximum Loan-to-Value (LTV)](https://sky-atlas.io/#586478a3-51cb-4a2e-8bb1-b96e6520fdcc) to **0%**. The liquidation threshold will remain unchanged at **75%**, preventing the change from directly causing liquidations.

##### [Ethereum] SparkLend - Update the USDT Interest Rate Model

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-spark-for-upcoming-spell/28208)

If this executive proposal passes, then the Spark proxy spell will update the USDT interest rate strategy to [`0x4FA65B096681bD6FeecF78e5D83096bf4A5762A0`](https://etherscan.io/address/0x4FA65B096681bD6FeecF78e5D83096bf4A5762A0) with the following parameters:

- [Optimal usage ratio](https://sky-atlas.io/#a6677e8a-7ef1-460b-a5cd-5411319bf2c0): **95%**
- Rate source: **[Sky Savings Rate (SSR)](https://sky-atlas.io/#2674cccb-d779-4868-b83f-8cb86648c88a)**
- [Base variable borrow rate](https://sky-atlas.io/#9372deb9-5115-4010-bf72-34023b846525): **0%**
- Variable rate [slope 1](https://sky-atlas.io/#c16b2b24-d663-4877-8bb3-cbd32e977360) spread: **0.10%** over SSR
- Variable rate [slope 2](https://sky-atlas.io/#56bc7808-5ef8-42af-ba17-708b995194cc): **15%**

##### [Ethereum] Spark Liquidity Layer - Onboard the Sentora-Curated RLUSD Morpho Vaults V2 Instance

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x95329a02677772384f4d2bad196de1f2b0fe6b83a06ab61fe634fb07643dcb86)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-spark-for-upcoming-spell/28208)

If this executive proposal passes, then the Spark proxy spell will onboard the [Sentora x Spark RLUSD Morpho Vault V2](https://etherscan.io/address/0xFC8C624B6080a0a780583799f2A862DE936F6E22) to the Spark Liquidity Layer with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Deposit rate limit:
  - `maxAmount`: **10 million RLUSD**
  - `slope`: **100 million RLUSD per day**
- Withdrawal rate limit:
  - `maxAmount`: **Unlimited**
- Maximum exchange rate: **3 RLUSD per vault share**

##### [Ethereum] SparkLend - Claim Accrued SparkLend Reserves

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-spark-for-upcoming-spell/28208)

If this executive proposal passes, then the Spark proxy spell will claim all accrued SparkLend reserves and transfer them as follows:

- DAI, USDS, USDC, PYUSD, USDT, USDG, and RLUSD reserves will be transferred to the [Spark ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).
- All other reserves will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

##### [Gnosis] SparkLend - Complete the Deprecation of the Gnosis Market

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-spark-for-upcoming-spell/28208)

If this executive proposal passes, then the Spark proxy spell will complete the deprecation of the SparkLend Gnosis market through the following changes to WXDAI, WETH, wstETH, GNO, and sDAI:

- Set [Maximum LTV](https://sky-atlas.io/#586478a3-51cb-4a2e-8bb1-b96e6520fdcc) to **0%**
- Set [liquidation thresholds](https://sky-atlas.io/#2dd2045c-6a33-4229-b6c8-e531d6ecd27a) to **0.01%**
- Set the liquidation protocol fee to **0%**
- Remove [WETH](https://sky-atlas.io/#dc3b3c32-f891-49fa-bdb4-8944d14e3d56) and [wstETH](https://sky-atlas.io/#a07d0682-9249-4a4f-b2a3-c0dfb163c683) from [E-Mode Category 1](https://sky-atlas.io/#49159478-90c9-4200-ab33-277a70b924d6).

These changes will make remaining borrow positions backed by these collateral assets liquidatable. Stablecoin reserves USDC, USDT, EURe, and USDC.e will remain unchanged.

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/76).

##### [Ethereum] Onboard the Grove × Steakhouse USDG Morpho Vault

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x1c152d7efd78b8cc72bec0af156d60ead97578bf11285a2c51e84d8adf2dbaba)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/september-10-2026-proposed-changes-to-grove-for-upcoming-spell/28207)

If this executive proposal passes, then the Grove proxy spell will onboard the [Grove × Steakhouse USDG Morpho Vault V2](https://etherscan.io/address/0xbeef05061FE51eA482BD1b68041353490b3a5934) to the Grove Liquidity Layer with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Deposit rate limit:
  - `maxAmount`: **50 million USDG**
  - `slope`: **50 million USDG per day**
- Withdrawal rate limit:
  - `maxAmount`: **Unlimited**
- Maximum exchange rate: **2 USDG per vault share**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

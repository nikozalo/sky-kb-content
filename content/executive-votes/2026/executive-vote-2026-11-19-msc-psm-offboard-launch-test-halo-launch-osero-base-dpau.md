---
title: Template - [Executive Vote] Monthly Settlement Cycle for October 2026, Treasury Management Function Execution, Core Vault Debt Ceiling Reductions, Legacy USDC PSM Offboarding, Test Halo Initialization, Osero Base DPAU Activation, Safe Harbor Agreement Update, Prime Agent Proxy Spells - November 19, 2026
summary: Execute the Monthly Settlement Cycle for October 2026 and the associated token transfers, burn SKY from the Pause Proxy balance, update LSSKY->SKY staking rewards and shorten the buyback and LSSKY->USDS reward cycles, remove core vaults from the Debt Ceiling Instant Access Module and set their debt ceilings to 0, finalize offboarding the legacy USDC PSM, initialize a test Halo, perform the necessary configuration steps to activate the Osero DPAU on Base, update the Safe Harbor Agreement, whitelist proxy spells for Spark, Grove, and Osero.
date: 2026-11-19T00:00:00.000Z
address: "$spell_address"
---

# [Executive Proposal] Monthly Settlement Cycle for October 2026, Treasury Management Function Execution, Core Vault Debt Ceiling Reductions, Legacy USDC PSM Offboarding, Test Halo Initialization, Osero Base DPAU Activation, Safe Harbor Agreement Update, Prime Agent Proxy Spells - November 19, 2026

The Core Facilitator, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Monthly Settlement Cycle for October 2026 will be executed.
- The Treasury Management Function will be executed, including burning SKY from the Pause Proxy, updating LSSKY->SKY staking rewards, and shortening the buyback and LSSKY->USDS reward cycles.
- Core Vaults will be removed from the Debt Ceiling Instant Access Module (DC-IAM) and their debt ceilings will be set to 0.
- The offboarding of the legacy USDC Peg Stability Module (PSM) will be finalized.
- A test Halo controlled by Sky Core will be initialized.
- The Beacon and Parallelized Allocation System (PAS) on Base will be configured for Osero's Diamond Parallelized Allocation Unit (DPAU) launch on Base.
- The Safe Harbor Agreement will be updated.
- Prime Agent proxy spells for Spark, Grove, and Osero will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Monthly Settlement Cycle for October 2026

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6f8d5065-d6ff-4add-9a28-eadeffa7ed1a)
- **Proposal**: [MSC #14 - Settlement Summary (October 2026)](https://forum.skyeco.com/t/msc-14-settlement-summary-october-2026/28406)

If this executive proposal passes, then the Monthly Settlement Cycle for October 2026 will be executed through the following actions:

#### Spark

- Mint **14,048,690 USDS** debt in `ALLOCATOR-SPARK-A` and transfer the amount to the Surplus Buffer.
- Send **4,188,099 USDS** from the Surplus Buffer to the [`SPARK_SUBPROXY`](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **8,866,792 USDS** debt in `ALLOCATOR-BLOOM-A` and transfer the amount to the Surplus Buffer.
- Send **2,170,826 USDS** from the Surplus Buffer to the [`GROVE_SUBPROXY`](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Keel

- Send **34,034 USDS** from the Surplus Buffer to the [`KEEL_SUBPROXY`](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **1,463,217 USDS** debt in `ALLOCATOR-OBEX-A` and transfer the amount to the Surplus Buffer.
- Send **205,907 USDS** from the Surplus Buffer to the [`OBEX_SUBPROXY`](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **145,439 USDS** from the Surplus Buffer to the [`SKYBASE_SUBPROXY`](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Osero

- Mint **15,812 USDS** debt in `ALLOCATOR-PRYSM-A` and transfer the amount to the Surplus Buffer.
- Send **42,396 USDS** from the Surplus Buffer to the [`OSERO_SUBPROXY`](https://etherscan.io/address/0x24fdcd3bFA5C2553e05B2f9AD0365EBC296278D3).

#### Demand Side Buffer Top-Up

- Send **1,000,000 USDS** from the Surplus Buffer to the Demand Side Buffer at [0x5e2fEc3a3C4E63A422e45C1BB83EdB3a5aD0543B](https://etherscan.io/address/0x5e2fEc3a3C4E63A422e45C1BB83EdB3a5aD0543B).

### Treasury Management Function

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#f67a5780-11d5-4014-8254-795080c77133)
- **Proposal**: [Treasury Management Function (TMF) Configurations](https://forum.skyeco.com/t/treasury-management-function-tmf-configurations/28153/10)

If this executive proposal passes, then Treasury Management Function configurations will be updated through the following actions:

- Transfer **3,720,082 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364). This amount represents **1,860,041 USDS** allocated to the Core Council and **1,860,041 USDS** allocated to the Fortification Foundation, combined into a single transfer.
- Burn **7,770,211 SKY** from the [Pause Proxy](https://etherscan.io/address/0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB) balance.
- Update the LSSKY->SKY farm vest by calling [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with the following parameters:
  - `dist`: [`0x675671A8756dDb69F7254AFB030865388Ef699Ee`](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - `vestTot`: **104,897,852 SKY**
  - `vestBgn`: `block.timestamp`
  - `vestTau`: **90 days**
- Decrease `splitter.hop` by 574 seconds from 2,693 seconds to **2,119 seconds**.
- Decrease `rewardsDuration` in [`REWARDS_LSSKY_USDS`](https://etherscan.io/address/0x38E4254bD82ED5Ee97CD1C4278FAae748d998865) by 574 seconds from 2,693 seconds to **2,119 seconds**.

### Adjust Core Vault DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#2107f160-751d-4fea-abc0-f0bef76a30d5)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/core-vaults-parameter-changes-set-dc-iam-line-to-0-on-eth-a-eth-b-eth-c-wsteth-a-and-wsteth-b/28399)

If this executive proposal passes, then Core Vaults will have their DC-IAM and debt ceiling parameters adjusted as follows:

- Remove ETH-A from the DC-IAM.
- Set ETH-A Debt Ceiling to **0 USDS**.
- Remove ETH-B from the DC-IAM.
- Set ETH-B Debt Ceiling to **0 USDS**.
- Remove ETH-C from the DC-IAM.
- Set ETH-C Debt Ceiling to **0 USDS**.
- Remove WSTETH-A from the DC-IAM.
- Set WSTETH-A Debt Ceiling to **0 USDS**.
- Remove WSTETH-B from the DC-IAM.
- Set WSTETH-B Debt Ceiling to **0 USDS**.

Global Debt Ceiling will be reduced to account for the removals from the DC-IAM. This reduction will be offset by the debt remaining in each ilk at the point of execution of the spell to ensure sufficient headroom remains.

### Finalize Legacy USDC PSM Offboarding

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#0d0e2e1a-0502-4ee3-bc9d-8bd8ddde19ec)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/psm-usdc-a-housekeeping/28417)

If this executive proposal passes, then the offboarding of the legacy USDC PSM, `PSM-USDC-A`, will be finalized by the following actions:

- Exit **99.328577 USDC** on [`MCD_JOIN_PSM_USDC_A`](https://etherscan.io/address/0x0A59649758aa4d66E25f08Dd01271e891fe52199) to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).
- Remove `PSM-USDC-A` from [`ILK_REGISTRY`](https://etherscan.io/address/0x5a464C28D19848f44199D003BeF5ecc87d090F87).
- Remove `PSM-USDC-A` from [`LINE_MOM`](https://etherscan.io/address/0x9c257e5Aaf73d964aEBc2140CA38078988fB0C10).
- Cage [`MCD_JOIN_PSM_USDC_A`](https://etherscan.io/address/0x0A59649758aa4d66E25f08Dd01271e891fe52199).
- Revoke the [`MCD_JOIN_PSM_USDC_A`](https://etherscan.io/address/0x0A59649758aa4d66E25f08Dd01271e891fe52199) authorization on [`MCD_VAT`](https://etherscan.io/address/0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B).
- Revoke the [`MCD_CLIP_PSM_USDC_A`](https://etherscan.io/address/0x66609b4799fd7cE12BA799AD01094aBD13d5014D) authorization on [`MCD_VAT`](https://etherscan.io/address/0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B) and [`MCD_DOG`](https://etherscan.io/address/0x135954d155898D42C90D2a57824C690e0c7BEf1B).
- Remove `PSM-USDC-A` related addresses from [chainlog](https://chainlog.skyeco.com):
  - Remove [`MCD_PSM_USDC_A`](https://etherscan.io/address/0x89B78CfA322F6C5dE0aBcEecab66Aee45393cC5A) from the [chainlog](https://chainlog.skyeco.com).
  - Remove [`MCD_JOIN_PSM_USDC_A`](https://etherscan.io/address/0x0A59649758aa4d66E25f08Dd01271e891fe52199) from the [chainlog](https://chainlog.skyeco.com).
  - Remove [`MCD_CLIP_PSM_USDC_A`](https://etherscan.io/address/0x66609b4799fd7cE12BA799AD01094aBD13d5014D) from the [chainlog](https://chainlog.skyeco.com).
  - Remove [`MCD_CLIP_CALC_PSM_USDC_A`](https://etherscan.io/address/0xbeE028b5Fa9eb0aDAC5eeF7E5B13383172b91A4E) from the [chainlog](https://chainlog.skyeco.com).

### Initialize Test Halo SubProxy and StarGuard

- **Authorization**: [Governance Poll ID 1658](https://vote.sky.money/polling/QmPNbnSS)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-for-the-new-test-halo-agent-setup/28418)

If this executive proposal passes, then a new Test Halo SubProxy and StarGuard will be initialized through the following actions:

- Call [StarGuardInit.init](https://github.com/sky-ecosystem/star-guard/blob/52239d716a89188b303f137fc43fb9288735ba2e/deploy/StarGuardInit.sol#L44-L63) with:
  - `chainlog`: **DssExecLib.LOG**
  - `cfg.subProxy`: [**0xF12Be1673758f8fBC275755401774Ec45C80c0F0**](https://etherscan.io/address/0xF12Be1673758f8fBC275755401774Ec45C80c0F0)
  - `cfg.subProxyKey`: **TEST_HALO_SUBPROXY**
  - `cfg.starGuard`: [**0x5dc7A3700Dc0508f5E127FA23acd83cc2E1D6056**](https://etherscan.io/address/0x5dc7A3700Dc0508f5E127FA23acd83cc2E1D6056)
  - `cfg.starGuardKey`: **TEST_HALO_STARGUARD**
  - `cfg.maxDelay`: **7 days**
- Call [CRON_STARGUARD_JOB.add](https://github.com/sky-ecosystem/dss-cron/blob/acec225fcbc5fb90bb2ad7d1092091785b888bdf/src/StarGuardJob.sol#L150-L153) with:
  - `starGuard`: [**0x5dc7A3700Dc0508f5E127FA23acd83cc2E1D6056**](https://etherscan.io/address/0x5dc7A3700Dc0508f5E127FA23acd83cc2E1D6056)

### [Base] Configure the Beacon and PAS for Osero's DPAU Launch

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#24c2fc14-448d-48be-a416-86bfad6f33fe)
- **Proposal**: [Technical Scope](https://forum.skyeco.com/t/technical-scope-of-the-core-l2-spell-on-base-assisting-osero-s-dpau-launch/28413)

If this executive proposal passes, then the Beacon and PAS on Base will be configured to enable activation of Osero's DPAU. These changes will be executed using a reusable L2MulticallSpell at [0x682048513247076Fb5dB4762121BdB136182e4A9](https://basescan.org/address/0x682048513247076Fb5dB4762121BdB136182e4A9) through the following actions:

- Add ERC4626Facet to the Beacon via [Beacon.setIntegration](https://github.com/sky-ecosystem/diamond-pau/blob/a84fe9616412e3b6d10ea64301a3481f7dcf9a05/src/Beacon.sol#L49-L67) with:
  - `Beacon`: [**0x7ac96180C4d6b2A328D3a19ac059D0E7Fc3C6d41**](https://basescan.org/address/0x7ac96180C4d6b2A328D3a19ac059D0E7Fc3C6d41)
  - `id`: **ERC4626_FACET**
  - `config.facet`: [**0xC6Fb54348feCdb2790Fa9130D1fc35d6E101C97D**](https://basescan.org/address/0xC6Fb54348feCdb2790Fa9130D1fc35d6E101C97D)
  - `config.wires`: an array directly fetched from the mainnet Beacon.
- Add cBEAM to PAS via [BeamState.addCBeam](https://github.com/sky-ecosystem/pas/blob/5263f26010d6543c7a95b3b2a94533e456af1911/src/BeamState.sol#L210-L213) with:
  - `BeamState`: [**0x29840a8519013F483d94781b5C1671b552A109e1**](https://basescan.org/address/0x29840a8519013F483d94781b5C1671b552A109e1)
  - `cBeam`: [**0x42D1038017E466b413aa44Ae798E30FB80b2E180**](https://basescan.org/address/0x42D1038017E466b413aa44Ae798E30FB80b2E180)
- Add Osero's RateLimits to PAS via [BeamState.addRateLimits](https://github.com/sky-ecosystem/pas/blob/5263f26010d6543c7a95b3b2a94533e456af1911/src/BeamState.sol#L186-L189) with:
  - `BeamState`: [**0x29840a8519013F483d94781b5C1671b552A109e1**](https://basescan.org/address/0x29840a8519013F483d94781b5C1671b552A109e1)
  - `rateLimits_`: [**0xd9E629588c48722E4c1bfcfb17829FecAf73839f**](https://basescan.org/address/0xd9E629588c48722E4c1bfcfb17829FecAf73839f)
- Add cBEAM for Osero's RateLimits via [BeamState.setCBeamForRateLimits](https://github.com/sky-ecosystem/pas/blob/5263f26010d6543c7a95b3b2a94533e456af1911/src/BeamState.sol#L225-L230) with:
  - `BeamState`: [**0x29840a8519013F483d94781b5C1671b552A109e1**](https://basescan.org/address/0x29840a8519013F483d94781b5C1671b552A109e1)
  - `rateLimits_`: [**0xd9E629588c48722E4c1bfcfb17829FecAf73839f**](https://basescan.org/address/0xd9E629588c48722E4c1bfcfb17829FecAf73839f)
  - `cBeam`: [**0x42D1038017E466b413aa44Ae798E30FB80b2E180**](https://basescan.org/address/0x42D1038017E466b413aa44Ae798E30FB80b2E180)
- Add Osero's Controller to PAS via [BeamState.addController](https://github.com/sky-ecosystem/pas/blob/5263f26010d6543c7a95b3b2a94533e456af1911/src/BeamState.sol#L198-L201) with:
  - `BeamState`: [**0x29840a8519013F483d94781b5C1671b552A109e1**](https://basescan.org/address/0x29840a8519013F483d94781b5C1671b552A109e1)
  - `controller`: [**0x96F18963c1B1Dd83bB4D14119cF2C4b94F86d6a9**](https://basescan.org/address/0x96F18963c1B1Dd83bB4D14119cF2C4b94F86d6a9)
- Add cBEAM for Osero's Controller via [BeamState.setCBeamForController](https://github.com/sky-ecosystem/pas/blob/5263f26010d6543c7a95b3b2a94533e456af1911/src/BeamState.sol#L237-L242) with:
  - `BeamState`: [**0x29840a8519013F483d94781b5C1671b552A109e1**](https://basescan.org/address/0x29840a8519013F483d94781b5C1671b552A109e1)
  - `controller`: [**0x96F18963c1B1Dd83bB4D14119cF2C4b94F86d6a9**](https://basescan.org/address/0x96F18963c1B1Dd83bB4D14119cF2C4b94F86d6a9)
  - `cBeam`: [**0x42D1038017E466b413aa44Ae798E30FB80b2E180**](https://basescan.org/address/0x42D1038017E466b413aa44Ae798E30FB80b2E180)
- Relay calls to Base via [BASE_GOV_RELAY.relay](https://etherscan.io/address/0x1Ee0AE8A993F2f5abDB51EAF4AC2876202b65c3b#code#F1#L77) with:
  - `target`: [0x682048513247076Fb5dB4762121BdB136182e4A9](https://basescan.org/address/0x682048513247076Fb5dB4762121BdB136182e4A9)
  - `targetData`:
    - `calls`: an array of [Call](https://github.com/sky-ecosystem/l2-multicall-spell/blob/ea3e8445eb4d489ac8ec710c79df36f69ed5c3f0/src/L2MulticallSpell.sol#L24-L27) structs with the items listed above.
    - `deadline`: **block.timestamp + 7 days**
  - `minGasLimit`: **1_000_000**

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, the Safe Harbor Agreement will be updated to include the following new contracts added by this spell:

#### Ethereum Mainnet

- `TEST_HALO_SUBPROXY`: [0xF12Be1673758f8fBC275755401774Ec45C80c0F0](https://etherscan.io/address/0xF12Be1673758f8fBC275755401774Ec45C80c0F0)
- `TEST_HALO_STARGUARD`: [0x5dc7A3700Dc0508f5E127FA23acd83cc2E1D6056](https://etherscan.io/address/0x5dc7A3700Dc0508f5E127FA23acd83cc2E1D6056)

#### Base

- `L2_ERC4626_FACET`: [0xC6Fb54348feCdb2790Fa9130D1fc35d6E101C97D](https://basescan.org/address/0xC6Fb54348feCdb2790Fa9130D1fc35d6E101C97D)
- `L2_MULTICALL_SPELL`: [0x682048513247076Fb5dB4762121BdB136182e4A9](https://basescan.org/address/0x682048513247076Fb5dB4762121BdB136182e4A9)

### Prime Agent Proxy Spells

If this executive proposal passes, then the Spark proxy spell with address [`0x0703EBA65Ff30c245f739087B4c5280e9e4dBD50`](https://etherscan.io/address/0x0703EBA65Ff30c245f739087B4c5280e9e4dBD50) and codehash `0x0a88e3ab7468f13e69d3e49699ccd8463dedc9609ea097e23c19e6106810e6c8` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then the Grove proxy spell with address [`0x1a74cC68A37f24367914fAc1915cC604CB3D72AF`](https://etherscan.io/address/0x1a74cC68A37f24367914fAc1915cC604CB3D72AF) and codehash `0x45f2833db32128803bd3ce7dc8fa9837a38db7791cacd99ac1c90598d0a70bc9` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then the Osero proxy spell with address [`0xC1989b5c81eA2bC4A6Abda0e73e3E3C48D500d05`](https://etherscan.io/address/0xC1989b5c81eA2bC4A6Abda0e73e3E3C48D500d05) and codehash `0xd99ef190c8ebdfbe3ddd67e84a2d63243b0f354e4841928a8bc6869a4055d77b` will be whitelisted in the [Osero StarGuard](https://etherscan.io/address/0xBfA2D1dA838E55A74c61699e164cDFF8cF0cF0e2).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/211).

##### [Ethereum] Spark Liquidity Layer - Upgrade the Ethereum ALM Controller to MainnetController v1.11.0

- **Authorization**: [Spark Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x5547b7f06c852c98c517e53fb8f2516062d7d890c9abd1bd7b2c9a5db67f9289)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-spark-for-upcoming-spell/28390)

If this executive proposal passes, then the Spark proxy spell will upgrade the Ethereum ALM Controller as follows:

- Upgrade the Ethereum ALM Controller to **MainnetController v1.11.0**.

The new controller address is [**0xc953972Cd006d1f12686fd7185c6D443b15900Cd**](https://etherscan.io/address/0xc953972Cd006d1f12686fd7185c6D443b15900Cd).

##### [Ethereum] SparkLend - Claim Accrued SparkLend Reserves

- **Authorization**: [Spark Artifact](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-spark-for-upcoming-spell/28390)

If this executive proposal passes, then the Spark proxy spell will claim accrued SparkLend reserves. Stablecoin reserves will be routed to the [Spark Liquidity Layer's Ethereum ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E), while other claimed reserves will be sent to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC). The amounts will depend on reserves accrued at execution.

##### [Ethereum] Spark Treasury - Transfer the December 2026 Grants

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-spark-for-upcoming-spell/28390)

If this executive proposal passes, then the Spark proxy spell will execute the following grant transfers:

- Transfer **865,000 USDS** to the Spark Foundation at [**0x92e4629a4510AF5819d7D1601464C233599fF5ec**](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec).
- Transfer **45,000 USDS** to the Spark Assets Foundation at [**0xEabCb8C0346Ac072437362f1692706BA5768A911**](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911).

##### [Avalanche] Spark Savings and Spark Liquidity Layer - Deprecate Avalanche

- **Authorization**: [Spark Snapshot Poll 1](https://snapshot.org/#/s:sparkfi.eth/proposal/0xf1426e0ea2fcab571a5d59e650b24a88f56c041efe8ddc31d22a9d354dd57f97), [Spark Snapshot Poll 2](https://snapshot.org/#/s:sparkfi.eth/proposal/0x38093a3ead044a60511d1451ae04d0768e65b4ac32e19069c4d78335b64df61d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-spark-for-upcoming-spell/28390)

If this executive proposal passes, then the Spark proxy spell will deprecate the Spark Liquidity Layer on Avalanche. This will include:

- setting the spUSDC deposit cap to zero
- fixing the spUSDC rate at 0%
- setting the spUSDC take rate limit to zero
- zeroing the CCTP limits

##### [OP Mainnet] Spark Liquidity Layer - Deprecate the Spark Liquidity Layer on OP Mainnet

- **Authorization**: [Spark Snapshot Poll 1](https://snapshot.org/#/s:sparkfi.eth/proposal/0x61efe7dcaadc2baf6b0dde519ceb3e360f7ac864c888004108d97012843246ed), [Spark Snapshot Poll 2](https://snapshot.org/#/s:sparkfi.eth/proposal/0x38093a3ead044a60511d1451ae04d0768e65b4ac32e19069c4d78335b64df61d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-spark-for-upcoming-spell/28390)

If this executive proposal passes, then the Spark proxy spell will deprecate the Spark Liquidity Layer on OP Mainnet. This will include:

- returning remaining USDS and sUSDS to Ethereum Mainnet
- setting all rate limits to zero

##### [Unichain] Spark Liquidity Layer - Deprecate the Spark Liquidity Layer on Unichain

- **Authorization**: [Spark Snapshot Poll 1](https://snapshot.org/#/s:sparkfi.eth/proposal/0x4ca8fbf47c4679aa74d3cd6681c89ced9383e9f923b7dc6f33c94f7f8f0cee5b), [Spark Snapshot Poll 2](https://snapshot.org/#/s:sparkfi.eth/proposal/0x38093a3ead044a60511d1451ae04d0768e65b4ac32e19069c4d78335b64df61d)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-spark-for-upcoming-spell/28390)

If this executive proposal passes, then the Spark proxy spell will deprecate the Spark Liquidity Layer on Unichain. This will include:

- returning remaining USDS and sUSDS to Ethereum Mainnet
- setting all rate limits to zero

##### [X-Layer] Spark Savings - Onboard the Spark-curated Morpho USDC Vault on X-Layer to the spUSDC PAU

- **Authorization**: [Spark Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x807d260ba5b828e4e886727c66b4bb5666a76a8dcf78cff89bb2584f7580ea17)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-spark-for-upcoming-spell/28390)

If this executive proposal passes, then the Spark proxy spell will onboard the Spark-curated Morpho USDC vault on X-Layer to the spUSDC PAU with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) and contracts:

- Add ERC4626 Facet at [0x3fC45da74c30644172620520F6bAf6783aec11F2](https://www.oklink.com/xlayer/address/0x3fC45da74c30644172620520F6bAf6783aec11F2) to the spUSDC PAU on X-Layer.
- Set rate limits for the Morpho USDC vault on X-Layer at [0xDb6C283f8026a2D1D69b90464011baFB0A1090F4](https://www.oklink.com/xlayer/address/0xDb6C283f8026a2D1D69b90464011baFB0A1090F4).
  - Deposit:
    - `maxAmount`: **15 million USDC**
    - `slope`: **10 million USDC per day**
  - Withdraw:
    - `maxAmount`: **Unlimited**
  - Maximum Exchange Rate:
    - `maxExchangeRate`: at most **3 USDC per whole vault share**

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/89).

##### [Ethereum] Treasury Distribution - 800,000 USDS to the Grove Foundation Multisig for November 2026

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-grove-for-upcoming-spell/28387)

If this executive proposal passes, then the Grove proxy spell will execute the following treasury distribution:

- Transfer **800,000 USDS** from the [Grove SubProxy](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) to the Grove Foundation Multisig at [0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

##### [Ethereum] Agora AUSD Instance - Add Agora's New Mint and Redeem Addresses

- **Authorization**: [Grove Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x6a024ffdd779c80702e6c11dd8343a64627e7bfe5cfe4f33b1a4fa6cd3f3a5cf)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-grove-for-upcoming-spell/28387)

If this executive proposal passes, then the Grove proxy spell will set the following transfer [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) to enable mint and redeem of AUSD from Agora's new mint and redeem addresses:

- Mint:
  - `asset`: [USDC](https://etherscan.io/token/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48)
  - `destination address`: [0xC6A7d3662e7d38f8e3a1e991116F6c3628bd7EDf](https://etherscan.io/address/0xC6A7d3662e7d38f8e3a1e991116F6c3628bd7EDf)
  - `maxAmount`: **10 million USDC**
  - `slope`: **100 million USDC per day**
- Redeem:
  - `asset`: [AUSD](https://etherscan.io/token/0x00000000eFE302BEAA2b3e6e1b18d08D69a9012a)
  - `destination address`: [0x9307672C95c7B92e659da63EF5ee64B0C0D14619](https://etherscan.io/address/0x9307672C95c7B92e659da63EF5ee64B0C0D14619)
  - `maxAmount`: **10 million AUSD**
  - `slope`: **100 million AUSD per day**

##### [Ethereum] GROVE Purchases - 300,000 USDS to the Grove Foundation Multisig to Buy GROVE for the Grove SubProxy Over Three Months

- **Authorization**: [Grove Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x6b470d2a31a6e1723376a35691a551c521739d85f9f55672793857405cab88a5)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-grove-for-upcoming-spell/28387)

If this executive proposal passes, then the Grove proxy spell will transfer **300,000 USDS** to the Grove Foundation Multisig at [0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42) for the purchase of GROVE tokens through FalconX.

##### [Ethereum + Base] Raise the Circle CCTP Transfer Rate Limits Between Ethereum and Base to 100,000,000 USDC

- **Authorization**: [Grove Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x319e9c02e0cbd1a4c9e1647fdb5b2c7ad99bc7076b3a7cd5f49c58d8a1d7cdef)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-grove-for-upcoming-spell/28387)

If this executive proposal passes, then the Grove proxy spell will increase the Circle CCTP transfer [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) between Ethereum and Base as follows:

- Ethereum to Base:
  - `maxAmount`: **100 million USDC**
  - `slope`: **100 million USDC per day**
- Base to Ethereum:
  - `maxAmount`: **100 million USDC**
  - `slope`: **100 million USDC per day**

#### Osero Proxy Spell

The Pull Request for the Osero proxy spell can be viewed [here](https://github.com/osero-io/osero-spells/pull/8).

##### [Ethereum] Configure CCTP toward Base

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-osero-for-upcoming-spell/28388)

If this executive proposal passes, then the Osero proxy spell will enable the [CCTP_FACET](https://etherscan.io/address/0xADf62692340e46EF90336f2e75ce3b37f1148873) on the Osero [`Controller`](https://etherscan.io/address/0x24169Afb34fAe4D4356BC54Bd80319131e35ca38) on Ethereum Mainnet. The domain parameters and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) will be set as follows:

- `destinationDomain`: **6**
- `recipient`: [Osero ALM Proxy on Base](https://basescan.org/address/0x61ee4C5157AC876D1F5132Dc6832AC4896F533C9)
- `minFeeCapRate`: **0**
- `maxFeeCapRate`: **0**
- `LIMIT_USDC_TO_CCTP`: **Unlimited**
- USDC to Base limits:
  - `maxAmount`: **10 million USDC**
  - `slope`: **50 million USDC per day**

##### [Ethereum] Relay the Osero Base Payload to the Osero Receiver on Base

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-osero-for-upcoming-spell/28388)

If this executive proposal passes, then the Osero proxy spell will transmit the actions for execution on Base to the [Osero Receiver](https://basescan.org/address/0x63B4A33770F58205F3D646C5A635fF417a3819C3) through Base's [L1CrossDomainMessenger](https://etherscan.io/address/0x866E82a600A1414e583f7F13623F1aC5d58b0Afa).

##### [Base] Set up the Osero Diamond PAU on Base

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-osero-for-upcoming-spell/28388)

If this executive proposal passes, then the Osero proxy spell will initialize the Osero Diamond PAU on Base as follows:

- Call [PAUInit.init](https://github.com/sky-ecosystem/diamond-pau/blob/c5c961a8bd5568c7ca73ba1151b23ab9c7cd9113/deploy/PAUInit.sol) with:
  - `inst`:
    - `accessControls`: [0xBF79Eed65E43323893F604386CC2635C2cB03f2d](https://basescan.org/address/0xBF79Eed65E43323893F604386CC2635C2cB03f2d)
    - `almProxy`: [0x61ee4C5157AC876D1F5132Dc6832AC4896F533C9](https://basescan.org/address/0x61ee4C5157AC876D1F5132Dc6832AC4896F533C9)
    - `rateLimits`: [0xd9E629588c48722E4c1bfcfb17829FecAf73839f](https://basescan.org/address/0xd9E629588c48722E4c1bfcfb17829FecAf73839f)
    - `controller`: [0x96F18963c1B1Dd83bB4D14119cF2C4b94F86d6a9](https://basescan.org/address/0x96F18963c1B1Dd83bB4D14119cF2C4b94F86d6a9)
    - `beacon`: [0x7ac96180C4d6b2A328D3a19ac059D0E7Fc3C6d41](https://basescan.org/address/0x7ac96180C4d6b2A328D3a19ac059D0E7Fc3C6d41)
  - `integrationIds`: [] (empty array)
- Call [PAUInit.addAllocator](https://github.com/sky-ecosystem/diamond-pau/blob/c5c961a8bd5568c7ca73ba1151b23ab9c7cd9113/deploy/PAUInit.sol) with:
  - `agent`: [0xFeC5e58eED607f240e73beA20F5b43c262bb61AB](https://basescan.org/address/0xFeC5e58eED607f240e73beA20F5b43c262bb61AB)
- Call [AdministeredAgentInit.init](https://github.com/sky-ecosystem/pau-administered-agent/blob/7a6fd3951f4210095945474576a1e9eb5f54c7f5/deploy/AdministeredAgentInit.sol) with:
  - `p.admins`: [] (empty array, Osero Executor is the admin)
  - `p.actors`:
    - [0x29c5A20A49A0D522A3714af97C517a908946b6A8](https://basescan.org/address/0x29c5A20A49A0D522A3714af97C517a908946b6A8) (Osero Relayer Multisig)
    - [0x3dE688267Cf099307aBdd85F64D8efe03D0b2b26](https://basescan.org/address/0x3dE688267Cf099307aBdd85F64D8efe03D0b2b26) (Core Operator Relayer Multisig)
  - `p.grantors`: [] (empty array, no grantor set)
  - `p.revokers`: [0xF61F90907551a8A23f0f8EEE9658Fa53326de603](https://basescan.org/address/0xF61F90907551a8A23f0f8EEE9658Fa53326de603) (Freezer Multisig on Base)

##### [Base] Enable the CCTP and ERC-4626 Facets on the Osero Controller on Base

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-osero-for-upcoming-spell/28388)

If this executive proposal passes, then the Osero proxy spell will enable the following Facets on the Osero Controller on Base:

- [CCTP_FACET](https://basescan.org/address/0xb22d50c393c6E1D13E3e05B172448dD8BF8DdC32)
- [ERC4626_FACET](https://basescan.org/address/0xC6Fb54348feCdb2790Fa9130D1fc35d6E101C97D)

##### [Base] Configure CCTP toward Ethereum Mainnet

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-osero-for-upcoming-spell/28388)

If this executive proposal passes, then the Osero proxy spell will configure transfers of USDC through CCTP from Base to Ethereum Mainnet with the following parameters and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Call Controller.cctp_setDomainParameters with:
  - `destinationDomain`: **0**
  - `recipient`: [Osero ALM Proxy on Ethereum Mainnet](https://etherscan.io/address/0x6d370e359e9cbd0Fd35Bb38fAF705D84238CB884)
  - `minFeeCapRate`: **0**
  - `maxFeeCapRate`: **0**
- Set the `LIMIT_USDC_TO_CCTP` rate limit on Base to **Unlimited**.
- Set the `LIMIT_USDC_TO_DOMAIN` rate limit for Ethereum Mainnet on Base:
  - `maxAmount`: **10 million USDC**
  - `slope`: **50 million USDC per day**

##### [Base] Onboard the Osero x Gauntlet USDC Prime Vault on Base

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-osero-for-upcoming-spell/28388)

If this executive proposal passes, then the Osero proxy spell will onboard the Osero x Gauntlet USDC Prime Vault on Base with the following parameters and [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- [Osero x Gauntlet USDC Prime Vault](https://basescan.org/address/0x8c1e205C408b90A0dDDbD53594049a379557c651)
- `shares`: **1**
- `maxExpectedAssets`: **2 USDC per share**
- Deposits:
  - `maxAmount`: **15 million USDC**
  - `slope`: **10 million USDC per day**
- Withdrawals:
  - `maxAmount`: **Unlimited**

##### [Base] Grant DEFAULT_ADMIN_ROLE on the Osero AccessControls on Base and on the Osero ALM Rate Limits Contract on Base to the Configurator on Base

- **Authorization**: [Governance Poll ID 1657](https://vote.sky.money/polling/QmYWJPcE)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-19-2026-proposed-changes-to-osero-for-upcoming-spell/28388)

If this executive proposal passes, then the Osero proxy spell will grant `DEFAULT_ADMIN_ROLE` to the [Configurator](https://basescan.org/address/0x458Acd38fD749F6325039e63e8Bc496dBc286D11) on Base for the Osero [AccessControls](https://basescan.org/address/0xBF79Eed65E43323893F604386CC2635C2cB03f2d) and Osero [ALM Rate Limits](https://basescan.org/address/0xd9E629588c48722E4c1bfcfb17829FecAf73839f) contracts.

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

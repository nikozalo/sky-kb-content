---
title: Template - [Executive Vote] November and December Monthly Settlement Cycles and Treasury Management Function, Pattern Onboarding, Skybase Onboarding and Genesis Capital Funding, DAO Resolution for 6s Capital, Prime Agent Proxy Spells - January 29, 2026
summary: Execute Monthly Settlement Cycle and Treasury Management Function for November and December, onboard Pattern with ALLOCATOR-PATTERN-A and StarGuard instance, onboard Skybase with StarGuard instance, approve DAO Resolution for RWA001-A, whitelist proxy spells for Spark and Grove.
date: 2026-01-26T00:00:00.000Z
address: "0x4d99868F6D4d2545EbFf3a1385efE31C06d3A472"
---

# [Executive Proposal] November and December Monthly Settlement Cycles and Treasury Management Function, Pattern Onboarding, Skybase Onboarding and Genesis Capital Funding, DAO Resolution for 6s Capital, Prime Agent Proxy Spells - January 29, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Monthly Settlement Cycle and Treasury Management Function for November and December 2025 will be executed.
- The Pattern Allocator Vault and StarGuard will be initialized.
- Skybase StarGuard will be initialized.
- Skybase Genesis Capital Allocation will be distributed.
- A DAO Resolution relating to 6s Capital (RWA001-A) will be approved.
- Star Agent proxy spells for Spark and Grove will be whitelisted in the respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Monthly Settlement Cycle and Treasury Management Function for November and December

- **Authorization**: [A.2.4 - Sky Core Monthly Settlement Cycle](https://sky-atlas.io/#A.2.4), [A.2.3 - Treasury Management](https://sky-atlas.io/#A.2.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/msc-4-settlement-summary-november-and-december-2025-spark-grove/27617/5)

If this executive proposal passes, then the November and December 2025 Monthly Settlement Cycles will be executed by taking the following steps.

#### Spark

- Mint **25,547,255 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Transfer **7,071,339 USDS** from the Surplus Buffer to the SPARK_SUBPROXY located at [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **14,311,822 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.

#### Obex

- Mint **1,768,819 USDS** debt in ALLOCATOR-OBEX-A and transfer the amount to the Surplus Buffer.
- Transfer **442,327 USDS** from the Surplus Buffer to the OBEX_SUBPROXY located at [0x8be042581f581E3620e29F213EA8b94afA1C8071](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Treasury Management Function

- Transfer **6,632,421 USDS** from the Surplus Buffer to the Core Council Buffer located at [0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).
- Transfer **331,620 USDS** from the Surplus Buffer to the Aligned Delegates Buffer located at [0x37FC5d447c8c54326C62b697f674c93eaD2A93A3](https://etherscan.io/address/0x37FC5d447c8c54326C62b697f674c93eaD2A93A3).

### Pattern Onboarding

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-new-pattern-allocator-instance/27641)

If this executive proposal passes, then Pattern will be onboarded as a Prime Agent. The onboarding will consist of initializing an Allocator Vault, adding the new Allocator Vault to the SP-BEAM, and initializing a Pattern StarGuard instance for future proxy spells.

#### Add Allocator Instance

Init new Allocator instance by calling [AllocatorInit.initIlk](https://github.com/sky-ecosystem/dss-allocator/blob/226584d3b179d98025497815adb4ea585ea0102d/deploy/AllocatorInit.sol#L97-L164) with:

- `sharedInstance.oracle`: `PIP_ALLOCATOR` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.roles`: `ALLOCATOR_ROLES` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.registry`: `ALLOCATOR_REGISTRY` from [Chainlog](https://chainlog.sky.money/);
- `ilkInstance.owner`: `MCD_PAUSE_PROXY` from [Chainlog](https://chainlog.sky.money/);
- 'ilkInstance.vault': [0xbd34fc6AAa1d3F52B314CB9D78023dd23eAc3B0E](https://etherscan.io/address/0xbd34fc6AAa1d3F52B314CB9D78023dd23eAc3B0E);
- 'ilkInstance.buffer': [0x823459b55D79F0421f24a4828237F7ecb8D7F1ef](https://etherscan.io/address/0x823459b55D79F0421f24a4828237F7ecb8D7F1ef);
- 'cfg.ilk': `ALLOCATOR-PATTERN-A`;
- [`cfg.duty`](https://sky-atlas.io/#A.3.7.1.1.2.3): **0%**;
- [`cfg.gap`](https://sky-atlas.io/#A.3.7.1.1.2.4.2): **10 million USDS**;
- [`cfg.maxLine`](https://sky-atlas.io/#A.3.7.1.1.2.4.1): **10 million USDS**;
- [`cfg.ttl`](https://sky-atlas.io/#A.3.7.1.1.2.4.1): **86,400 seconds**;
- `cfg.AllocatorProxy`: [0xbC8959Ae2d4E9B385Fe620BEF48C2FD7f4A84736](https://etherscan.io/address/0xbC8959Ae2d4E9B385Fe620BEF48C2FD7f4A84736);
- `cfg.ilkRegistry`: ILK_REGISTRY from [Chainlog](https://chainlog.sky.money/)

The initialization script will create a PIP_ALLOCATOR_PATTERN_A entry in the [Chainlog](https://chainlog.sky.money/); this entry is not necessary and will be removed.

ALLOCATOR-PATTERN-A will be added to the [Debt Ceiling Breaker (LINE_MOM)](https://sky-atlas.powerhouse.io/A.1.9.3.2.3_Debt_Ceiling_Breaker_Exception/8c27b081-2db5-4e8f-9b5c-f5cf0f8d3102|0db30758e055352c).

#### Add New Pattern Allocator to the SP-BEAM

ALLOCATOR-PATTERN-A ilk will be added to the [SP-BEAM](https://sky-atlas.io/#A.3.7.1.2) with the following parameters:

- [max](https://sky-atlas.io/#A.3.7.1.2): **3,000 bps**
- [min](https://sky-atlas.io/#A.3.7.1.2.1.1): **0 bps**
- [step](https://sky-atlas.io/#A.3.7.1.2.1.3): **400 bps**

#### Add Pattern StarGuard Instance

Init new StarGuard module by calling [StarGuardInit.init](https://github.com/sidestream-tech/sky-star-guard/blob/7398ffb283c4490c6e29bea28b92cd57285d4889/deploy/StarGuardInit.sol#L44-L63) with:

- [`chainlog`](https://chainlog.sky.money/): `DssExecLib.LOG`
- `cfg.subProxy`: [0xbC8959Ae2d4E9B385Fe620BEF48C2FD7f4A84736](https://etherscan.io/address/0xbC8959Ae2d4E9B385Fe620BEF48C2FD7f4A84736)
- `cfg.subProxyKey`: `PATTERN_SUBPROXY`
- cfg.starGuard: [0x2fb18b28fB39Ec3b26C3B5AF5222e2ca3B8B2269](https://etherscan.io/address/0x2fb18b28fB39Ec3b26C3B5AF5222e2ca3B8B2269)
- `cfg.starGuardKey`: `PATTERN_STARGUARD`
- `cfg.maxDelay`: **7 days**

PATTERN_STARGUARD will be added to the [StarGuardJob](https://etherscan.io/address/0xB18d211fA69422a9A848B790C5B4a3957F7Aa44E).

### Skybase Onboarding and Genesis Capital Funding

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-new-skybase-agent/27642)

If this executive proposal passes, then the Skybase Prime will be onboarded to their own StarGuard instance and receive Genesis Capital Funding, as described below.

#### Add Skybase StarGuard Instance

Initialize new StarGuard module by calling StarGuardInit.init with:

- [`chainlog`](https://chainlog.sky.money/): `DssExecLib.LOG`
- `cfg.subProxy`: [0x08978E3700859E476201c1D7438B3427e3C81140](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140)
- `cfg.subProxyKey`: `SKYBASE_SUBPROXY`
- `cfg.StarGuard`: [0xA170086AeF9b3b81dD73897A0dF56B55e4C2a1F7](https://etherscan.io/address/0xA170086AeF9b3b81dD73897A0dF56B55e4C2a1F7)
- `cfg.starGuardKey`: `SKYBASE_STARGUARD`
- `cfg.maxDelay`: **7 days**

SKYBASE_STARGUARD will be added to the [StarGuardJob](https://etherscan.io/address/0xb18d211fa69422a9a848b790c5b4a3957f7aa44e).

#### Skybase Genesis Funding

The following transfers will be made as part of Skybase's [Genesis funding](https://sky-atlas.io/#A.2.8.2.7.2.2):

- Transfer **10 million USDS** to SKYBASE_SUBPROXY located at [0x08978E3700859E476201c1D7438B3427e3C81140](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).
- Transfer **5 million USDS** to the USDS Demand Subsidies Multisig at [0x3F32bC09d41eE699844F8296e806417D6bf61Bba](https://etherscan.io/address/0x3F32bC09d41eE699844F8296e806417D6bf61Bba).

### DAO Resolution for 6s Capital (RWA001-A)

- **Authorization**: [Core Facilitator Approval](https://forum.sky.money/t/rwa-001-6s-capital-update-and-stability-fee-proposal/24624/5)
- **Proposal**: [Forum Post](https://forum.sky.money/t/rwa-001-6s-capital-update-and-stability-fee-proposal/24624/4)

If this executive proposal passes, then a DAO Resolution with IPFS hash [bafkreiczdjq55zsxvxcf4le3oaqvhp4jgvls4n4b7xbnzvkwilzen3a2te](https://gateway.pinata.cloud/ipfs/bafkreiczdjq55zsxvxcf4le3oaqvhp4jgvls4n4b7xbnzvkwilzen3a2te) will be approved. This DAO Resolution authorizes the return of the full balance of funds held in the Trust.

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell at [0xa091BeD493C27efaa4D6e06e32684eCa0325adcA](https://etherscan.io/address/0xa091BeD493C27efaa4D6e06e32684eCa0325adcA) with the codehash `0x6ef4bf2258afab1e1c857892e5253e95880230a86ee9adc773fab559d7a594ec` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell at [0x67aB5b15E3907E3631a303c50060c2207465a9AD](https://etherscan.io/address/0x67aB5b15E3907E3631a303c50060c2207465a9AD) with the codehash `0x7e4eb1e46f50b347fc7c8d20face6070c8fda4876049e32f3877a89cede1d533` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark Proxy Spell

##### [Gnosis] Deprecate SparkLend Phase 1

- **Authorization**: [A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#A.6.1.1.1.3.2.1.2.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The deprecation process for the Gnosis market will begin by setting the following parameters:

- [Reserve state](https://sky-atlas.io/#A.6.1.1.1.3.2.1.1.1.14) (all assets): **Frozen**
- Increase [reserve factor](https://sky-atlas.io/#A.6.1.1.1.3.2.1.1.1.8) (all assets) to **50%**

##### [Ethereum] SparkLend - Deprecate tBTC Phase 1

- **Authorization**: [A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#A.6.1.1.1.3.2.1.2.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The deprecation process for tBTC on SparkLend Mainnet will begin by setting the following parameters:

- [Reserve state](https://sky-atlas.io/#A.6.1.1.1.3.2.1.1.1.14): **Frozen**
- Increase [reserve factor](https://sky-atlas.io/#A.6.1.1.1.3.2.1.1.1.8) to **99%**

##### [Ethereum] SparkLend - Deprecate ezETH Phase 1

- **Authorization**: [A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#A.6.1.1.1.3.2.1.2.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The deprecation process for ezETH on SparkLend Mainnet will begin by setting the following parameters:

- [Reserve state](https://sky-atlas.io/#A.6.1.1.1.3.2.1.1.1.14): **Frozen**

##### [Ethereum] SparkLend - Deprecate rsETH Phase 1

- **Authorization**: [A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#A.6.1.1.1.3.2.1.2.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The deprecation process for rsETH on SparkLend Mainnet will begin by setting the following parameters:

- [Reserve state](https://sky-atlas.io/#A.6.1.1.1.3.2.1.1.1.14): **Frozen**

##### [Ethereum] SLL - Upgrade ALM Controller

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x7888032804772315db4be8e2d0c59ec50c70fbc0d4e7c5bab0af0a4b7391070e)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The Ethereum ALM Controller will be upgraded to version 1.9.0. This upgrade adds functionality to facilitate integration of Uniswap v4 pools for liquidity provision (including single tick ranges that serve as limit orders) and swaps.

##### [Ethereum] SLL - Onboard Uniswap v4 PYUSD/USDS

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x7888032804772315db4be8e2d0c59ec50c70fbc0d4e7c5bab0af0a4b7391070e)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The Uniswap v4 PYUSD/USDS Pool will be onboarded with the following parameters:

- Pool: `0xe63e32b2ae40601662f760d6bf5d771057324fbd97784fe1d3717069f7b75d45`
- Swap fee: **0.0005%**
- SLL [Uniswap parameters](https://docs.uniswap.org/contracts/v4/reference/core/libraries/TickMath)
  - Min lower tick limit: **276,314 (-0.1%)**
  - Max upper tick limit: **276,334 (+0.1%)**
  - Max tick width: **10 ticks**
  - Max slippage: **0.1%**
- Deposits
  - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **10 million**
  - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **100 million per day**
- Withdrawals
  - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **50 million**
  - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **200 million per day**
- Swaps
  - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **5 million**
  - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **50 million per day**

##### [Ethereum] SLL - Onboard Uniswap v4 USDT/USDS

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x7888032804772315db4be8e2d0c59ec50c70fbc0d4e7c5bab0af0a4b7391070e)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The Uniswap v4 USDT/USDS Pool will be onboarded with the following parameters:

- Pool: `0x3b1b1f2e775a6db1664f8e7d59ad568605ea2406312c11aef03146c0cf89d5b9`
- Swap fee: **0.0005%**
- SLL [Uniswap parameters](https://docs.uniswap.org/contracts/v4/reference/core/libraries/TickMath)
  - Min lower tick limit: **276,304 (-0.2%)**
  - Max upper tick limit: **276,344 (+0.2%)**
  - Max tick width: **10 ticks**
  - Max slippage: **0.2%**
- Deposits
  - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **5 million**
  - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **50 million per day**
- Withdrawals
  - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **50 million**
  - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **200 million per day**
- Swaps
  - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **5 million**
  - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **50 million per day**

##### [Ethereum] Spark Savings - Increase spUSDT Deposit Cap

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x64bd800579115f0a11a1290af898bdbe587947cd483afab3998b8454e3a4fb2d)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

The spUSDT [Deposit Cap](https://docs.spark.fi/dev/savings/spark-vaults-v2#deposit-cap) will be increased by 1.5 billion, from 500 million to **2 billion USDT**.

##### [Ethereum] SparkLend - Claim Accumulated Reserves

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xa1b2e3a136cca3a6df5498a074aeecad8bee871866726b7568b19c087ff33178)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

Accumulated reserves will be claimed as described below:

- Claim SparkLend USDS, USDC, DAI, PYUSD, and USDT and send to SparkALM Proxy
- Recipient address: [0x1601843c5E9bC251A3272907010AFa41Fa18347E](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E)

- Claim all other SparkLend reserves, and send to Spark Operations Multisig
- Recipient address: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC)

##### [Ethereum] Spark Treasury - Spark Foundation Grant

- **Authorization**: [A.2.8.2.2.2.5.5.2 - Spark Foundation Grant Authorization: December 2025](https://sky-atlas.io/#A.2.8.2.2.2.5.5.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes/27620)

**1.1 million USDS** will be transferred to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec).

#### Grove Proxy Spell

##### [Mainnet] Re-Onboard Agora AUSD Mint Redeem

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes-to-grove-for-upcoming-spell/27608)

The mint destination address for AUSD with Agora will be updated with the following market parameters:

- USDC: [0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 ](https://developers.circle.com/stablecoins/usdc-contract-addresses)
  - ERC20Transfers:
    - Destination: [0xfEa17E5f0e9bF5c86D5d553e2A074199F03B44E8](https://github.com/grove-labs/grove-spells/blob/1d963ab4d8e0f18287a6630d56b13ece35ad7a78/src/proposals/20251211/GroveEthereum_20251211.sol#L29)
    - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **0 USDC**
    - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **0 USDC per day**
  - ERC20Transfers:
    - Destination: [0x748b66a6b3666311F370218Bc2819c0bEe13677e](https://etherscan.io/address/0x748b66a6b3666311F370218Bc2819c0bEe13677e)
    - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **10M USDC**
    - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **100M USDC per day**
- AUSD: [0x00000000eFE302BEAA2b3e6e1b18d08D69a9012a](https://docs.agora.finance/developer/contract-deployments)
  - ERC20Transfers:
    - Destination: [0xab8306d9FeFBE8183c3C59cA897A2E0Eb5beFE67](https://etherscan.io/address/0xab8306d9FeFBE8183c3C59cA897A2E0Eb5beFE67)
    - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **10M AUSD**
    - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **100M AUSD per day**

##### [Mainnet] Onboard Curve AUSD/USDC Swaps & LP

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes-to-grove-for-upcoming-spell/27608)

Curve AUSD/USDC Swaps & Liquidity Provision will be onboarded with the following parameters:

- Curve AUSD/USDC Pool: [0xE79C1C7E24755574438A26D5e062Ad2626C04662](https://www.curve.finance/dex/ethereum/pools/factory-stable-ng-225/deposit)
  - USDC: [0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48](https://developers.circle.com/stablecoins/usdc-contract-addresses)
  - AUSD: [0x00000000eFE302BEAA2b3e6e1b18d08D69a9012a](https://docs.agora.finance/developer/contract-deployments)
    - Swaps:
      - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **5M AUSD/USDC**
      - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **100M AUSD/USDC per day**
      - [maxSlippage](https://sky-atlas.io/#A.2.2.9.1.1.1.2.6): **0.1%**
    - LP Deposits:
      - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **25M AUSD/USDC**
      - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **25M AUSD/USDC per day**
    - LP Withdraws:
      - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **Unlimited**

##### [Mainnet] Onboard Uniswap v3 AUSD/USDC Swaps & LP

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes-to-grove-for-upcoming-spell/27608)

Uniswap v3 AUSD/USDC Swaps & Liquidity Provision will be onboarded with the following parameters:
- Uniswap v3 AUSD/USDC Pool: [0xbAFeAd7c60Ea473758ED6c6021505E8BBd7e8E5d](https://app.uniswap.org/explore/pools/ethereum/0xbAFeAd7c60Ea473758ED6c6021505E8BBd7e8E5d)
  - USDC: [0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48](https://developers.circle.com/stablecoins/usdc-contract-addresses)
  - AUSD: [0x00000000eFE302BEAA2b3e6e1b18d08D69a9012a](https://docs.agora.finance/developer/contract-deployments)
    - Swaps:
      - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **5M AUSD/USDC**
      - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **100M AUSD/USDC per day**
      - [maxSlippage](https://sky-atlas.io/#A.2.2.9.1.1.1.2.6): **0.1%**
    - LP Deposits:
      - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **25M AUSD/USDC**
      - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **25M AUSD/USDC per day**
    - LP Withdraws:
      - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **Unlimited**
- [Instance Specific Parameters](https://sky-atlas.io/#A.6.1.1.2.2.6.1.3.1.12.2.4)
  - twapSecondsAgo: **600**
  - maxTickDelta: **200**
  - lowerTickBound: **-10**
  - upperTickBound: **+10**

##### [Mainnet] Onboard Curve PYUSD/USDS Swaps

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes-to-grove-for-upcoming-spell/27608)

Curve PYUSD/USDS Swaps will be onboarded with the following parameters:

- Curve PYUSD/USDS Pool: [0xA632D59b9B804a956BfaA9b48Af3A1b74808FC1f](https://www.curve.finance/dex/ethereum/pools/factory-stable-ng-561/deposit)
  - PYUSD: [0x6c3ea9036406852006290770BEdFcAbA0e23A0e8](https://docs.paxos.com/guides/stablecoin/pyusd/mainnet)
  - USDS: [0xdC035D45d973E3EC169d2276DDab16f1e407384F](https://github.com/grove-labs/grove-address-registry/blob/5fd8653a059386b44e4c7f503d5c66547cf90680/src/Ethereum.sol#L26C40-L26C82)
    - Swaps:
      - [maxAmount](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.1): **5M PYUSD/USDS**
      - [Slope](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2.2): **100M PYUSD/USDS per day**
      - [maxSlippage](https://sky-atlas.io/#A.2.2.9.1.1.1.2.6): **0.1%**

##### [Mainnet] Onboard Grove x Steakhouse USDC Morpho Vault

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes-to-grove-for-upcoming-spell/27608)

Grove x Steakhouse USDC Morpho Vault V2 will be onboarded with the following parameters:

- **Grove x Steakhouse USDC V2:** [0xBeefF08dF54897e7544aB01d0e86f013DA354111](https://app.morpho.org/ethereum/vault/0xBeefF08dF54897e7544aB01d0e86f013DA354111/grove-x-steakhouse-usdc)
  - USDC: [0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 ](https://developers.circle.com/stablecoins/usdc-contract-addresses)
    - Deposits:
      - maxAmount:  **20M USDC**
      - Slope: **20M USDC per day**
    - Withdraws:
      - Amount: **Unlimited**
    - Max Exchange Rate:
      - Controllers now have  protections that require a `maxExchangeRate` to be set for deposits. The following ensures that 1 share can represent at most 2 USDC.
        - `setMaxExchangeRate(GROVE_X_STEAKHOUSE_USDC_V2, 1e18, 2e6)`

##### [Mainnet] Onboard Steakhouse PYUSD Morpho Vault

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes-to-grove-for-upcoming-spell/27608)

Steakhouse PYUSD Morpho Vault will be onboarded with the following parameters:

- Steakhouse PYUSD Main: [0xd8A6511979D9C5D387c819E9F8ED9F3a5C6c5379](https://app.morpho.org/ethereum/vault/0xd8A6511979D9C5D387c819E9F8ED9F3a5C6c5379/steakhouse-high-yield-instant?tab=vault)
  - PYUSD: [0x6c3ea9036406852006290770BEdFcAbA0e23A0e8](https://docs.paxos.com/guides/stablecoin/pyusd/mainnet)
    - Deposits:
      - maxAmount: **20M PYUSD**
      - Slope: **20M PYUSD per day**
    - Withdraws:
      - Amount: **Unlimited**
    - Max Exchange Rate:
      - Controllers now have  protections that require a `maxExchangeRate` to be set for deposits. The following ensures that 1 share can represent at most 4 PYUSD (current share price is 2).
        - `setMaxExchangeRate(STEAKHOUSE_PYUSD_MAIN, 1e18, 4e6)`

##### [Mainnet] Onboard Relayers for Grove Liquidity Layer

- **Authorization**: [Governance Poll 1615](https://vote.sky.money/polling/QmVGah9c)
- **Proposal**: [Forum Post](https://forum.sky.money/t/january-29-2026-proposed-changes-to-grove-for-upcoming-spell/27608)

A Secondary Relayer for the MainnetController will be onboarded for Grove, located at [0x9187807e07112359C481870feB58f0c117a29179](https://etherscan.io/address/0x9187807e07112359C481870feB58f0c117a29179#code).

##### [Mainnet] Transfer 2.5 billion GROVE tokens to Grove Labs

- **Authorization**: [A.6.1.1.2.2.1.4.2.1.2.4 - Transfer Of Tokens To Grove Labs](https://sky-atlas.io/#A.6.1.1.2.2.1.4.2.1.2.4)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2026-01-19/27627)

2.5 billion GROVE tokens will be transferred from the Grove SubProxy to Grove Labs at [0x1EBC4425B16FD76F01f9260d8bfFE0c2C6ecCe70](https://etherscan.io/address/0x1EBC4425B16FD76F01f9260d8bfFE0c2C6ecCe70)

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

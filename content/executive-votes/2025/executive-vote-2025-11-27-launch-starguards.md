---
title: Template - [Executive Vote] Launch StarGuards, October Monthly Settlement Cycle and Treasury Management Function, October Ranked Delegate Compensation, Atlas Core Development Compensation, Payment to Gnosis, Add ALLOCATOR-OBEX-A to SP-BEAM, Prime Agent Proxy Spells - November 27, 2025
summary: Launch Starguard for Grove, Keel, and Obex, execute Monthly Settlement Cycle and Treasury Management Function for October, pay Ranked Delegate Compensation for October, make Atlas Core Development USDS and SKY payments for November, make Gnosis payment for the difference between the Sky Savings Rate and the Dai Savings Rate on xDai, add ALLOCATOR-OBEX-A to SP-BEAM, whitelist Spark Proxy Spell in Spark Starguard, execute Keel Proxy Spell. 
date: 2025-11-27T00:00:00.000Z
address: "0xa57d885d8FB034455aADb8c3F3D5414c214cBe3d"
---

# [Executive Proposal] Launch StarGuards, October Monthly Settlement Cycle and Treasury Management Function, October Ranked Delegate Compensation, Atlas Core Development Compensation, Payment to Gnosis, Add ALLOCATOR-OBEX-A to SP-BEAM, Prime Agent Proxy Spells - November 27, 2025

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- StarGuard modules for Grove, Keel, and Obex will be launched.
- The Monthly Settlement Cycle and Treasury Management Function for October 2025 will be executed.
- A total of **23,479 USDS** will be distributed to six Ranked Delegates as compensation for October 2025.
- A total of **66,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development compensation for November 2025.
- **1,806,670 USDS** will be transferred to Gnosis at [0x849D52316331967b6fF1198e5E32A0eB168D039d](https://etherscan.io/address/0x849D52316331967b6fF1198e5E32A0eB168D039d).
- ALLOCATOR-OBEX-A will be added to SP-BEAM, as described below.
- A proxy spell for Spark will be whitelisted in the Spark StarGuard.
- A proxy spell for Keel will be executed.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Launch Grove StarGuard

- **Authorization**: [Governance Poll 1606](https://vote.sky.money/polling/QmdomJ7o)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-starguard-launches-for-grove-keel-and-obex/27441)

If this executive proposal passes, then [StarGuard](https://forum.sky.money/t/launching-starguard-an-upgrade-to-the-sky-agents-governance-payload-execution/27364) will be initialized for Grove proxy spells by executing the following actions:

Call [StarGuardInit.init](https://github.com/sidestream-tech/sky-star-guard/blob/7398ffb283c4490c6e29bea28b92cd57285d4889/deploy/StarGuardInit.sol#L44-L63) with the following parameters:

- `chainlog`: **DssExecLib.LOG**
- `cfg.subProxy`: [0x1369f7b2b38c76B6478c0f0E66D94923421891Ba](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba#code)
- `cfg.subProxyKey`: **GROVE_SUBPROXY**
- `cfg.starGuard`: [0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880#code)
- `cfg.starGuardKey`: **GROVE_STARGUARD**
- `cfg.maxDelay`: **7 days**

Other required actions:

- Add `GROVE_STARGUARD` to the [`StarGuardJob`](https://etherscan.io/address/0xb18d211fa69422a9a848b790c5b4a3957f7aa44e).

### Launch Keel StarGuard

- **Authorization**: [Governance Poll 1606](https://vote.sky.money/polling/QmdomJ7o)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-starguard-launches-for-grove-keel-and-obex/27441)

If this executive proposal passes, then [StarGuard](https://forum.sky.money/t/launching-starguard-an-upgrade-to-the-sky-agents-governance-payload-execution/27364) will be initialized for Keel proxy spells by executing the following actions:

Call [StarGuardInit.init](https://github.com/sidestream-tech/sky-star-guard/blob/7398ffb283c4490c6e29bea28b92cd57285d4889/deploy/StarGuardInit.sol#L44-L63) with the following parameters:

- `chainlog`: **DssExecLib.LOG**
- `cfg.subProxy`: [0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310#code)
- `cfg.subProxyKey`: **KEEL_SUBPROXY**
- `cfg.starGuard`: [0xe8fF70481d653Ec31AB9E0cB2A8B316afF8D84ee](https://etherscan.io/address/0xe8fF70481d653Ec31AB9E0cB2A8B316afF8D84ee#code)
- `cfg.starGuardKey`: **KEEL_STARGUARD**
- `cfg.maxDelay`: **7 days**

Other required actions:

- Add `KEEL_STARGUARD` to the [`StarGuardJob`](https://etherscan.io/address/0xb18d211fa69422a9a848b790c5b4a3957f7aa44e).

### Launch Obex StarGuard

- **Authorization**: [Governance Poll 1606](https://vote.sky.money/polling/QmdomJ7o)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-of-the-starguard-launches-for-grove-keel-and-obex/27441)

If this executive proposal passes, then [StarGuard](https://forum.sky.money/t/launching-starguard-an-upgrade-to-the-sky-agents-governance-payload-execution/27364) will be initialized for Obex proxy spells by executing the following actions:

Call [StarGuardInit.init](https://github.com/sidestream-tech/sky-star-guard/blob/7398ffb283c4490c6e29bea28b92cd57285d4889/deploy/StarGuardInit.sol#L44-L63) with the following parameters:

- `chainlog`: **DssExecLib.LOG**
- `cfg.subProxy`: [0x8be042581f581E3620e29F213EA8b94afA1C8071](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071#code)
- `cfg.subProxyKey`: **OBEX_SUBPROXY**
- `cfg.starGuard`: [0x987f1C31f9935e9926555BcFB76516bb2EcEccaD](https://etherscan.io/address/0x987f1C31f9935e9926555BcFB76516bb2EcEccaD#code)
- `cfg.starGuardKey`: **OBEX_STARGUARD**
- `cfg.maxDelay`: **7 days**

Other required actions:

- Add `OBEX_STARGUARD` to the [`StarGuardJob`](https://etherscan.io/address/0xb18d211fa69422a9a848b790c5b4a3957f7aa44e).

### Monthly Settlement Cycle and Treasury Management Function for October

- **Authorization**: [A.2.5](https://sky-atlas.io/#A.2.5), [A.2.4.1.4.1.1](https://sky-atlas.io/#A.2.4.1.4.1.1), [A.2.4.1.4.1.2](https://sky-atlas.io/#A.2.4.1.4.1.2)
- **Proposal**: [Forum Post](https://forum.sky.money/t/msc-3-settlemnt-summary-october-2025-initial-calculation/27397/3)

If this executive proposal passes, then the October 2025 Monthly Settlement Cycle will be executed by taking the following steps.

#### Spark

- Mint **16,332,535 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Transfer **4,642,240 USDS** from the Surplus Buffer to the Spark SubProxy at [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **4,196,768 USDS debt** in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.

#### Treasury Management Function

- Transfer **3,177,413 USDS** to the Core Council Buffer Multisig at [0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).
- Transfer **158,871 USDS** to the Aligned Delegates Buffer Multisig at [0x37FC5d447c8c54326C62b697f674c93eaD2A93A3](https://etherscan.io/address/0x37FC5d447c8c54326C62b697f674c93eaD2A93A3)

### Delegate Compensation for October 2025

- **Authorization**: [A.1.5](https://sky-atlas.io/#A.1.5)
- **Proposal**: [Forum Post](https://forum.sky.money/t/october-2025-ranked-delegate-compensation/27412)

If this executive proposal passes, then a total of **23,479 USDS** will be distributed to six Ranked Delegates as follows:

| Delegate    | Amount (USDS) | Address                                                                                                               |
|-------------|---------------|-----------------------------------------------------------------------------------------------------------------------|
| AegisD      | 4,000         | [0x78C180CF113Fe4845C325f44648b6567BC79d6E0](https://etherscan.io/address/0x78C180CF113Fe4845C325f44648b6567BC79d6E0) |
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| Sky Staking | 3,783         | [0x05c73AE49fF0ec654496bF4008d73274a919cB5C](https://etherscan.io/address/0x05c73AE49fF0ec654496bF4008d73274a919cB5C) |
| Tango       | 3,696         | [0xB2B86A130B1EC101e4Aed9a88502E08995760307](https://etherscan.io/address/0xB2B86A130B1EC101e4Aed9a88502E08995760307) |

### Atlas Core Development Payments for November 2025

- **Authorization**: [A.2.2.1.1](https://sky-atlas.io/#A.2.2.1.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-core-development-payment-requests-november-2025/27402)

If this executive proposal passes, then a total of **66,584 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for November 2025 as follows.

#### USDS Payments

| Recipient | Amount (USDS) | Address                                                                                                               |
|-----------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 50,167        | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 16,417        | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |

#### SKY Payments

| Recipient | Amount (SKY) | Address                                                                                                               |
|-----------|-------------:|-----------------------------------------------------------------------------------------------------------------------|
| BLUE      | 330,000      | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Cloaky    | 288,000      | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |

### Payment to Gnosis

- **Authorization**: [A.4.1.1.1.1](https://sky-atlas.io/#A.4.1.1.1.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-10/27400)

If this executive proposal passes, then the following transfer will be made for the difference between the Sky Savings Rate and the Dai Savings Rate on xDai:

- Transfer **1,806,670 USDS** to Gnosis at [0x849D52316331967b6fF1198e5E32A0eB168D039d](https://etherscan.io/address/0x849D52316331967b6fF1198e5E32A0eB168D039d).

### Add ALLOCATOR-OBEX-A to SP-BEAM

- **Authorization**: [A.3.7.1.2.3](https://sky-atlas.io/#A.3.7.1.2.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/executive-inclusion-add-allocator-obex-a-to-the-sp-beam/27442)

If this executive proposal passes, then ALLOCATOR-OBEX-A will be added to the SP-BEAM with the following parameters:

- [max](https://sky-atlas.io/#A.3.7.1.2.1.2): **3,000 basis points**
- [min](https://sky-atlas.io/#A.3.7.1.2.1.1): **0 basis points**
- [step](https://sky-atlas.io/#A.3.7.1.2.1.3): **400 basis points**

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark Proxy Spell at [0x2C9E477313EC440fe4Ab6C98529da2793e6890F2](https://etherscan.io/address/0x2C9E477313EC440fe4Ab6C98529da2793e6890F2) with the codehash `0xfad4d50e95e43a5d172619770dac42160a77258693d15be09343c5b29f88c521` will be whitelisted in the Spark StarGuard.

If this executive proposal passes, then a Keel Proxy Spell at [0x2395AF361CdF86d348B07E109E710943AFDb23aa](https://etherscan.io/address/0x2395AF361CdF86d348B07E109E710943AFDb23aa) will be executed.

#### Spark

##### [Mainnet] Arkis Funding

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x9dd06e68b3b109b616cc7cf7af7f1cf78ed9408312bfb9fe43764a3b3dba563a)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-proposed-changes-to-spark-for-upcoming-spell/27418)

A transfer of **4 million USDS** will be made to [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec) to fund the Arkis Strategic Investment.

##### [Mainnet] Onboard B2C2 Penny

- **Authorization**: [Governance Poll 1589](https://vote.sky.money/polling/QmTNrfXk)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-proposed-changes-to-spark-for-upcoming-spell/27418)

B2C2 Penny will be onboarded to provide OTC services for the following tokens with the listed [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2):

- USDC transferAsset
  - Recipient address: [0xa29e963992597b21bcdcaa969d571984869c4ff5](https://etherscan.io/address/0xa29e963992597b21bcdcaa969d571984869c4ff5)
  - maxAmount: **1 million USDC**
  - slope: **20 million USDC per day**
- USDT transferAsset
  - Recipient address: [0xa29e963992597b21bcdcaa969d571984869c4ff5](https://etherscan.io/address/0xa29e963992597b21bcdcaa969d571984869c4ff5)
  - maxAmount: **1 million USDT**
  - slope: **20 million USDT per day**
- PYUSD transferAsset
  - Recipient address: [0xa29e963992597b21bcdcaa969d571984869c4ff5](https://etherscan.io/address/0xa29e963992597b21bcdcaa969d571984869c4ff5)
  - maxAmount: **1 million PYUSD**
  - slope: **20 million PYUSD per day**

##### [Mainnet] Foundation Grant

- **Authorization**: [A.2.9.2.2.2.5.1](https://sky-atlas.io/#A.2.9.2.2.2.5.5.1)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-proposed-changes-to-spark-for-upcoming-spell/27418)

Spark will transfer funding for the December Spark Foundation Grant to the Spark Foundation:

- Payment Amount: **1.1 million USDS**
- Payment Source: **[Spark SubProxy](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4)**
- Payment Receipt Address: [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec) (Spark Foundation)

##### [Mainnet] Claim SparkLend Reserves

- **Authorization**: [A.6.1.1.1.2.6.1.2.1.2.3](https://sky-atlas.io/#A.6.1.1.1.2.6.1.2.1.2.3)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-proposed-changes-to-spark-for-upcoming-spell/27418)

All accrued reserves for SparkLend USDS and SparkLend DAI will be claimed.

##### [Various] Upgrade ALM Controller to v1.8

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xcaafeb100a8ec75ae1e1e9d4059f7d2ec2db31aa55a09be2ec2c7467e0f10799)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-proposed-changes-to-spark-for-upcoming-spell/27418)

The ALM Controller will be upgraded to v1.8 on Mainnet, Base, Arbitrum, Optimism, Unichain, and Avalanche.

#### Keel

##### [Mainnet] Adjust ALM Controller Parameters to Prepare for Solana Launch

- **Authorization**: [Governance Poll 1606](https://vote.sky.money/polling/QmdomJ7o)
- **Proposal**: [Forum Post 1](https://forum.sky.money/t/november-27-2025-prime-technical-scope-parameter-change-for-upcoming-spell/27406), [2](https://forum.sky.money/t/november-27-2025-prime-technical-scope-solana-pre-configuration-for-upcoming-spell/27404)

The ALM controller [rate limit](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2) parameters listed below will be updated for the Solana launch.

###### [Mainnet] LIMIT_USDS_TO_USDC

- Rate limit:
  - maxAmount: **100 million USDS**
  - Slope: **50 million USDS per day**

###### [Mainnet] LIMIT_4626_DEPOSIT - sUSDS (sUSDS Deposit)

- Rate limit:
  - maxAmount: **100 million USDS**
  - Slope: **50 million USDS per day**

###### [Mainnet] LIMIT_4626_WITHDRAW - sUSDS (sUSDS Withdraw)

- Rate limit:
  - maxAmount: **Unlimited**
  - Slope: **0**

###### [Mainnet] LIMIT_USDC_TO_CCTP

- Rate limit:
  - maxAmount: **100 million USDC**
  - Slope: **50 million USDC per day**

###### [Mainnet] LIMIT_USDC_TO_DOMAIN - 5 (Solana)

- Rate limit:
  - maxAmount: **100 million USDS**
  - Slope: **50 million USDS per day**

###### [Mainnet] mintRecipients[5] (CCTP Mint Recipient — to Keel’s Solana ALM Controller)

- destinationDomain: [5](https://developers.circle.com/cctp/v1/supported-domains)
- mintRecipient: **0xcac3764c231540dd2364f24c78fe8f491c08c42ef2ed370f22904eda9ac48609** (Hex encoding of Keel’s Solana ALM Controller’s (base58) PDA: [EeWDutgcKNTdQGJkGRrWYmTXXuKnPUZNvXepbLkQrxW4](https://solscan.io/account/EeWDutgcKNTdQGJkGRrWYmTXXuKnPUZNvXepbLkQrxW4))

###### [Mainnet] LIMIT_LAYERZERO_TRANSFER - Solana (LayerZero/SkyBridge - USDS to Keel’s Solana ALM Controller)

- Rate limit:
  - maxAmount: **100 million USDS**
  - Slope: **50 million USDS per day**

###### [Mainnet] layerZeroRecipients[**30168**] (LayerZero/SkyBridge — Solana)

- destinationEndpointId : [30168](https://docs.layerzero.network/v2/deployments/chains/solana)
- layerZeroRecipient: **0xcac3764c231540dd2364f24c78fe8f491c08c42ef2ed370f22904eda9ac48609** (Hex encoding of Keel’s Solana ALM Controller’s (base58) PDA: [EeWDutgcKNTdQGJkGRrWYmTXXuKnPUZNvXepbLkQrxW4](https://solscan.io/account/EeWDutgcKNTdQGJkGRrWYmTXXuKnPUZNvXepbLkQrxW4))

##### [Solana] Launch Allocation System on Solana

- **Authorization**: [Governance Poll 1606](https://vote.sky.money/polling/QmdomJ7o)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-prime-technical-scope-solana-pre-configuration-for-upcoming-spell/27404)

[Rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2) for the parameters listed below will be updated for the Solana Allocation System launch.

###### [Solana] USDS-Reserve

- Address: [FfpyJhTfxKfDJSode3YNZCxEkPRZ2shBv9gU5PTWCCEk](https://solscan.io/account/FfpyJhTfxKfDJSode3YNZCxEkPRZ2shBv9gU5PTWCCEk)
- General:
  - status: **ReserveStatus::Active**
  - mint: [USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA](https://solscan.io/token/USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA) (USDS Token Mint)
- Rate limit:
  - maxAmount: **25 million USDS**
  - Slope: **10 million USDS per day**

###### [Solana] USDC-Reserve

- Address: [ELdtQWuDKswV5ddhWqHn1EgRDdv5E6mtuhEVhqksYEpi](https://solscan.io/account/ELdtQWuDKswV5ddhWqHn1EgRDdv5E6mtuhEVhqksYEpi)
- General:
  - status: **ReserveStatus::Active**
  - mint: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/account/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v) (USDC Token Mint)
- Rate limit:
  - maxAmount: **25 million USDC**
  - Slope: **10 million USDC per day**

###### [Solana] USDT-Reserve

- Address: [3g74M93WWad6KuZoiwkAxPQsVZBuHhzpirBs73WPJ27W](https://solscan.io/account/3g74M93WWad6KuZoiwkAxPQsVZBuHhzpirBs73WPJ27W)
- General:
  - status: **ReserveStatus::Active**
  - mint: [Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB](https://solscan.io/token/Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB) (USDT Token Mint)
- Rate limit:
  - maxAmount: **25 million USDT**
  - Slope: **10 million USDT per day**

###### [Solana] CctpBridge-USDC-Integration

- Address: [zYyBzzLkH97TdBH7xNcM2TJEyvYejCnPCdCh2LYC3q8](https://solscan.io/account/zYyBzzLkH97TdBH7xNcM2TJEyvYejCnPCdCh2LYC3q8)
- General:
  - integration_type: **IntegrationType::CctpBridge**
  - status: **IntegrationStatus::Active**
  - description: **USDC CctpBridge**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDC**
  - Slope: **10 million USDC per day**
- Inner:
  - cctp_token_messenger_minter: [CCTPiPYPc6AsJuwueEnWgSgucamXDZwBd53dQ11YiKX3](https://solscan.io/account/CCTPiPYPc6AsJuwueEnWgSgucamXDZwBd53dQ11YiKX3)
  - cctp_message_transmitter: [CCTPmbSD7gX1bxKPAmg77w8oFzNFpaQiQUWD43TKaecd](https://solscan.io/account/CCTPmbSD7gX1bxKPAmg77w8oFzNFpaQiQUWD43TKaecd)
  - mint: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v) (USDC)
  - destination_address: [0xa5139956eC99aE2e51eA39d0b57C42B6D8db0758](https://etherscan.io/address/0xa5139956eC99aE2e51eA39d0b57C42B6D8db0758) (Keel ALM Proxy)
  - destination_domain: **0 (Ethereum Mainnet)**

###### [Solana] LzBridge-USDS-Integration

- Address: [93bmMnKLgBXLMMfqVk53DzMAR4JcE3m5WX5hdTrUopuM](https://solscan.io/account/93bmMnKLgBXLMMfqVk53DzMAR4JcE3m5WX5hdTrUopuM)
- General:
  - integration_type: **IntegrationType::LzBridge**
  - status: **IntegrationStatus::Active**
  - description: **USDS LzBridge**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDS**
  - Slope: **10 million USDS per day**
- Inner:
  - program: [SKYTAiJRkgexqQqFoqhXdCANyfziwrVrzjhBaCzdbKW](https://solscan.io/account/SKYTAiJRkgexqQqFoqhXdCANyfziwrVrzjhBaCzdbKW) (Sky USDS OFT)
  - mint: [USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA](https://solscan.io/account/USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA) (USDS)
  - oft_store: [BEvTHkTyXooyaJzP8egDUC7WQK8cyRrq5WvERZNWhuah](https://solscan.io/account/BEvTHkTyXooyaJzP8egDUC7WQK8cyRrq5WvERZNWhuah)
  - oft_token_escrow: [8GVwe5nYwqkC9udmj1LsGMD5pYDq2ZtKH9YNrzWzV3Z2](https://solscan.io/account/8GVwe5nYwqkC9udmj1LsGMD5pYDq2ZtKH9YNrzWzV3Z2)
  - peer_config: [CwL294rKs4a18rAKDnDs18JsSVoA5Cgz1ekwVPqsQgfR](https://solscan.io/account/CwL294rKs4a18rAKDnDs18JsSVoA5Cgz1ekwVPqsQgfR)
  - destination_address: [0xa5139956eC99aE2e51eA39d0b57C42B6D8db0758](https://etherscan.io/address/0xa5139956eC99aE2e51eA39d0b57C42B6D8db0758) (Keel ALM Proxy)
  - destination_eid: **30101 (Ethereum Mainnet)**

###### [Solana] USDS/USDC-Switchboard-Feed (Oracle)

- Address: [4ATfhXp6LibWDgzMZMQ729Q2qmnpxr319e5cSTXsxgrk](https://solscan.io/account/4ATfhXp6LibWDgzMZMQ729Q2qmnpxr319e5cSTXsxgrk)
- General:
  - queue: [A43DyUGA7s8eXPxqEjJY6EBu1KKbNgfxF8h17VAHn13w](https://solscan.io/account/A43DyUGA7s8eXPxqEjJY6EBu1KKbNgfxF8h17VAHn13w) (Primary mainnet queue)
  - max_variance: **1%**
  - min_job_responses: **1**
  - min_sample_size: **1**
  - max_staleness: **100 (slots)**
  - auth_only_updates: **false**

###### [Solana] USDS-USDC-AtomicSwap-Integration

- Address: [3vAnLvHHERj4xdnrGhMcBpdL7p4RtyisgggHq78MWGSw](https://solscan.io/account/3vAnLvHHERj4xdnrGhMcBpdL7p4RtyisgggHq78MWGSw)
- General:
  - integration_type: **IntegrationType::AtomicSwap**
  - status: **IntegrationStatus::Active**
  - description: **USDS->USDC AtomicSwap**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDS**
  - Slope: **10 million USDS per day**
- Oracle ([GgnDDij1tbhj52d3AA3jPDhUMSz3LhdeNUDwSt1RcUze](https://solscan.io/account/GgnDDij1tbhj52d3AA3jPDhUMSz3LhdeNUDwSt1RcUze)):
  - oracle_type: **Switchboard**
  - price_feed: [4ATfhXp6LibWDgzMZMQ729Q2qmnpxr319e5cSTXsxgrk](https://solscan.io/account/4ATfhXp6LibWDgzMZMQ729Q2qmnpxr319e5cSTXsxgrk)
  - base_mint: [USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA](https://solscan.io/token/USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA)
  - quote_mint: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v)
- Inner:
  - input_token: [USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA](https://solscan.io/token/USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA) (USDS Token Mint)
  - output_token: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v) (USDC Token Mint)
  - status: **active**
  - oracle: [GgnDDij1tbhj52d3AA3jPDhUMSz3LhdeNUDwSt1RcUze](https://solscan.io/account/GgnDDij1tbhj52d3AA3jPDhUMSz3LhdeNUDwSt1RcUze)
  - max_staleness: **100 (slots, approx 30 seconds)**
  - expiry_timestamp: **i64::MAX (never)**
  - max_slippage_bps: **10**
  - oracle_price_inverted: **false**

###### [Solana] USDT/USDC-Switchboard-Feed (Oracle)

- Address: [EQWQQhg9KajosBpZ2sYqEgPfNm6wdmWwGNAkVMocQSz4](https://solscan.io/account/EQWQQhg9KajosBpZ2sYqEgPfNm6wdmWwGNAkVMocQSz4)
- General:
  - queue: [A43DyUGA7s8eXPxqEjJY6EBu1KKbNgfxF8h17VAHn13w](https://solscan.io/account/A43DyUGA7s8eXPxqEjJY6EBu1KKbNgfxF8h17VAHn13w) (Primary mainnet queue)
  - max_variance: **1%**
  - min_job_responses: **1**
  - min_sample_size: **1**
  - max_staleness: **100 (slots)**
  - auth_only_updates: **false**

###### [Solana] USDC-USDT-AtomicSwap-Integration

- Address: [Efy1EWHmJzckFqpAbDzxnsMXwBu5Jf13BMXXf2fMUUcs](https://solscan.io/account/Efy1EWHmJzckFqpAbDzxnsMXwBu5Jf13BMXXf2fMUUcs)
- General:
  - integration_type: **IntegrationType::AtomicSwap**
  - status: **IntegrationStatus::Active**
  - description: **USDC->USDT AtomicSwap**
  - permit_liquidation: **false**
- Rate limit:
  - maxAmount: **25 million USDC**
  - Slope: **10 million USDC per day**
- Oracle ([E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn](https://solscan.io/account/E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn)):
  - oracle_type: **Switchboard**
  - price_feed: [EQWQQhg9KajosBpZ2sYqEgPfNm6wdmWwGNAkVMocQSz4](https://solscan.io/account/EQWQQhg9KajosBpZ2sYqEgPfNm6wdmWwGNAkVMocQSz4)
  - base_mint: [Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB](https://solscan.io/token/Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB)
  - quote_mint: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v)
- Inner:
  - input_token: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v) (USDC Token Mint)
  - output_token: [Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB](https://solscan.io/token/Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB) (USDT Token Mint)
  - status: **active**
  - oracle: [E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn](https://solscan.io/account/E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn)
  - max_staleness: **100 (slots, approx 30 seconds)**
  - expiry_timestamp: **i64::MAX (never)**
  - max_slippage_bps: **10**
  - oracle_price_inverted: **true**

###### [Solana] USDT-USDC-AtomicSwap-Integration

- Address: [EGbTPmtHB4MJ99pjbrZhquqhMGGixEev9TKQbsX4ioyV](https://solscan.io/account/EGbTPmtHB4MJ99pjbrZhquqhMGGixEev9TKQbsX4ioyV)
- General:
  - integration_type: **IntegrationType::AtomicSwap**
  - status: **IntegrationStatus::Active**
  - description: **USDT->USDC AtomicSwap**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDT**
  - Slope: **10 million USDT per day**
- Oracle ([E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn](https://solscan.io/account/E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn):
  - oracle_type: Switchboard
  - price_feed: [EQWQQhg9KajosBpZ2sYqEgPfNm6wdmWwGNAkVMocQSz4](https://solscan.io/account/EQWQQhg9KajosBpZ2sYqEgPfNm6wdmWwGNAkVMocQSz4)
  - base_mint: [Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB](https://solscan.io/token/Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB)
  - quote_mint: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v)
- Inner:
  - input_token: [Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB](https://solscan.io/token/Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB) (USDT Token Mint)
  - output_token: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v) (USDC Token Mint)
  - status: **active**
  - oracle: [E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn](https://solscan.io/account/E6QFLWgPoDHydKVwEc5Ar49k1zMQ19qM8A9NFxjoSitn)
  - max_staleness: **100 (slots, approx 30 seconds)**
  - expiry_timestamp: **i64::MAX (never)**
  - max_slippage_bps: **10**
  - oracle_price_inverted: **false**

##### [Solana] Onboard various Kamino vaults

- **Authorization**: [Governance Poll 1606](https://vote.sky.money/polling/QmdomJ7o)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-prime-technical-scope-solana-pre-configuration-for-upcoming-spell/27404)

Various Kamino vaults will be onboarded on Solana with the following [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2).

###### [Solana] Kamino-Main-USDC-Integration

- Address: [GZ6vUcBZk4QiaBUhhn1TpX6S7FiXK71Pogke1RnBc3zA](https://solscan.io/account/GZ6vUcBZk4QiaBUhhn1TpX6S7FiXK71Pogke1RnBc3zA)
- General:
  - integration_type: **IntegrationType::Kamino**
  - status: **IntegrationStatus::Active**
  - description: **Kamino Main USDC**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDC**
  - Slope: **10 million USDC per day**
- Inner:
  - market: [7u3HeHxYDLhnCoErrtycNokbQYbWGzLs6JSDqGAv5PfF](https://solscan.io/account/7u3HeHxYDLhnCoErrtycNokbQYbWGzLs6JSDqGAv5PfF)
  - reserve: [D6q6wuQSrifJKZYpR1M8R4YawnLDtDsMmWM1NbBmgJ59](https://solscan.io/account/D6q6wuQSrifJKZYpR1M8R4YawnLDtDsMmWM1NbBmgJ59)
  - reserve_liquidity_mint: [EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v](https://solscan.io/token/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v)
  - obligation_id: **0**

###### [Solana] Kamino-Main-USDS-Integration

- Address: [H5Vix4RGchYq1cemoe61y7J4j4v3XgWPGLBeqvPEgvzr](https://solscan.io/account/H5Vix4RGchYq1cemoe61y7J4j4v3XgWPGLBeqvPEgvzr)
- General:
  - integration_type: **IntegrationType::Kamino**
  - status: **IntegrationStatus::Active**
  - description: **Kamino Main USDS**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDS**
  - Slope: **10 million USDS per day**
- Inner:
  - market: [7u3HeHxYDLhnCoErrtycNokbQYbWGzLs6JSDqGAv5PfF](https://solscan.io/account/7u3HeHxYDLhnCoErrtycNokbQYbWGzLs6JSDqGAv5PfF)
  - reserve: [BHUi32TrEsfN2U821G4FprKrR4hTeK4LCWtA3BFetuqA](https://solscan.io/account/BHUi32TrEsfN2U821G4FprKrR4hTeK4LCWtA3BFetuqA)
  - reserve_liquidity_mint: [USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA](https://solscan.io/token/USDSwr9ApdHk5bvJKMjzff41FfuX8bSxdKcR81vTwcA)
  - obligation_id: **0**

###### [Solana] Kamino-Main-USDT-Integration

- Address: [ArpjQUCqHvtDQZFR2tFbPPEKYiQHuaJkcFQBdW5NQC4U](https://solscan.io/account/ArpjQUCqHvtDQZFR2tFbPPEKYiQHuaJkcFQBdW5NQC4U)
- General:
  - integration_type: **IntegrationType::Kamino**
  - status: **IntegrationStatus::Active**
  - description: **Kamino Main USDT**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDT**
  - Slope: **10 million USDT per day**
- Inner:
  - market: [7u3HeHxYDLhnCoErrtycNokbQYbWGzLs6JSDqGAv5PfF](https://solscan.io/account/7u3HeHxYDLhnCoErrtycNokbQYbWGzLs6JSDqGAv5PfF)
  - reserve: [H3t6qZ1JkguCNTi9uzVKqQ7dvt2cum4XiXWom6Gn5e5S](https://solscan.io/account/H3t6qZ1JkguCNTi9uzVKqQ7dvt2cum4XiXWom6Gn5e5S)
  - reserve_liquidity_mint: [Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB](https://solscan.io/account/Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB) (USDT Mint)
  - obligation_id: **0**

##### [Solana] Onboard various Drift vaults

- **Authorization**: [Governance Poll 1606](https://vote.sky.money/polling/QmdomJ7o)
- **Proposal**: [Forum Post](https://forum.sky.money/t/november-27-2025-prime-technical-scope-solana-pre-configuration-for-upcoming-spell/27404)

Various Drift vaults will be onboarded on Solana with the following [rate limits](https://sky-atlas.io/#A.2.3.9.1.1.1.2.2).

###### [Solana] Drift-MainMarket-USDC-Integration

- Address: [ET3k7uBeXLmeVQW5Tm8xBnLte9FgUSRebgneT57wjuqL](https://solscan.io/account/ET3k7uBeXLmeVQW5Tm8xBnLte9FgUSRebgneT57wjuqL)
- General:
  - integration_type: **IntegrationType::Drift**
  - status: **IntegrationStatus::Active**
  - description: **Drift Main USDC**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDC**
  - Slope: **10 million USDC per day**
- Inner:
  - market_idx: **0**
  - sub_account_id: **0**
  - pool_id: **0 (Main Market)**

###### [Solana] Drift-Main-USDS-Integration

- Address: [DFrV1Nyfvoucz3nofVRGFmhWAxV1qz1xQxz5rQi4MNot](https://solscan.io/account/DFrV1Nyfvoucz3nofVRGFmhWAxV1qz1xQxz5rQi4MNot)
- General:
  - integration_type: **IntegrationType::Drift**
  - status: **IntegrationStatus::Active**
  - description: **Drift Main USDS**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDS**
  - Slope: **10 million USDS per day**
- Other:
  - market_idx: **28**
  - sub_account_id: **0**
  - pool_id: **0 (Main Market)**

###### [Solana] Drift-MainMarket-USDT-Integration

- Address: [Gb8TLtzWtUVVm5VaEXeZS7hdeXMc675PBvWimeep6aU1](https://solscan.io/account/Gb8TLtzWtUVVm5VaEXeZS7hdeXMc675PBvWimeep6aU1)
- General:
  - integration_type: **IntegrationType::Drift**
  - status: **IntegrationStatus::Active**
  - description: **Drift Main USDT**
  - permit_liquidation: **true**
- Rate limit:
  - maxAmount: **25 million USDT**
  - Slope: **10 million USDT per day**
- Inner:
  - market_idx: **5**
  - sub_account_id: **0**
  - pool_id: **0 (Main Market)**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

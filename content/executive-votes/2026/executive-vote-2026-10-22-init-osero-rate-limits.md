---
title: Template - [Executive Vote] Add Initial Rate Limits for Osero, Prime Agent Proxy Spells - October 22, 2026
summary: Configure initial rate limits for the Osero x Gauntlet USDC Prime Vault deposit key, whitelist Prime Agent proxy spells for Spark, Grove, and Pattern.
date: 2026-10-22T00:00:00.000Z
address: "$spell_address"
---

# [Executive Proposal] Add Initial Rate Limits for Osero, Prime Agent Proxy Spells - October 22, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Initial rate limits for the Osero x Gauntlet USDC Prime Vault deposit key will be set.
- Proxy spells for Spark, Grove, and Pattern will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Add Initial Rate Limits for Osero x Gauntlet USDC Prime Vault

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#cb293144-de0c-4bd8-9971-d96327b38ae9)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-osero-for-upcoming-spell/28297)

If this executive proposal passes, then the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) will be set as the default values for the deposit key of the Osero x Gauntlet USDC Prime Vault. This permits the Osero Operator Multisig (Osero's cBEAM) to raise the vault deposit slope from 0 to 650,000 USDC per day through the Configurator, without an Osero spell.

- `maxAmount`: **5 million USDC**
- `slope`: **650,000 USDC per day**

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [`0x78E4439ae74447992b111A73556a188229D34C37`](https://etherscan.io/address/0x78E4439ae74447992b111A73556a188229D34C37) and codehash `0x08c335ce1b2ad471186a566f08889631b3268cc74dc478b07e3c77f71c312166` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [`0xf9449D21ef687eE55233B9EDC3d7DDA87C7562a7`](https://etherscan.io/address/0xf9449D21ef687eE55233B9EDC3d7DDA87C7562a7) and codehash `0x7c9f6ed4604e78848e7b368736b8ae59f2209c6687977128a8302fafe1d6526c` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

If this executive proposal passes, then a Pattern proxy spell with address [`0xb38EB4a6f0Ae439a454EED67877f5aC7e66A7652`](https://etherscan.io/address/0xb38EB4a6f0Ae439a454EED67877f5aC7e66A7652) and codehash `0x2b3da408f1feea10a958fd5678dfe409d54500e8f1dfc2d0fe22c6b49b41b10c` will be whitelisted in the [Pattern StarGuard](https://etherscan.io/address/0x2fb18b28fB39Ec3b26C3B5AF5222e2ca3B8B2269).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/208).

##### [Arbitrum] Spark Liquidity Layer - Bridge 100,000,000 sUSDS from the Ethereum ALM Proxy to the Arbitrum ALM Proxy

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x47341f1ff9453d3f3c6b088ebe1137c17a14536dde08aed2581019ca7ccef2f8)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-spark-for-upcoming-spell/28298)

If this executive proposal passes, **100 million sUSDS** will be bridged from the [Ethereum ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E) to the [Arbitrum ALM Proxy](https://arbiscan.io/address/0x92afd6F2385a90e44da3a8B60fe36f6cBe1D8709).

##### [Ethereum] SparkLend - Decrease WETH Interest Rate Model Slope 2 From 75% to 30%

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-spark-for-upcoming-spell/28298)

If this executive proposal passes, the WETH market's [Interest Rate Model](https://sky-atlas.io/#9006fd8d-bd13-48fc-bf2f-04f47579b3b0) will be updated to reduce the [slope 2](https://sky-atlas.io/#56bc7808-5ef8-42af-ba17-708b995194cc) parameter by 45 percentage points, from 75% to **30%**.

##### [Ethereum] SparkLend - Update PYUSD, RLUSD and USDG Interest Rate Models to 80% Optimal Utilization, SSR + 0.20% Base Rate, 0.20% Slope 1 and 15% Slope 2

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-spark-for-upcoming-spell/28298)

If this executive proposal passes, the PYUSD, RLUSD and USDG markets' [Interest Rate Models](https://sky-atlas.io/#9006fd8d-bd13-48fc-bf2f-04f47579b3b0) will be updated with the following parameters:

- [Optimal Utilization](https://sky-atlas.io/#a6677e8a-7ef1-460b-a5cd-5411319bf2c0): **80%**
- [Base Rate](https://sky-atlas.io/#9372deb9-5115-4010-bf72-34023b846525): **SSR + 0.20%**
- [Slope 1](https://sky-atlas.io/#c16b2b24-d663-4877-8bb3-cbd32e977360): **0.20%**
- [Slope 2](https://sky-atlas.io/#56bc7808-5ef8-42af-ba17-708b995194cc): **15%**

##### [Ethereum] Spark Treasury - Transfer 865,000 USDS to the Spark Foundation and 45,000 USDS to the Spark Assets Foundation for November 2026

- **Authorization**: [Governance Poll](https://vote.sky.money/polling/QmQBiM5W)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-spark-for-upcoming-spell/28298)

If this executive proposal passes, **865,000 USDS** will be transferred from the Spark SubProxy to the Spark Foundation at [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec), and **45,000 USDS** will be transferred from the Spark SubProxy to the Spark Assets Foundation at [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911).

##### [Ethereum] Spark Treasury - Transfer 341,970 USDS to the Spark Operations Multisig for SPK Buybacks

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#dfa483c7-5adb-480e-9f82-c97cf4d0f74e)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-spark-for-upcoming-spell/28298)

If this executive proposal passes, **341,970 USDS** will be transferred from the [Spark SubProxy](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4) to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to fund SPK buybacks.

##### [Ethereum] SparkLend - Claim Accrued SparkLend Reserves

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-spark-for-upcoming-spell/28298)

If this executive proposal passes, then the Spark proxy spell will claim all accrued SparkLend reserves and transfer them as follows:

- DAI, USDS, USDC, PYUSD, USDT, USDG, and RLUSD reserves will be transferred to the [Spark ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E).
- All other reserves will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC).

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/85).

##### [Ethereum] Grove Treasury - Transfer 800,000 USDS to the Grove Foundation Multisig for October 2026

- **Authorization**: [Governance Poll](https://vote.sky.money/polling/QmQBiM5W)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-grove-for-upcoming-spell/28296)

If this executive proposal passes, **800,000 USDS** will be transferred from the [Grove SubProxy](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) to the [Grove Foundation Multisig](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

##### [Avalanche] Grove Executor - Revoke SUBMISSION_ROLE from the Grove Circle CCTP v1 Governance Relay Receiver

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x7659f7a429ab635b7c41796c80f2f730008fe3dd2beb603f7ced05b7ac9cada8)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/october-22-2026-proposed-changes-to-grove-for-upcoming-spell/28296)

If this executive proposal passes, the CCTP v1 relay to Avalanche will be retired by revoking `SUBMISSION_ROLE` from the [Grove Circle CCTP v1 Governance Relay Receiver](https://snowtrace.io/address/0x26e9512547feC1906C55256e491DfB6673D8C23f) on the Grove Executor on Avalanche. The CCTP v2 governance relay was authorized in the June 4, 2026 spell.

#### Pattern Proxy Spell

The Pull Request for the Pattern proxy spell can be viewed [here](https://github.com/Pattern-Dev-Co/pattern-spells/pull/3).

##### [Ethereum] Pattern Liquidity Layer - Onboard the River I Allocation to River SPV II as a USDC Transfer Asset with a maxAmount of 35,000,000 USDC and slope of 10,000,000 USDC per day

- **Authorization**: [Governance Poll](https://vote.sky.money/polling/QmQBiM5W)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/technical-scope-for-the-october-22-2026-pattern-prime-spell/28295)

If this executive proposal passes, the LIMIT_ASSET_TRANSFER [rate limit](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5) will be set with the following parameters. This will permit the Pattern ALM Proxy to transfer USDC to the specified `RIVER_SPV_2_OFFRAMP` address.

- `key`: **0x9e89eef868db62cc103dac9e8428957603e3ff835526132d10b5f1f327fc7605**
  - `asset`: [**0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48**](https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48) (USDC address)
  - `destination`: [**0xfD2cB7Ebbb339B9AA4E9C60e5aFa460F4888320F**](https://etherscan.io/address/0xfD2cB7Ebbb339B9AA4E9C60e5aFa460F4888320F) (`RIVER_SPV_2_OFFRAMP`)
- `maxAmount`: **35 million USDC**
- `slope`: **10 million USDC per day**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

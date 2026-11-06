---
title: Template - [Executive Vote] Finalize GUSD and USDP PSM Offboarding, Skybase Foundation Grant, Adjust Spark DC-IAM Parameters, Update Safe Harbor Agreement, Prime Agent Proxy Spells - November 5, 2026
summary: Finalize the GUSD and USDP PSM offboardings, transfer 900,000 USDS from the Skybase SubProxy to the Skybase Foundation, increase the ALLOCATOR-SPARK-A DC-IAM cooldown, update the Safe Harbor Agreement, and whitelist Prime Agent proxy spells for Spark and Grove.
date: 2026-11-05T00:00:00.000Z
address: "0xaBc702420dCc1868F7f8Df06A89dA766BcB01136"
---

# [Executive Proposal] Finalize GUSD and USDP PSM Offboarding, Skybase Foundation Grant, Adjust Spark DC-IAM Parameters, Update Safe Harbor Agreement, Prime Agent Proxy Spells - November 5, 2026

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The offboarding of the GUSD and USDP Peg Stability Modules (PSMs) will be finalized.
- **900,000 USDS** will be transferred from the Skybase SubProxy to the Skybase Foundation.
- The Debt Ceiling Instant Access Module (DC-IAM) cooldown for `ALLOCATOR-SPARK-A` will be increased.
- The Safe Harbor Agreement will be updated.
- Proxy spells for Spark and Grove will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**48 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Finalize GUSD and USDP PSM Offboarding

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#0d0e2e1a-0502-4ee3-bc9d-8bd8ddde19ec)
- **Proposal**: [PSM-GUSD-A and PSM-PAX-A Housekeeping](https://forum.skyeco.com/t/psm-gusd-a-and-psm-pax-a-housekeeping/28373)

If this executive proposal passes, then the offboarding of the `PSM-GUSD-A` and `PSM-PAX-A` PSMs will be finalized through the following actions.

#### PSM-GUSD-A

- Write off any remaining debt associated with the `PSM-GUSD-A` PSM position through the Vat, with the residual debt accounted for in the Vow.
- Remove `PSM-GUSD-A` from the Ilk Registry and `LINE_MOM`.
- Cage `MCD_JOIN_PSM_GUSD_A` and revoke its authorization on the Vat.
- Revoke the `MCD_CLIP_PSM_GUSD_A` Clipper's authorizations on the Vat and Dog.
- Remove the following entries from the Chainlog:
  - `MCD_PSM_GUSD_A`
  - `MCD_JOIN_PSM_GUSD_A`
  - `MCD_CLIP_PSM_GUSD_A`
  - `MCD_CLIP_CALC_PSM_GUSD_A`
  - `MCD_PSM_GUSD_A_JAR`
  - `MCD_PSM_GUSD_A_INPUT_CONDUIT_JAR`

#### PSM-PAX-A (USDP)

- Write off any remaining debt associated with the `PSM-PAX-A` PSM position through the Vat, with the residual debt accounted for in the Vow.
- Remove `PSM-PAX-A` from the Ilk Registry and `LINE_MOM`.
- Cage `MCD_JOIN_PSM_PAX_A` and revoke its authorization on the Vat.
- Revoke the `MCD_CLIP_PSM_PAX_A` Clipper's authorizations on the Vat and Dog.
- Remove the following entries from the Chainlog:
  - `MCD_PSM_PAX_A`
  - `MCD_JOIN_PSM_PAX_A`
  - `MCD_CLIP_PSM_PAX_A`
  - `MCD_CLIP_CALC_PSM_PAX_A`
  - `MCD_PSM_PAX_A_JAR`
  - `MCD_PSM_PAX_A_INPUT_CONDUIT_JAR`

Following these changes, the Chainlog version will be updated from `1.20.21` to `1.20.22`.

### Skybase Foundation Grant

- **Authorization**: [Sky Governance Poll](https://vote.sky.money/polling/QmYNuyHd)
- **Proposal**: [November 5, 2026 - Skybase Foundation Grant: 900,000 USDS SubProxy Transfer](https://forum.skyeco.com/t/november-5-2026-skybase-foundation-grant-900-000-usds-subproxy-transfer/28359)

If this executive proposal passes, then [`SUBPROXY_METHODS`](https://etherscan.io/address/0x5162489F4FEa651b76c75193387d08aAAC9CB52C) will be used to transfer **900,000 USDS** from [`SKYBASE_SUBPROXY`](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140) to the [Skybase Foundation Operational Multisig](https://etherscan.io/address/0x58B945c8Ce34BD8cEA3Fc0437626F9F87d58A621).

The transfer uses existing funds held by the Skybase SubProxy; it does not mint new USDS debt.

### Adjust ALLOCATOR-SPARK-A DC-IAM Parameters

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#41a1ae38-4f5c-468f-b6ba-47e16ecc5aec)
- **Proposal**: [November 5, 2026 Proposed Changes to Spark for Upcoming Spell](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-spark-for-upcoming-spell/28351)

If this executive proposal passes, then the following DC-IAM parameters will apply to `ALLOCATOR-SPARK-A`:

- Increase the [Ceiling Increase Cooldown (`ttl`)](https://sky-atlas.io/#a5ae79ad-9460-41a3-8dbf-65605f54b79b) by 43,200 seconds, from 43,200 seconds (12 hours) to **86,400 seconds (24 hours)**.
- Leave the [Maximum Debt Ceiling (`line`)](https://sky-atlas.io/#6ba18f25-dae8-4fa5-929e-3c7071b70107) unchanged at **10 billion USDS**.
- Leave the [Target Available Debt (`gap`)](https://sky-atlas.io/#07353080-4346-4ffd-bfc8-913cac78776a) unchanged at **1.5 billion USDS**.

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3 - Safe Harbor Modifications](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, then the Safe Harbor Agreement will be updated to include the following accounts on **Base** (`eip155:8453`).

- PAS BeamState: [`0x29840a8519013F483d94781b5C1671b552A109e1`](https://basescan.org/address/0x29840a8519013F483d94781b5C1671b552A109e1)
- PAS Configurator: [`0x458Acd38fD749F6325039e63e8Bc496dBc286D11`](https://basescan.org/address/0x458Acd38fD749F6325039e63e8Bc496dBc286D11)
- PAS Timelock: [`0x2ACADc011b4fc13072F92231D1216c16deac5188`](https://basescan.org/address/0x2ACADc011b4fc13072F92231D1216c16deac5188)
- CCTP V2 facet: [`0xb22d50c393c6E1D13E3e05B172448dD8BF8DdC32`](https://basescan.org/address/0xb22d50c393c6E1D13E3e05B172448dD8BF8DdC32)
- Spark Diamond PAU Beacon: [`0x7ac96180C4d6b2A328D3a19ac059D0E7Fc3C6d41`](https://basescan.org/address/0x7ac96180C4d6b2A328D3a19ac059D0E7Fc3C6d41)
- PAU Factory: [`0x011A115b5498B85b3d12245A3a7296F77325B5C3`](https://basescan.org/address/0x011A115b5498B85b3d12245A3a7296F77325B5C3)
- PAU Administered Agent Factory: [`0xD711DbfD937a45e2C89CA0D4781cfa5BAb32e752`](https://basescan.org/address/0xD711DbfD937a45e2C89CA0D4781cfa5BAb32e752)

### Prime Agent Proxy Spells

If this executive proposal passes, then the Spark proxy spell with address [`0x9C3991A36aE899c7b267208bad2cC1237BE36F5b`](https://etherscan.io/address/0x9C3991A36aE899c7b267208bad2cC1237BE36F5b) and codehash `0x084497cc546ef29a5597591d820a3342a0b7687bcbd6fed504830f915a4422d9` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then the Grove proxy spell with address [`0xb7fdd2f1efE69EC2145A914bCEB23D48de4Bb74D`](https://etherscan.io/address/0xb7fdd2f1efE69EC2145A914bCEB23D48de4Bb74D) and codehash `0x205f19d44421f601f530310481a88bbd037f1d114e82e9cd5d82ccf828b45ee3` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark Proxy Spell

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/209).

##### [Ethereum] Spark Liquidity Layer - Onboard Mint and Redeem of OUSD

- **Authorization**: [Spark Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x49ea98e37b49e441c62a5747225794d7351624af28e7ab3a52d18ededde95263)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-spark-for-upcoming-spell/28351)

If this executive proposal passes, then the Spark proxy spell will enable the Spark Liquidity Layer to mint and redeem [OUSD](https://etherscan.io/address/0x9f6F3991D525015a6F8CaF062C83b62fD3AC4436) through Bridge deposit addresses, with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- OUSD mint leg — USDC transfer rate limit (`LIMIT_ASSET_TRANSFER`):
  - Destination: [Bridge USDC deposit address](https://etherscan.io/address/0xCeB913e6CB36651af7FA4585F6C8F0e81C015A5F)
  - `maxAmount`: **5 million USDC**
  - `slope`: **50 million USDC per day**
- OUSD redemption leg — OUSD transfer rate limit (`LIMIT_ASSET_TRANSFER`):
  - Destination: [Bridge OUSD deposit address](https://etherscan.io/address/0x3539f3f7F3A368EAf87315cE56ea2834a6e6a195)
  - `maxAmount`: **5 million OUSD**
  - `slope`: **200 million OUSD per day**

##### [Ethereum] Spark Liquidity Layer - Onboard Uniswap v4 OUSD/USDS Pool

- **Authorization**: [Spark Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xb74887a3c9d89ce3d72b97b8e10f1e2ee4588115e65755e09b3117c9e31a6ce0)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-spark-for-upcoming-spell/28351)

If this executive proposal passes, then the Spark proxy spell will onboard the [Uniswap v4](https://developers.uniswap.org/docs/protocols/v4/concepts/architecture) OUSD/USDS pool for the Spark Liquidity Layer with the following configuration:

- Uniswap v4 Parameters:
  - Pool ID: `0x710254704dfff19aee863a784a36823eb9c926cae8d3d425080d7c88c144a9c7`
  - Pool fee parameter: **0.0005%**
  - tick spacing: **1**
  - hooks: **none**
  - Position tick limits: **276,314 to 276,334**, with a **10-tick** deviation around the configured center
- Deposit rate limit parameters:
  - `maxAmount`: **10 million USDS**
  - `slope`: **50 million USDS per day**
- Withdrawal rate limit parameters:
  - `maxAmount`: **Unlimited**
- Swap rate limit parameters:
  - `maxAmount`: **5 million USDS**
  - `slope`: **100 million USDS per day**
  - Maximum slippage: **0.1%** (`0.999e18`)

All three pool-action rate limits above are denominated in **USDS terms**.

##### [Ethereum] SparkLend - Claim Accrued SparkLend Reserves

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-spark-for-upcoming-spell/28351)

If this executive proposal passes, then the Spark proxy spell will claim accrued SparkLend reserves. Stablecoin reserves will be routed to the [Spark Liquidity Layer's Ethereum ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E), while other claimed reserves will be sent to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC). The amounts will depend on reserves accrued at execution.

##### [Base] Spark Liquidity Layer - Activate Diamond PAU Parallel Controller, Open CCTP V2 Route, and Update Operators

- **Authorization**: [Spark Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xa0cf2d0ad428858797853eb9b015bf921e2f53a07b96aaa4de4bf28e84653298)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-spark-for-upcoming-spell/28351)

If this executive proposal passes, then the Spark proxy spell will activate the Diamond PAU parallel controller alongside the existing controller on Base, configure the CCTP V2 USDC route to Ethereum with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5), and update operator permissions:

- Grant the `CONTROLLER` role on the [Base ALM Proxy](https://basescan.org/address/0x2917956eFF0B5eaF030abDB4EF4296DF775009cA) to the [Diamond PAU Controller](https://basescan.org/address/0xd864bF1Ea2f78Dc2013E3FC7e4C474383BE9d456), without removing the existing controller.
- On the [PAU Administered Agent](https://basescan.org/address/0x70E46bAf2E3F27a119757D7b796c641C8bc087cE):
  - Add the [Soter Labs freezer multisig](https://basescan.org/address/0x747BF29B189e2a070a921Af7Cf65681E3d5F5967) as a revoker.
  - Add the [Soter Labs grantor multisig](https://basescan.org/address/0x97EC6398e5dD047BA3223cFC017bFC6436Ac3Fe7) as a grantor and remove the [previous PAU grantor multisig](https://basescan.org/address/0x4B61A0E48dd1e300f64090C60F414c1aC6CbC514) from the grantor role.
  - Add the [Spark hot wallet](https://basescan.org/address/0x062cE42caE04c51D04E77e3D64cc8953a2296FfE) as an actor.
- Aggregate CCTP V2 rate limit (`cctp_toCCTPRateLimitKey()`):
  - `maxAmount`: **Unlimited**
- CCTP V2 Base-to-Ethereum route rate limit (`cctp_getToDomainRateLimitKey(0)`):
  - Destination domain: **0** (Ethereum)
  - `maxAmount`: **5 million USDC**
  - `slope`: **50 million USDC per day**
- Set the CCTP destination to the [Ethereum ALM Proxy](https://etherscan.io/address/0x1601843c5E9bC251A3272907010AFa41Fa18347E), with both CCTP fee caps set to **zero**.

##### [Base] Spark Liquidity Layer - Grant PAS Configurator Admin over PAU Access Controls and Rate Limits

- **Authorization**: [Spark Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xa0cf2d0ad428858797853eb9b015bf921e2f53a07b96aaa4de4bf28e84653298)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-spark-for-upcoming-spell/28351)

If this executive proposal passes, then the Spark proxy spell will grant `DEFAULT_ADMIN_ROLE` to the [PAS Configurator](https://basescan.org/address/0x458Acd38fD749F6325039e63e8Bc496dBc286D11) on both of the following Base contracts:

- [PAU Access Controls](https://basescan.org/address/0xE593c8c6a31d88cab100244Afd352efb127f9a16).
- [PAU Rate Limits](https://basescan.org/address/0x5E311e8BCe95F4e8d4920E70985ED4aC122a838A).

##### [Base] Spark Liquidity Layer - Transfer Diamond PAU Beacon Admin to Sky Governance Relay

- **Authorization**: [Spark Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0xa0cf2d0ad428858797853eb9b015bf921e2f53a07b96aaa4de4bf28e84653298)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-spark-for-upcoming-spell/28351)

If this executive proposal passes, then the Spark proxy spell will transfer administration of the [Base Diamond PAU Beacon](https://basescan.org/address/0x7ac96180C4d6b2A328D3a19ac059D0E7Fc3C6d41) from the [Base Spark Executor](https://basescan.org/address/0xF93B7122450A50AF3e5A76E1d546e95Ac1d0F579) to the [Sky Governance Relay](https://basescan.org/address/0xdD0BCc201C9E47c6F6eE68E4dB05b652Bb6aC255), granting the relay admin access before removing the Executor's admin role.

#### Grove Proxy Spell

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/87).

##### [Ethereum] Increase Deposit Rate Limit of Grove x Steakhouse USDC Morpho Vault v2

- **Authorization**: [Grove Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0xa813ec78cae204f323f891b6dccdba89a6a74fb76cb612a63cd96d5332efacdb)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-grove-for-upcoming-spell/28336)

If this executive proposal passes, then the Grove proxy spell will increase the deposit rate limit for the [Grove x Steakhouse USDC Morpho Vault v2 on Ethereum](https://etherscan.io/address/0xBeefF08dF54897e7544aB01d0e86f013DA354111) with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Deposit rate limit (`LIMIT_4626_DEPOSIT`):
  - `maxAmount`: **100 million USDC**
  - `slope`: **100 million USDC per day**
- Withdrawal rate limit (unchanged):
  - `maxAmount`: **Unlimited**

##### [Ethereum] Swap Grove SubProxy USDC to USDS

- **Authorization**: [Sky Atlas](https://sky-atlas.io/#aa16daa3-ee62-49eb-851e-cb0708670144)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-grove-for-upcoming-spell/28336)

If this executive proposal passes, then the Grove proxy spell will swap **1,484,740.589999 USDC** held by the [`GROVE_SUBPROXY`](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) for USDS through [`WRAPPER_USDS_LITE_PSM_USDC_A`](https://etherscan.io/address/0xA188EEC8F81263234dA3622A406892F3D630f98c), with the resulting USDS retained by the Grove SubProxy.

##### [Base] Increase Deposit Rate Limit of Grove x Steakhouse USDC Morpho Vault V2

- **Authorization**: [Grove Snapshot Poll](https://snapshot.box/#/s:grovefinance.eth/proposal/0x5da7eb8f4101223ff240384be3cbde658b385af1f097575c761ad5839ff8c1a0)
- **Proposal**: [Prime Technical Scope](https://forum.skyeco.com/t/november-5-2026-proposed-changes-to-grove-for-upcoming-spell/28336)

If this executive proposal passes, then the Grove proxy spell will increase the deposit rate limit for the [Grove x Steakhouse USDC Morpho Vault V2 on Base](https://basescan.org/address/0xbeef0786756810478b88982DE00F3CD7fdB8e7c7) with the following [rate limits](https://sky-atlas.io/#8efb0a11-b798-48eb-af19-f65b38f039b5):

- Deposit rate limit (`LIMIT_4626_DEPOSIT`):
  - `maxAmount`: **100 million USDC**
  - `slope`: **100 million USDC per day**
- Withdrawal rate limit (unchanged):
  - `maxAmount`: **Unlimited**

---

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

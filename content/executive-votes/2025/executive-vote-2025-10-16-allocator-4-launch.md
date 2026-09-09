---
title: Template - [Executive Vote] Allocator 4 Technical Launch, Monthly Settlement Cycle for September 2025, Ranked Delegate Compensation, Atlas Core Development Compensation, Execute Prime Agent Proxy Spells - October 16, 2025
summary: Onboard Allocator 4, execute the steps for the Monthly Settlement Cycle for September 2025, distribute Ranked Delegate compensation for September 2025, distribute Atlas Core Development compensation for October 2025, execute proxy spells for Spark and Grove.
date: 2025-10-16T00:00:00.000Z
address: "0xf3d37a2508d269b8328026f72D65795730Ce07b6"
---

# [Executive Proposal] Allocator 4 Technical Launch, Monthly Settlement Cycle for September 2025, Ranked Delegate Compensation, Atlas Core Development Compensation, Prime Agent Proxy Spells - October 16, 2025

The Core Facilitators, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- The Allocator Vault and associated contracts for Launch Agent 4 will be initialized.
- The Monthly Settlement Cycle for September 2025 will be executed.
- A total of **23,824 USDS** will be distributed to six Ranked Delegates as compensation for September 2025.
- A total of **78,188 USDS** and **618,000 SKY** will be distributed as Atlas Core Development compensation for October 2025.
- Prime Agent proxy spells for Spark and Grove will be executed.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.powerhouse.io/A.1.9.2.1_Pause_Delay/a98b8227-95f6-4711-9d8d-f52cbc6ad2d0|0db30758e055). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.powerhouse.io/A.1.9.2.1.2_Pause_Delay_Current_Value/09d2514b-3169-4755-a654-2c774456980d|0db30758e055d2d0).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Allocator 4 Technical Launch

- **Authorization**: [Facilitator approval](https://forum.sky.money/t/technical-scope-launch-of-the-agent-4-allocation-system/27314/4), [Governance poll](https://vote.sky.money/polling/QmWyJQpE)
- **Proposal**: [Forum Post](https://forum.sky.money/t/technical-scope-launch-of-the-agent-4-allocation-system/27314)

If this executive proposal passes, then the technical launch of Allocator 4 will be carried out by calling [AllocatorInit.initIlk](https://github.com/makerdao/dss-allocator/blob/226584d3b179d98025497815adb4ea585ea0102d/deploy/AllocatorInit.sol#L97-L164) with the following parameters:

- `sharedInstance.oracle`: `PIP_ALLOCATOR` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.roles`: `ALLOCATOR_ROLES` from [Chainlog](https://chainlog.sky.money/);
- `sharedInstance.registry`: `ALLOCATOR_REGISTRY` from [Chainlog](https://chainlog.sky.money/);
- `ilkInstance.owner`: `MCD_PAUSE_PROXY` from [Chainlog](https://chainlog.sky.money/);
- `ilkInstance.vault`: [0xF275110dFE7B80df66a762f968f59B70BABE2b29](https://etherscan.io/address/0xF275110dFE7B80df66a762f968f59B70BABE2b29) (AllocatorVault contract);
- `ilkInstance.buffer`: [0x51E9681D7a05abFD33EfaFd43e5dd3Afc0093F1D](https://etherscan.io/address/0x51E9681D7a05abFD33EfaFd43e5dd3Afc0093F1D) (AllocatorBuffer contract);
- `cfg.ilk`: `ALLOCATOR-OBEX-A`;
- `cfg.duty`: **1*10^27 (0%)**;
- `cfg.gap`: **10 million USDS**;
- `cfg.maxLine`: **10 million USDS**;
- `cfg.ttl`: **86,400 seconds (24 hours)**;
- `cfg.allocatorProxy`: [0x8be042581f581E3620e29F213EA8b94afA1C8071](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071) (SubProxy contract);
- `cfg.ilkRegistry`: `ILK_REGISTRY` from [Chainlog](https://chainlog.sky.money/).

The initialization script will create a PIP_ALLOCATOR_OBEX_A entry in the [Chainlog](https://chainlog.sky.money/); this entry is not necessary and will be removed.

ALLOCATOR-OBEX-A will be added to the [Debt Ceiling Breaker (LINE_MOM)](https://sky-atlas.powerhouse.io/A.1.9.3.2.3_Debt_Ceiling_Breaker_Exception/8c27b081-2db5-4e8f-9b5c-f5cf0f8d3102|0db30758e055352c).

### September 2025 Monthly Settlement Cycle

- **Authorization**: [Core GovOps Approval](https://forum.sky.money/t/msc-2-settlement-summary-september-2025-spark-only-initial-calculations/27286/4), [Core Facilitator Approval](https://forum.sky.money/t/msc-2-settlement-summary-september-2025-spark-only-initial-calculations/27286/5), [Atlas Authorization](https://sky-atlas.powerhouse.io/A.2.5_Sky_Core_Monthly_Settlement_Cycle/1d8f2ff0-8d73-807c-80f0-e58dde70cc27|9e1f)
- **Proposal**: [Forum post](https://forum.sky.money/t/msc-2-settlement-summary-september-2025-spark-only-initial-calculations/27286)

If this executive proposal passes, then the following steps to execute the September 2025 Monthly Settlement Cycle will be taken.

#### Spark

- Mint **16,931,086 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Send **3,827,201 USDS** from the Surplus Buffer to the Spark SubProxy at [0x3300f198988e4C9C63F75dF86De36421f06af8c4](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **6,382,973 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.
- Send **104,924 USDS** from the Surplus Buffer to the Grove SubProxy at [0x1369f7b2b38c76B6478c0f0E66D94923421891Ba](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

### Ranked Delegate Compensation for September 2025

- **Authorization**: [Atlas Authorization](https://sky-atlas.powerhouse.io/A.1.5.7.1_AD_Monthly_Compensation_Cycle/117f2ff0-8d73-806f-87d7-e6713a7fe64f|0db3af4e4161)
- **Proposal**: [Forum post](https://forum.sky.money/t/september-2025-ranked-delegate-compensation/27305)

If this executive proposal passes, then a total of **23,824 USDS** will be distributed to six Ranked Delegates as follows:

| Delegate    | Amount (USDS) | Address                                                                                                               |
|-------------|---------------|-----------------------------------------------------------------------------------------------------------------------|
| AegisD      | 4,000         | [0x78C180CF113Fe4845C325f44648b6567BC79d6E0](https://etherscan.io/address/0x78C180CF113Fe4845C325f44648b6567BC79d6E0) |
| BLUE        | 4,000         | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |
| Bonapublica | 4,000         | [0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3](https://etherscan.io/address/0x167c1a762B08D7e78dbF8f24e5C3f1Ab415021D3) |
| Cloaky      | 4,000         | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| Tango       | 4,000         | [0xB2B86A130B1EC101e4Aed9a88502E08995760307](https://etherscan.io/address/0xB2B86A130B1EC101e4Aed9a88502E08995760307) |
| Sky Staking | 3,824         | [0x05c73AE49fF0ec654496bF4008d73274a919cB5C](https://etherscan.io/address/0x05c73AE49fF0ec654496bF4008d73274a919cB5C) |

### Atlas Core Development Payments for October 2025

- **Authorization**: [Atlas Authorization](https://sky-atlas.powerhouse.io/Budget_And_Participation_Requirements/4c698938-1a11-4486-a568-e54fc6b0ce0c%7C0db3af4e)
- **Proposal**: [Forum post](https://forum.sky.money/t/atlas-core-development-payment-requests-october-2025/27293)

If this executive proposal passes, then a total of **78,188 USDS** and **618,000 SKY** will be distributed as Atlas Core Development payments for October 2025 as follows.

#### USDS Payments

| Recipient | Amount (USDS) | Address                                                                                                               |
|-----------|--------------:|-----------------------------------------------------------------------------------------------------------------------|
| Kohla     | 11,604        | [0x73dFC091Ad77c03F2809204fCF03C0b9dccf8c7a](https://etherscan.io/address/0x73dFC091Ad77c03F2809204fCF03C0b9dccf8c7a) |
| Cloaky    | 16,417        | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| BLUE      | 50,167        | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |

#### SKY Payments

| Recipient | Amount (SKY) | Address                                                                                                               |
|-----------|-------------:|-----------------------------------------------------------------------------------------------------------------------|
| Cloaky    | 288,000      | [0x9244F47D70587Fa2329B89B6f503022b63Ad54A5](https://etherscan.io/address/0x9244F47D70587Fa2329B89B6f503022b63Ad54A5) |
| BLUE      | 330,000      | [0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf](https://etherscan.io/address/0xb6C09680D822F162449cdFB8248a7D3FC26Ec9Bf) |

### Prime Agent Proxy Spells

If this executive proposal passes, then Prime Agent proxy spells for Spark and Grove will be executed at the following addresses:

- Spark: [0x4924e46935F6706d08413d44dF5C31a9d40F6a64](https://etherscan.io/address/0x4924e46935F6706d08413d44dF5C31a9d40F6a64)
- Grove: [0xF2A28fb43D5d3093904B889538277fB175B42Ece](https://etherscan.io/address/0xF2A28fb43D5d3093904B889538277fB175B42Ece)

The expected contents of each proxy spell are listed below.

#### Spark

##### [Ethereum] Disable Unused Products

- **Authorization**: [Snapshot poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x56cbdcf3f29f3b3f03c65ebb779106ebfe34e4582a177b5987c90cc5cf5a37ea)
- **Proposal**: [Forum post](https://forum.sky.money/t/october-16-2025-proposed-changes-to-spark-for-upcoming-spell/27215)

BUIDL and JTRSY will be offboarded from the Spark Liquidity Layer on mainnet by setting their deposit and redemption maxAmount and slope [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de) to **0**.

##### [Ethereum] Onboard USCC

- **Authorization**: [Governance poll](https://vote.sky.money/polling/QmRVD3uC)
- **Proposal**: [Forum post](https://forum.sky.money/t/september-18-2025-proposed-changes-to-spark-for-upcoming-spell/27153)

Superstate USCC will be onboarded to the Spark Liquidity Layer on mainnet with the following details:

- USCC token: [0x14d60E7FDC0D71d8611742720E4C50E7a974020c](https://etherscan.io/address/0x14d60E7FDC0D71d8611742720E4C50E7a974020c)
- Deposit address: [0xDB48AC0802F9A79145821A5430349cAff6d676f7](https://etherscan.io/address/0xDB48AC0802F9A79145821A5430349cAff6d676f7)
- Underlying asset: USDC
- [Rate limits](https://docs.spark.fi/dev/spark-liquidity-layer/spark-alm-controller#rate-limits)
  - Deposits
    - maxAmount: **100 million USDC**
    - slope: **50 million USDC per day**
  - Withdrawals
    - maxAmount: **Unlimited**

##### [Avalanche] Onboard Avalanche to the Spark Liquidity Layer

- **Authorization**: [Snapshot poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x56cbdcf3f29f3b3f03c65ebb779106ebfe34e4582a177b5987c90cc5cf5a37ea)
- **Proposal**: [Forum post](https://forum.sky.money/t/october-16-2025-proposed-changes-to-spark-for-upcoming-spell/27215)

The Spark Liquidity Layer will onboard Avalanche with the following details and [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de):

- SLL addresses:
  - Spark Governance Executor: [0x7566DEbC906C17338524A414343fA61BcA26A843](https://snowtrace.io/address/0x7566DEbC906C17338524A414343fA61BcA26A843)
  - Receiver: [0xd905be48983D405C6fD7f5a983D2351fb61C691F](https://snowtrace.io/address/0xd905be48983D405C6fD7f5a983D2351fb61C691F)
  - CCTP Messenger: [0x6B25532e1060CE10cc3B0A99e5683b91BFDe6982](https://snowtrace.io/address/0x6B25532e1060CE10cc3B0A99e5683b91BFDe6982)
  - ALM Controller: [0x4E64b576F72c237690F27727376186639447f096](https://snowtrace.io/address/0x4E64b576F72c237690F27727376186639447f096)
  - ALM Proxy: [0xecE6B0E8a54c2f44e066fBb9234e7157B15b7FeC](https://snowtrace.io/address/0xecE6B0E8a54c2f44e066fBb9234e7157B15b7FeC)
  - ALM Rate Limits: [0xb79972e8B21f0dE911E65AC342ac85ad38C9A77a](https://snowtrace.io/address/0xb79972e8B21f0dE911E65AC342ac85ad38C9A77a)
  - Relayer: [0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB](https://snowtrace.io/address/0x8a25A24EDE9482C4Fc0738F99611BE58F1c839AB)
  - Backup Relayer: [0x8Cc0Cb0cfB6B7e548cfd395B833c05C346534795](https://snowtrace.io/address/0x8Cc0Cb0cfB6B7e548cfd395B833c05C346534795)
  - Freezer: [0x90D8c80C028B4C09C0d8dcAab9bbB057F0513431](https://snowtrace.io/address/0x90D8c80C028B4C09C0d8dcAab9bbB057F0513431)
- CCTP initial rate limits:
  - CCTP global
    - maxAmount: **Unlimited**
  - CCTP from Avalanche to Ethereum
    - maxAmount: **100 million USDC**
    - slope: **50 million USDC per day**
  - CCTP from Ethereum to Avalanche
    - maxAmount: **100 million USDC**
    - slope: **50 million USDC per day**
- Spark Savings USDC (spUSDC) on Avalanche
  - spUSDC address: [0x28B3a8fb53B741A8Fd78c0fb9A6B2393d896a43d](https://snowtrace.io/address/0x28B3a8fb53B741A8Fd78c0fb9A6B2393d896a43d)
  - Spark Vault v2 implementation: [0xC2C0582D1cCe30449cF561C7b9C4D6d527547F12](https://snowtrace.io/address/0xC2C0582D1cCe30449cF561C7b9C4D6d527547F12)
  - Roles
    - Default admin: [0x7566DEbC906C17338524A414343fA61BcA26A843 (Spark Governance executor)](https://snowtrace.io/address/0x7566DEbC906C17338524A414343fA61BcA26A843)
    - Setter: [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC (Spark operations safe)](https://snowtrace.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC)
    - Taker: [0xecE6B0E8a54c2f44e066fBb9234e7157B15b7FeC (ALM Proxy)](https://snowtrace.io/address/0xecE6B0E8a54c2f44e066fBb9234e7157B15b7FeC)
  - Yield
    - Max yield: **10%**
    - Current yield (at launch): **0%**
  - Supply cap: **50 million USDC**
  - Rate limits
    - take (withdraw USDC from vault)
      - maxAmount: **Unlimited**
    - transferAsset (deposit USDC to vault)
      - maxAmount: **Unlimited**

##### [Avalanche] Onboard Aave v3 Avalanche USDC

- **Authorization**: [Snapshot poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x56cbdcf3f29f3b3f03c65ebb779106ebfe34e4582a177b5987c90cc5cf5a37ea)
- **Proposal**: [Forum post](https://forum.sky.money/t/october-16-2025-proposed-changes-to-spark-for-upcoming-spell/27215)

Aave v3 Avalanche USDC will be onboarded to the Spark Liquidity Layer on Avalanche with the following details and [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de):

- aAvaxUSDC address: [0x625E7708f30cA75bfd92586e17077590C60eb4cD](https://snowtrace.io/address/0x625E7708f30cA75bfd92586e17077590C60eb4cD)
- Underlying asset: USDC
- Deposits
  - maxAmount: **20 million USDC**
  - slope: **10 million USDC per day**
- Withdrawals
  - maxAmount: **Unlimited**

#### Grove

##### [Ethereum] Enable USDC Transfers to FalconX

- **Authorization**: [Governance poll/Atlas Edit Proposal](https://vote.sky.money/polling/QmWyJQpE)
- **Proposal**: [Forum post](https://forum.sky.money/t/october-16-2025-proposed-changes-to-grove-for-upcoming-spell/27266)

USDC deposits to FalconX will be onboarded to the Grove Liquidity Layer with the following details and [rate limits](https://sky-atlas.powerhouse.io/A.2.3.9.1.1.1.1.2_Rate_Limits/264f2ff0-8d73-8050-892b-e4a0ed9828dc|9e1ff936a6cb63b1903ca2d845de):

- **FalconX USDC Deposit Address:** [0xD94F9ef3395BBE41C1f05ced3C9a7dc520D08036](https://etherscan.io/address/0xD94F9ef3395BBE41C1f05ced3C9a7dc520D08036)
- **Rationale:** Onboard USDC (ERC20Transfers) deposits to the above FalconX USDC Deposit Address for settlement. The address is an EOA and onboarding details have been documented in the [Risk Assessment thread](https://forum.sky.money/t/grove-risk-assessment-pt-usde-pt-susde/27254).
- **Parameters:**
  - USDC: [0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48](https://etherscan.io/token/0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48)
    - Deposits/ Transfers:
      - maxAmount: **50 million USDC**
      - slope: **50 million USDC per day**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

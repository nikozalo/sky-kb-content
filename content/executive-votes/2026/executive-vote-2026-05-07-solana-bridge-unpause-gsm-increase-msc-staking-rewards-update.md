---
title: Template - [Executive Vote] Unpause Solana SkyLink Bridge, Increase GSM Pause Delay, April 2026 Monthly Settlement Cycle, Update Staking Rewards, Prime Agent Proxy Spells - May 7, 2026
summary: Update rate limits and unpause Solana SkyLink Bridge, increase the GSM Pause Delay to 48 hours, execute Monthly Settlement Cycle and Treasury Management Function for April 2026, update LSSKY->SKY staking rewards, whitelist proxy spells for Spark and Grove.
date: 2026-05-07T00:00:00.000Z
address: "0xA0059DaDd7Fbdbc81a9bb9d1d17cCB029b6AF596"
---

# [Executive Proposal] Unpause Solana SkyLink Bridge, Increase GSM Pause Delay, April 2026 Monthly Settlement Cycle, Update Staking Rewards, Prime Agent Proxy Spells - May 7, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Solana SkyLink will be unpaused with updated rate limits.
- The [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6) will be increased.
- The Monthly Settlement Cycle and Treasury Management Function for April 2026 will be executed.
- LSSKY->SKY staking rewards will be updated.
- Prime Agent proxy spells for Spark and Grove will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#db442d8a-8d98-47a2-b162-01c2adc22b67).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Unpause Solana SkyLink Bridge

- **Authorization**: [Core Facilitator Authorization](https://forum.skyeco.com/t/technical-scope-unpausing-the-layerzero-solana-bridge/27894/3)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/technical-scope-unpausing-the-layerzero-solana-bridge/27894)

If this executive proposal passes, then the Solana Skylink Bridge will be unpaused by executing the following actions.

#### Set Ethereum USDS OFT rate limits for Solana

- Call `USDS_OFT.setRateLimits` with:
  - `USDS_OFT` being [0x1e1D42781FC170EF9da004Fb735f56F0276d01B8](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from the [Chainlog](https://chainlog.sky.money/)
- `RateLimitConfig[] _rateLimitConfigsInbound` being an array with one item:
  - `uint32 eid` being **30168** (Solana Mainnet Eid)
  - `uint48 window` being **86,400** (1 day)
  - `uint256 limit` being **5_000_000 * WAD** (5,000,000 USDS)
- `RateLimitConfig[] _rateLimitConfigsOutbound` being an array with one item:
  - `uint32 eid` being **30168** (Solana Mainnet Eid)
  - `uint48 window` being **86,400** (1 day)
  - `uint256 limit` being **5_000_000 * WAD** (5,000,000 USDS)

#### Unpause Ethereum USDS OFT

- Call `USDS_OFT.unpause` with:
  - `USDS_OFT` being [0x1e1D42781FC170EF9da004Fb735f56F0276d01B8](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from the [Chainlog](https://chainlog.sky.money/)

#### Allow LZ_GOV_RELAY to send Solana governance payloads

- Call `LZ_GOV_SENDER.setCanCallTarget` with:
  - `LZ_GOV_SENDER` being [0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) from the [Chainlog](https://chainlog.sky.money/)
  - `address _srcSender` being [0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) (`LZ_GOV_RELAY` from the [Chainlog](https://chainlog.sky.money/))
  - `uint32 _dstEid` being **30168** (Solana Mainnet Eid)
  - `bytes32 _dstTarget` being **0x067c7c6c60ba7f1aec14059100df74d6da07e7d31da5dd756c6308f02e661649** (Solana OFT program ID SKYTAiJRkgexqQqFoqhXdCANyfziwrVrzjhBaCzdbKW encoded as bytes32)
  - `bool _canCall` being **true**
- Set the max execution budget for bridging the Solana payloads to **0.01 ETH**

#### Set Solana inbound rate limit for Ethereum -> Solana

- Intended parameters:
  - refill per second: **57,870,370**
  - capacity: **5,000,000,000,000**
  - rate_limiter_type: **net**
 
#### Call `LZ_GOV_RELAY.relayRaw` with:

- `LZ_GOV_RELAY` being [0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) from the [Chainlog](https://chainlog.sky.money/)
- `LZ_GOV_SENDER` being [0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) from the [Chainlog](https://chainlog.sky.money/)
- `TxParams txParams`:
  - `uint32 dstEid` being **30168** (Solana Mainnet Eid)
  - `bytes32 dstTarget` being **0x067c7c6c60ba7f1aec14059100df74d6da07e7d31da5dd756c6308f02e661649** (Solana OFT program ID encoded as bytes32)
  - `bytes dstCallData` being:
**0x00046370695f617574686f72697479000000000000000000000000000000000000000101b15b6cea974229517bec70478d3f574b4010444df812d75f6ca722fc0fa3256800019825dc0cbeaf22836931c00cb891592f0a96d0dc6a65a4c67992b01e0db8d1220000000000000000000000000000000000000000000000000000000000000000000000004fbba8398b8c5d2f95750000040101220873030000000001005039278c0400000100**
  - `bytes extraOptions` being LayerZero Type 3 options encoded via `abi.encodePacked` as **0x000301001101000000000000000000000000000927c0**:
    - `uint16 optionsType` being **3**
    - `uint8 workerId` being **1** (Executor)
    - `uint16 optionSize` being **17** (1 byte for optionType + 16 bytes for _gas; _value is omitted by the zero-value encoding)
    - `uint8 optionType` being **1** (LZRECEIVE)
    - `uint128 _gas` being **600,000**
    - `uint128 _value` being **0**
- `MessagingFee fee` being the result of `LZ_GOV_SENDER.quoteTx(txParams, false)`
- `address refundAddress` being [0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) (`LZ_GOV_RELAY` from the [Chainlog](https://chainlog.sky.money/))
- `msg.value` being **0**, with `LZ_GOV_RELAY` paying `fee.nativeFee` from its pre-funded ETH balance

#### Set Solana outbound rate limit for Solana -> Ethereum

- Intended parameters:
  - refill per second: **57,870,370**
  - capacity: **5,000,000,000,000**
  - rate_limiter_type: **net**

#### Call `LZ_GOV_RELAY.relayRaw` with:

- `LZ_GOV_RELAY` being [0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) from the [Chainlog](https://chainlog.sky.money/)
- `LZ_GOV_SENDER` being [0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) from the [Chainlog](https://chainlog.sky.money/)
- `TxParams txParams`:
  - `uint32 dstEid` being **30168** (Solana Mainnet Eid)
  - `bytes32 dstTarget` being **0x067c7c6c60ba7f1aec14059100df74d6da07e7d31da5dd756c6308f02e661649** (Solana OFT program ID encoded as bytes32)
  - `bytes dstCallData` being:
**0x00046370695f617574686f72697479000000000000000000000000000000000000000101b15b6cea974229517bec70478d3f574b4010444df812d75f6ca722fc0fa3256800019825dc0cbeaf22836931c00cb891592f0a96d0dc6a65a4c67992b01e0db8d1220000000000000000000000000000000000000000000000000000000000000000000000004fbba8398b8c5d2f95750000030101220873030000000001005039278c0400000100**
  - `bytes extraOptions` being LayerZero Type 3 options encoded via `abi.encodePacked` as **0x000301001101000000000000000000000000000927c0**:
    - `uint16 optionsType` being **3**
    - `uint8 workerId` being **1** (Executor)
    - `uint16 optionSize` being **17** (1 byte for optionType + 16 bytes for _gas; _value is omitted by the zero-value encoding)
    - `uint8 optionType` being **1** (LZRECEIVE)
    - `uint128 _gas` being **600,000**
    - `uint128 _value` being **0**
- `MessagingFee fee` being the result of `LZ_GOV_SENDER.quoteTx(txParams, false)`
- `address refundAddress` being [0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) (`LZ_GOV_RELAY` from the [Chainlog](https://chainlog.sky.money/))
- `msg.value` being **0**, with `LZ_GOV_RELAY` paying `fee.nativeFee` from its pre-funded ETH balance

#### Unpause Solana Sky OFT

- Call `LZ_GOV_RELAY.relayRaw` with:
  - `LZ_GOV_RELAY` being [0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) from the [Chainlog](https://chainlog.sky.money/)
  - `LZ_GOV_SENDER` being [0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) from the [Chainlog](https://chainlog.sky.money/)
  - `TxParams txParams`:
    - `uint32 dstEid` being **30168** (Solana Mainnet Eid)
    - `bytes32 dstTarget` being **0x067c7c6c60ba7f1aec14059100df74d6da07e7d31da5dd756c6308f02e661649** (Solana OFT program ID encoded as bytes32)
    - `bytes dstCallData` being:
**0x00026370695f617574686f726974790000000000000000000000000000000000000001009825dc0cbeaf22836931c00cb891592f0a96d0dc6a65a4c67992b01e0db8d12200013f209a0238674f2d00**
    - `bytes extraOptions` being LayerZero Type 3 options encoded via `abi.encodePacked` as **0x000301001101000000000000000000000000000927c0**:
      - `uint16 optionsType` being **3**
      - `uint8 workerId` being **1** (Executor)
      - `uint16 optionSize` being **17** (1 byte for optionType + 16 bytes for _gas; _value is omitted by the zero-value encoding)
      - `uint8 optionType` being **1** (LZRECEIVE)
      - `uint128 _gas` being **600,000**
      - `uint128 _value` being **0**
  - `MessagingFee fee` being the result of `LZ_GOV_SENDER.quoteTx(txParams, false)`
  - `address refundAddress` being [0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) (`LZ_GOV_RELAY` from the [Chainlog](https://chainlog.sky.money/))
  - `msg.value` being **0**, with `LZ_GOV_RELAY` paying `fee.nativeFee` from its pre-funded ETH balance

#### Disable Ethereum -> Avalanche USDS flow

_Note: Unpausing Ethereum USDS_OFT without zeroing the rate limit would allow Ethereum -> Avalanche transfers while Avalanche remains paused. User funds would then be locked on Ethereum without successful delivery on Avalanche until the receive flow is restored and the message retried. To prevent this, the Ethereum outbound rate limit for Avalanche should be set to zero so such transfers are rejected before funds are locked._

- Call `USDS_OFT.setRateLimits` with:
  - `USDS_OFT` being [0x1e1D42781FC170EF9da004Fb735f56F0276d01B8](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from the [Chainlog](https://chainlog.sky.money/)
  - `RateLimitConfig[] _rateLimitConfigsInbound` being an empty array
  - `RateLimitConfig[] _rateLimitConfigsOutbound` being an array with one item:
    - `uint32 eid` being **30106** (Avalanche Mainnet Eid)
    - `uint48 window` being **86,400** (1 day)
    - `uint256 limit` being **0**

### Increase GSM Pause Delay

- **Authorization**: [Governance Poll 1630](https://vote.sky.money/polling/QmToMBbA)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-27/27864)

If this executive proposal passes, then the [GSM Pause Delay](https://sky-atlas.io/#3c9545d9-775f-4149-88bf-7d297b5302c6) will be increased by 24 hours, from 24 hours to **48 hours**. 

### Monthly Settlement Cycle for April 2026

- **Authorization**: [Atlas - A.2.4 - Sky Core Monthly Settlement Cycle](https://sky-atlas.io/#6f8d5065-d6ff-4add-9a28-eadeffa7ed1a)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/msc-8-settlement-summary-april-2026/27888)

If this executive proposal passes, then the April 2026 Monthly Settlement Cycle will be executed by taking the following steps.

#### Spark

- Mint **9,179,021 USDS** debt in ALLOCATOR-SPARK-A and transfer the amount to the Surplus Buffer.
- Send **1,512,762 USDS** from the Surplus Buffer to the [SPARK_SUBPROXY](https://etherscan.io/address/0x3300f198988e4C9C63F75dF86De36421f06af8c4).

#### Grove

- Mint **9,385,986 USDS** debt in ALLOCATOR-BLOOM-A and transfer the amount to the Surplus Buffer.
- Send **241,690 USDS** from the Surplus Buffer to the [GROVE_SUBPROXY](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba).

#### Keel

- Send **52,915 USDS** from the surplus buffer to the [KEEL_SUBPROXY](https://etherscan.io/address/0x355CD90Ecb1b409Fdf8b64c4473C3B858dA2c310).

#### Obex

- Mint **1,969,499 USDS** debt in ALLOCATOR-OBEX-A and transfer the amount to the Surplus Buffer.
- Send **64,862 USDS** from the Surplus Buffer to the [OBEX_SUBPROXY](https://etherscan.io/address/0x8be042581f581E3620e29F213EA8b94afA1C8071).

#### Skybase

- Send **201,469 USDS** from the Surplus Buffer to the [SKYBASE_SUBPROXY](https://etherscan.io/address/0x08978E3700859E476201c1D7438B3427e3C81140).

#### Treasury Management Function

- Transfer **3,144,308 USDS** from the Surplus Buffer to the [Core Council Buffer](https://etherscan.io/address/0x210CFcF53d1f9648C1c4dcaEE677f0Cb06914364).

### Staking Rewards Update

- **Authorization**: [Atlas - A.4.4.1.2 - SKY Staking Rewards](https://sky-atlas.io/#a98a1bfe-5713-43f5-a8bd-83c5808900b8)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/19)

If this executive proposal passes, then the distribution of SKY token rewards to SKY stakers will be normalized as per [A.4.4.1.4.2 - Short Term SKY Rewards For SKY Stakers](https://sky-atlas.io/#aed6511f-f5f0-4b46-a56e-9a7bbc6ea310), by executing the following actions:

- Update LSSKY->SKY Farm vest by calling [`TreasuryFundedFarmingInit.updateFarmVest()`](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with params:
  - dist: [0x675671A8756dDb69F7254AFB030865388Ef699Ee](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - vestTot: **239,982,804 SKY**
  - vestBgn: **block.timestamp**
  - vestTau: **90 days**

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [0x84c5E704F7918812BA878ea7Ddbb1365876697C2](https://etherscan.io/address/0x84c5E704F7918812BA878ea7Ddbb1365876697C2) and codehash `0x8731ee32dbe70020716a1d7d6623881f52ed120f60bd4876ef39c5e25706f515` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [0x8EF80aBDa108a23eA01C8A3D1F5C8B49DD2008e8](https://etherscan.io/address/0x8EF80aBDa108a23eA01C8A3D1F5C8B49DD2008e8) and codehash `0x9e8672cc4807d1acac2c63390b2afad3248c109aa4252f4dc5e81a0c95624de7` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark

The Pull Request for the Spark proxy spell can be viewed [here](https://github.com/sparkdotfi/spark-spells/pull/166).

##### [Avalanche] Spark Liquidity Layer - Offboard Aave Avalanche USDC

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x710eb6996204b3df1eedd19d2f8bea9d0d69cdfa85a31c514527d9c212686348)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

Aave Avalanche USDC will be offboarded with the following [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- SLL parameters
  - Deposits
    - maxAmount: **0 USDC**
  - Withdrawals
    - maxAmount: **0 USDC**

##### [Ethereum] Spark Liquidity Layer - Update Spark Blue Chip USDT Morpho Vault

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0xa72495fc832baced4d2285928e2ca6ff906d7ff88c4dceaaa2d8c4aa6bdfdbdc)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

The Spark Blue Chip USDT Morpho Vault will be updated with the following parameters and [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- Old vault SLL updates
  - Address: [0xc7CDcFDEfC64631ED6799C95e3b110cd42F2bD22](https://etherscan.io/address/0xc7CDcFDEfC64631ED6799C95e3b110cd42F2bD22)
  - Deposits
    - maxAmount: 0 USDT
  - Withdrawals
    - maxAmount: Unlimited
- Replacement vault SLL updates
  - Address: [0xb0c424116172B55CbB6dD3136F5989F7959e5B91](https://etherscan.io/address/0xb0c424116172B55CbB6dD3136F5989F7959e5B91)
  - Deposits
    - maxAmount: **100 million USDT**
    - slope: **1 billion per day USDT**
  - Withdrawals
    - maxAmount: **Unlimited**

##### [Ethereum] Spark Liquidity Layer - Offboard Aave Core USDT

- **Authorization**: [Snapshot Poll](https://snapshot.org/#/s:sparkfi.eth/proposal/0x7909f554a2f33155e234788382927f9af0d4dd5a4808349bc0ff57c2ab8b5ce0)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

Aave Core USDT will be offboarded with the following [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- SLL parameters
  - Deposits
    - maxAmount: **0 USDT**
  - Withdrawals
    - maxAmount: **0 USDT**

##### [Ethereum] SparkLend - Update LBTC Parameters

- **Authorization**: [Atlas - A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

LBTC Parameters will be updated with the following [cap automator parameters](https://sky-atlas.io/#6ffdb8ee-b083-40f5-b51b-1c91e954b68b):

- SparkLend LBTC
  - Cap automator parameters
    - Deposits
      - max: **5,000 LBTC** (reduced from 10,000)
      - gap: **200 LBTC** (reduced from 500)
      - ttl: **12 hours**

##### [Ethereum] SparkLend - Update WBTC Parameters

- **Authorization**: [Atlas - A.6.1.1.1.3.2.1.2.1 - SparkLend Risk Parameters Modification](https://sky-atlas.io/#6029a425-ad81-46c5-866d-94e2ff663873)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

WBTC Parameters will be updated with the following [cap automator parameters](https://sky-atlas.io/#6ffdb8ee-b083-40f5-b51b-1c91e954b68b):

- SparkLend WBTC
  - Cap automator parameters
    - Deposits
      - max: **30,000 WBTC** (increased from 3,000)
      - gap: **500 WBTC**
      - ttl: **12 hours**

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [Atlas - A.6.1.1.1.2.6.1.2.1.2.3 - Token Claim Authorization](https://sky-atlas.io/#ea73f176-0b94-4e93-b1ee-ca498ac5a6c6)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

SparkLend reserves will be claimed as follows:

- Claim all reserves.
- Transfer USD stablecoin reserves to ALM Proxy.
- Transfer non-USD stablecoin reserves to Spark Operations Multisig [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to be liquidated.

##### [Ethereum] Spark Treasury - Monthly Grants for Spark Foundation and Spark Assets Foundation

- **Authorization**: [Atlas - A.2.8.2.2.2.4.5.1.3 - Spark Foundation Grant Authorization: Q2 2026](https://sky-atlas.io/#b69158da-476a-4d4b-b7ef-2f8b96b73d23)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

The following grant transfers will be made:

- Spark Foundation Grant
  - Recipient address: [0x92e4629a4510AF5819d7D1601464C233599fF5ec](https://etherscan.io/address/0x92e4629a4510AF5819d7D1601464C233599fF5ec).
  - Transfer amount: **1,100,000 USDS**.
- Spark Asset Foundation Grant
  - Recipient address: [0xEabCb8C0346Ac072437362f1692706BA5768A911](https://etherscan.io/address/0xEabCb8C0346Ac072437362f1692706BA5768A911).
  - Transfer amount: **100,000 USDS**.

##### [Ethereum] Spark Treasury - Transfer Excess USDS from SubDAO Proxy for SPK Buybacks

- **Authorization**: [Atlas - A.6.1.1.1.3.4.2.3 - Excess SubDAO Proxy Funds Disposition Policy](https://sky-atlas.io/#6a4870fa-73f1-4d49-b7ee-d531fb59a971)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-spark-for-upcoming-spell/27870)

**326,945 USDS** will be transferred to the [Spark Operations Multisig](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) for SPK buybacks.

#### Grove

The Pull Request for the Grove proxy spell can be viewed [here](https://github.com/grove-labs/grove-spells/pull/52).

##### [Ethereum] Onboard Grove x Steakhouse RLUSD Morpho Vault V2

- **Authorization**: [Governance Poll 1630](https://vote.sky.money/polling/QmToMBbA)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-grove-for-upcoming-spell/27858)

Grove x Steakhouse RLUSD Morpho Vault V2 will be onboarded with the following [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2):

- Grove x Steakhouse RLUSD V2: [0xBeEff4fD39F8e48b6a6e475445D650cb11e9599F](https://etherscan.io/address/0xBeEff4fD39F8e48b6a6e475445D650cb11e9599F)
  - Underlying Asset: **RLUSD** [0x8292Bb45bf1Ee4d140127049757C2E0fF06317eD](https://etherscan.io/address/0x8292Bb45bf1Ee4d140127049757C2E0fF06317eD)
  - Deposits:
    - Max amount: **100 million RLUSD**
    - Slope: **100 million RLUSD per day**
  - Withdrawals:
    - Amount: **Unlimited**
    - Max Exchange Rate: `setMaxExchangeRate(GROVE_X_STEAKHOUSE_RLUSD_V2, 1e18, 3e18)`

##### [Ethereum] Grove Treasury — Monthly Grant for Grove Foundation

- **Authorization**: [Governance Poll 1630](https://vote.sky.money/polling/QmToMBbA)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/may-7-2026-proposed-changes-to-grove-for-upcoming-spell/27858)

**800,000 USDS** will be transferred to the Grove Foundation at [0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42](https://etherscan.io/address/0xE3EC4CC359E68c9dCE15Bf667b1aD37Df54a5a42).

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

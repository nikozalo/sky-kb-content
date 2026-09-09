---
title: Template - [Executive Vote] Launch Avalanche SkyLink, Update Staking Rewards, Grove Genesis Capital Transfer, Safe Harbor Update, Prime Agent Proxy Spells - April 9, 2026
summary: Launch SkyLink to Avalanche, update LSSKY->SKY staking rewards, transfer Genesis Capital to Grove, update the Safe Harbor agreement to account for the new SkyLink deployment, whitelist proxy spells for Spark and Grove.
date: 2026-04-09T00:00:00.000Z
address: "0x70Da14478667C08320Ef65506063abba84B6990f"
---

# [Executive Proposal] Launch Avalanche SkyLink, Update Staking Rewards, Grove Genesis Capital Transfer, Safe Harbor Update, Prime Agent Proxy Spells - April 9, 2026

The Core Facilitators, Dewiz, and Sidestream have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **actions** will occur within the Sky Protocol:

- Avalanche SkyLink will be launched.
- LSSKY->SKY staking rewards will be updated.
- 20,797,477 USDS will be transferred to Grove as part of their Genesis Capital allocation.
- The chain list and contract list in the Safe Harbor Agreement will be updated.
- Prime Agent proxy spells for Spark and Grove will be whitelisted in their respective StarGuard modules.

**Voting for this executive proposal will place your SKY in support of the actions outlined above.**

Unless otherwise noted, the actions listed above are subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Launch Avalanche SkyLink

- **Authorization**: [Governance Poll 1627](https://vote.sky.money/polling/QmW61Lnd)
- **Proposal**: [Atlas Edit Weekly Cycle Proposal](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-06/27822), [Technical Scope](https://forum.skyeco.com/t/skylink-bridge-to-avalanche/27825)

If this executive proposal passes, then the Avalanche SkyLink will be launched through the following series of actions.

#### Wire LZ_GOV_SENDER on Ethereum Mainnet with Avalanche Mainnet

Set GovernanceOAppReceiver as a peer on Avalanche by calling [LZ_GOV_SENDER.setPeer](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/OAppCore.sol#L43) with:

- [`LZ_GOV_SENDER`](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) being the address from chainlog
- `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `bytes32 _peer` being the address of the new GovernanceOAppReceiver at [0x6fdd46947ca6903c8c159d1dF2012Bc7fC5cEeec](https://snowscan.xyz/address/0x6fdd46947ca6903c8c159d1dF2012Bc7fC5cEeec#code) padded with zeros

Set Oapp SendLibrary for Avalanche by calling [EndpointV2.setSendLibrary](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L227) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [LZ_GOV_SENDER](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) from chainlog
- `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `address _newLib` being [0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)

Configure Oapp SendLibrary for Avalanche by calling [EndpointV2.setConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [LZ_GOV_SENDER](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) from chainlog
- `address _lib` being [0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `SetConfigParam[] _params` being an array with two items:
  - First item: Executor parameters
    - `uint32 eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint32 configType` being **1** - Executor type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L16)
    - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26) with:
      - `maxMessageSize` being **10_000**
      - `executor` being [0x173272739Bd7Aa6e4e214714048a9fE699453059](https://etherscan.io/address/0x173272739Bd7Aa6e4e214714048a9fE699453059) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
  - Second item: ULN parameters
    - `uint32 eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint32 configType` being **2** - ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17)
    - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with:
      - `uint64 confirmations` being **15** - default configuration, see [LayerZero docs](https://layerzeroscan.com/tools/defaults?version=V2&srcChainKey[0]=ethereum&dstChainKey[0]=avalanche)
      - `uint8 requiredDVNCount` being **255** (meaning NONE, [source](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L11))
      - `uint8 optionalDVNCount` being **7**
      - `uint8 optionalDVNThreshold` being **4**
      - `address[] requiredDVNs` being an array with 0 addresses
      - `address[] optionalDVNs` being an array with 7 addresses - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum):
        - [0x589dEDbD617e0CBcB916A9223F4d1300c294236b](https://etherscan.io/address/0x589dEDbD617e0CBcB916A9223F4d1300c294236b) (LayerZero Labs),
        - [0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5](https://etherscan.io/address/0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5) (Nethermind),
        - [0xa4fE5A5B9A846458a70Cd0748228aED3bF65c2cd](https://etherscan.io/address/0xa4fE5A5B9A846458a70Cd0748228aED3bF65c2cd) (Canary),
        - [0x373a6E5c0C4E89E24819f00AA37ea370917AAfF4](https://etherscan.io/address/0x373a6E5c0C4E89E24819f00AA37ea370917AAfF4) (Deutsche Telekom),
        - [0x06559EE34D85a88317Bf0bfE307444116c631b67](https://etherscan.io/address/0x06559EE34D85a88317Bf0bfE307444116c631b67) (P2P),
        - [0x380275805876Ff19055EA900CDb2B46a94ecF20D](https://etherscan.io/address/0x380275805876Ff19055EA900CDb2B46a94ecF20D) (Horizen),
        - [0x58249a2Ec05c1978bF21DF1f5eC1847e42455CF4](https://etherscan.io/address/0x58249a2Ec05c1978bF21DF1f5eC1847e42455CF4) (Luganodes)

#### Allow LZ_GOV_SENDER to send messages to Avalanche

Call [LZ_GOV_SENDER.setCanCallTarget](https://github.com/sky-ecosystem/sky-oapp-oft/blob/main/contracts/GovernanceOAppSender.sol#L45-L50) with:

- [`LZ_GOV_SENDER`](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA) being the address from chainlog
- `address _srcSender` being [`LZ_GOV_RELAY`](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61) from chainlog
- `uint32 _dstEid` being **30106** (Avalanche Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/avalanche))
- `bytes32 _dstTarget` being the address of the new L2GovernanceRelay at [0xe928885BCe799Ed933651715608155F01abA23cA](https://snowscan.xyz/address/0xe928885BCe799Ed933651715608155F01abA23cA) padded with zeros
- `bool _canCall` being **true**

#### Wire `USDS_OFT` on Ethereum Mainnet with Avalanche Mainnet

Set `SkyOFTAdapterMintBurn(USDS)` as a peer on Avalanche by calling [`USDS_OFT.setPeer`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/OAppCore.sol#L43) with:

- [`USDS_OFT`](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) being the address from chainlog
- `uint32 eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `bytes32 _peer` being the new SkyOFTAdapterMintBurn(USDS) on Avalanche at [0x4fec40719fD9a8AE3F8E20531669DEC5962D2619](https://snowscan.xyz/address/0x4fec40719fD9a8AE3F8E20531669DEC5962D2619) padded with zeros

Set OFT SendLibrary for Avalanche by calling [`EndpointV2.setSendLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L227) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [USDS_OFT](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from chainlog
- `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `address _newLib` being [0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)

Set OFT ReceiveLibrary for Avalanche by calling [`EndpointV2.setReceiveLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L245) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [USDS_OFT](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from chainlog
- `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `address _newLib` being [0xc02Ab410f0734EFa3F14628780e6e695156024C2](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `_gracePeriod` being **0** (No grace period is needed as this is the first time we set the receive library for Avalanche)

Configure OFT SendLibrary for Avalanche by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [USDS_OFT](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from chainlog
- `address _lib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `SetConfigParam[] _params` being an array with two items:
  - First item: Executor parameters
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint32 configType` being **1** (Executor type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L16))
    - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26) with:
      - `maxMessageSize` being **10_000** - see [LayerZero docs](https://docs.layerzero.network/v2/developers/evm/protocol-contracts-overview#max-message-bytes-size)
      - `executor` being [`0x173272739Bd7Aa6e4e214714048a9fE699453059`](https://etherscan.io/address/0x173272739Bd7Aa6e4e214714048a9fE699453059) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
  - Second item: ULN parameters
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint32 configType` being **2** (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
    - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with:
      - `uint64 confirmations` being **15** (default configuration) - see [LayerZero docs](https://layerzeroscan.com/tools/defaults?version=V2&srcChainKey[0]=ethereum&dstChainKey[0]=avalanche)
      - `uint8 requiredDVNCount` being **2**
      - `uint8 optionalDVNCount` being **0**
      - `uint8 optionalDVNThreshold` being **0**
      - `address[] requiredDVNs` being an array with **2** addresses:
        - [0x589dEDbD617e0CBcB916A9223F4d1300c294236b](https://etherscan.io/address/0x589dEDbD617e0CBcB916A9223F4d1300c294236b) (LayerZero Labs)
        - [0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5](https://etherscan.io/address/0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5) (Nethermind)
      - `address[] optionalDVNs` being an array with **0** addresses

Configure OFT ReceiveLibrary for Avalanche by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [USDS_OFT](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from chainlog
- `address _lib` being [`0xc02Ab410f0734EFa3F14628780e6e695156024C2`](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `SetConfigParam[] _params` being an array with one item:
  - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
  - `uint32 configType` being **2** (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
  - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with:
    - `uint64 confirmations` being **12** - (default configuration from [source](https://layerzeroscan.com/tools/defaults?version=V2&srcChainKey[0]=ethereum&dstChainKey[0]=avalanche))
    - `uint8 requiredDVNCount` being **2**
    - `uint8 optionalDVNCount` being **0**
    - `uint8 optionalDVNThreshold` being **0**
    - `address[] requiredDVNs` being an array with **2** addresses:
      - [0x589dEDbD617e0CBcB916A9223F4d1300c294236b](https://etherscan.io/address/0x589dEDbD617e0CBcB916A9223F4d1300c294236b) (LayerZero Labs)
      - [0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5](https://etherscan.io/address/0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5) (Nethermind)
    - `address[] optionalDVNs` being an array with **0** addresses

Set OFT enforced options for Avalanche by calling [`USDS_OFT.setEnforcedOptions`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OAppOptionsType3.sol#L28) with:

- [USDS_OFT](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from chainlog
- [`EnforcedOptionParam`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/interfaces/IOAppOptionsType3.sol#L5-L12)`[] _enforcedOptions` being an array with `2` items:
  - SendOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint16 msgType` being **1** (Meaning SEND, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F2))
    - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
      - `uint128 _gas` being **130_000** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
      - `uint128 _value` being **0** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))
  - SendAndCallOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint16 msgType` being **2** (Meaning SEND_AND_CALL, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F3))
    - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
      - `uint128 _gas` being **130_000** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
      - `uint128 _value` being **0** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))

#### Set USDS rate limits for Avalanche

Call [`USDS_OFT.setRateLimits`](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTCore.sol#L124) to set inbound and outbound rate limits with:

- [USDS_OFT](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8) from chainlog
- `RateLimitConfig[] _rateLimitConfigsInbound` being an array with one item:
  - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
  - `uint48 window` being **86,400s (1 day)**
  - `uint256 limit` being **5,000,000 USDS**
- `RateLimitConfig[] _rateLimitConfigsOutbound` being an array with one item:
  - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
  - `uint48 window` being **86,400s (1 day)**
  - `uint256 limit` being **5,000,000 USDS**

#### Add sUSDS_OFT to Chainlog

Add [0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1](https://etherscan.io/address/0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1) to chainlog as **SUSDS_OFT**.

#### Wire `SUSDS_OFT` on Ethereum Mainnet with Avalanche Mainnet

Set `pauser` by calling `SUSDS_OFT`.[`setPauser`](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTCore.sol#L156) with:

- `address _pauser` being [0x38d1114b4cE3e079CC0f627df6aC2776B5887776](https://etherscan.io/address/0x38d1114b4cE3e079CC0f627df6aC2776B5887776) (”LayerZero Freezer Multisig Address” from the [Atlas edit](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381))
- `bool _canPause` being **true** (required to enable the pauser)

Set `SkyOFTAdapterMintBurn(sUSDS)` as a peer on Avalanche by calling `SUSDS_OFT`[`.setPeer`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/OAppCore.sol#L43) with:

- [`SUSDS_OFT`](https://etherscan.io/address/0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1) being the address from chainlog
- `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `bytes32 _peer` being the new `SkyOFTAdapterMintBurn(sUSDS)` on Avalanche at [0x7297D4811f088FC26bC5475681405B99b41E1FF9](https://snowscan.xyz/address/0x7297D4811f088FC26bC5475681405B99b41E1FF9) padded with zeros

Set OFT SendLibrary for Avalanche by calling [`EndpointV2.setSendLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L227) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [`SUSDS_OFT`](https://etherscan.io/address/0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1) from chainlog
- `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `address _newLib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))

Set OFT ReceiveLibrary for Avalanche by calling [`EndpointV2.setReceiveLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L245) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [`SUSDS_OFT`](https://etherscan.io/address/0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1) from chainlog
- `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
- `address _newLib` being [`0xc02Ab410f0734EFa3F14628780e6e695156024C2`](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) (ReceiveUln302 on Ethereum Mainnet from [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `_gracePeriod` being **0** (No grace period is needed as this is the first time we set the receive library for Avalanche)

Configure OFT SendLibrary for Avalanche by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [`SUSDS_OFT`](https://etherscan.io/address/0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1) from chainlog
- `address _lib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `SetConfigParam[] _params` being an array with two items:
  - First item: Executor parameters
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint32 configType` being **1** (Executor type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L16))
    - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26) with:
      - `maxMessageSize` being **10_000** (from the [docs](https://docs.layerzero.network/v2/developers/evm/protocol-contracts-overview#max-message-bytes-size))
      - `executor` being [`0x173272739Bd7Aa6e4e214714048a9fE699453059`](https://etherscan.io/address/0x173272739Bd7Aa6e4e214714048a9fE699453059) (Executor on Ethereum Mainnet from [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
  - Second item: ULN parameters
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint32 configType` being **2** (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
    - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with:
      - `uint64 confirmations` being **15** (default configuration from [LayerZero docs](https://layerzeroscan.com/tools/defaults?version=V2&srcChainKey[0]=ethereum&dstChainKey[0]=avalanche))
      - `uint8 requiredDVNCount` being **2**
      - `uint8 optionalDVNCount` being **0**
      - `uint8 optionalDVNThreshold` being **0**
      - `address[] requiredDVNs` being an array with **2** addresses:
        - [`0x589dEDbD617e0CBcB916A9223F4d1300c294236b`](https://etherscan.io/address/0x589dEDbD617e0CBcB916A9223F4d1300c294236b) (LayerZero Labs)
        - [`0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5`](https://etherscan.io/address/0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5) (Nethermind)
      - `address[] optionalDVNs` being an array with **0** addresses

Configure OFT ReceiveLibrary for Avalanche by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [0x1a44076050125825900e736c501f859c50fE728c](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum)
- `address _oapp` being [`SUSDS_OFT`](https://etherscan.io/address/0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1) from chainlog
- `address _lib` being [`0xc02Ab410f0734EFa3F14628780e6e695156024C2`](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) (ReceiveUln302 on Ethereum Mainnet from [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `SetConfigParam[] _params` being an array with one item:
  - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
  - `uint32 configType` being **2** (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
  - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with:
    - `uint64 confirmations` being **12** (default configuration from [LayerZero docs](https://layerzeroscan.com/tools/defaults?version=V2&srcChainKey[0]=ethereum&dstChainKey[0]=avalanche))
    - `uint8 requiredDVNCount` being **2**
    - `uint8 optionalDVNCount` being **0**
    - `uint8 optionalDVNThreshold` being **0**
    - `address[] requiredDVNs` being an array with **2** addresses:
      - [`0x589dEDbD617e0CBcB916A9223F4d1300c294236b`](https://etherscan.io/address/0x589dEDbD617e0CBcB916A9223F4d1300c294236b) (LayerZero Labs)
      - [`0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5`](https://etherscan.io/address/0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5) (Nethermind)
    - `address[] optionalDVNs` being an array with **0** addresses

Set OFT enforced options for Avalanche by calling [`SUSDS_OFT.setEnforcedOptions`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OAppOptionsType3.sol#L28) with:

- [`SUSDS_OFT`](https://etherscan.io/address/0x85A3FE4DA2a6cB98A5bdF62458B0dB8471B9f0f1) being the address from chainlog
- [`EnforcedOptionParam`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/interfaces/IOAppOptionsType3.sol#L5-L12)`[] _enforcedOptions` being an array with **2** items:
  - SendOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint16 msgType` being **1** (Meaning SEND, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F2))
    - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
      - `uint128 _gas` being **130_000** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
      - `uint128 _value` being **0** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))
  - SendAndCallOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
    - `uint32 _eid` being **30106** - see [LayerZero docs](https://docs.layerzero.network/v2/deployments/chains/avalanche)
    - `uint16 msgType` being **2** (Meaning SEND_AND_CALL, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F3))
    - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
      - `uint128 _gas` being **130_000** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
      - `uint128 _value` being **0** ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))

### LSSKY->SKY Staking Rewards Update

- **Authorization**: [Governance Poll 1627](https://vote.sky.money/polling/QmW61Lnd)
- **Proposal**: [Atlas Edit Weekly Cycle Proposal](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-06/27822), [BA Labs Calculation](https://forum.skyeco.com/t/lssky-to-sky-rewards-sky-rewards-for-sky-stakers-normalization-configuration/27721/6)

If this executive proposal passes, then the distribution of SKY token rewards to SKY stakers will be updated through the following actions:

- Call [TreasuryFundedFarmingInit.updateFarmVest()](https://github.com/sky-ecosystem/endgame-toolkit/blob/master/script/dependencies/treasury-funded-farms/TreasuryFundedFarmingInit.sol#L128) with the following parameters:
  - dist: [0x675671A8756dDb69F7254AFB030865388Ef699Ee](https://etherscan.io/address/0x675671A8756dDb69F7254AFB030865388Ef699Ee)
  - vestTot: **192,110,322 SKY**
  - vestBgn: **`block.timestamp`**
  - vestTau: **90 days**

### Grove Genesis Capital Transfer

- **Authorization**: [Atlas A.2.8.2.2.2.5.2](https://sky-atlas.io/#062fdb39-464e-4a5b-a44f-3462d2d38be5)
- **Proposal**: [Forum post](https://forum.skyeco.com/t/grove-genesis-capital-transfer/27828)

If this executive proposal passes, then **20,797,477 USDS** will be transferred to the [Grove SubProxy](https://etherscan.io/address/0x1369f7b2b38c76B6478c0f0E66D94923421891Ba) as part of their Genesis Capital allocation.

### Safe Harbor Update

- **Authorization**: [Atlas A.2.11.1.2.3](https://sky-atlas.io/#fcd868db-4a91-4ee0-baf5-1ebd40fc651e)

If this executive proposal passes, the Safe Harbor agreement will be updated to include the Avalanche chain along with the new GovernanceOAppReceiver on Avalanche, L2GovernanceRelay on Avalanche, USDS proxy and implementation on Avalanche, sUSDS proxy and implementation on Avalanche, SkyOFTAdapterMintBurn(USDS) on Avalanche, SkyOFTAdapter(sUSDS) on mainnet, and SkyOFTAdapterMintBurn(sUSDS) on Avalanche added by this spell.

### Prime Agent Proxy Spells

If this executive proposal passes, then a Spark proxy spell with address [0xFa5fc020311fCC1A467FEC5886640c7dD746deAa](https://etherscan.io/address/0xFa5fc020311fCC1A467FEC5886640c7dD746deAa) and codehash `0x2572a97846f7a6f9f159a9a69c2707cfa4186c061de2a0ec59e7a0d46473c74c` will be whitelisted in the [Spark StarGuard](https://etherscan.io/address/0x6605aa120fe8b656482903E7757BaBF56947E45E).

If this executive proposal passes, then a Grove proxy spell with address [0x679eD4739c71300f7d78102AE5eE17EF8b8b2162](https://etherscan.io/address/0x679eD4739c71300f7d78102AE5eE17EF8b8b2162) and codehash `0x4fa1f743b3d6d2855390724459129186dd684e1c07d59f88925f0059ba1e6c84` will be whitelisted in the [Grove StarGuard](https://etherscan.io/address/0xfc51CAa049E8894bEcFfB68c61095C3F3Ec8a880).

#### Spark

##### [Ethereum] Spark Liquidity Layer - Update Rate Limits

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x6c889e7be8fba52d9cac4bd2e89c9bcb4ee1952afb40b555e87bf09062cb837f)
- **Proposal**: [Forum Proposal](https://forum.skyeco.com/t/april-9-2026-proposed-changes-to-spark-for-upcoming-spell/27804)

Various [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) for the Spark Liquidity Layer on Ethereum mainnet will be updated as follows:

- Fluid Ethereum sUSDS
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**
- Aave Prime USDS
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**
- Aave Core USDS
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**
- Aave Core USDC
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**
- Aave Core USDT
  - Deposits
    - maxAmount: **100 million USDT**
    - slope: **1 billion USDT per day**
  - Withdrawals
    - maxAmount: **unlimited**
- SparkLend USDT
  - Deposits
    - maxAmount: **500 million USDT**
    - slope: **2 billion USDT per day**
  - Withdrawals
    - maxAmount: **unlimited**
- Maple syrupUSDT
  - Deposits
    - maxAmount: **50 million USDT**
    - slope: **100 million USDT per day**
  - Request redemption
    - maxAmount: **unlimited**
  - Withdrawals
    - maxAmount: **unlimited**
- Spark Blue Chip USDT Morpho Vault
  - Deposits
    - maxAmount: **100 million USDT**
    - slope: **1 billion USDT per day**
  - Withdrawals
    - maxAmount: **unlimited**
- SparkLend ETH
  - Deposits
    - maxAmount: **50,000 ETH**
    - slope: **250,000 ETH per day**
  - Withdrawals
    - maxAmount: **unlimited**
- Curve weETH-ng
  - Swaps
    - maxAmount: **1,000**
    - slope: **50,000 per day**
    - maxSlippage: **0.25%**
- Curve sUSDS/USDT
  - Swaps
    - maxAmount: **10 million**
    - slope: **200 million per day**
    - maxSlippage: **0.25%**
- Anchorage USDT
  - transferAsset
    - Address: [0x49506C3Aa028693458d6eE816b2EC28522946872](https://etherscan.io/address/0x49506C3Aa028693458d6eE816b2EC28522946872)
    - maxAmount: **50 million**
    - slope: **250 million per day**
- Anchorage USAT
  - transferAsset
    - Address: [0x49506C3Aa028693458d6eE816b2EC28522946872](https://etherscan.io/address/0x49506C3Aa028693458d6eE816b2EC28522946872)
    - maxAmount: **50 million**
    - slope: **250 million per day**

##### [Arbitrum] Spark Liquidity Layer - Update Rate Limits

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x6c889e7be8fba52d9cac4bd2e89c9bcb4ee1952afb40b555e87bf09062cb837f)
- **Proposal**: [Forum Proposal](https://forum.skyeco.com/t/april-9-2026-proposed-changes-to-spark-for-upcoming-spell/27804)

Various [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) for the Spark Liquidity Layer on Arbitrum will be updated as follows:

- Aave Arbitrum USDC
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**
- Fluid Arbitrum sUSDS
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**

##### [Base] Spark Liquidity Layer - Update Rate Limits

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x6c889e7be8fba52d9cac4bd2e89c9bcb4ee1952afb40b555e87bf09062cb837f)
- **Proposal**: [Forum Proposal](https://forum.skyeco.com/t/april-9-2026-proposed-changes-to-spark-for-upcoming-spell/27804)

Various [rate limits](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) for the Spark Liquidity Layer on Base will be updated as follows:

- Aave Base USDC
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**
- Fluid Base sUSDS
  - Deposits
    - maxAmount: **0**
  - Withdrawals
    - maxAmount: **0**

##### [Ethereum] Spark Savings - Raise Deposit Caps for spUSDC, spUSDT, and spETH

- **Authorization**: [Snapshot Poll](https://snapshot.box/#/s:sparkfi.eth/proposal/0x51bf5882e51b16c35ea596cf0ca69d52aeec912c1a72b84b6512d2d5f07a0167)
- **Proposal**: [Forum Proposal](https://forum.skyeco.com/t/april-9-2026-proposed-changes-to-spark-for-upcoming-spell/27804)

[Deposit caps](https://sky-atlas.io/#77918273-af7f-4c7e-80af-3f3d9d2097ec) for spUSDC, spUSDT, and spETH will be increased to the following limits:

- spUSDT
  - Deposit cap: **4 billion USDT**
- spUSDC
  - Deposit cap: **2 billion USDC**
- spETH
  - Deposit cap: **500,000 ETH**

##### [Ethereum] SparkLend - Claim SparkLend Reserves

- **Authorization**: [Atlas A.6.1.1.1.2.6.1.2.1.2.3 - Token Claim Authorization](https://sky-atlas.io/#A.6.1.1.1.2.6.1.2.1.2.3)
- **Proposal**: [Forum Post](https://forum.skyeco.com/t/april-9-2026-proposed-changes-to-spark-for-upcoming-spell/27804)

SparkLend reserves will be claimed as follows:

- Claim all reserves
- Transfer USD stablecoin reserves to ALM Proxy
- Transfer non-USD stablecoin reserves to Spark Operations Multisig [0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC](https://etherscan.io/address/0x2E1b01adABB8D4981863394bEa23a1263CBaeDfC) to be liquidated

#### Grove

##### [Ethereum] Onboard Maple syrupUSDC

- **Authorization**: [Governance Poll 1627](https://vote.sky.money/polling/QmW61Lnd)
- **Proposal**: [Atlas Edit Weekly Cycle Proposal](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-06/27822), [Technical Scope](https://forum.skyeco.com/t/april-9th-2026-proposed-changes-to-grove-for-upcoming-spell/27801)

Maple syrupUSDC will be onboarded to the Grove Liquidity Layer with the following contracts and [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters:

- syrupUSDC: [0x80ac24aA929eaF5013f6436cdA2a7ba190f5Cc0b](https://etherscan.io/address/0x80ac24aA929eaF5013f6436cdA2a7ba190f5Cc0b)
  - Underlying Asset: **USDC**
  - Deposits:
    - Max amount: **50 million USDC**
    - Slope: **50 million USDC per day**
  - Withdrawals:
    - Amount: **0 USDC**
  - Max Exchange Rate:
    - `setMaxExchangeRate(MAPLE_SYRUP_USDC, 1e6, 3e6)`

##### [Ethereum] Increase JTRSY Deposit Rate Limits

- **Authorization**: [Governance Poll 1627](https://vote.sky.money/polling/QmW61Lnd)
- **Proposal**: [Atlas Edit Weekly Cycle Proposal](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-06/27822), [Technical Scope](https://forum.skyeco.com/t/april-9th-2026-proposed-changes-to-grove-for-upcoming-spell/27801)

JTRSY deposit [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters will be updated as follows:

- JTRSY (V3): [0xFE6920eB6C421f1179cA8c8d4170530CDBdfd77A](https://etherscan.io/address/0xFE6920eB6C421f1179cA8c8d4170530CDBdfd77A)
  - Underlying Asset: **USDC**
  - Deposits:
    - Max amount: **500 million USDC**
    - Slope: **500 million USDC per day**
  - Withdrawals:
    - Amount: **unlimited**

##### [Ethereum] Increase PSM USDS/USDC Swap Rate Limits

- **Authorization**: [Governance Poll 1627](https://vote.sky.money/polling/QmW61Lnd)
- **Proposal**: [Atlas Edit Weekly Cycle Proposal](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2026-04-06/27822), [Technical Scope](https://forum.skyeco.com/t/april-9th-2026-proposed-changes-to-grove-for-upcoming-spell/27801)

PSM USDS/USDC Swap [rate limit](https://sky-atlas.io/#A.2.2.9.1.1.1.2.2) parameters will be updated as follows:

- PSM USDS/USDC Swap: [0xf6e72Db5454dd049d0788e411b06CfAF16853042](https://etherscan.io/address/0xf6e72Db5454dd049d0788e411b06CfAF16853042)
  - Max amount: **500 million USDC**
  - Slope: **500 million USDC per day**

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.skyeco.com/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

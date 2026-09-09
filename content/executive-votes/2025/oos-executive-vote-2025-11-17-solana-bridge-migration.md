---
title: Template - [Executive Vote] Out-of-Schedule Spell - Solana Bridge Migration Spell 1 - November 17, 2025
summary: Carry out the final stage of the Solana Bridge Migration.
date: 2025-11-17T00:00:00.000Z
address: "0x2140f15f957Fcb0b101CD3957217174c3E4d6bf9"
---

# [Executive Proposal] Out-of-Schedule Spell - Solana Bridge Migration Spell 1 - November 17, 2025

The Core Facilitator, Sidestream, and Dewiz have placed an executive proposal into the voting system. SKY holders should vote for this proposal if they support the following alterations to the Sky Protocol.

If you are new to voting in the Sky Protocol, please see the [voting guide](https://manual.makerdao.com/governance/voting-in-makerdao/on-chain-governance) to learn how voting works.

---

## Executive Summary

If this executive proposal passes, the following **action** will occur within the Sky Protocol:

- The final stage of the Solana Bridge Migration will be executed.

**Voting for this executive proposal will place your SKY in support of the action outlined above.**

Unless otherwise noted, the action listed above is subject to the [GSM Pause Delay](https://sky-atlas.io/#A.1.9.3.1). This means that if this executive proposal passes, the changes and additions listed above will only become active in the Sky Protocol after the GSM Pause Delay has expired. The GSM Pause Delay is currently set to [**24 hours**](https://sky-atlas.io/#A.1.9.3.1.2).

This executive proposal includes an office-hours modifier that means that it **can only be executed between 14:00 and 21:00 UTC, Monday - Friday**.

If this executive proposal does not pass within 30 days, then it will expire and can no longer have any effect on the Sky Protocol.

---

## Proposal Details

### Solana Bridge Migration

- **Authorization**: [Governance Poll 1603](https://vote.sky.money/polling/Qmetv8fp), [Atlas Entry](https://sky-atlas.io/#A.1.9.4.1)
- **Proposal**: [Technical Scope](https://forum.sky.money/t/november-27-2025-prime-technical-scope-solana-pre-configuration-for-upcoming-spell/27404), [Atlas Edit Proposal](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381)

If this executive proposal passes, then the final stage of the Solana Bridge Migration will be executed through the following actions:

- Call [MigrationInit.initMigrationStep1](https://github.com/sky-ecosystem/wh-lz-migration/blob/4aeb832d712efc0ec2fbad5623207de54b450b0c/deploy/MigrationInit.sol#L221-L249) with the following parameters:
  - `oftAdapter`: [`0x1e1D42781FC170EF9da004Fb735f56F0276d01B8`](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8#code)
  - `oftPeer`: [`BEvTHkTyXooyaJzP8egDUC7WQK8cyRrq5WvERZNWhuah`](https://solscan.io/account/BEvTHkTyXooyaJzP8egDUC7WQK8cyRrq5WvERZNWhuah)
  - `govOapp`: [`0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA`](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA#code)
  - `govPeer`: [`8vXXGiaXFrKFUDw21H5Z57ex552Lh8WP9rVd2ktzmcCy`](https://solscan.io/account/8vXXGiaXFrKFUDw21H5Z57ex552Lh8WP9rVd2ktzmcCy)
  - `rl.outboundWindow`: outbound [duration of the rate limiting window](https://github.com/sky-ecosystem/sky-oapp-oft/blob/8128f8aa8b465b8b784efd1bb27aa8a3f082fedd/contracts/SkyRateLimiter.sol#L145):
    - **1 days** (as specified [in the Atlas edit](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381#:~:text=rate%20limit%20of%2010%2C000%2C000%20USDS%20per%20day))
  - `rl.outboundLimit`:  outbound [maximum allowed amount within a given window](https://github.com/sky-ecosystem/sky-oapp-oft/blob/8128f8aa8b465b8b784efd1bb27aa8a3f082fedd/contracts/SkyRateLimiter.sol#L144):
    - **10_000_000 USDS** (as specified [in the Atlas edit](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381#:~:text=rate%20limit%20of%2010%2C000%2C000%20USDS%20per%20day))
  - `rl.inboundWindow`:  inbound [duration of the rate limiting window](https://github.com/sky-ecosystem/sky-oapp-oft/blob/8128f8aa8b465b8b784efd1bb27aa8a3f082fedd/contracts/SkyRateLimiter.sol#L145):
    - **1 days** (as specified [in the Atlas edit](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381#:~:text=rate%20limit%20of%2010%2C000%2C000%20USDS%20per%20day))
  - `rl.inboundLimit`:  inbound [maximum allowed amount within a given window](https://github.com/sky-ecosystem/sky-oapp-oft/blob/8128f8aa8b465b8b784efd1bb27aa8a3f082fedd/contracts/SkyRateLimiter.sol#L144):
    - **10_000_000 USDS** (as specified [in the Atlas edit](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381#:~:text=rate%20limit%20of%2010%2C000%2C000%20USDS%20per%20day))
  - `rl.rlAccountingType`:  accounting type ([`Net` or `Gross`](https://github.com/sky-ecosystem/sky-oapp-oft/blob/a9bfce855bee344b10da2b020504768c47e8017a/contracts/interfaces/ISkyRateLimiter.sol#L37-L40)):
    - **0** meaning `Net` (as specified [in the Atlas edit](https://forum.sky.money/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381#:~:text=The%20Solana%20LayerZero%20Bridge%20uses%20net%20accounting))
  - `maxFee`: expected to be **0** (unless [`Wormhole.messageFee()`](https://etherscan.io/address/0x98f3c9e6E3fAce36bAAd05FE09d375Ef1464288B#readProxyContract#F11) returns non-zero value)
  - `transferMintAuthPayload`: expected to contain cross-chain message sent via [Wormhole.publishMessage](https://etherscan.io/address/0x3c3d457f1522d3540ab3325aa5f1864e34cba9d0#code#F1#L17) that will transfer mint authority to the new `oftPeer`:
    - Generated by the [ntt-transfer-mint-authority](https://github.com/keel-fi/crosschain-gov-solana-spell-payloads/tree/11baa180d4ad6c7579c69c8c0168e17cb73bb6ed/scripts/ntt-transfer-mint-authority) script
    - The actual payload can be found [on GitHub](https://raw.githubusercontent.com/keel-fi/crosschain-gov-solana-spell-payloads/11baa180d4ad6c7579c69c8c0168e17cb73bb6ed/ntt-transfer-mint-authority-mainnet.txt)
  - `transferFreezeAuthPayload`: expected to contain cross-chain message sent via [Wormhole.publishMessage](https://etherscan.io/address/0x3c3d457f1522d3540ab3325aa5f1864e34cba9d0#code#F1#L17) that will transfer freeze authority to the new `govPeer`:
    - Generated by the [set-token-freeze-authority](https://github.com/keel-fi/crosschain-gov-solana-spell-payloads/tree/11baa180d4ad6c7579c69c8c0168e17cb73bb6ed/scripts/set-token-freeze-authority) script
    - The actual payload found [on GitHub](https://raw.githubusercontent.com/keel-fi/crosschain-gov-solana-spell-payloads/11baa180d4ad6c7579c69c8c0168e17cb73bb6ed/set-token-freeze-authority-mainnet.txt)
  - `transferMetadataUpdateAuthPayload`: expected to contain cross-chain message sent via [Wormhole.publishMessage](https://etherscan.io/address/0x3c3d457f1522d3540ab3325aa5f1864e34cba9d0#code#F1#L17) that will transfer “metadata update” authority to the new `govPeer`:
    - Generated by the [update-mpl-metadata-authority](https://github.com/keel-fi/crosschain-gov-solana-spell-payloads/tree/11baa180d4ad6c7579c69c8c0168e17cb73bb6ed/scripts/update-mpl-metadata-authority) script
    - The actual payload found [on GitHub](https://raw.githubusercontent.com/keel-fi/crosschain-gov-solana-spell-payloads/11baa180d4ad6c7579c69c8c0168e17cb73bb6ed/update-mpl-metadata-authority-mainnet.txt)
- Call [`GovernanceRelayInit.init`](https://github.com/sky-ecosystem/lz-governance-relay/blob/d3e3df4db417f196fdd56123e7dbb462d04f32ef/deploy/GovernanceRelayInit.sol#L28-L31) with the following parameters:
  - `l1GovernanceRelay`: [`0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61`](https://etherscan.io/address/0x2beBFe397D497b66cB14461cB6ee467b4C3B7D61#code)
  - `l1Oapp`: [`0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA`](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA#code)

#### Chainlog Additions

The following additions to the [Chainlog](https://chainlog.sky.money) will be made:

- Add new `SkyOFTAdapter` ([`0x1e1D42781FC170EF9da004Fb735f56F0276d01B8`](https://etherscan.io/address/0x1e1D42781FC170EF9da004Fb735f56F0276d01B8#code)) to the Chainlog as `USDS_OFT`
- Add new `GovernanceOAppSender` ([`0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA`](https://etherscan.io/address/0x27FC1DD771817b53bE48Dc28789533BEa53C9CCA#code)) to the Chainlog as `LZ_GOV_SENDER`

## Review

Community debate on these topics can be found on the Sky [Governance forum](https://forum.sky.money/). Please review any linked threads to inform your position before voting.

---

## Resources

Additional information about the Governance process can be found in the [Operational Manual](https://manual.makerdao.com).

To add current and upcoming votes to your calendar, please see the [Sky Governance Calendar](https://manual.makerdao.com/makerdao/calendars/governance-calendar).

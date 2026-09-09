# P1 Borrower-to-ER User Scenario

A **value-free** narrative path through the topology ([`phase-1-spaces.md`](phase-1-spaces.md)): one borrower onboarding and NFAT origination, from first proposal to the holding Prime's first `prime-er` update. Shows the ordered steps and the authority boundary at each — not calibration. Adds no Spaces, entarts, beacon classes, or queue Space.

**Authority commitments:** no borrower Space (setup/admission atoms live in the per-halo risk-class Space); the NFATS queue is chain-side, seen only via relay receipts and halobook atoms; `relay-prime` / `relay-halo` record chain-coupled actions, `synops-halo` records in-synome requests and book-accounting only (moves no funds); the attestor writes boolean gates only; synserv derives all risk/matching/TRRC/ER.

## The path

1. **Borrower proposed.** `synops-halo` writes a proposed-borrower-setup into the risk-class Space; the attestor posts **readiness** (boolean: legal/account/custody/credit). Readiness ≠ admission — Configurator inclusion hasn't happened.
2. **Inclusion requested.** `synops-halo` submits a Core Council request (evidence = readiness); `relay-core-govops` records Configurator inclusion; the attestor then posts final **borrower admission** (the rollup gate).
3. **Books created ready-empty.** `relay-halo` builds halobook → riskbook → exobook with parent pointers, the riskbook bound to the risk class with the risk form imported; all `lifecycle = ready-empty`. No exposure yet.
4. **Prime queues funds.** `relay-prime` deposits the Generator asset into the chain-side NFATS queue and records the Prime-side intent/receipt.
5. **Halo mints the NFAT (cross-book duality).** `relay-halo` claims the queued funds and mints the NFAT, writing the duality pair: a halobook liability/holder atom and a Prime-root allocation atom.
6. **Synops assigns book assets.** `synops-halo` assigns the in-synome accounting path from halobook into riskbook/exobook (no chain funds; requires a valid relay receipt and matching parents).
7. **Term attestation.** The attestor refreshes the exobook term attestation (term/maturity/cash-path/disbursement).
8. **Disbursement.** `relay-halo` sends funds and records funding confirmation; the exobook goes `ready-empty → funded-active` and certified TTM becomes official. Now it is funded exposure.
9. **Risk form runs.** On the heartbeat, the rollup gate passes only with fresh accordant attestations; the risk form emits the four per-exobook CRR components (only default-CRR aggregates to riskbook level).
10. **Halobook projection (cross-book duality).** The halobook derives the NFAT projection (notional, SPTP bucket, CRR vector, unwind/transfer terms) as a Prime-side asset, read in-tick by the structbook.
11. **Structbook matching.** The structbook reads the projection and the current-epoch SDR allocation; the position stays in `structbook` regardless of SDR — allocation only sets the matched portion (matched = default-CRR; unmatched = `max(default-CRR, spread+liquidity) + rate`).
12. **ER updates.** Position capital flows into `insynTRRC`; the primebook adds patch-beacon `exsynTRRC`, reads `TRC`, and emits an updated `prime-er`.

## What it resolves

Pre-Council readiness vs post-Configurator admission gates; books can exist `ready-empty` before the NFAT mints; queue/claim stay chain-side; `synops` assigns accounting but moves no funds; the first ER uses the ordinary `structbook` path with the SDR-driven matched/unmatched blend.

Atom-level companion: [`p1-nfat-atom-trace.md`](p1-nfat-atom-trace.md).

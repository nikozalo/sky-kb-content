# P1 NFAT Atom Trace

The atom-level companion to [`p1-borrower-nfat-user-scenario.md`](p1-borrower-nfat-user-scenario.md): which atoms are read and written at each rollup stage, and the default-deny branches. Identifiers and values are symbolic — this teaches the read/write **shape**, not calibration. Adds no Spaces, verbs, or beacon classes.

## Trace discipline

- Each atom lives in one Space; cross-Space reads use only the four sanctioned mechanisms (registries, oracle subscription, cross-book duality, SDR allocation reads).
- Attestor atoms are boolean gates — never collateral/debt/price/LTV/CRR numbers.
- Market facts come from the oracle `ticks`; loan facts from exobook atoms + `CHAINREAD`.
- Derived atoms are **frame-local scratch** within the heartbeat (not a persistence commitment); replay from append-only input + rule atoms is the canonical history. S-expressions are derivation notation; readers consume evaluated scalars.
- `patch-{prime}` enters only at the primebook as `exsynTRRC`.

## Reads and writes by stage

**Constructor / operational writes** (gate-mediated, not sudo). `relay-halo` writes the halobook (referencing the halo class), the riskbook (bound to the risk class, risk form imported at creation), and the exobook (borrower, frame, collateral ref, senior/junior tranches, term intent, `ready-empty`). The attestor writes the three boolean surfaces (borrower admission, riskbook, exobook term), each scope-bound. On funding confirmation the exobook goes `funded-active`; issuance writes the **cross-book duality pair** — a halobook `nfat-unit`/`nfat-holder` and a Prime-root `prime-nfat-allocation`.

**External inputs before the heartbeat.** Market-memory atoms in the oracle `ticks` (prices, vol, correlation, impact, drawdown, freshness). The DSC SDR pipeline writes `effective-sdr-bucket-capacity` (in `structural-demand`) and `sdr-allocation` (in `sdr-auction`); Prime root holds `prime-trc`/`prime-ijrc`; the patch-beacon writes `exsyn-trrc-claim` into the primebook.

**Synserv heartbeat.**
- *Exobook* — reads source atoms + term attestation + `CHAINREAD` (collateral balance, debt, LT, liquidation bonus); derives current state, equity, SPTP/bucket.
- *Riskbook* — checks all boolean gates (a `rollup-gate` pass needs fresh, scope-matching borrower admission + riskbook + exobook attestations); runs the scenario-synchronous risk form → four per-exobook CRR components; aggregates default-CRR to riskbook level only.
- *Halobook* — projects the NFAT as a Prime-side asset (`nfat-prime-projection`: notional, SPTP bucket, CRR vector, unwind/transfer terms); pure summation, no cross-riskbook netting.
- *Structbook* — reads projections (cross-book duality) + current-epoch `sdr-allocation`; cumulative matching against the required-or-higher bucket sets matched/unmatched; `position_capital = matched×default-CRR + unmatched×(max(default-CRR, spread+liquidity) + rate)`.
- *Primebook* — `insynTRRC + exsynTRRC = TRRC`; `ER = TRRC / TRC`; emits `prime-er` each heartbeat. This is the P1 deliverable; settlement/penalty stay manual.

## Default-deny branches

| Failure | Result |
|---|---|
| Missing/stale/blocked borrower admission | Exobook can't roll up. |
| Missing/stale/failed riskbook attestation | Riskbook + all child exobooks excluded. |
| Missing/stale/failed exobook term attestation | That exobook excluded. |
| Scope mismatch on any attestation | Same as missing. |
| Exobook still `ready-empty` | Tracked, but not funded exposure / not SDR-matchable. |
| Composition ≠ `custodial-crypto` | CRR 100% (constructors should reject first). |
| Market memory stale/divergent beyond tolerance | Risk form haircuts or default-denies. |
| No current SDR allocation | Matched = 0; stays in `structbook`, capitalizes as unmatched. |

## Residual (calibration, not topology)

Exact `scope-ref` predicates; final field names; first approved scenario constants; the market-memory reducer catalog (mechanism settled in [`market-memory-oracle.md`](market-memory-oracle.md)).

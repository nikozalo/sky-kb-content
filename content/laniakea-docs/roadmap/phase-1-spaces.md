# Phase 1 — Synart Space Perspective

The durable **shape** of P1 synart topology: what kinds of Spaces exist, the rollup path, and what counts as a phase boundary. As-built specifics — exact counts/totals, the Prime/Halo roster, settlement cut-times, auction coefficients, worked figures — are intermediate implementation and live in the implementation canon. Background: [`../roadstart/big-picture.md`](../roadstart/big-picture.md). Patterns: [`roadmap-ideas.md`](roadmap-ideas.md). Invariants: [`phase-1-principles.md`](phase-1-principles.md).

## Framing

**Deliverable:** real-time ER per Prime, emitted continuously in production-quality synlang. Settlement and penalty action stay manual; the synome publishes ER, governance consumes it externally.

P1 cuts, as durable principles:

- All canonical Primes active, deploying into a small set of P1 Term Halos.
- **Per-entart local materialization** — each Halo carries its own halo-class + risk-class copies; each Prime/Halo/Generator its own `protocol-registry`. The rollup's only cross-Space reads are four: registries, oracle subscription, cross-book duality, SDR allocation reads.
- **Halo class vs risk class** decoupled (halobook policy template vs riskbook risk treatment); all P1 halos share one of each but materialize their own copies.
- Halobooks/riskbooks/exobooks are **constructor-made** by the Halo relay, not sudo.
- **Attestation is boolean** (default-deny on stale/fail/missing); all quantitative CRR inputs are insyn (`CHAINREAD` + market memory).
- Cert/auth rooted in `&core.registry.beacon`; no standing Guardian entart.
- **Derived atoms are frame-local** within synserv's heartbeat; replay from append-only input + rule atoms is the canonical history. Any cache is a non-semantic optimization.

## Vocabulary

| Term | Meaning |
|---|---|
| **halo class** | Halobook policy template — standard terms, permitted risk classes, presets. Per-halo at `…{halo-class-name}`. |
| **risk class** | Riskbook treatment — risk form + class-accordant attestor (sub-Space `…{risk-class}.attest-data`). |
| **risk form** | Synlang equation: market memory + `CHAINREAD` → per-risk-type CRR components. |
| **cross-book duality** | A unit viewed from issuer and holder sides: issuance writes a halobook liability/holder atom and a Prime-root allocation atom; synserv derives the risk projection at the issuer, read in-tick by the holding Prime's structbook. |
| **constructor** | Space-allocating verb. P1: `create-halobook` / `-riskbook` / `-exobook`. |
| **relay** | Beacon with external/onchain actuation + the in-synome record. |
| **synops-beacon** | In-synome operational mutation only; no external authority. |
| **workspec** | Canonical synart source spec for a workcell/workspace, copied into embart workspaces (holds no secrets/endpoints/state). |

## Topology shape

A tree of entarts plus universal `&core.*` Spaces. Categories (counts are as-built, not durable):

- **Universal core:** `bootstrap` (one-shot, then inert), `syngate`, `loop.synserv`, `registry.beacon`, `registry.protocol`, `governance.requests`, `relay.govops`, `settlement`, `treasury`, `test-suite`.
- **Workspec:** `prod`/`test` pairs for ethereum, syngate, attestor, operator-ui, testonome, market-data-obtainer, market-data-processing.
- **Generator (`usge`):** `root`, `structural-demand` (lot-age surface → Lindy SDR → policy overlay → effective bucket capacity), `sdr-auction` (temporary auction body + `(sdr-allocation …)` atoms), `protocol-registry`.
- **Oracle (crypto-majors):** `root`, `market-data`, `ticks` (reducer outputs + checkpoints, not raw tapes).
- **Per Prime:** `root` (identity, `prime-trc`/`prime-ijrc`), `primebook` (insyn sweep + `exsyn-trrc-claim`, emits `prime-er`), `structbook` (matched/unmatched vs SDR), `relay`, `protocol-registry`.
- **Per Halo:** `root`, `nfat-term` (halo class), `custodial-crypto` (risk class), `custodial-crypto.attest-data` (attestor), `relay`, `synops`, `protocol-registry`.
- **Constructor-made (unbounded):** `halobook.{id}`, `riskbook.{id}`, `exobook.{id}`.

**SDR pipeline:** during the DSC processing window synserv refreshes the lot-age surface, runs Lindy SDR + the governance-set policy overlay, then the temporary auction splits each bucket's capacity across active Primes (by Sky token-share × IJRC) into `(sdr-allocation …)` atoms. The consumption site is fixed — later real auctions replace the body, not the read path.

## Attestation model

Four boolean surfaces (schemas: [`attestor-atom-schema.md`](attestor-atom-schema.md)): borrower **readiness** (gate to request Configurator inclusion), borrower **admission** (rollup gate, after Configurator inclusion), **riskbook** structural, **exobook** term. The attestor underwrites only what the chain can't show (legal/operational/credit/term); without a fresh accordant `pass` the position is excluded (default-deny). Exobook lifecycle: `ready-empty` → (funds assigned + funding tx confirms) → `funded-active`, at which point certified TTM is official for SDR matching.

## ER rollup (synserv heartbeat)

```
market memory + CHAINREAD + attestations + relay/synops records
  exobook   → health/equity, funded state
  riskbook  → per-position CRR (default/spread/rate/liquidity); excluded if no fresh attestation
  halobook  → NFAT projected as Prime-side asset (cross-book duality)
  structbook→ matched/unmatched vs current-epoch SDR allocation; matched = default-CRR only
  primebook → insynTRRC + exsynTRRC = TRRC ;  ER = TRRC / TRC   (emitted every heartbeat)
```

At the DSC cut synserv runs the SDR pipeline; at DSC settle it advances the epoch (wall-clock-derived, no sudo). Value-free narrative: [`p1-borrower-nfat-user-scenario.md`](p1-borrower-nfat-user-scenario.md); atom-level: [`p1-nfat-atom-trace.md`](p1-nfat-atom-trace.md).

## Genesis and phase boundaries

Genesis is an **ordered sequence of sudo writes** (universal infra → entart roots → content → beacon cert/auth before loop bodies → settlement/SDR/test state). Then `&core.bootstrap` materializes implement code blobs, binds sigils, registers workcell hubs, emits receipts, and goes inert; operators run the testosynome rehearsal ([`testonomes-and-phase-rehearsal.md`](testonomes-and-phase-rehearsal.md)) before production starts.

**Any sudo event in P1 is a phase boundary** — e.g. adding a Prime/Halo/class/beacon-class, changing post-bootstrap sigils/bindings, activating new sub-books or concentration caps, replacing the temporary SDR auction with real auctions, activating canonical propagation, settlement closure, Growth Staking, or Genbook enforcement. Each later phase is an additive topology delta; the substrate books rest on is never rewritten.

## P1 carve-outs (deferred, additive later)

Genbook + cross-Prime concentration; non-`structbook` sub-books; real Prime-strategy SDR auctions; canonical risk-form/loop-template propagation; settlement closure beyond DSC; stress-modified SPTP; mezzanine/equity tranches; DR/SDRR/tagging; Core-Entity halo-mode (legacy exposure stays patch-fed exsyn). Invariants distilled from these: [`phase-1-principles.md`](phase-1-principles.md).

## File map

[`../roadstart/README.md`](../roadstart/README.md) (full) · [`attestor-atom-schema.md`](attestor-atom-schema.md) · [`custodial-crypto-risk-form.md`](custodial-crypto-risk-form.md) · [`grounding-and-workcells.md`](grounding-and-workcells.md) · [`sigils-and-workcells.md`](sigils-and-workcells.md) · [`teleonomes.md`](teleonomes.md) · [`testonomes-and-phase-rehearsal.md`](testonomes-and-phase-rehearsal.md) · [`localnome.md`](localnome.md) · [`market-memory-oracle.md`](market-memory-oracle.md) · [`matching.md`](matching.md) · [`capital-formula.md`](capital-formula.md) · [`roadmap-ideas.md`](roadmap-ideas.md) · [`phase-1-principles.md`](phase-1-principles.md) · [`phase-1-overview.md`](phase-1-overview.md).

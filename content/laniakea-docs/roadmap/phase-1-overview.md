# Phase 1 — Fronts

Orientation layer above [`phase-1-spaces.md`](phase-1-spaces.md) (the canonical Space spec). A **front** is a unit of focused attention — a region, participant, or challenge — not a topology unit; the same component (e.g. synserv) appears through several fronts by design.

**Deliverable:** real-time ER per Prime, emitted continuously in production-quality synlang. Settlement and penalty stay manual.

**Global guardrails.** What's locked (capital-math vocabulary, naming convention, beacon taxonomy) — don't relitigate. Build once (code→synlang, data→atoms from day 1; black-box deferrals are honest scaffolds). Fix the consumption site, migrate provenance later (phase-invariant). Tempted to sudo mid-phase? You've started a new phase. The carve-outs are deliberate ([`phase-1-principles.md`](phase-1-principles.md)).

## Structural fronts (where)

- **The Core** — can the substrate run signed, scheduled, scatter-gather loops at all. Covers `syngate` (the trust boundary), `loop.synserv`, the registries, settlement/treasury, and the grounded execution surface. Risk-form equations are **not** here.
- **Prime–Halo** — the deliverable. The ER rollup `exobook → riskbook → halobook NFAT projection → structbook → primebook → ER`, plus attestor gates, market memory, the insyn/exsyn TRRC split, and dynamic auto-wiring (a new constructor must be immediately live in the rollup with no follow-up sudo).
- **Demand Side** — SDR: how much USDS liability is sticky enough to support matched assets per bucket. Lot-age surface → Lindy SDR → policy overlay → effective capacity; the temporary `sdr-auction` splits it; structbooks read only `(sdr-allocation …)`.

## Operator fronts (who) — each converges to a local telart

- **synserv (+ Guardian/Ozone)** — central node: heartbeat, sequence accepted writes, run the rollup, advance DSC, emit ER. Singleton + hot standby. Guardian holds all sudo at genesis.
- **relay / synops operators** — deterministic beacons; govops is the human operator. Relay = external action + synome record; synops = in-synome only. Core/Prime/Halo variants.
- **Attestor** — boolean borrower/riskbook/exobook gates; underwrites legal/operational/credit/term, not loan numbers (those are insyn).
- **Market Oracle** — current state + rolling market memory; reducer provenance and archive replay are the trust surface.
- **patch beacon** — per-Prime exsyn-TRRC scaffold; the one class with no regulated framework, designed to sunset.
- **test-runner** — testonome/testosynome rehearsal; the conformance tests *are* the normative risk-form spec until a canonical Space exists.

Detail: [`phase-1-spaces.md`](phase-1-spaces.md) · [`attestor-atom-schema.md`](attestor-atom-schema.md) · [`market-memory-oracle.md`](market-memory-oracle.md) · [`testonomes-and-phase-rehearsal.md`](testonomes-and-phase-rehearsal.md) · [`roadmap-ideas.md`](roadmap-ideas.md).

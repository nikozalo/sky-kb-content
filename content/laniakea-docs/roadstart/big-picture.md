# Big Picture — Background for Roadmap Work

Durable framing the roadmap assumes. Concrete counts, rosters, parameters, and cut-times are intermediate implementation — see [`../roadmap/phase-1-spaces.md`](../roadmap/phase-1-spaces.md) and the implementation canon. Full depth lives in `summaries/` (one file per topic dir).

## What Laniakea is

Sky's automated capital-deployment infrastructure on USDS. The **synome** is replicated public **synart** running on a synomic runtime, hosting **Synomic Entities** (ledger-native agents) operated by private **teleonomes** through regulated apertures called **beacons**.

**Five layers / three artifact tiers:** Synome (synart, public) → Synomic Entities (synart) → Teleonomes (telart, private) → Embodiments (embart) → Embodied Agents (ephemeral). L1–2 are public and replicated; L3–5 private. **P1 builds the L1–2 substrate.**

**Dual architecture** across every layer: a sparse **deontic skeleton** (axioms/rules, governance-paced) plus a dense **probabilistic mesh** (evidence-driven beliefs). P1 is essentially the deontic skeleton.

## Entities and beacons

Ranks: Core Council (0) → Guardian (Ozone) / Core Entity (1) → Prime / Generator / Oracle / Sequencer / Pylon (2) → Halo / Folio (3). **P1 inventory (shape, not roster):** one Generator (USDS), one market-memory Oracle, a roster of canonical Primes, and a few Term Halos sharing one halo class × one risk class.

**Beacons** are regulated apertures classified by authority tier × I/O role: inputs (`market-data` / `attest-data` / `patch`), actions (`synops` / `relay` / `sentinel`), plus **synserv**, the sole canonical sequencer. P1 beacons are deterministic govops-run programs; sentinels are later-phase. Details: `macrosynomics/beacon-framework.md`.

## Substrate

**Synart is the program;** runtimes (Noemar) interpret it. Identity-driven boot; `&core.bootstrap` runs once then goes inert. Topology = a tree of entarts plus universal `&core.*` Spaces. The **gate** is the trust-boundary primitive; **call-out** is the only synart→telart bridge; **calculation is in-space** (synserv runs it, beacons are pure I/O). Chain-side patterns: PAU, Configurator, LCTS, NFATS. Governance is fully sudo at genesis (Guardian holds all); SpellCore/SpellGuard is post-transition. Depth: `summaries/noemar-synlang.md`, `summaries/governance.md`.

## Accounting

Capital stack: IJRC/EJRC → Prime-token inflation → MDC/SRC. **ER = TRRC / TRC**, governance-capped below 1. The **DSC** is the only in-synome cadence (daily cut → processing window → epoch advance, wall-clock-derived); legacy monthly settlement stays out-of-band. TMF, DR, SDRR, and Growth Staking are post-P1. Depth: `summaries/accounting.md`.

## Phase roadmap

P1 real-time ER per Prime · P2–4 settlement closure / TMF / LCTS · P5–8 factory stack for entity expansion · P9–10 sentinel formations + real auctions · beyond: richer cognitive recipes. Any sudo event during a phase is a phase boundary.

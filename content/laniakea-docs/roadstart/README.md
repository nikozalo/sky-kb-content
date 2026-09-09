# Focused-Work Mode Entry

Phase execution (P1, P2, …). Load: this dir (`roadstart/`) + `../roadmap/` — that's the entire focused-mode preload set. **No dependencies on files outside these two dirs.** Skip `../summaries/` and the rest of the broader corpus. Big-picture mode (Laniakea-wide thinking) entry: `../summaries/README.md`.

The roadmap dir carries **lean P1-scoped versions** of four risk-framework files (`custodial-crypto-risk-form.md`, `matching.md`, `capital-formula.md`, `market-memory-oracle.md`). Their canonical verbose bodies remain at `../risk-framework/`; the lean roadmap copies carry only what P1 binds to and link back for theory / multi-phase content.

## Reading order from cold

1. `big-picture.md` — Laniakea architecture context the roadmap assumes
2. `risk-framework.md` — risk concepts the roadmap assumes (P1-binding details in lean files below)
3. `../roadmap/phase-1-overview.md` — Phase 1 by fronts (orientation layer)
4. `../roadmap/phase-1-spaces.md` — canonical Phase 1 synart Space-by-Space spec, including workspec Spaces
5. `../roadmap/phase-1-principles.md` — current P1 invariants (one line each)
6. `../roadmap/synlang-p1-form.md` — minimal executable synlang form LN1/LN6 rely on
7. `../roadmap/attestor-atom-schema.md` — canonical attestor schema
8. `../roadmap/custodial-crypto-risk-form.md` — lean: THE P1 binding risk form body
9. `../roadmap/matching.md` — lean: smooth matched/unmatched blend formula
10. `../roadmap/capital-formula.md` — lean: per-position formulas + TRRC + ER
11. `../roadmap/market-memory-oracle.md` — lean: oracle inputs the risk form consumes
12. `../roadmap/roadmap-ideas.md` — design patterns (lift, insyn/exsyn, sudo staircase, phase-invariant)
13. `../roadmap/grounding-and-workcells.md` — P1 grounded execution: literal / special form / stdlib / speciallib / workcell-backed stack
14. `../roadmap/noemar-synlib-telseed.md` — provisional principles for Noemar vs synlib vs telseed boundaries
15. `../roadmap/sigils-and-workcells.md` — canonical P1 callable/workcell inventory
16. `../roadmap/testonomes-and-phase-rehearsal.md` — testing / phase rehearsal doctrine: testonomes, testosynomes, workspec/workspace parity, prod unit tests, canaries
17. `../roadmap/teleonomes.md` — five P1 production-candidate teleonome delivery specs
18. `../roadmap/localnome.md` — iterative local build ladder through full P1
19. `../roadmap/localnome-containers.md` — container / workcell / fake-external-world doctrine for Localnome and the later telseed packaging learning loop
20. `../roadmap/testosynome-scenarios.md` — cross-teleonome scenario coverage and activation suite
21. `../roadmap/p1-nfat-atom-trace.md` — resolved atom-level NFAT heartbeat trace
22. `../roadmap/p1-borrower-nfat-user-scenario.md` — narrative borrower-to-ER scenario

## File map

| Doc | Role |
|---|---|
| `big-picture.md` | 5-layer arch, beacon taxonomy, smart contracts (PAU/Configurator/LCTS/NFATS), Noemar substrate, governance, accounting/DSC, phase ladder |
| `risk-framework.md` | 5 risk types, book primitive, tranching + waterfall, currency frame, sub-book taxonomy, default-deny, capital formula, custodial-crypto form body, SDR model, asset risk-type tuple |
| `../roadmap/phase-1-overview.md` | Fronts orientation (structural + operator) above the canonical Space spec |
| `../roadmap/phase-1-spaces.md` | Durable Phase 1 synart **shape**: Space categories, halo class/risk class decoupling, constructors, attestation model, ER rollup path, genesis/phase-boundary discipline, carve-outs |
| `../roadmap/phase-1-principles.md` | 17 invariants distilled from P1 design |
| `../roadmap/synlang-p1-form.md` | Minimal executable rule / loop / risk-form shapes needed by Localnome 1 and the custodial-crypto risk body |
| `../roadmap/attestor-atom-schema.md` | Borrower readiness/admission + riskbook/exobook attestation schemas, ready-empty/funded-active lifecycle, default-deny gate, slashing surface |
| `../roadmap/custodial-crypto-risk-form.md` | **Lean** — P1 binding risk-form body: composition scope, exobook waterfall, CRR component outputs, riskbook aggregation, structbook consumption |
| `../roadmap/matching.md` | **Lean** — smooth blend formula, cumulative capacity matching, P1 SDR allocation source, termbook-vs-structbook |
| `../roadmap/capital-formula.md` | **Lean** — per-position flow, structbook formula (only P1-active), TRRC aggregation, ER |
| `../roadmap/market-memory-oracle.md` | **Lean** — memory-system pattern, reducer versioning, output families, quality states, scenario discipline |
| `../roadmap/roadmap-ideas.md` | Sudo staircase, frame mechanism, lift principle and its sub-patterns (code/data, insyn/exsyn, black-box, temporary-equation, phase-invariant), DSC, market-memory, don't-rabbit-hole |
| `../roadmap/grounding-and-workcells.md` | P1 grounded execution stack: literals, special forms, stdlib, speciallib, workcell-backed sigils, bindings, implements, implement code blobs, workcells, installer, `&core.bootstrap` |
| `../roadmap/noemar-synlib-telseed.md` | Provisional boundary principles for keeping Noemar minimal while synlib carries governance-maintained defaults and telseeds carry birth/install packages |
| `../roadmap/sigils-and-workcells.md` | Complete P1 callable/workcell inventory across special forms, stdlib, speciallib, `SYNGATE-READ`, `CHAINREAD`, workcells, Space feed map |
| `../roadmap/testonomes-and-phase-rehearsal.md` | Testonomes/testosynomes, testonome workcells, embstate boundaries, workspec/workspace parity, P1 boot testing, later phase rehearsal, prod unit tests, prod canaries |
| `../roadmap/teleonomes.md` | Production-candidate delivery notes for `synserv`, `entity-govops`, `core-govops`, `attestor`, and `market-data` teleonomes |
| `../roadmap/localnome.md` | Build ladder from single-runtime callable tests to full local P1; intentionally narrative until Noemar has a real ingestion format |
| `../roadmap/localnome-containers.md` | Container and external-world isolation doctrine; phases one-localtel-per-container into Localnome and defers telseed package shape until Localnome has produced evidence |
| `../roadmap/testosynome-scenarios.md` | Scenario coverage matrix and P1 activation rehearsal suite |
| `../roadmap/p1-nfat-atom-trace.md` | Atom-level read/write **shape** per rollup stage + default-deny branches (symbolic, value-free) |
| `../roadmap/p1-borrower-nfat-user-scenario.md` | Value-free narrative borrower-to-ER path: readiness → admission → ready-empty books → NFAT mint → disbursement → structbook ER update |

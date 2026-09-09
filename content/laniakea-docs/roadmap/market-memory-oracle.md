# Market Memory Oracle — P1 Lean

Lean P1 view of [`../risk-framework/market-memory-oracle.md`](../risk-framework/market-memory-oracle.md) (canonical — concrete reducer/atom catalog and the P1 asset set there). This file carries only the durable patterns P1 binds to.

The Crypto Majors Oracle is a **market-memory system**, not a tick pusher:

```
raw source tape (archive nodes)
  → versioned reducer formulas (replay mode for history + live-tail for new events; same formula, same atom shapes)
  → reducer outputs + rolling memory + provenance checkpoints in &entity.oracle.crypto-majors.ticks
```

Risk forms read reducer outputs + provenance, not the processing mode. The synome stores reduced memory, not raw tapes; raw archives, credentials, and reducer runtime state live in market-data embstate.

**Topology:** `crypto-majors.root` / `.market-data` (beacon loop) / `.ticks`. The teleonome instantiates the ethereum, market-data-obtainer, market-data-processing, and syngate workspecs.

**Reducers** are immutable by version (`*-v2` never mutates `*-v1`); the same formula runs replay and live-tail, emitting identical atom shapes so live data becomes future history and scenarios can replay old periods. Each batch carries reproducibility anchors (input window, source coverage, archive/normalizer/reducer/output hashes, quality report).

**Output families** the `custodial-crypto` form reads: prices/pegs, volatility/correlation/basis, liquidity/impact, liquidation overhang, funding/basis/leverage, rates/macro factors, crash quantiles, and data quality. Every output carries subject, metric family, value/curve/distribution, window, as-of, source set, reducer version, checkpoint hash, and quality status (`pass` / `degraded` / `stale` / `failed` / `disputed` / `manual-review`). Risk forms pin behavior per quality state (consume / haircut / default-deny).

**Scenario discipline:** scenarios reference reducer outputs rather than free parameters; any remaining semantic bridge ("war = this bundle of reducer refs") is explicit, and later causal models replace it without changing the consumption path.

**Not here:** loan facts (collateral, debt, LT, maturity, accounts) — those are exobook / `CHAINREAD` / attestor-gated.

**Localnome:** start from the minimal raw series the P1 form consumes, and simulate upstream sources (fake feeds into the data-obtainer workcell, forked chain into the ethereum workcell) so the reducer path is exercised, not bypassed.

# Custodial-Crypto Risk Form — P1 Lean

Lean P1 view of [`../risk-framework/custodial-crypto-risk-form.md`](../risk-framework/custodial-crypto-risk-form.md) (canonical full body — exact collateral/denom roster, term bound, worked math). The P1 risk-form model for fixed-term custodial crypto lending: major liquid crypto collateral backing senior USD-frame exo units. Lives per-halo at `&entity.halo.{id}.custodial-crypto`.

**Stress-envelope, not expected loss:** apply the approved scenario library's shocks to each exobook's collateral, translate to USD frame, run the exobook liability waterfall, take the worst senior loss. `default-CRR = max-scenario senior loss / senior notional`. The question is whether the senior exo unit survives the scenarios governance says must be survivable. CORE is calibration/reference only — never the binding engine, never called via `call-out`.

**Composition scope** (single senior tranche; P1 collateral/denom set and bounded TTM in the canonical doc): anything outside the form falls through to default-deny CRR 100%.

**Inputs:** exobook state via `CHAINREAD` (collateral, debt, LT, LTV, maturity, lifecycle); boolean attestation gates (admission + exobook term, default-deny on missing/stale/fail — no quantitative content); market memory from the oracle `ticks` ([`market-memory-oracle.md`](market-memory-oracle.md)); a named scenario library referencing reducer outputs.

**Waterfall** per exobook `e`, scenario `s`: `senior_loss = max(0, senior_notional − stressed_asset_value)`, with scenario-consistent junior-cushion revaluation.

**Four components:** `default-CRR` (irreducible — SDR matching never removes it), `spread-CRR` (MTM before maturity — SDR-covered for the matched portion), `rate-CRR` (term carry mismatch — non-binding for matched), `liquidity-CRR` (wrapper exit). **Riskbook aggregation** is per shared scenario (`max_s Σ senior_loss / total senior notional`), preserving correlation; only default-CRR aggregates to riskbook level in P1.

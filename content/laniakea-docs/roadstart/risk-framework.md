# Risk Framework — Essentials for Roadmap Work

The risk-framework concepts the roadmap assumes but doesn't define. Compact companion to `roadmap/`; full depth in `risk-framework/` (file map at bottom).

**Five risk types.** Default/fundamental (permanent — capital always required, irreducible floor); credit-spread MTM (mean-reverting — held-to-par via SDR/term match); rate cash-flow drag (can be permanent — match, hedge, or rate-CRR); liquidity/fire-sale (crystallizes on forced sale — held-to-par or transferability); concentration (portfolio-level — category caps + 100% CRR on excess). Default capital is always required; sub-books only modify the other four. ASC and ORC are parallel tracks, not in TRRC. Stress is point-in-time worst-case, not lifetime PD.

**Book primitive.** Every book is `(assets, tranches, equity-tranche, rules, state, frame)` with exactly one equity tranche (first-loss); solvent iff equity > 0; real-time equity recomputation required; bankruptcy-remoteness at the Riskbook level (no netting across Riskbooks). Rules are synart-resolved code synserv runs in-space.

**Tranching.** Ordered claims `(seniority, holder, notional, denomination)`; waterfall most-junior-first; `senior_loss = max(0, asset_drop − junior_cushion)` with mandatory cushion revaluation under stress. Anything overcollateralized is a senior tranche of a tranched exobook.

**Currency frame.** Frame = abstract unit of account (P1: USD via the Generator). Instrument = concrete realization (unit-of-account / stablecoin-proxy / native-volatile). The Riskbook is the translation layer — depeg/FX/asset stress applied there.

**Four-layer stack.** Riskbook (unit of regulation; matches a risk form or CRR 100%; default risk + currency translation; bankruptcy-remote) → Halobook (declares P = permitted unwind and T = transfer market; pure summation, no netting) → Primebook (routes Halobook units by structural eligibility into typed sub-books) → Genbook (system-wide concentration; **deferred in P1**). U/P/T liquidity: two exit paths, `U AND P` (unwind) or `T` (transfer).

**Sub-books.** `ascbook`, `tradingbook`, `termbook`, `hedgebook` deferred; **`structbook` is the active P1 sub-book** (SDR-matched covers spread/rate/liquidity for the matched portion; unmatched is forced-loss). Routing is declarative by eligibility; switching is free (no motivational scrutiny). Optimization-shaped sub-books blend matched/unmatched smoothly.

**Default-deny CRR 100%** when a riskbook/exobook has no matching risk form or exceeds recursion depth — same pattern as verb whitelists: regulated activity flows where governance built infrastructure.

**Capital formula.** `structbook`: `position_capital = matched × default-CRR + unmatched × max(default-CRR, spread-CRR + liquidity-CRR) + unmatched × rate-CRR`. `TRRC = Σ position_capital + concentration excess`; `ER = TRRC / TRC`, governance-capped below 1. `TRC` spans IJRC/EJRC/SRC tiers ([`risk-framework/`] / `accounting/capital-stack.md`).

**Custodial-crypto form (P1).** Stress-envelope waterfall (not expected loss): worst approved-scenario senior loss / notional = default-CRR; four components out; SDR matching never removes default-CRR. Inputs all insyn (`CHAINREAD` + market memory) plus boolean attestation gates; CORE is calibration-only. Body: [`risk-framework/custodial-crypto-risk-form.md`](risk-framework/custodial-crypto-risk-form.md).

**SDR + matching.** Buckets are time-binned by tenor; an asset routes to the bucket matching its **SPTP** (Stressed Pull-to-Par = nominal × stress modifier; P1 NFAT uses nominal, no modifier; assets with no SPTP can't be matched). Eligibility = `SPTP ≤ bucket tenor` + a rate treatment (P1: SDR match). Pipeline in `usge.structural-demand`: lot-age surface → Lindy SDR → policy overlay → effective capacity; `usge.sdr-auction` splits by ownership weight. Conservative rounding (liabilities down, assets up); cumulative capacity; continuous, not binary.

**Asset risk-type tuple** (per canonical asset, target `&core.framework.risk.asset-profiles`): fundamental RW, drawdown distribution, slippage model, SPTP, correlations, currency dimension → asset-level liquidity profile. No risk form inlines its own asset stress (single source of truth). In P1 the per-halo risk class carries the copy (phase-invariant consumption site).

**Risk forms** declare `level / frame / composition-constraints / variables / equation-* / resolution-tier`; the catalog is governance's primary risk-shaping lever.

**Hedging** is quantified residual risk (counterparty × basis × slippage × tenor mismatch), tactical (Riskbook) or portfolio (Hedgebook, deferred). **Concentration** (Primebook + Genbook, deferred enforcement in P1): correlation categories, caps, excess × 100% CRR, max binding category, capacity rights. **ORC** (operator-posted, parallel to TRRC): P1 `ORC ≥ IRL × accumulation × N`; operating-setup era `ORC ≥ Rate Limit × TTS`. Parameter values: `smart-contracts/rate-limit-attacks.md`. **Projection models** for non-tranchable positions (not relevant to P1's single waterfall form).

## File map

`risk-decomposition.md` (five types, U/P/T) · `book-primitive.md` · `tranching.md` · `currency-frame.md` · `riskbook-layer.md` / `halobook-layer.md` · `primebook-composition.md` (sub-books) · `custodial-crypto-risk-form.md` · `sdr-model.md` · `matching.md` · `capital-formula.md` · `asset-classification.md` · `market-memory-oracle.md` · `correlation-framework.md` · `operational-risk-capital.md` + `smart-contracts/rate-limit-attacks.md` · `risk-monitoring.md` · `asset-type-treatment.md` / `projection-models.md` · `hedgebook.md` · `sentinel-integration.md`.

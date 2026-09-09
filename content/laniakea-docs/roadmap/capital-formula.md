# Capital Formula — P1 Lean

Lean P1 view of [`../risk-framework/capital-formula.md`](../risk-framework/capital-formula.md) (canonical full body, including the deferred sub-book formulas). P1 has one active sub-book, `structbook`.

**Per position:** risk-form match (else CRR 100% default-deny) → project asset stress through structure → route (P1: always `structbook`) → sub-book capital math → concentration excess (computed, enforcement deferred) → `position_capital = sub-book formula × position size`.

**`structbook` formula:**

```
matched   = min(position_size, available SDR capacity at required-or-higher bucket)
unmatched = position_size − matched
forced-loss-capital = spread-CRR + liquidity-CRR

position_capital = matched   × default-CRR
                 + unmatched × max(default-CRR, forced-loss-capital)
                 + unmatched × rate-CRR
```

SDR matching makes spread/rate/liquidity non-binding for the matched portion; **default-CRR is always required.** Missing SDR allocation = zero capacity → fully unmatched.

**Aggregation:** `insynTRRC = Σ position_capital + concentration excess (deferred)`; `TRRC = insynTRRC + exsynTRRC` (exsyn from `patch-{prime}`); `ER = TRRC / TRC`, governance-capped below 1. `TRC` is the governance-set scalar in the Prime root (tier mechanics deferred — see [`../accounting/capital-stack.md`](../accounting/capital-stack.md)). ER is emitted per heartbeat.

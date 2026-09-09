# Matching — P1 Lean

Lean P1 view of [`../risk-framework/matching.md`](../risk-framework/matching.md) (canonical, with the worked numeric example). P1's only active matched sub-book is `structbook`.

Hold-to-par matching makes a position's spread and liquidity risks "covered by structure" rather than capital — the Prime holds to maturity against structural demand. **Credit spread** is mean-reverting, so matching protects; **rate risk** can be permanent (regime shift), so the SDR mechanism is what makes rate-CRR non-binding for matched portions. Matching is **continuous, not binary** — a smooth blend as capacity utilization shifts, no transition event.

**Eligibility (P1):** `has-sptp(position)` routes it to `structbook`. SDR-allocation availability sets the **matched portion within** structbook, not membership — missing/zero allocation → `matched = 0`, full position unmatched.

**Smooth blend:**

```
structbook CRR = matched × default-CRR
               + unmatched × max(default-CRR, spread-CRR + liquidity-CRR)
               + unmatched × rate-CRR
```

**Cumulative capacity:** a position matches against its required bucket and all higher buckets; matched = min(size, cumulative SDR capacity there). As stickiness grows, more matches → lower capital (natural incentive alignment).

**SDR source:** total capacity is produced in `usge.structural-demand`; `structbook` reads only `(sdr-allocation $prime $bucket $amount $epoch)` from `usge.sdr-auction`. That atom shape is the stable contract — temporary and future real auctions write the same shape; no P1 carry-forward.

`termbook` (tUSDS YT match, covers rate too) is Phase 2+; `structbook` is the active P1 sub-book.

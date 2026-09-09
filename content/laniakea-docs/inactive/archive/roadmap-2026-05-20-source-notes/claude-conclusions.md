# Claude Conclusions — Sigil Naming + Doc Cleanup

**Status:** Checkpoint from a working session. Captures resolved design decisions, the specific doc-rewrite work that follows from them, and pending sub-decisions. Self-contained so context can be cleared and the work picked up later.

**Scope:** Implements the unresolved bits of [`sigil-naming-proposal.md`](sigil-naming-proposal.md), plus a parallel "stale-reference cleanup" pass driven by a separate user instruction ("clean these up so they dont have references to old or outdated things — `xyz replaces the older abc` patterns where `abc` isn't referenced anywhere else").

---

## 1. Sigil taxonomy — resolved

The five-row taxonomy below supersedes the proposal's drafts (which had six subtypes across two axes). Sub-categories live in prose as organizational vocabulary, not as formal tiers.

```
literal       — values                            (42, "hello", true)
special form  — evaluator control                 (if, let, match, quote)

stdlib        — bundled inline; pure              substitutable by value;
                                                   no state reads; no side effects

  · utility       (+, -, *, /, ==, <, <=, >, >=, MIN, MAX, SUM, SHA256)
  · optimization  (future: STRESS-WATERFALL-KERNEL, MATCHING-SOLVER,
                   CORRELATION-MATRIX-KERNEL — heavy pure kernels)

speciallib    — bundled inline; non-substitutable  reads runtime state or
                                                   mutates substrate

  · bootstrap powers   (MATERIALIZE-IMPLEMENT, BIND-SIGIL,
                        REGISTER-WORKCELL-HUB, ENABLE-LOOP)
  · frame ops          (FORK, SWITCH, DISCARD, DIFF)
  · scheduler reads    (NOW)

workcell      — live operational setup            backed by hub +
                                                   components beyond evaluator

  · exogenous     (SYNGATE-READ, CHAINREAD;
                   future SENSORREAD, SCRAPE, SENDTX, CHAINPROOF, ROBOT-CONTROL)
  · optimization  (future: GPU-BATCH-SOLVE, HPC-SCENARIO-SWEEP, MONTE-CARLO-CLUSTER)
  · neural        (future: EMBED, RERANK, ASKLLM, CLASSIFY)
```

### Specific resolutions

- **`=` is reserved** for synlang's definition / equation / function-definition syntax. **`==`** is the equality operator. Update everywhere `=` currently appears as comparison (notably the stdlib row in `sigils-and-workcells.md` §1).
- **All word-callable sigils are UPPERCASE** (`MIN`, `MAX`, `SUM`, `SHA256`, `NOW`, `BIND-SIGIL`, `FORK`, etc.). Symbolic sigils retain their symbols (`+`, `==`, `<`).
- **`NOW` is speciallib**, not stdlib. Speciallib's defining property is non-substitutability — `(NOW)` returns different values across heartbeats, so it can't be replaced by a value at any point in evaluation. Keeping stdlib pure makes its substitutability invariant load-bearing.
- **Bootstrap powers are speciallib** (not their own tier, not a "scope" property on sigils). They use the same binding/implement machinery as ordinary sigils; what's different is their target (runtime substrate). Their "bootstrap-only" availability is **emergent from auth state, not a categorical restriction** — see §1.3.
- **Frame ops** (`FORK`, `SWITCH`, `DISCARD`, `DIFF`) graduate from "Noemar-native non-sigil controls" to **first-class speciallib sigils**. Casing flips lowercase → UPPERCASE. They have bindings, can be declared in `loop-requires`, and access is governed by auth-to-target like everything else.
- **The proposal's three inline subtypes** (standard bundled / runtime / optimization) and **three workcell subtypes** (exogenous / optimization / neural) **stop being formal tiers**. They survive as organizational sub-categories in prose. The "optimization" sub-category specifically cross-cuts stdlib (pure local kernel) and workcell (live cluster) — pivot is operational: versioned code artifact loaded by evaluator vs. live resources needing health/queue/failover.

### Why "speciallib" not "criticallib"

The earlier framing tried "criticallib" with the implicit semantic claim *"administers substrate, structurally essential."* That forced awkward arguments — `NOW` isn't critical, `DIFF` is introspection-only, future tear-down sigils aren't critical either. Speciallib drops the semantic claim and just means **"bundled inline, doesn't fit stdlib's purity invariant"** — a grab-bag tier for runtime-state reads, substrate mutations, frame controls, future introspection/teardown. Accommodates the long tail without needing to rename when adding members.

### Access control — auth model, not sigil scope

Bootstrap powers are not "restricted to `&core.bootstrap`" as a property of the sigil. They're ordinary sigils. Whoever can usefully call them is determined by **auth to their target substrate**:

| Sigil | Target | Who has write auth |
|---|---|---|
| `BIND-SIGIL` | runtime binding table | `&core.bootstrap` during boot; no one after |
| `MATERIALIZE-IMPLEMENT` | implement-materialization dir | `&core.bootstrap` during boot; no one after |
| `REGISTER-WORKCELL-HUB` | workcell hub registry | `&core.bootstrap` during boot; no one after |
| `ENABLE-LOOP` | loop registry | `&core.bootstrap` during boot; no one after |

After successful boot, `&core.bootstrap` becomes inert (its auth grants over runtime substrate revoke/expire). Subsequent calls to these sigils — from any loop that might declare them — return auth-failure at call time. Same pattern as `(auth $beacon $verb $target)` everywhere else. The gate is auth-to-target evaluated at the point of effect, not `loop-requires` at enable time.

### Primordial bindings — implementation note

`BIND-SIGIL` is the sigil that creates new sigil bindings. Chicken-and-egg: how is `BIND-SIGIL` itself bound? Answer: **primordial.** The 4 bootstrap powers, the 4 frame ops, `NOW`, and most/all of stdlib have bindings that ship with the Noemar distribution — pre-populated in the runtime's binding table before `&core.bootstrap` evaluates. Bootstrap then uses them to bind everything else (`CHAINREAD`, `SYNGATE-READ`, future workcell sigils via implement code blobs). Same shape as compiler bootstrap.

Worth one paragraph in `grounding-and-workcells.md`. Not a taxonomic axis.

### `loop-requires` — deferred

The current §6 declaration shape in both `grounding-and-workcells.md` and `sigils-and-workcells.md` stays as-is for now. No reshaping in this pass. When bootstrap's loop-enable check actually needs implementing, revisit shape then.

---

## 2. Sigil absorption — file-by-file changes

The proposal's "Plan for modifying current docs" (§7 of `sigil-naming-proposal.md`) is the right outline. Updates to that plan reflecting our resolved taxonomy:

### `grounding-and-workcells.md`

- **§1 "Grounded callable split" table:** replace with the 5-row taxonomy above. Keep sub-category bullets under stdlib / speciallib / workcell as prose, not as table rows.
- **Syntax convention block** (currently `lowercase / symbols = stdlib, ALL CAPS = sigil`): rewrite. New convention:
  ```
  ALL CAPS / symbols  = sigils (word-callable uppercase; symbolic ops keep symbols)
  $                   = variables
  &                   = Spaces
  numbers / quotes    = literals
  ```
- **§2 workcell-backed sigil stack:** change "workcell hub" and "workcell components" from mandatory to optional. New stack:
  ```
  sigil
    -> binding
      -> implement.method
        -> implement code blob
          -> [optional] workcell hub
            -> [optional] workcell components
  ```
  Inline sigils stop at implement code blob; workcell sigils go all the way down.
- **Add a paragraph on primordial bindings** (§2 or new §2.5): "Most stdlib and all speciallib sigils have primordial bindings — they ship with the Noemar distribution, pre-populated in the runtime's binding table before `&core.bootstrap` evaluates. Bootstrap uses them to bind workcell sigils via implement code blobs and hub registration. This resolves the chicken-and-egg around `BIND-SIGIL` itself."
- **Add a paragraph on access control** (§2 or §4): "Sigils are not scope-restricted at the taxonomy level. Whoever can usefully call a sigil is determined by the auth model evaluated at call time against the sigil's target. The bootstrap powers' `&core.bootstrap`-only availability is emergent — after boot, no one has auth over runtime substrate, so any subsequent call returns auth-failure."
- **§3 workcell content:** no structural changes, but update "P1 boundary" framing to clarify inline sigils don't have workcells.
- **§5 installer / boot flow:** unchanged.
- **§6 loop requirements:** unchanged (deferred).
- **§7 P1 callable inventory:** update to point at `sigils-and-workcells.md` for the canonical list under the new taxonomy.
- **Remove "the old 'grounded atom' bucket"** framing where it appears — stale-reference cleanup, see §3.

### `sigils-and-workcells.md`

- **§1 callable categories table:** rewrite to match the new taxonomy. Fold the current "Bootstrap-only powers" row into speciallib. Move `NOW` from "Native stdlib sigil" to speciallib. Add `FORK`, `SWITCH`, `DISCARD`, `DIFF` to speciallib. Change `=` to `==` in the stdlib row. The "Noemar-native controls" row disappears (frame ops are now speciallib sigils).

  Target table:
  | Category | P1 members | Backed by workcell? |
  |---|---|---|
  | Special forms | `if`, `let`, `match`, `quote` | No |
  | Stdlib (pure) | `+`, `-`, `*`, `/`, `==`, `<`, `<=`, `>`, `>=`, `MIN`, `MAX`, `SUM`, `SHA256` | No |
  | Speciallib | `NOW`, `FORK`, `SWITCH`, `DISCARD`, `DIFF`, `MATERIALIZE-IMPLEMENT`, `BIND-SIGIL`, `REGISTER-WORKCELL-HUB`, `ENABLE-LOOP` | No |
  | Workcell-backed sigils | `SYNGATE-READ`, `CHAINREAD` | Yes |

  Add a note that sub-categories (utility / optimization for stdlib; bootstrap powers / frame ops / scheduler reads for speciallib; exogenous / optimization / neural for workcell) are recognized organizational labels even though they're not separate tiers.

- **§2 `NOW`:** unchanged in content, but the heading classification changes to "speciallib scheduler-read sigil."
- **§3 `SYNGATE-READ` and `CHAINREAD`:** unchanged.
- **Add a new section** (or expand §4) listing the speciallib sigils that aren't workcell-backed: bootstrap powers + frame ops + `NOW`. Brief description of each — the bootstrap-power descriptions from `grounding-and-workcells.md` §4 are the right level.
- **§4 Workcells:** unchanged.
- **§5 Space feed map:** unchanged (current entries reference `SYNGATE-READ`, `CHAINREAD`, `NOW`; no taxonomy implications).
- **§6 loop requirement shape:** unchanged (deferred). Existing block stays.

### `phase-1-spaces.md`

- **Test System table, "Bootstrap / grounding" row** (currently "literal / special form / stdlib / sigil classification"): change to "literal / special form / stdlib / speciallib / workcell sigil classification."
- **Verify nothing else references** "native sigil" or "stdlib pure" — those terms get retired. Currently I don't see any other references in this file, but a grep before the edit is worth doing.

### `roadstart/README.md`

- **File-map entry for `sigils-and-workcells.md`:** update from "stdlib pure functions, `NOW`, `SYNGATE-READ`, `CHAINREAD`, workcells, Space feed map" to "complete P1 callable inventory across literal / special form / stdlib / speciallib / workcell tiers, plus workcells and Space feed map."
- **Reading order:** decide whether to keep `sigil-naming-proposal.md` listed. Recommendation: remove from reading order (and archive the proposal file — see below).
- **Pre-synlang ↔ synlang vocabulary mapping at the bottom:** pending user decision — see §4.

### `roadstart/big-picture.md`

- **"sigils (ALL CAPS callable powers)"** in the Noemar/synlang section: replace with "sigils — stdlib / speciallib (bundled inline) or workcell-backed; callable surface for grounded execution. Convention: word-callable sigils uppercase, symbolic sigils retain symbols."
- **"Grounded execution in P1 splits the old 'grounded atom' bucket into literals (values), special forms (evaluator control), and sigils (ALL CAPS callable powers)"**: rewrite to remove "the old 'grounded atom' bucket" framing. New: "Grounded execution in P1 has five callable categories: literals (values), special forms (evaluator control), stdlib sigils (pure utility), speciallib sigils (runtime-state operations), and workcell sigils (live operational setups). Canonical detail: `../roadmap/grounding-and-workcells.md`."
- **`endoscraper` denial**: cleanup decision — see §3.

### `sigil-naming-proposal.md`

- Once absorbed: **archive to `inactive/`** (preserves design trail) or **delete** (cleaner repo). Recommendation: archive to `inactive/proposals/sigil-naming-proposal.md` if the `inactive/` pattern is being maintained; otherwise delete. Pending §4 decision on inactive/.

---

## 3. Stale-reference cleanup — specific deletes

The pattern: "xyz replaces / is no longer / vs earlier drafts" framing where the older `abc` isn't referenced anywhere else. Useful at moment of design churn; dead weight once the design stabilizes.

### `phase-1-spaces.md`

- **"What's deliberately *not* here vs. earlier drafts:"** — entire bulleted block enumerating `&core.meta-topology`, `&core.registry.entity`, `&core.registry.halo-class`, `&core.registry.sigil`, `&core.registry.binding`, `&core.registry.workcell`, `&core.framework.risk.categories`, `&core.protocol`, `&core.test-results`, `&core.loop.market-data`, `&core.loop.attest-data`, `&core.loop.relay.prime`, `&core.loop.relay.halo`, `&core.loop.synops.halo`, `&core.loop.test-runner`. None referenced elsewhere; cleanest single delete.
- **"Book Attestation Oracle, an entity that existed in earlier drafts, no longer has its own entart Space…"** — rewrite to describe current state directly: "Phase 1 has one oracle entity: Crypto Majors Oracle for market data. Cert chains for class-accordant attestors live in `&core.registry.beacon`; borrower-readiness / borrower-admission / riskbook / exobook attestation atoms land directly in their target risk class or book Spaces."
- **"Draft v4 (2026-05-17 live-state cleanup — supersedes v3 of 2026-05-15)"** in the Status header — simplify to "Draft" or remove version supersession parenthetical.

### `phase-1-overview.md`

- **"Book Attestation Oracle…"** parenthetical (if present here too) — same treatment.

### `roadmap-ideas.md`

- **Black-box deferrals section** — entire "matured past opacity" framing (appears twice). Rewrite the section as forward-looking only: "When you don't know enough about a domain to model its internals, define the function signature in synlang and leave the body opaque. The discipline: define the smallest synlang surface that lets the layer above proceed. Defer everything else to its respective phase boundary." Don't reference the P1 custodial-crypto journey through opacity — describe current matter-of-fact state if relevant.

### `roadstart/big-picture.md`

- **"`endoscraper` is **not** a beacon class — chain reads are grounded execution through the `CHAINREAD` sigil…"** — `endoscraper` appears nowhere else in roadstart or roadmap. Rewrite as positive statement: "Chain reads happen through the `CHAINREAD` sigil, resolved by Noemar through a binding to an implement backed by a workcell."
- **"the old 'grounded atom' bucket"** framing — already covered in §2 sigil absorption.

### Multiple files: timestamp / version lines

- **Status / Last Updated headers** across most files (`phase-1-spaces.md`, `phase-1-overview.md`, `attestor-atom-schema.md`, `grounding-and-workcells.md`, `sigils-and-workcells.md`, `sigil-naming-proposal.md`, `p1-nfat-atom-trace.md`, `asc-transition.md`, `v1-principles.md`, etc.). Decision pending — see §4.

### `v1-principles.md`

- **Title is "V1 Principles"** but content references "Phase 1." Rename file to `phase-1-principles.md` and title to "Phase 1 Principles." Update all incoming links in `roadstart/README.md`, `phase-1-overview.md`, `phase-1-spaces.md`. Minor consistency cleanup.

---

## 4. Pending sub-decisions

Two decisions still needed before executing the cleanup pass:

### 4.1 Pre-synlang ↔ synlang vocabulary mapping (`roadstart/README.md`)

The bottom table mapping `Synome-MVP` → `Universal Spaces`, `Halo Books` → `factory-created halobook Spaces`, etc. Useful only if `inactive/pre-synlang/roadmap/` material is actively being read; dead weight otherwise.

**Decision needed:** keep mapping (still reading legacy) or strip (no longer reading legacy).

### 4.2 Status / Last Updated lines across files

Three options:

- **(a) Strip both entirely.** No version tracking; rely on git for history.
- **(b) Keep `Status` (with values like "Proposal", "Resolved", "Working notes"), drop dates.** Conveys design state without becoming stale on every edit.
- **(c) Leave as-is.** Don't touch them this pass.

**Decision needed:** (a), (b), or (c).

---

## 5. Execution plan

Three passes (+ one optional):

**Pass 1: Stale-reference cleanup.** After §4 decisions are settled. Surgical deletes only; no taxonomy changes. Diff stays small and reviewable.

**Pass 2: Sigil proposal absorption.** Across the 5 docs in §2 (plus archive/delete proposal file). Coordinated edits; the per-file scope is fully specified above.

**Pass 3 (optional): Status/timestamp normalization.** Only if §4.2 chooses (a) or (b). Mechanical.

Doing Pass 1 before Pass 2 is mildly preferred because some stale-reference touches (the `endoscraper` denial, the "old grounded atom bucket" framing) overlap with sigil-doc rewrites, and it's cleaner to remove stale text first then restructure the new content.

---

## 6. Other quality issues noticed but not addressed in this pass

Carried forward for later attention:

- **`v1` vs `Phase 1` ambiguity** beyond the file rename — phrases like "v1 NFAT," "v1 measures gross-of-hedge," "v1 SDR auction body" use "v1" loosely. May or may not be worth normalizing.
- **Risk-form output naming** — the docs alternate between `default-CRR` / `spread-CRR` / `rate-CRR` / `liquidity-CRR` (hyphenated) and `default-crr` (lowercase in atom shapes). Consistent in context, but worth noting if a future pass touches risk-form atom naming.
- **Worked-example numbers** — the BTC price `$80000`, the senior loan `$750K`, etc. are illustrative; no calibration claim. Fine for now.
- **"Last Updated" dates spread across files** — last edit dates range from May 13 to May 19 2026, suggesting active churn. Most are recent enough that they're not yet stale, but timestamp normalization (Pass 3) would address.

---

## 7. What to load from cold to resume

When picking this up after context clear:

1. Read this file (`claude-conclusions.md`).
2. If continuing the sigil absorption: read `sigil-naming-proposal.md` for the original framing it supersedes.
3. If continuing the stale-reference cleanup: read whichever target files §3 lists.
4. Standard focused-mode preload (`roadstart/` + `roadmap/`) is still the right starting set per `CLAUDE.md`.

No other docs from this conversation depend on context that isn't already captured here or in the focused-mode preload set.

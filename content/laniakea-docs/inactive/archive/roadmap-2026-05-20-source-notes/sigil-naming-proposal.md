# Sigil Naming Proposal

**Status:** Proposal / working taxonomy.
**Scope:** A naming and classification proposal for grounded callables. This document is intentionally non-canonical until resolved. It does not itself change the P1 callable inventory in [`sigils-and-workcells.md`](sigils-and-workcells.md) or the substrate model in [`grounding-and-workcells.md`](grounding-and-workcells.md).

The purpose is to capture the current direction before rewriting the active docs: stdlib callables are sigils, but some sigils are inline code artifacts while others are backed by live workcells.

---

## 1. Core distinction

The learner-facing split should be:

| Category | Meaning | Examples |
|---|---|---|
| **Literal** | Value syntax; evaluates as a value. | `42`, `3.14`, `"hello"`, `true` |
| **Special form** | Evaluator control; changes how arguments evaluate. Not a sigil. | `IF`, `LET`, `MATCH`, `QUOTE` |
| **Sigil** | Grounded callable power; resolves through a binding to an implement. | `+`, `SHA256`, `NOW`, `CHAINREAD` |

`+`, `-`, `*`, `/`, comparison operators, `MIN`, `MAX`, `SUM`, and `SHA256` are not literals. They are **standard bundled sigils**: deterministic, workcell-less callables shipped with the standard runtime/library surface.

Single `=` should remain reserved for definition / equation / function-definition syntax. Equality comparison should use a distinct operator such as `==` if symbolic comparison is accepted.

---

## 2. Main sigil split

The important split is not simple vs complex, and not strictly synchronous vs asynchronous. It is:

```text
inline sigil   = inert local code artifact; runs in or near evaluator
workcell sigil = live maintained operating setup; accessed through a hub
```

The decisive test:

> If using the sigil only requires loading and running versioned code, it is an inline sigil. If using it requires maintaining live resources beyond the evaluator process, it is a workcell sigil.

A workcell sigil can still be synchronous at the call boundary: the evaluator may call `(CHAINREAD ...)` and wait for a result. The workcell distinction is about what must be kept alive behind the call: nodes, queues, API credentials, sensors, GPUs, model servers, provider failover, monitoring, and operator procedures.

---

## 3. Inline sigils

Inline sigils terminate at an implement method / code artifact. They do not require an ongoing workcell hub or live operational island.

```text
sigil
  -> binding
    -> implement.method
      -> implement code blob
```

### Standard bundled inline sigils

These are the ordinary stdlib callables. They are still sigils; they are just bundled, deterministic, and workcell-less.

Examples:

```text
+ - * /
== < <= > >=
MIN MAX SUM
SHA256
```

The symbolic arithmetic/comparison sigils are naming exceptions: they are callable sigils with symbolic spelling, not literals.

### Runtime inline sigils

These expose runtime-controlled context without an external workcell.

P1 example:

```text
NOW
```

`NOW` should return the heartbeat scheduler timestamp, not an arbitrary machine-clock read inside equations.

### Optimization inline sigils

These are local optimized implementations of heavy deterministic computations that should not be written directly in synlang.

Examples:

```text
STRESS-WATERFALL-KERNEL
MATCHING-SOLVER
CORRELATION-MATRIX-KERNEL
```

They might be Python wrappers around C, Rust, WASM, or optimized machine code. The key property is that the dependency is an artifact loaded by the evaluator, not a live external operating setup.

---

## 4. Workcell sigils

Workcell sigils call into a live maintained setup. The workcell is a bounded operating island with health checks, resource management, credentials or access control, operator procedures, and often multiple sigils sharing the same hub.

```text
sigil
  -> binding
    -> implement.method
      -> implement code blob
        -> workcell hub
          -> workcell components
```

### Exogenous workcell sigils

These connect synlang to the outside world: chains, sensors, scrapers, queues, robots, external APIs.

P1 examples:

```text
SYNGATE-READ
CHAINREAD
```

Future examples:

```text
SENSORREAD
SCRAPE
ROBOT-CONTROL
CHAINPROOF
```

### Optimization workcell sigils

These use a live compute facility rather than a local compiled artifact. The computation may still be deterministic, but the backing setup is an actively managed resource.

Examples:

```text
GPU-BATCH-SOLVE
HPC-SCENARIO-SWEEP
MONTE-CARLO-CLUSTER
```

The distinction from optimization inline sigils is operational: a local compiled risk kernel is inline; a scheduled GPU/HPC service with queues, capacity, health, and failover is a workcell.

### Neural workcell sigils

These call model/cognition infrastructure: a hot local GPU model, a model server, or a closed-source frontier-model API with routing, credentials, logging, and output-shape checks.

Examples:

```text
EMBED
RERANK
ASKLLM
CLASSIFY
```

Neural workcell sigils are out of ordinary P1 synserv scope, but the taxonomy should leave a clear home for them.

---

## 5. Relation to older vocabulary

The old rough split of `native`, `exo`, and `neural` sigils can be preserved conceptually:

| Older term | Proposed home |
|---|---|
| Native sigil | Usually inline sigil; specifically standard bundled, runtime, or optimization inline |
| Exo sigil | Exogenous workcell sigil |
| Neural sigil | Neural workcell sigil |

The new distinction is more precise because optimization can appear on either side:

- optimized local code artifact -> optimization inline sigil;
- live managed compute facility -> optimization workcell sigil.

---

## 6. P1 impact if accepted

P1 ordinary synserv execution would use:

| Type | P1 examples |
|---|---|
| Special forms | `IF`, `LET`, `MATCH`, `QUOTE` |
| Standard bundled inline sigils | `+`, `-`, `*`, `/`, `==`, `<`, `<=`, `>`, `>=`, `MIN`, `MAX`, `SUM`, `SHA256` |
| Runtime inline sigils | `NOW` |
| Workcell sigils | `SYNGATE-READ`, `CHAINREAD` |
| Bootstrap-only sigils | `MATERIALIZE-IMPLEMENT`, `BIND-SIGIL`, `REGISTER-WORKCELL-HUB`, `ENABLE-LOOP` |

Out of ordinary P1 loop scope:

```text
SENDTX
ASKLLM
randomness / stochastic powers
non-Ethereum chain access
beacon-local teleonome/operator sigils
```

---

## 7. Plan for modifying current docs

This section is the implementation plan for a later step. Do not apply these edits until the proposal is resolved.

### `sigils-and-workcells.md`

- Replace the current `Stdlib pure`, `Native stdlib sigil`, and `Workcell-backed sigils` table with a sigil taxonomy based on:
  - literals;
  - special forms;
  - inline sigils;
  - workcell sigils;
  - bootstrap-only sigils;
  - Noemar-native non-sigil controls.
- Move `+`, `-`, `*`, `/`, comparisons, `MIN`, `MAX`, `SUM`, and `SHA256` under standard bundled inline sigils.
- Replace equality `=` with `==` in comparison examples and state that `=` is reserved for definition/equation/function-definition syntax.
- Keep `NOW` as a runtime inline sigil.
- Keep `SYNGATE-READ` and `CHAINREAD` as P1 workcell sigils.
- Add a short "needs further research" note that this is the P1 working taxonomy, not the final language-wide sigil spec.

### `grounding-and-workcells.md`

- Change "grounded callable split" to:
  - literal;
  - special form;
  - sigil.
- Under sigil, introduce inline vs workcell-backed execution.
- Replace the current mandatory workcell stack with an optional-workcell stack:
  ```text
  sigil
    -> binding
      -> implement.method
        -> implement code blob
          -> optional workcell hub
            -> optional workcell components
  ```
- Update syntax examples to use uppercase special forms, symbolic stdlib sigils, `NOW`, and `CHAINREAD`.
- Update loop requirement examples to declare inline sigils and workcell sigils separately, or otherwise make clear that not all sigils require workcells.

### `phase-1-spaces.md`

- Update bootstrap / grounding test language from "literal / special form / stdlib / sigil classification" to "literal / special form / inline sigil / workcell sigil classification."
- Keep the operational write surface unchanged: `synserv-canonical` still reads syngate intake through `SYNGATE-READ`, chain state through `CHAINREAD`, and heartbeat time through `NOW`.

### `roadstart/README.md`

- Update the file-map entry for `sigils-and-workcells.md` after the proposal is accepted so it describes inline vs workcell sigils instead of "stdlib pure functions."
- Optionally add `sigil-naming-proposal.md` to the reading order while the taxonomy remains unresolved; remove or archive it after the canonical docs absorb the proposal.

### `roadstart/big-picture.md`

- Replace "sigils (ALL CAPS callable powers)" with a less brittle phrasing:
  ```text
  sigils (grounded callable powers; some symbolic, some word-like)
  ```
- Keep the point that `CHAINREAD` is resolved through a binding to an implement backed by a workcell.

---

## 8. Open questions

These should remain open until the next design pass:

- Whether symbolic comparison should be canonical as `==`, `<`, `<=`, `>`, `>=` or whether word aliases should also exist.
- Whether `MIN`, `MAX`, `SUM`, and `SHA256` should remain uppercase word sigils or adopt lowercase / symbolic aliases.
- Whether bootstrap-only powers should be called bootstrap-only sigils or kept as a separate bootstrap power category.
- Whether frame operations remain Noemar-native non-sigil controls or become bootstrap/test-only sigils.
- How much of this taxonomy should become long-term language spec versus P1 operating convention.

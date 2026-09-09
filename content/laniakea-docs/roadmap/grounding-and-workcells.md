# Grounding and Workcells

**Scope:** The grounded execution model Noemar needs for Phase 1: literals, special forms, stdlib, speciallib, workcell-backed sigils, bindings, implements, implement code blobs, workcells, installer boot, and `&core.bootstrap`.

Boundary principles for what should stay in Noemar versus move into governed libraries / telseeds live in [`noemar-synlib-telseed.md`](noemar-synlib-telseed.md). This doc pins the P1 grounded execution surface; it does not decide the later synlib or telseed package shape.

This doc does not add an ongoing sigil / binding / workcell registry. P1 has one boot Space, `&core.bootstrap`, that materializes the runtime call surface and then becomes inert. Ordinary loops only use already-bound sigils. The complete P1 callable/workcell inventory lives in [`sigils-and-workcells.md`](sigils-and-workcells.md).

---

## 1. Callable split

For P1, split callable and evaluator surface into five cases:

| Term | Meaning | Examples |
|---|---|---|
| **literal** | Built-in value atom | `42`, `3.14`, `"hello"`, `true` |
| **special form** | Evaluator-native control form | `if`, `let`, `match`, `quote` |
| **stdlib** | Bundled inline pure function; substitutable by value | `+`, `SHA256`, `MIN`, `==` |
| **speciallib** | Bundled inline non-substitutable operation; reads runtime state or mutates runtime substrate | `NOW`, `FORK`, `BIND-SIGIL` |
| **workcell-backed sigil** | Callable that reaches a bounded operational setup through a workcell hub | `CHAINREAD`, `SYNGATE-READ` |

Rule of thumb:

```text
literals are values
special forms govern evaluation
stdlib computes without reading or mutating hidden state
speciallib reads runtime state or mutates runtime substrate
workcell-backed sigils reach bounded external power
```

Syntax convention:

```text
word-callable sigils = UPPERCASE
symbolic sigils      = symbolic (`+`, `==`, `<`, etc.)
$         = variable
&         = Space
numbers   = literals
```

Examples:

```text
$borrower
&entity.halo.spark-term
loan-health
42
+
==
NOW
CHAINREAD
```

Special forms are Noemar evaluator law. A normal callable cannot implement `if` or `quote` cleanly because those forms change which arguments evaluate.

Adding a new literal type changes the language; adding a new special form changes the evaluator; adding a stdlib function changes the pure library; adding a speciallib or workcell-backed sigil changes the boot/binding surface.

---

## 2. Sigil stack

A sigil is not the program itself. It is the synlang-side callable name. Inline sigils stop at the implement code blob; workcell-backed sigils continue through a workcell hub into local components.

```text
sigil
  -> binding
    -> implement.method
      -> implement code blob
        -> [optional] workcell hub
          -> [optional] workcell components
```

Definitions:

| Term | Meaning |
|---|---|
| **sigil** | Callable symbol in synlang. Word-callable sigils use uppercase; symbolic sigils retain their symbols. |
| **binding** | Versioned wiring from a sigil to an implement method, including type, auth, determinism/effect, and verification policy. |
| **implement** | Controlled executable adapter/service Noemar can call. |
| **implement method** | Specific callable method on an implement. |
| **implement code blob** | Concrete source/package/blob that bootstrap materializes and verifies. |
| **workcell hub** | Strict machine-facing service the implement calls. |
| **workcell component** | Concrete operator-provided backing piece: node, signer, API endpoint, model endpoint, operator UI, robot arm, camera, etc. |

Example:

```text
CHAINREAD
  sigil

chainread-eth-mainnet-v1
  binding

eth-mainnet-connector.read.v1
  implement method

eth-mainnet-connector-v1.py
  implement code blob

eth-mainnet-read-workcell-hub
  workcell hub

full node / archive node / RPC endpoint
  workcell components
```

Most stdlib and all speciallib sigils have primordial bindings. They ship with the Noemar distribution and are pre-populated in the runtime binding table before `&core.bootstrap` evaluates. Bootstrap uses these primordial powers to bind P1 workcell sigils through implement code blobs and hub registration.

Sigils are not scope-restricted by taxonomy. Whoever can call a sigil is determined by auth evaluated at call time against the target. The bootstrap powers are available during boot because `&core.bootstrap` temporarily has auth over runtime substrate; after successful boot that auth expires or is revoked.

P1 uses one broad `CHAINREAD` sigil rather than separate chain-log or balance sigils:

```text
CHAINREAD -> eth-mainnet-connector.read.v1
  query families: balance, contract read/storage, event/log range, transaction receipt
```

P1 binding shape:

```text
sigil: CHAINREAD
binding-id: chainread-eth-mainnet-v1
implement: eth-mainnet-connector
method: read
version: v1
mode: exo-implement
traits: [read-only, consensus-backed]
determinism: deterministic-at-block
verification: block-ref + proof/provenance policy
```

Speciallib sigils such as `NOW` have no workcell stack. Stdlib functions such as `+` and `SHA256` have neither workcell hub nor workcell components.

---

## 3. Workcells

A **workcell** is a bounded operational setup backing one or more implement methods.

The term comes from robotics/manufacturing: a workcell is not just the robot; it is the whole local operating island: controller, sensors, safety interlocks, tooling, operator procedures, and the robot itself.

P1 uses the same abstraction for grounded execution:

| Workcell term | Meaning |
|---|---|
| **workcell** | Bounded operational setup. |
| **workcell spec** | Human-readable and testable requirements for operating the setup. |
| **workcell hub** | Strict service implements call into. |
| **workcell component** | Concrete piece the operator provides: node, signer, UI, API endpoint, model endpoint, device, etc. |

Ethereum read example:

```text
eth-mainnet-read-workcell
  spec:
    archive-capable reads
    explicit block references
    provider redundancy
    health/provenance reports

  hub:
    eth-mainnet-read-workcell-hub

  components:
    full node
    archive node
    RPC endpoint
    signer/HSM if effectful methods are enabled
```

Syngate intake example:

```text
syngate-intake-workcell
  spec:
    signed envelope queue
    registered-beacon pubkey snapshot
    signature verification
    basic nonce / rate-limit / spam prefiltering
    replayable cursor batches

  hub:
    syngate-intake-workcell-hub
```

Human/operator input example:

```text
human-input-ui-workcell
  spec:
    authenticated operator session
    prompt/response schema
    timeout and escalation policy
    approval/refusal recording
    anti-replay and audit log
    safe descriptor for current UI/version/policy hash

  hub:
    human-input-ui-workcell-hub

  components:
    operator console
    local approval queue
    notification channel
    hardware presence / session guard when required
```

A human-input/UI workcell is how a teleonome embodiment asks its human operator for bounded input inside its core orchestration/agart loop. It is not an implicit free-form side channel. The embart/telart declares the prompt shape and authority boundary; the workcell owns the actual UI session, operator authentication, local audit trail, and any high-impact approval controls.

P1 boundary:

```text
humans / installer:
  set up workcell components
  start workcell hubs
  provide paths/endpoints

Noemar / bootstrap:
  reads boot manifest
  registers hub paths
  runs conformance checks
  binds sigils
```

P1 does not use signed workcell-readiness atoms. Running the installer / boot function is the operator assertion that the workcells are ready.

Later phases can migrate workcell operation from humans to teleonomes and embodiments. The loop requirement surface stays stable; only readiness provenance improves. Teleonome-local orchestration loops may bind a human-input/UI workcell even when synserv itself has no such P1 sigil.

---

## 4. `&core.bootstrap`

`&core.bootstrap` is a P1 Space and part of the fixed topology. It is special because it is one-shot boot substrate, not an ordinary operational registry.

It holds:

- bootstrap recipe;
- boot manifest schema;
- sigil catalog needed for P1;
- binding specs needed for P1;
- implement code blob refs / hashes;
- workcell specs and hub registration shapes;
- loop requirement declarations;
- conformance test hooks;
- boot receipts.

It can perform bootstrap-time speciallib powers:

```text
MATERIALIZE-IMPLEMENT
  write a verified implement code blob to a local path

BIND-SIGIL
  bind a sigil to a materialized implement method

REGISTER-WORKCELL-HUB
  attach a workcell name to a local hub endpoint

ENABLE-LOOP
  start a loop only after requirements pass
```

After successful boot, `&core.bootstrap` becomes inert. Ordinary loops do not have auth to materialize code blobs, bind sigils, or register workcell hubs; they only call already-bound sigils.

---

## 5. Installer and boot flow

P1 uses a normal installer as the human/operator bridge:

```text
installer
  -> sets up workcell components
  -> starts workcell hubs
  -> installs Noemar
  -> loads mega .synlang file
  -> writes boot manifest
  -> invokes &core.bootstrap
```

Boot manifest shape:

```text
boot-manifest:
  noemar-version: ...
  noemar-path: ...

  synome-artifact:
    path: laniakea-p1.synlang
    hash: sha256:...

  implement-code-blobs:
    eth-mainnet-connector-v1:
      source-hash: sha256:...
      materialized-path: /opt/noemar/implements/...
    syngate-intake-connector-v1:
      source-hash: sha256:...
      materialized-path: /opt/noemar/implements/...

  workcell-hubs:
    eth-mainnet-read-workcell:
      endpoint: http://127.0.0.1:8547
    syngate-intake-workcell:
      endpoint: unix:/run/noemar/syngate-intake.sock

  test-domain:
    testosynome: enabled
    eth-mainnet-fork: enabled
    fixture-workcells: enabled
```

Clean production binds only production workcells. Rehearsal/testosynome deployments use the same sigil specs but bind them to test-domain workcells:

```text
production bindings:
  CHAINREAD    -> eth-mainnet-read-workcell-hub
  SYNGATE-READ -> syngate-intake-workcell-hub

testosynome bindings:
  CHAINREAD    -> eth-mainnet-fork-workcell-hub
  SYNGATE-READ -> syngate-test-intake-workcell-hub
```

The same synlang can then run against production reality or testosynome reality without mounting mock or fixture bindings into clean production artifacts. The broader testing doctrine lives in [`testonomes-and-phase-rehearsal.md`](testonomes-and-phase-rehearsal.md).

---

## 6. Loop requirements

Loops declare the grounded powers they need:

```text
(loop-requires synserv-canonical
   (stdlib [core-special-forms-v1 core-stdlib-v1])
   (speciallib [NOW])
   (sigils [SYNGATE-READ CHAINREAD])
   (bindings [syngate-read-v1 chainread-eth-mainnet-v1])
   (workcells [syngate-intake-workcell eth-mainnet-read-workcell])
   (tests [syngate-read-conformance-v1 chainread-conformance-v1]))
```

Bootstrap refuses to enable a loop if its requirements are not satisfied. Once enabled, the loop can only call declared stdlib/speciallib surface and already-bound workcell sigils through the normal evaluator.

---

## 7. P1 callable inventory

P1 keeps the workcell-backed sigil set small. The canonical list is [`sigils-and-workcells.md`](sigils-and-workcells.md).

Stdlib:

```text
+ - * /
MIN MAX SUM
== < <= > >=
SHA256
```

Speciallib:

```text
NOW
FORK SWITCH DISCARD DIFF
MATERIALIZE-IMPLEMENT BIND-SIGIL REGISTER-WORKCELL-HUB ENABLE-LOOP
```

Workcell-backed sigils:

```text
SYNGATE-READ
CHAINREAD
```

Explicitly out of ordinary P1 loop scope:

```text
SENDTX
ASKLLM
randomness / stochastic sigils
```

P1 relays can record transaction receipts and lifecycle atoms, but ordinary synlang loops do not directly send transactions through `SENDTX`. Later phases can add effectful and stochastic sigils with explicit auth, determinism, and verification policies.

# P1 Embodiment, Workcell, Testonome, Localnome, and Market-Data Conclusions

This note consolidates the design conclusions from the focused discussion beginning with the introduction of `embstate`, `workcells`, and the testonome/workspace model. It is intended as a pasteable/copyable Markdown handoff for Codex work.

The goal is not to specify every engineering detail. The goal is to lock the big-picture target shape: what the things are for, what boundaries matter, what must never happen, and what the implementation must be able to support.

---

## 1. Core embodiment terminology

### 1.1 `embart` vs `embstate`

The key split is:

```text
embart ≠ embstate
```

`embart` is the private in-Noemar symbolic/artifact layer for an embodiment.

It includes:

```text
Spaces
synlang
local rules
local teleonome/embodiment structure
local symbolic artifacts
bindings and symbolic config where represented in Noemar
```

`embstate` is everything on the embodiment hardware or under its control.

It includes:

```text
files
processes
runtimes
workcells
credentials
local databases
model weights/configs
queues
caches
logs
repos
installers
monitoring state
network state
```

The important conceptual correction is that `embart` is not the whole embodiment state. `embart` is the in-Noemar symbolic/artifact slice. `embstate` is the actual operational substrate.

### 1.2 Secure embstate

`secure embstate` is the high-risk subset of embstate that can compromise authority, capital, privacy, or integrity if exposed.

Examples:

```text
crypto keys
registered Ethereum signing keys
API credentials
secrets
production signing material
privileged configs
sensitive legal documents
borrower documents
access tokens
signer state
credential stores
```

Core invariant:

```text
secure embstate is never forked into a testonome
```

Test systems may compare against secure embstate through tightly controlled checks, but should not copy, expose, or inherit it.

---

## 2. Sigils, bindings, implements, workcells, workspaces

### 2.1 Grounded atom split

The old term `grounded atom` is too broad. It should split into at least:

```text
literal
  Grounded value atom.
  Examples: 1, 3.14, "hello", true.

SIGIL
  Grounded callable atom.
  ALL CAPS canonical callable symbol inside synlang/the atomspace.
  Examples: ADD, SHA256, CHAINREAD, SENDTX, ASKLLM.
```

Final lexical direction:

```text
lowercase = ordinary symbolic atom
ALL CAPS  = canonical special atom / SIGIL
$         = variable
&         = Space
numbers   = literals
```

Ordinary symbols should be lowercase-only, likely kebab-case for compounds:

```text
borrower
loan-health
riskbook-attestation
custodial-crypto
spark-term
```

Sigils are rare and visually powerful:

```text
ADD
SUB
MUL
DIV
SHA256
CHAINREAD
SENDTX
ASKLLM
VERIFY
```

Some ALL CAPS atoms may be evaluator-native special forms rather than sigils backed by implements:

```text
ALL CAPS atom
  ├── special form
  └── SIGIL
```

Examples:

```text
IF, MATCH, LET, QUOTE
  special forms

CHAINREAD, SENDTX, ASKLLM, SHA256
  sigils
```

### 2.2 Sigil stack

Final stack:

```text
SIGIL -> binding -> implement -> workcell
                              ^
                              |
                          workspace
```

Definitions:

```text
SIGIL
  ALL CAPS callable atom in synlang.
  Controls symbolic invocation.
  Example: CHAINREAD, SENDTX, ASKLLM.

binding
  Registry mapping from SIGIL to implement method/interface.
  Controls type signature, version, auth, determinism, effects, and verification policy.

implement
  Executable adapter/function/model wrapper invoked by the binding.
  Controls the actual executable method being called.

workcell
  Actual installed/running service, daemon, runtime, node, model server, signer,
  reducer, processor, or hardware setup on embodiment hardware.
  Controls runtime/service state.

workspace
  Repo/installers/config/monitoring/maintenance/control layer around a workcell.
  Controls reproducibility, installation, maintenance, upgrades, validation, and parity checks.
```

Important relationship:

```text
Multiple sigils may invoke the same implement.
Multiple implements may use the same workcell.
A workspace installs, maintains, controls, and validates workcells.
```

Example:

```text
CHAINREAD
  SIGIL

CHAINREAD -> geth-reader.read-slot
  binding

geth-reader
  implement

mainnet-geth-workcell
  workcell

ethereum-prod-workspace
  workspace that installs/maintains/checks the geth/signer workcell
```

### 2.3 Implement modes

Broad implement categories:

```text
exo-implement
  External read/write/action capability.
  Examples: sensors, APIs, chain reads, chain writes, message sending,
  financial actions, machine control.

native-implement
  Deterministic internal acceleration or hardcoding.
  Examples: compiled Rust/C, crypto libraries, SHA/KZG/BLS, heavy math kernels,
  ASIC execution, deterministic optimized circuits.

stochastic-implement
  Nondeterministic or probabilistic execution.
  Examples: LLMs, neural networks, randomized optimizers, samplers,
  other probabilistic or randomness-using systems.
```

Possible later traits/submodes:

```text
proof-carrying
  Returns a proof or proof-checkable result.

consensus-backed
  Grounds result through another replicated state system.

effectful
  Can change external state.

read-only
  Observes but does not act.
```

These should probably be traits on bindings/implements rather than too many top-level categories at first.

### 2.4 Noemar bootstrap primitive

Noemar does not need many pre-bundled install sigils if it already supports:

```text
write Python implement
bind implement to SIGIL
eval SIGIL
```

That is the universal grounded-execution bootstrap primitive.

But open implement/binding creation is not an ordinary production permission.

Lifecycle:

```text
open bootstrap implement/binding mode
  -> define/install bootstrap sigils
  -> install/check workspaces and workcells
  -> bind operational sigils
  -> run tests
  -> seal bootstrap state
  -> close open implement/binding mode
```

After sealing:

```text
new implement or binding = authorized phase change / sudo / workspace upgrade
```

This means the real native minimum is conceptually:

```text
DEFINEIMPLEMENT
BINDSIGIL
EVAL
```

or, more generally:

```text
Noemar can create grounded execution.
```

---

## 3. Workcells and workspaces

### 3.1 Workcell definition

A `workcell` is the actual installed/running thing on embodiment hardware.

Examples:

```text
synced geth node
signer daemon
syngate sender/receiver
market-data reducer process
attestor document processor
model server
local daemon
API wrapper environment
hardware/runtime setup
```

Workcells live in `embstate` and may access relevant embstate.

A `secure workcell` is a workcell with access to secure embstate.

Examples:

```text
ethereum-workcell with registered Ethereum key
attestor-workcell with sensitive legal documents
operator-ui-workcell with privileged command authority
```

### 3.2 Workspace definition

A `workspace` is the artifact/knowledge/control layer around a workcell.

It contains things like:

```text
GitHub repo
installers
config templates
monitoring
maintenance automation
access-control policy
test harnesses
diff/check scripts
deployment recipes
operator documentation
```

Core distinction:

```text
workcell = actual installed/running thing
workspace = artifact/knowledge/automation for creating and controlling that thing
```

Relationship:

```text
workspace -> installs / maintains / controls / validates -> workcell
```

### 3.3 Prod and test workspaces should be separate

Do not model one workspace directly defining both prod and test workcells.

Instead:

```text
prod workspace ≠ test workspace
```

Mapping:

```text
prod workspace -> prod workcell
test workspace -> test workcell
```

`prod workspace` is authoritative, protected, and non-forkable in normal testing.

`test workspace` is forkable/runnable/sandboxable and used by testonome to install and operate test workcells safely.

For ordinary regression testing, the test workspace may be derived from the current prod workspace.

For phase changes, the test workspace should be derived from the phase-target workspace definition.

### 3.4 Workspace/workcell parity

Core parity target:

```text
prod workspace ≈ test workspace
prod workcell  ≈ test workcell
```

Allowed differences:

```text
production secrets
production keys
production credentials
production endpoints
secure embstate access
test credentials
testnet endpoints
fake scenario feeds
testosynome config
harmless test-only instrumentation
```

The purpose of workspace/workcell parity is to make testonomes meaningful rather than toy simulations.

Secure workspaces should run comparison tests between prod secure workcells and test workcells. These tests may temporarily open/check the secure workcell enough to prove similarity, but must not expose or clone secure embstate.

---

## 4. P1 workcell taxonomy

P1 needs a small but explicit set of workcells.

### 4.1 Ethereum workcell

```text
ethereum-workcell
```

Role:

```text
chain reads
transaction construction/submission
Ethereum key custody
beacon/onchain transaction authority
tx receipt monitoring
chain reorg/finality handling
DEX/onchain data reads where relevant
```

This is one of the most security-critical workcells because it contains or controls the teleonome’s registered Ethereum key and can move capital or affect onchain authority.

Possible sigils/implements using it:

```text
CHAINREAD
SENDTX
VERIFYTX
READRECEIPT
WATCHCONTRACT
```

Security classification:

```text
secure workcell
```

### 4.2 Syngate workcell

```text
syngate-workcell
```

Role differs by teleonome type.

For synserv:

```text
receive signed messages from beacons
parse envelopes
verify signatures/pubkeys/nonces/rate limits
route accepted messages into synome loop execution
```

For beacons:

```text
send syngate messages to synserv
receive synserv state / acks / rejects
track nonce state and delivery status
```

Possible sigils/implements:

```text
SENDSYNGATE
RECVSYNGATE
VERIFYSIG
READSYNSTATE
```

For the market-data tel, the syngate workcell is also the publication path. No separate “data sender workcell” is needed.

### 4.3 Market-data workcells

The market-data tel is not one monolithic workcell. It has at least:

```text
market-data-tel
  ├── ethereum workcell
  ├── data-obtainer workcell
  ├── data-processing workcell
  └── syngate workcell
```

The market-data tel has two upstream workstreams feeding one processing layer:

```text
onchain/inspace workstream
  -> ethereum workcell
  -> DEX liquidity, pool state, oracle contracts, protocol state, onchain events

exo/web/proprietary workstream
  -> data-obtainer workcell
  -> CEX prices/order books, perp funding/OI, paid feeds, rates/macro, proprietary data
```

Both feed:

```text
data-processing workcell
  -> normalization
  -> archive/replay/live-tail
  -> reducers
  -> quality/provenance checkpoints
  -> market-memory outputs
  -> syngate
  -> market-memory Space
```

The `data-obtainer workcell` is an exo workcell.

It handles:

```text
exchange APIs
order books
perp venues
paid feeds
proprietary feeds
rates/macro feeds
source health
web/API collection
```

The `data-processing workcell` is an optimization workcell.

It handles:

```text
normalization
raw/normalized archive management
historical replay
live-tail processing
reducer runs
quality scoring
checkpoint/provenance generation
market-memory output manifests
```

The `syngate workcell` publishes approved reducer outputs through the normal syngate path.

### 4.4 Attestor workcell

```text
attestor-workcell
```

Role:

```text
receive sensitive borrower/legal/operational documents
process attestable legal and credit facts
determine whether borrower/riskbook/exobook attestations should pass
produce attestation outputs
```

Important nuance:

As much processing as possible should happen in-space, but not in the ordinary test zone if it touches sensitive data.

The attestor workcell bridges:

```text
sensitive real-world data / documents
  -> controlled processing
  -> attestation decision
  -> signed attest-data message
```

Test version emits predetermined fake attestations for testosynome scenarios.

Security classification:

```text
secure workcell
```

It may not hold capital keys, but it holds sensitive legal/private data and influences whether exposure becomes eligible for rollup.

### 4.5 Operator UI / human input workcell

```text
operator-ui-workcell
```

Role:

```text
literal operator UI
human command intake
core orchestrator/agent loop listens for instructions
converts operator intent into local teleonome actions pending checks
may trigger relay, attest, market-data, or testonome workflows
```

Main invariant:

```text
operator-ui-workcell must not become an unguarded sudo shell
```

It should have strong confirmation, audit logs, and role-scoped command surfaces.

### 4.6 Testonome workcell

```text
testonome-workcell
```

Role:

```text
creates testonome forks from permitted test-zone state
starts/runs testonomes
connects testonome to testosynome Ethereum testnet
runs scenario drills
coordinates tests across multiple teleonomes
produces test reports/diffs
tears down testonomes after completion
```

Core invariant:

```text
testonome-workcell must not clone or expose secure embstate
```

---

## 5. Teleonomes, beacons, and P1 topology

### 5.1 Teleonome vs beacon identity

P1 should use few teleonomes and many beacon identities.

Do not model P1 as one teleonome per beacon.

Core split:

```text
teleonome = operational/cognitive/control instance
beacon identity = registered signer/auth surface
```

One teleonome may run many beacon identities, but must preserve:

```text
separate beacon identities
separate keys where appropriate
separate auth grants
separate nonce domains
separate logs
scoped workcells
clear blast-radius analysis
```

### 5.2 Proposed P1 teleonome set

P1 likely needs these single-emb teleonomes:

```text
entity-govops-tel
  Operator: Soter Labs
  Runs most entity govops beacons.
  Covers Halo/Prime relay + synops for ordinary entity operations.

core-govops-tel
  Operator: Soter Labs / Core Council govops
  Runs core-level synops + relay.
  Covers privileged coordination, phase scripts, core operational setup.

synserv-tel
  Operator: Soter Labs / Core Council controlled
  Runs synserv-canonical.
  Central synomic node: sequencing, heartbeat, derived state, ER emission.

attestor-tel
  Operator: Attest team
  Runs attest-data beacons.
  Handles borrower/riskbook/exobook attestation processing.

market-data-tel
  Operator: Market data team
  Runs market-data beacons.
  Handles price, liquidity, vol, funding, rates, market-memory inputs.
```

Ownership shape:

```text
Soter Labs:
  entity-govops-tel
  core-govops-tel
  synserv-tel

Attest team:
  attestor-tel

Market data team:
  market-data-tel
```

Synserv should remain conceptually distinct from govops even if Soter operates it.

### 5.3 Relay, synops, synserv

Role doctrine:

```text
synops
  In-synome operational mutation only.
  Used for constructors, operational state writes, setup records, and non-external lifecycle mutation.

relay
  Synops-capable beacon that also performs external/onchain actuation.
  It acts externally, then writes the synome record of what it did or is about to do.

synserv
  Central synomic node operated by Core Council govops.
  Sequences accepted writes, runs heartbeat derivations, advances canonical state,
  and emits official outputs such as prime-er.
```

Core rule:

```text
relay = act externally + record in synome
synops = mutate synome only
synserv = sequence/derive/publish canonical state
```

Synserv is not an ordinary operator beacon and should not become a human operator or arbitrary admin path.

---

## 6. Testonomes and testosynome

### 6.1 Testonome definition

A `testonome` is a Noemar fork of the relevant teleonome/embodiment state, but only over the safe test-zone subset.

It is not a full clone of a production teleonome.

It includes:

```text
Noemar fork of relevant test-zone state
test workspaces
test workcells
testosynome/testnet connections
scenario configuration
```

It excludes:

```text
secure embstate
production keys
production credentials
production secrets
production signing authority
sensitive legal/private data
```

Core purpose:

```text
Testonome tests behavior, topology, interfaces, upgrade scripts, scenario response,
and prod/test equivalence — not production secrets.
```

### 6.2 Testosynome definition

A `testosynome` is the coordinated multi-testonome test world.

It is used for cross-teleonome scenario drills before activation or phase change.

It includes:

```text
multiple testonomes
shared testosynome Ethereum testnet
synthetic/forked protocol state
test syngate endpoints
scenario scripts
signed participant reports
```

### 6.3 Testosynome leadership

For testosynome creation, `synserv-testonome` should lead.

Reasons:

```text
synserv is already the central coordination point for canonical state, heartbeat, and derived outputs
```

The synserv-testonome should:

```text
create the testosynome Ethereum testnet
publish testnet/syngate/testosynome config
coordinate participant connection
verify everyone is synced
start scenario clocks/drills
collect signed test reports
aggregate all-ok/fail report
```

Sequence:

```text
synserv-testonome creates testosynome eth testnet
-> publishes testnet/syngate/test config
-> entity-govops-testonome connects
-> core-govops-testonome connects
-> attestor-testonome connects
-> market-data-testonome connects
-> synserv verifies all synced
-> scenario drills begin
-> each testonome signs/reports status
-> synserv aggregates all-ok/fail report
```

Synserv-testonome coordinates and aggregates. It should not falsify or own the other testonomes’ results; each testonome signs/reports its own status.

---

## 7. P1 launch and phase-change sequences

### 7.1 P1 launch sequence

Important correction:

```text
prod-installed ≠ prod-active
```

P1 launch should install production first but keep it inactive until tests/canary pass.

Sequence:

```text
1. Install production workcells, but keep prod not active.
2. Boot sigils, bindings, implements, and workcell links.
3. Create testonome on every relevant teleonome.
4. Fork test-zone state.
5. Fork/instantiate test workspaces where allowed.
6. Test workspaces install test workcells.
7. Run testosynome scenario drills.
8. Secure workspaces run prod-secure-workcell vs test-workcell comparison tests.
9. Run read-only prod unit tests while testonome/test references remain alive if needed.
10. Delete testonomes and tear down test workcells.
11. Run live prod canary.
12. If canary passes, activate P1 operations.
```

Short form:

```text
prod-installed, not prod-active
  -> boot sigils
  -> create testonomes
  -> install test workcells
  -> run scenario drills
  -> secure-vs-test workcell comparison
  -> read-only prod tests
  -> delete testonomes
  -> prod canary
  -> prod-active
```

Key invariant:

```text
Testonome should remain alive until all checks that depend on test workcells
or testosynome state are complete.
```

### 7.2 Phase-change sequence

For phase changes, test the next phase before applying it to prod.

Sequence:

```text
1. Define phase-target prod workspace changes.
2. Derive/fork corresponding phase-target test workspace.
3. Create testonome from current prod test-zone state.
4. Testonome runs the phase-target test workspace.
5. Test workspace installs new/modified test workcells.
6. Run the phase-upgrade sudo script inside testonome.
7. Run scenario drills and unit tests.
8. Run workspace/workcell parity checks:
     prod-target workspace vs test workspace
     prod-intended workcell definition vs installed test workcell
     current prod secure workcell vs relevant test/prod-target expectations where safe
9. Delete testonome/test workcells after comparison-dependent checks are complete.
10. Apply equivalent prod workspace changes.
11. Apply equivalent prod sudo upgrade.
12. Run read-only prod tests.
13. Run prod canary.
14. Begin new phase operations.
```

Short form:

```text
phase-target prod workspace
  -> derive phase-target test workspace
  -> testonome runs test workspace
  -> install/test new workcells
  -> rehearse sudo upgrade
  -> compare/diff
  -> apply equivalent changes to prod
  -> canary
  -> activate
```

Key idea:

```text
Phase changes rehearse the future, not the present.
```

---

## 8. Localnome

### 8.1 Localnome definition

A `localnome` is a fully local, from-scratch mini synome/teleonome deployment.

It is not forked from prod.

It runs multiple local teleonomes side by side, fake syngate/network communication, local workcells, fake oracle/attestor data, and its own local Ethereum/Sky fork/testnet.

Purpose:

```text
fast full-stack development and integration testing
```

Core distinction:

```text
localnome   = local synthetic world, built from scratch
testonome   = forked test instance of a real/phase-target teleonome
testosynome = coordinated multi-testonome test world
```

Purpose split:

```text
localnome proves the architecture works locally
testosynome proves the prod-shaped system is safe to activate
```

### 8.2 Localnome bite-size ladder

Core rule:

```text
Each localnome level should add one new dimension while keeping everything else fake/minimal.
```

#### Localnome-0 — Sigil stack toy

```text
one Noemar runtime
one local Space set
one fake SIGIL
one fake binding
one fake implement
one fake workcell
```

Purpose:

```text
prove SIGIL -> binding -> implement -> workcell
```

Example:

```text
(FAKEREAD price-btc-usd) -> 80000
```

No syngate, no chain, no multiple teleonomes.

#### Localnome-1 — Synserv-only local ER skeleton

```text
one synserv-tel
local synome Spaces
fake input atoms
heartbeat loop
fake prime-er output
```

Purpose:

```text
prove synserv can derive canonical outputs from local atoms
```

Skeleton:

```text
fake exobook atoms
+ fake market-memory atoms
+ fake attestation atoms
-> synserv heartbeat
-> fake prime-er
```

#### Localnome-2 — One beacon through fake syngate

```text
synserv-tel
entity-govops-tel
fake syngate transport
one signed message
one operational verb
```

Purpose:

```text
prove external operator flow
```

Flow:

```text
beacon signs
-> syngate verifies
-> auth checks
-> dispatches
-> Space mutates
-> synserv sees mutation
```

Best first verb:

```text
register-borrower-setup
```

#### Localnome-3 — Add attestor tel

```text
synserv-tel
entity-govops-tel
attestor-tel
fake attestations
```

Purpose:

```text
prove borrower/riskbook/exobook eligibility gates and default-deny
```

Flow:

```text
relay/synops creates borrower shell
-> attestor posts borrower admission
-> attestor posts riskbook/exobook pass
-> synserv includes only fresh/pass/scope-correct objects
```

#### Localnome-4 — Add market-data tel

```text
synserv-tel
entity-govops-tel
attestor-tel
market-data-tel
fake market-memory workcell
```

Purpose:

```text
prove market-memory enters the risk path
```

Flow:

```text
market-data emits fake price/liquidity/vol atoms
-> attestor emits pass/fail atoms
-> entity-govops creates book atoms
-> synserv computes risk output
```

Still no real chain state.

#### Localnome-5 — Forked Ethereum / Sky protocol testnet

This should not be a blank toy chain.

Localnome-5 should:

```text
fork real Ethereum state
include relevant Sky protocol infrastructure
take local control of relevant forked protocol contracts
assign control to local/test beacon keys
run CHAINREAD / SENDTX / receipt monitoring against the fork
```

Purpose:

```text
make the Ethereum workcell realistic while fully isolated from mainnet
```

Tests:

```text
real contract addresses / ABIs / storage shapes
realistic chain reads
realistic PAU / Configurator / token interactions
local test beacon authority
tx construction / submission / receipt handling
synserv observation of forked chain state
```

Key distinction:

```text
blank local chain = tests generic tx mechanics
forked Sky/Ethereum chain = tests whether P1 works against the real protocol shape
```

#### Localnome-6 — Single-loan NFAT heartbeat

First meaningful mini-P1.

```text
one Halo
one Prime
one borrower
one exobook
one riskbook
one halobook / NFAT-like unit
one structbook
one prime-er
```

Purpose:

```text
prove end-to-end P1 shape in miniature
```

Flow:

```text
borrower setup
-> attestation pass
-> forked chain funding/collateral state
-> market memory
-> custodial-crypto risk form
-> structbook matching
-> prime-er
```

#### Localnome-7 — Five-teleonome P1 topology

```text
entity-govops-tel
core-govops-tel
synserv-tel
attestor-tel
market-data-tel
```

Purpose:

```text
prove actual P1 teleonome topology with correct actor boundaries
```

One tel may run many beacon identities, but key/auth/log/blast-radius separation must remain explicit.

#### Localnome-8 — Reduced-cardinality P1 slice

```text
1 Generator
1 Oracle
1 Prime
1 Halo
1 risk class
1 halo class
1-3 loans
local SDR buckets
local market memory
local attestations
forked Sky/Ethereum chain
```

Purpose:

```text
prove P1 architecture with minimal cardinality
```

This is “P1 with all counts reduced to 1.”

#### Localnome-9 — Full-cardinality P1 local release candidate

```text
1 Generator
1 Oracle
7 Primes
3 Halos
all P1 fixed Spaces
all P1 beacon classes
all P1 operational verbs
local/forked Sky-Ethereum workcell
fake but shaped market-data and attestor inputs
test scenario library
```

Purpose:

```text
prove full P1 topology locally before true testosynome/prod-shaped testing
```

P1 target shape includes 66 fixed Spaces at genesis, ~23 beacon identities, and ~14 operational verbs.

#### Localnome-10 — Testosynome rehearsal candidate

At this point, localnome artifacts should become the basis for:

```text
phase-target test workspaces
testonome creation scripts
testosynome scenario drills
prod/test parity checks
```

Purpose:

```text
bridge from local development into production-shaped rehearsal
```

### 8.3 Localnome build order

```text
sigil stack
-> synserv derivation
-> syngate write path
-> attestation gate
-> market-data gate
-> forked Ethereum/Sky protocol workcell
-> one-loan NFAT heartbeat
-> five-tel topology
-> reduced-cardinality P1
-> full-cardinality P1
-> testosynome rehearsal candidate
```

Dimensions to add one at a time:

```text
more teleonomes
real syngate
real workcells
forked real chain state
real Sky protocol contract shape
real risk form
real SDR matching
more entities
more loans
full P1 cardinality
prod-shaped workspace/testonome integration
```

Milestones:

```text
first meaningful milestone:
  Localnome-2
  synserv-tel + entity-govops-tel + fake syngate + register-borrower-setup

first useful P1 milestone:
  Localnome-6
  one local NFAT-style loan producing prime-er

first release-candidate milestone:
  Localnome-9
  full-cardinality P1 local topology
```

---

## 9. Market-data tel and reducer doctrine

### 9.1 Market-data tel is the thick-memory tel

Most P1 teleonomes are thin-ish wrappers around synart.

Market-data-tel is structurally different.

Most tels:

```text
relay / synops / attestor / synserv
  mostly execute known loops, sign messages, read/write bounded state
```

Market-data-tel:

```text
archive + ingestion + normalization + reducers + replay + live-tail + provenance
```

Core asymmetry:

```text
large embstate, small synart surface
```

The market-data tel may have huge, complex embstate, while the public synome receives only small canonical reducer outputs.

### 9.2 Synome consumes memory, not history

Core rule:

```text
synome consumes reduced memory, not raw history
```

Path:

```text
external feeds / chain venues / archives
  -> market-data workcell embstate
  -> normalization
  -> reducer runs
  -> reducer checkpoints
  -> market-memory atoms
  -> custodial-crypto risk form
```

Raw history should live outside ordinary synome atoms, in archive/replay infrastructure.

Synome should store:

```text
market-memory atoms
reducer checkpoint atoms
data-quality/freshness atoms
```

### 9.3 Market-data workcell split

Final market-data tel workcell shape:

```text
market-data-tel
  ├── ethereum workcell
  ├── data-obtainer workcell
  ├── data-processing workcell
  └── syngate workcell
```

`ethereum workcell` handles the onchain/inspace data workstream:

```text
DEX pool reads
onchain liquidity
oracle contracts
protocol state
event logs
chain-derived market data
```

`data-obtainer workcell` handles the exo/web/proprietary data workstream:

```text
exchange APIs
order books
perp venues
funding/OI
rates/macro feeds
paid data
proprietary sources
source health
```

`data-processing workcell` is the optimization workcell:

```text
normalizes upstream feeds
archives raw/normalized records
runs historical replay
runs live-tail processing
computes reducers
computes quality states
writes provenance checkpoints
produces market-memory outputs
```

`syngate workcell` publishes approved reducer outputs as market-memory atoms.

Full pipeline:

```text
onchain/DEX/protocol data
  -> ethereum workcell
  -> data-processing

web/CEX/paid/prop data
  -> data-obtainer workcell
  -> data-processing

data-processing
  -> reducer outputs + checkpoints
  -> syngate
  -> market-memory Space
```

### 9.4 Localnome market-data topology

For localnome, do not directly inject fake final reducer outputs as the main architecture.

Instead, localnome should simulate the upstream world:

```text
forked Sky/Ethereum chain
  -> local ethereum workcell
  -> data-processing

fake remote APIs/exchanges/paid feeds
  -> local data-obtainer workcell
  -> data-processing
```

The data-obtainer should connect to a fake-remote component that pretends to be many remote APIs, exchanges, venues, paid feeds, etc.

This makes localnome setup feel like prod setup while keeping the external world synthetic and controllable.

Core localnome market-data flow:

```text
fake remote exchanges/APIs
  -> local data-obtainer
  -> local data-processing
  -> local syngate
  -> local synserv
```

And for onchain:

```text
forked Sky/Ethereum chain
  -> local ethereum workcell
  -> local data-processing
  -> local syngate
  -> local synserv
```

### 9.5 Reducer target

A reducer is the canonical process that turns messy raw/history/live data into typed market-memory atoms.

```text
reducer = raw/live market data -> typed risk-consumable memory atoms
```

First reducer output families:

```text
spot-price-state
peg-basis-state
volatility-state
correlation-state
liquidity-impact-curve
liquidation-overhang-state
funding-oi-state
rates-state
data-quality-state
```

These map to the P1 custodial-crypto stress-envelope needs:

```text
price / peg / basis
volatility
correlation
liquidity / depth / impact
liquidation overhang
funding / open interest
rates / macro
data quality / provenance
```

### 9.6 Historical replay vs live-tail

Historical data and real-time data serve different roles but must share the same reducer interface.

Historical mode:

```text
raw historical tapes
  -> replay
  -> reducer calibration
  -> stress scenario parameters
  -> historical worst-case windows
```

Used to answer:

```text
How bad can price/liquidity/basis/funding get under real stress?
What haircut should the scenario use?
What correlations appear during crashes?
How much depth disappears under stress?
```

Real-time mode:

```text
live feeds
  -> same normalizers
  -> same reducers
  -> current market-memory atoms
```

Used to answer:

```text
What is the current risk input?
Is data fresh?
Is liquidity degraded?
Is the peg breaking?
Are funding/OI/liquidations signaling stress?
```

Key invariant:

```text
historical replay and live-tail emit the same atom shapes
```

This makes new live data automatically become future historical memory and allows localnome/testosynome scenarios to replay old periods through the same interface.

### 9.7 Market-memory atom dimensions

Every market-memory atom should carry enough metadata to be risk-consumable and replayable.

Minimum dimensions:

```text
subject
metric family
value / curve / distribution
window
as-of timestamp
source set
reducer version
checkpoint hash
quality status
```

Conceptual example:

```lisp
(market-memory btc-usd liquidity-impact
  (window 30d)
  (as-of T)
  (curve ...)
  (sources coinbase binance uniswap)
  (reducer liquidity-impact-v1)
  (checkpoint hash)
  (quality pass))
```

Exact syntax can change, but the dimensions should be stable.

### 9.8 Checkpoint/provenance requirements

Because raw history is not in synome, reducer outputs need reproducibility anchors.

Each output batch should have:

```text
input window
source coverage report
raw/archive checkpoint hash
normalizer version hash
reducer version hash
output manifest hash
data-quality report
```

Synome does not need to re-run the reducer, but an auditor/testonome/warden should be able to reproduce the output from the checkpoint.

### 9.9 Data-quality states

Market-memory outputs should carry quality state.

Possible states:

```text
pass
degraded
stale
failed
disputed
manual-review
```

Risk form behavior should be pinned down by metric:

```text
pass
  consume normally

degraded
  consume with conservative fallback/haircut

stale / failed
  default-deny or max-risk fallback depending on metric

disputed
  freeze previous valid value or use conservative bound
```

### 9.10 P1 raw time-series starting point

Do not start with “all market data.” Start with the raw data needed to produce the reducer outputs consumed by the P1 custodial-crypto stress-envelope form.

P1 collateral scope:

```text
BTC
ETH
stETH
```

P1 senior-denom scope:

```text
USDC
USDS
USDT
```

#### Spot price / index data

Assets/pairs:

```text
BTC/USD
ETH/USD
stETH/ETH
stETH/USD
USDC/USD
USDS/USD
USDT/USD
```

Raw series:

```text
trades
OHLCV
top-of-book
source index prices
oracle/reference prices
```

Purpose:

```text
current valuation
historical drawdown calibration
basis/depeg detection
scenario price paths
```

#### CEX liquidity / order book data

Pairs:

```text
BTC/USD or BTC/USDC
ETH/USD or ETH/USDC
stETH/ETH where available
USDC/USD
USDT/USD
USDS/USD where available
```

Raw series:

```text
order book snapshots
bid/ask spread
depth by bps bucket
trade prints
volume
market impact observations
```

Purpose:

```text
executable haircut
liquidity-CRR
forced-sale stress
depth collapse detection
```

#### DEX / onchain liquidity data

Fetched through the market-data tel’s Ethereum workcell.

Sources:

```text
Uniswap / Curve / Balancer pools
stETH/ETH pools
stablecoin pools
BTC-wrapper liquidity if relevant
Sky/USDS liquidity pools
```

Raw series:

```text
pool reserves
swap events
LP depth
price impact curves
pool imbalance
oracle contract values
onchain event logs
```

Purpose:

```text
onchain executable liquidity
DEX impact curves
stablecoin peg/basis stress
stETH basis stress
cross-check against CEX data
```

#### Perp / derivatives stress data

Assets:

```text
BTC perps
ETH perps
possibly stETH/ETH derivatives if meaningful
```

Raw series:

```text
funding rates
open interest
basis
liquidations
long/short skew
perp index price vs spot
```

Purpose:

```text
leverage stress
liquidation overhang
crowded positioning
funding stress
crash amplification signals
```

#### Stablecoin peg / basis data

Assets:

```text
USDC
USDS
USDT
DAI / sDAI if used for SDR/structural-demand context
```

Raw series:

```text
CEX stablecoin pairs
DEX stablecoin pool imbalance
redemption/minting where observable
Curve/Uniswap stable pools
oracle/reference prices
transfer/flow data where useful
```

Purpose:

```text
senior-denom depeg stress
cash-conversion haircut
stablecoin liquidity stress
basis scenario calibration
```

#### Rates / macro baseline

Raw series:

```text
SOFR / Fed funds
Treasury bill yields
Treasury curve points
stablecoin yield benchmarks
DeFi lending rates if relevant
```

Purpose:

```text
rate-CRR
funding environment
macro stress regimes
scenario conditioning
```

#### Chain / protocol state

Fetched through Ethereum workcell.

Raw series:

```text
block timestamps
gas prices
reorg/finality status
relevant contract events
PAU / Configurator / token state
collateral account balances
debt/funding state
receipt history
```

Purpose:

```text
chain-read inputs
funding confirmation
collateral/debt state
execution feasibility
protocol-state cross-checks
```

#### Source quality / provenance data

For every source:

```text
source status
last update time
missing intervals
outlier flags
source disagreement
coverage by window
normalizer version
reducer version
checkpoint hash
```

Purpose:

```text
freshness gates
data-quality fallback
audit/replay
test/prod parity
```

### 9.11 Practical v1 market-data starting pack

Start with:

```text
BTC/USD spot + liquidity
ETH/USD spot + liquidity
stETH/ETH basis + liquidity
USDC/USD peg + liquidity
USDS/USD peg + liquidity
USDT/USD peg + liquidity
BTC/ETH perp funding + OI + liquidations
DEX pool reserves/swaps for stETH/ETH and stablecoin pools
SOFR/T-bill curve
source-quality/provenance checkpoints
```

This should be enough to start producing useful P1 custodial-crypto stress-envelope inputs.

### 9.12 Market-data decisions still to pin down

The full market-data workcell/local tel spec should answer:

```text
what reducer families exist?
what atom shapes do they emit?
what sources feed them?
what freshness/quality gates apply?
what checkpoints prove them?
what test scenarios can fake them?
what local tel Spaces manage processing?
which workcell publishes to synome?
```

Everything else — database, queue, exact adapters, batch system — is engineering.

---

## 10. Custodial-crypto risk-form target shape

P1 custodial-crypto risk form measures point-in-time senior-tranche loss under approved stress scenarios.

It is not expected loss.

Target:

```text
Given chain state, market memory, attestation gates, tranches, and approved scenarios,
compute worst approved senior-tranche loss and CRR components for P1 custodial crypto NFATs.
```

Inputs:

```text
chain-read:
  collateral, debt, funding state, accounts, liquidation parameters

market memory:
  prices, liquidity, vol, correlation, depeg/basis, funding, rates, data quality

attestations:
  borrower admission
  riskbook structural attestation
  exobook term attestation

book structure:
  collateral assets
  senior notional
  junior/equity cushion
  maturity / TTM
  denomination
```

Outputs:

```text
default-CRR
spread-CRR
rate-CRR
liquidity-CRR
binding scenario
```

Default-deny rule:

```text
missing/stale/fail/scope-mismatched attestation
  -> excluded from rollup or CRR 100%, depending on context
```

SDR matching may cover spread/rate/liquidity treatment for matched portions, but never removes default capital.

---

## 11. Structural demand / SDR target shape

Structural demand answers one question:

```text
How much USDS liability structure is stable enough, by bucket, to match held-to-par assets?
```

Pipeline:

```text
lot-age surface
-> Lindy SDR
-> governance overlay
-> effective-sdr-bucket-capacity
-> Prime SDR allocations
-> structbook matching
```

`effective-sdr-bucket-capacity` means the live amount of liability structure, by bucket, that the system is willing to let structbooks consume for matching.

Lindy SDR should discount fragile structure such as:

```text
same-age crowding
same-account concentration
recent churn
low-quality sources
unstable or mercenary balances
uncertain provenance
```

Governance overlay constrains the model with:

```text
caps
haircuts
eligible sources
fallback values
emergency bounds
```

SDR is a matching resource, not just a governance number.

---

## 12. Dimension-collapsing kernels

These are the short insights that make the rest inferable.

### 12.1 Separate symbolic state from embodiment state

```text
embart ≠ embstate
```

`embart` is symbolic/in-Noemar. `embstate` is operational/local. `secure embstate` is not forked.

### 12.2 Grounded execution has a stack

```text
SIGIL -> binding -> implement -> workcell
```

A sigil is not the program. The program is not the running service. The running service is not the workspace that installs and maintains it.

### 12.3 Workcell and workspace are different objects

```text
workcell = actual running thing
workspace = artifact/control layer for creating and maintaining it
```

### 12.4 Testonomes test behavior without inheriting secure reality

```text
testonome = test-zone fork + test workspaces + test workcells - secure embstate
```

### 12.5 Prod/test parity is a first-class safety object

```text
prod workspace ≈ test workspace
prod workcell  ≈ test workcell
```

except for declared safe differences.

### 12.6 P1 uses few teleonomes, many beacon identities

```text
teleonome = operational/control instance
beacon identity = registered signer/auth surface
```

### 12.7 Relay, synops, and synserv are distinct

```text
synops = in-synome mutation only
relay = external/onchain actuation + synome record
synserv = central sequencer/deriver/publisher
```

### 12.8 Market memory is not raw history

```text
raw history -> reducers -> market-memory atoms -> risk forms
```

### 12.9 Structural demand is liability stability by tenor

```text
lot-age surface -> Lindy SDR -> governance overlay -> effective-sdr-bucket-capacity
```

### 12.10 Custodial crypto risk is stress-envelope senior loss

```text
chain state + market memory + attestations + book structure
  -> worst approved senior-tranche loss
```

### 12.11 Noemar bootstrap primitive is grounded-execution creation

```text
write implement -> bind to SIGIL -> eval SIGIL
```

### 12.12 P1 activation is prod-installed before prod-active

```text
installing prod is not activating prod
```

### 12.13 Phase changes rehearse the future

```text
phase-target prod workspace -> phase-target test workspace -> testonome rehearsal -> prod upgrade
```

---

## 13. Done standard for target docs

A target doc is done when engineers can answer:

```text
what is this thing for?
what must it never do?
what does it consume?
what does it produce?
what authority does it carry?
what state does it touch?
how is it tested without exposing secure embstate?
```

This is the level to nail before handing off to engineering. Exact database choices, queues, adapters, retry logic, process supervisors, and deployment scripts are downstream engineering details once the target shape is clear.


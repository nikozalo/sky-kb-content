# Testonomes and Phase Rehearsal

**Purpose:** Captures the testing and phase-upgrade doctrine for P1 and later phases: testonomes, testosynomes, testonome workcells, embstate boundaries, workspec/workspace parity, production unit tests, and canaries.

This is a roadmap companion, not a new P1 topology spec. It explains how to use Noemar testing features, testnet deployments, and operator coordination without putting mock/test powers into clean production synart, telart, or embart.

---

## 1. Core Ontology

Only embodiments actually run. A teleonome, telart, synome, or synart exists because embodiments store, mount, evaluate, sync, and act from those artifacts. Saying "the teleonome decided" is shorthand for "one or more embodiments, following telart state/protocol, emitted messages or actions that other embodiments accepted as expressing that teleonome."

Terms:

| Term | Meaning |
|---|---|
| **embart** | The embodiment's local atomspace artifact. Forkable only according to local fork policy. |
| **embstate** | All local embodiment state/resources available to the embodiment: atomspaces, files, queues, workcells, handles, logs, caches, and secrets. |
| **secure embstate** | High-sensitivity embstate that must not be forked or freely inspected: private keys, HSM handles, API credentials, production signer sessions, live nonce authority, and production infrastructure tokens. |
| **workspec** | Canonical synart source spec for a workcell/workspace pattern, shared through `&core.workspec.*`. |
| **embart workspace** | Local copied/instantiated workspace that installs, controls, validates, and maintains actual local workcells. |

Secrets should not live in telart or embart atomspaces. They live behind hardened workcell interfaces, outside the forkable atomspace. Atomspace state declares what capability is needed; a workcell owns the dangerous resource.

## 2. Production Testing Stance

Noemar may have powerful native testing features: forks, fake clocks, mocks, fixture workcells, and test runners. Clean production artifacts should not mount or authorize those testing powers.

Production must not contain mock bindings, fixture workcells, hidden test modes, arbitrary scenario runners, or shadow-promotion paths. Testing features may exist in Noemar and staging deployments, but production identities cannot call them because the relevant bindings, workcells, loop requirements, and auth grants are absent.

Routine mature validation should become continuous and endogenous: small validation minigames, wardens, receipt checks, cross-embodiment comparison, oracle challenges, and canaries. Whole-system fork testing is mainly bootstrap, development, and phase-rehearsal tooling.

Durable principle:

```text
testonomes rehearse
prod unit tests inspect
prod canaries touch reality
```

## 3. Testonomes and Testosynomes

A **testonome** is a disposable single-embodiment teleonome forked from a production teleonome/operator for testnet participation. For testonomes, the tel/emb distinction is intentionally collapsed: a testonome is a temporary single-emb-tel.

A **testosynome** is the fake synome/network formed by coordinated testonomes. It includes test synart, test syngates, test beacon registry/auth, fake or forked smart contracts, test oracle feeds, test-domain human-input/UI workcells, and testonomes playing synserv, market oracle, attestor, govops, Prime relay, Halo relay/synops, patch, and other operator roles.

Testonomes are behavioral twins, not identity continuations. They inherit enough state shape to behave like production, but never inherit production authority or secure embstate. Their evidence can flow back; their state does not automatically merge into production telart or embart.

## 4. Testonome Workcell

A **testonome workcell** lives in or adjacent to the production embodiment. It creates, configures, supervises, and wipes testonomes.

P1 boot may verify that the testonome workcell is present and isolated. Phase changes invoke it to create testonomes for a testosynome rehearsal.

Fork-time transforms are explicit:

| Operation | Examples |
|---|---|
| Scrub | Production secrets, live signer sessions, production nonce queues, sensitive logs. |
| Replace | Live keys -> test keys; live chain/contracts -> testnet or fork deployments; production syngate -> testosynome syngate. |
| Rebind | `CHAINREAD`, signing, oracle, gate, and human-input/UI capabilities to test workcells. |
| Redact | Proprietary or dangerous memory according to operator fork policy. |
| Stamp | Test-domain identity, test beacon authority, test chain IDs, test endpoint set. |

Use the same workspec and sigil/capability specs where possible; change bindings, domains, and workcells. A testonome should exercise the production-shaped flow without ever receiving production authority.

Operator input is part of the flow under test. If a production teleonome embodiment asks a human operator for approval, classification, override, or missing context through a human-input/UI workcell, the testonome should use a test-domain version of that workcell: scripted where appropriate, manually operated where the real operator ceremony matters, and always separated from production approval surfaces.

## 5. Workspec and Workspace Parity

P1 anchors workspace parity on canonical workspecs:

```text
canonical workspec Space
  -> copied into production embart workspace
  -> copied into test embart workspace
```

The production embart workspace is authoritative for live operation and may run diff/parity checks against the test embart workspace and against the canonical workspec. The test embart workspace is forkable/runnable/sandboxable and is what testonomes use to install and operate test workcells.

Core invariant:

```text
testonome has no access to production embart workspace
testonome has no access to production workcells
testonome has no access to secure embstate
```

Production workspaces are not verified by exposing internals to testonomes. They emit bounded descriptors, hashes, reports, safe attestations, challenge-response results, and production canary evidence.

Allowed differences between production and test workspaces include production secrets, production keys, production endpoints, test credentials, testnet endpoints, fake scenario feeds, and harmless test-only instrumentation. Any other divergence should be declared and reviewed.

## 6. Fork Security

Forking is a privileged operation controlled by embart-local policy. Noemar's fork feature must mechanically enforce blockers and transforms.

Classify embstate before any testonome fork:

| Zone | Fork rule |
|---|---|
| **forkable embart** | Non-sensitive atomspace state, configs, caches. May be copied. |
| **restricted embart** | Operational policy, wiring, local logs, pending queues. May be copied only with explicit redaction/transform. |
| **secure embstate** | Keys, credentials, HSM handles, signer sessions. Never copied or introspected by fork machinery. |

A testonome fork must prove:

- every source Space/resource is classified;
- denied zones are unreachable;
- restricted zones have explicit redaction/transform rules;
- secure embstate has no copy path;
- resulting bindings are test-domain only;
- no production endpoint, key, live nonce queue, signer session, or production approval session survives.

Fork transforms can rebind capability references. They cannot introspect or copy workcell internals.

## 7. P1 Boot vs Later Phase Changes

P1 boot and later phase changes have opposite causality.

P1 boot:

```text
sudo/bootstrap P1 production artifacts
install production embart workspaces and workcells, but keep prod inactive
bind production sigils/workcells
boot production embodiment
create testonomes from allowed test-zone state
instantiate test embart workspaces and test workcells
run testosynome rehearsal
run production workspace diff/parity checks and read-only prod tests
delete testonomes and test workcells after dependent checks complete
run production canaries
if good: start P1 activity
```

P2+ phase change:

```text
fork testonomes from live P1 production state
testonomes form testosynome
apply candidate P2 sudo script inside testosynome
run phase tests/rehearsal
if good: apply P2 script to production
run production read-only unit/invariant tests
pause ordinary economic actions
run production canaries with live keys/PAUs/syngate/workcells
if good: open P2 activity
```

Testosynome and production are not byte-identical. They are package-equivalent: same phase script, topology diff, loop bodies, schemas, workspec source, and operator flow; different keys, endpoints, chain/contracts, secrets, and authority domain.

During the post-upgrade pre-canary window, pause ordinary economic actions. Synserv, monitoring, input feeds, emergency paths, and canary paths stay live.

## 8. Production Unit Tests and Canaries

After deployment, run read-only production unit tests:

- topology exists;
- auth tables are sane;
- loop bodies and code hashes match the phase package;
- workcell health checks pass;
- derivations re-run consistently;
- required production bindings mount;
- syngate and operator embodiments expose expected safe descriptors.

Then run production canaries. Canaries are tiny real normal-path actions proving live authority paths: live keys, PAUs/contracts, syngate, workcells, receipts, indexing, and downstream atom recording.

Canaries use normal production verbs with minimal blast radius. They are not mock modes or hidden test hooks.

## 9. Principles

1. **Testing powers may exist in Noemar, not in clean production mounts.**
2. **Testonomes fork behavior, not authority.**
3. **A testosynome rehearses package-equivalent operator flow, not production identity.**
4. **Secure embstate never forks.**
5. **Production workcells are verified through narrow interfaces, not inspected from outside.**
6. **Canonical workspecs anchor prod/test workspace parity.**
7. **P1 boot tests after assembly; later phase changes rehearse before production mutation.**
8. **Production unit tests are read-only; production canaries are tiny real actions.**
9. **Evidence flows back from tests; test worlds and testonome state are disposable.**

## 10. Testosynome leadership

The synserv testonome leads testosynome creation because synserv is already the coordination point for canonical state, heartbeat, and derived outputs.

Sequence:

```text
synserv-testonome creates testosynome Ethereum testnet
-> publishes testnet/syngate/testosynome config
-> entity-govops-testonome connects
-> core-govops-testonome connects
-> attestor-testonome connects
-> market-data-testonome connects
-> synserv verifies all synced
-> scenario drills begin
-> each testonome signs/reports status
-> synserv aggregates all-ok/fail report
```

Synserv-testonome coordinates and aggregates. It must not falsify or own the other testonomes' results; each testonome signs its own report.

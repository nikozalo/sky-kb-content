# Noemar, Synlib, and Telseed

**Scope:** Early principles for deciding what belongs in Noemar, what belongs in governed libraries, and what a telseed should mean. This is not a final architecture spec, not a package layout, and not a telseed schema. Treat it as a boundary model to keep revisiting as Localnome and teleonome work produce evidence.

The purpose is to keep Noemar minimal while still giving aligned teleonomes a shared, governable operating-standard layer. The working split:

```text
Noemar      = minimal runtime / interpreter substrate
Synlang     = executable language and artifact format
Synart      = public governed synome program / state
Synlib      = governance-maintained shared defaults and operating standards
Telseed     = self-contained birth / install package for a synome or teleonome
Telart      = private teleonome identity / cognition / policy artifact
Embart      = local embodiment artifact and workspace state
```

## 1. Working layer split

| Layer | What belongs here | What does not belong here |
|---|---|---|
| **Noemar** | Atomspace/runtime substrate, evaluator law, parser, storage, frames, gate primitive, signature/hash primitives, bindings, implement loading, deterministic execution machinery. | Laniakea operating doctrine, workcell best practices, telseed packaging policy, teleonome strategy, governance defaults. |
| **Synlang / synart** | Public executable logic and governed replicated state: loops, gates, recipes, constructors, risk formulas, auth checks, conformance rules, phase topology. | Private cognition, local secrets, concrete workcell endpoints, operator infrastructure. |
| **Synlib** | Governance-maintained shared defaults: standard workcell specs, conformance tests, embart workspace patterns, syngate client conventions, logging / audit / nonce-domain standards, testonome policies, telseed templates, migration helpers. | Runtime primitives, private strategy, production secrets, per-operator infrastructure, arbitrary helper code with no standardization value. |
| **Telseed** | A packaged seed for P1 bootstrap or later teleonome setup: Noemar reference/build, synlang artifacts, synlib refs or snapshots, initial synart/telart/embart material where relevant, installer logic, binding profiles, and update policy. | The running teleonome itself, live secure embstate, production keys, production endpoints, or a fixed schema before Localnome has taught the package shape. |
| **Telart / embart** | Private teleonome goals, policies, cognition, memory, local embodiment state, workspaces, and operating choices. | Shared standards that other aligned teleonomes are expected to inherit. |

Noemar defines what can be run. Synlib defines how aligned teleonomes are normally expected to run it. Telseeds carry enough of both to birth a concrete synome or teleonome.

## 2. Decision tests

Use these tests when deciding where a capability belongs:

- If changing it changes the language/runtime for every artifact, put it in **Noemar**.
- If it is public system behavior, law, topology, or economic logic, put it in **synlang / synart**.
- If it is a governed shared default for aligned teleonomes, put it in **synlib**.
- If it is the install/birth bundle for a concrete synome or teleonome, put it in **telseed**.
- If it is private strategy, cognition, operator preference, or local embodiment memory, put it in **telart / embart**, not synlib.
- If it reaches an external or dangerous resource, expose it through a **workcell** and standardize the interface / conformance in synlib rather than hardcoding it into Noemar.

Negative test: do not put something in Noemar merely because every teleonome should probably do it. That is exactly the role of synlib.

## 3. Synlib as governed defaults

Synlib is distributed and maintained through the synome governance process. It is the channel for updating deep shared defaults without bloating Noemar or manually rewriting every teleonome.

Synlib can include:

- standard workcell specs and conformance tests;
- default syngate client behavior and envelope-handling conventions;
- logging, audit, cursor, replay, and nonce-domain conventions;
- testonome fork / scrub / replace / rebind policies;
- standard embart workspace patterns;
- standard operator UI prompt and approval shapes;
- market-data source quality and reducer-output expectations;
- telseed templates and installer patterns;
- migration helpers for new synlib versions.

Synlib should not become a general dumping ground. A candidate belongs in synlib only if shared standardization creates real conformance, safety, portability, or governance value.

## 4. Synlib update posture

Teleonomes should be designed to ingest synlib updates, but not as blind arbitrary remote code execution.

Working update model:

1. Synome governance publishes a versioned synlib release.
2. A teleonome verifies the release, its provenance, and its compatibility with the relevant telseed/update policy.
3. The teleonome runs local conformance checks and, for higher-risk updates, testonome rehearsal.
4. The teleonome applies the update according to its policy.
5. Beacon auth, recipe eligibility, payments, or canaries may require a minimum synlib version or passing conformance evidence.

Useful update classes:

| Class | Examples | Posture |
|---|---|---|
| **Patch default** | Clarified conformance test, harmless logging shape, documentation/spec correction. | Auto-ingest if verification and tests pass. |
| **Operational default** | Workcell health policy, retry/backoff standard, source-quality rule. | Stage locally, test, then apply. |
| **Authority-adjacent** | Syngate envelope handling, nonce-domain policy, signer/workcell constraints. | Require testonome rehearsal and/or operator approval. |
| **Breaking major** | New workcell model, new telseed structure, new beacon protocol expectation. | Treat as a phase-style migration with compatibility window. |

The exact update protocol is deliberately deferred. Localnome should teach which update classes are real and where the safety boundaries sit.

## 5. Telseed

A telseed is the self-contained package that can birth either:

- a P1 bootstrap environment from scratch; or
- in later phases, a teleonome that can connect to a running synome and operate authorized beacons.

A telseed should eventually answer:

- which Noemar build or source reference is required;
- which synlang / synart artifacts are mounted;
- which synlib release line or snapshot is used;
- which initial telart / embart seed material is included;
- which workcell classes must be installed or connected;
- which local / test / production binding profiles exist;
- which update policy governs future synlib ingestion.

Do not freeze the telseed schema yet. The first concrete shape should come from Localnome 7 through Localnome P1 Full, where actor isolation, workcells, fake external worlds, and testonome rehearsal are actually exercised.

## 6. What Localnome should teach

Localnome should keep pressure on these questions:

- Which behavior truly needs to be runtime primitive vs governed library?
- Which workcell standards are stable enough for synlib?
- Which installer behaviors are generic telseed machinery vs local operator practice?
- Which synlib updates can be safely auto-applied?
- Which updates require testonome rehearsal, operator approval, or phase-boundary migration?
- Which files/state belong in image-like material vs artifact bundles vs secure embstate?
- How should a teleonome prove current synlib conformance without exposing private cognition or secure embstate?

As Localnome answers these, this doc should be revised. The goal is not to lock the split early; it is to keep the split visible while implementation evidence accumulates.

## 7. Non-goals

Do not add here:

- concrete telseed schema fields;
- package directory layouts;
- Compose service definitions;
- update protocol wire formats;
- mandatory synlib release cadence;
- Noemar implementation details beyond the boundary tests above.


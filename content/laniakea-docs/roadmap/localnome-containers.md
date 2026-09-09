# Localnome Containers

Container and external-world isolation doctrine for Localnome. Not a Compose spec, package layout, or telseed schema. Containers are part of the realism ladder, but only when the boundary under test is process / identity / workcell separation. Boundary principles: [`noemar-synlib-telseed.md`](noemar-synlib-telseed.md).

**Isolation model — four distinct layers, never collapsed:**

- **Host unit** — the whole ensemble (later a Compose project / namespace).
- **Localtel** — one independent teleonome analogue: own keys, nonce domain, logs, filesystem, network identity (later one OCI container).
- **Workcell** — bounded operational resources (chain RPC, signer, market feed, attestor docs, operator UI) as sidecars that own dangerous resources.
- **Noemar frame** — in-runtime state snapshots/forks; runtime mechanics, not container isolation.

**Container principles:** one OCI container per localtel when actor boundaries are under test; **no Docker-in-Docker** (run multiple localnomes as multiple project namespaces); project namespace is the ensemble boundary; **sidecars are workcells** (the localtel talks to the interface, never owns the dangerous resource); develop locally, soak on remote Linux. These are hosting principles, not file-generation instructions — no concrete Compose services, endpoints, or volumes until a rung needs them.

**Phasing:** container fidelity arrives only when it tests a real boundary. LN0–1 none (keep paths separable); LN2 real syngate (containers optional); LN4–5 market-feed and forked-chain workcells become useful sidecars; **LN7 first mandatory one-localtel-per-container** (tests the five actor boundaries); LN8–P1 Full a Compose-compatible project is the normal host shape.

**Fake external world** is per boundary, not one sigil: syngate intake (run for real once it's under test), chain reads (forked/fixture, same `CHAINREAD` shape), market data (fake feeds → reducer-shaped outputs), relay/govops (signer/receipt/fork-chain sidecars; synserv gains no `SENDTX`), attestor/operator (fixture docs, scripted UI). Fake the external world behind workcells; never fake the gate path itself when it's under test.

**What Localnome must teach telseed:** by LN7–P1 Full, clarify what belongs in an image vs an artifact bundle, how Noemar/synlang/synart/telart/embart/workspecs/installer separate, how sidecars are declared without secrets, how local/test/prod bindings differ without changing core code, and how a production teleonome produces testonomes without cloning authority. The telseed/container package spec is a conclusion drawn from these rungs, not invented ahead of them.

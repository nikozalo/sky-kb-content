# Localnome

The local build ladder for P1 — the sequence for developing the smallest useful local version, then adding realism one boundary at a time. Not a second production spec, not a generated package layout. Container/isolation doctrine: [`localnome-containers.md`](localnome-containers.md).

**Carry-forward decisions.** Bias toward building the local Noemar/runtime path, not production-candidate teleonome specs. Local runs may use fake data, fixtures, forked chains, local keys/workcells, and reduced cardinality — but must not touch production workspaces, workcells, endpoints, keys, or secure embstate. Keep config/keys/logs/state separable early; require one localtel per container only when a rung tests actor boundaries. Unspecified details stay open gaps, not placeholder atoms.

**The ladder grows production synlang additively:** each rung's loop body/rules/equations are production-quality for its scope; later rungs extend them at phase-invariant consumption sites without rewriting. A black-box-deferred body (real signature, opaque body) becomes a real body later; readers don't change.

**Rungs:** LN0 one grounded callable path · LN1 real synserv heartbeat + ER rollup shape (risk-form body black-box-deferred) · LN2 syngate envelope accept/reject · LN3 attestation default-deny · LN4 market memory affects risk · LN5 `CHAINREAD` + receipts on forked/test chain · LN6 one NFAT loan end-to-end · LN7 the five actor boundaries (one localtel per container) · LN8 reduced-cardinality P1 · LN9 full-cardinality local P1 · P1 Full testosynome-readiness artifacts.

**Noemar alignment.** Current Noemar already seeds LN0 (Protocol.handles ≈ sigil heads; register_protocol ≈ binding; evaluate ≈ implement). LN0/LN1 implementation surface = reconciling roadmap sigil names vs current protocol prefixes, first-class binding metadata, and loop-body ingestion; align LN1's executable surface with [`synlang-p1-form.md`](synlang-p1-form.md).

**Don't generate yet:** `localtels/` trees, concrete Compose services, per-Space `.synlang` placeholders, fake boot manifests, invented auth/endpoints/receipts/hubs, telseed schemas, production teleonome layouts. These appear only after Noemar has a real package/ingestion surface or a rung needs a concrete fixture — which does not forbid the minimal real LN0/LN1 ingestion path (one synserv loop body + seeded source atoms).

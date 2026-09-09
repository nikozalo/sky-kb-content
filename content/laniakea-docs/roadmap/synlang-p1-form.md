# Synlang P1 Form

**Scope:** Minimal executable synlang surface needed for Localnome 1 and the P1 custodial-crypto path. This is not a complete language spec. It pins only the forms needed to write the synserv heartbeat, rule-shaped derivations, and the black-box-deferred risk form.

P1 reuses the callable split in [`grounding-and-workcells.md`](grounding-and-workcells.md): literals, special forms, stdlib, speciallib, and workcell-backed sigils. Atom syntax follows the examples in the roadmap corpus.

## Rule Form

Rules declare reads, a predicate, and yielded atom templates:

```metta
(rule {rule-id}
   (reads [&space-1 &space-2 ...])
   (when {predicate})
   (yields {atom-template}))
```

`reads` is explicit. `when` may use variables, literals, special forms, stdlib calls, and already-bound sigils. `yields` materializes atoms into the current heartbeat derivation set with the heartbeat timestamp unless the rule says otherwise.

Example rollup gate:

```metta
(rule rollup-gate-custodial-crypto-v1
   (reads [&entity.halo.spark-term.custodial-crypto
           &entity.halo.spark-term.riskbook.rbk-001
           &entity.halo.spark-term.exobook.spark-term-loan-001])
   (when (and (fresh-pass borrower-admission borrower-001)
              (fresh-pass riskbook-attestation rbk-001)
              (fresh-pass exobook-term-attestation spark-term-loan-001)
              (scope-match spark-term-loan-001)))
   (yields (rollup-gate rbk-001 spark-term-loan-001 $H pass)))
```

## Loop Body Form

Loop bodies are ordered steps. Each step declares its reads and writes / yielded derivations.

```metta
(loop-body {loop-id}
   (loop-step {step-id}
      (reads ...)
      (derives ...)
      (writes ...))
   ...)
```

P1 synserv heartbeat skeleton:

```metta
(loop-body synserv-heartbeat-v1
   (loop-step settlement
      (reads [(NOW) &core.settlement])
      (writes [&core.settlement
               &core.treasury
               &entity.generator.usge.structural-demand
               &entity.generator.usge.sdr-auction]))
   (loop-step exobook-derivation
      (reads [CHAINREAD &entity.oracle.crypto-majors.ticks])
      (derives [exobook-current-state exobook-sptp]))
   (loop-step riskbook
      (reads [borrower-admission riskbook-attestation exobook-term-attestation risk-form])
      (derives [rollup-gate custodial-crypto-crr-components riskbook-default-crr]))
   (loop-step halobook
      (reads [child-riskbook nfat-unit nfat-holder])
      (derives [halobook-exposure nfat-prime-projection]))
   (loop-step structbook
      (reads [nfat-prime-projection sdr-allocation])
      (derives [structbook-match structbook-position-capital structbook-insyn-trrc]))
   (loop-step primebook
      (reads [structbook-insyn-trrc exsyn-trrc-claim prime-trc])
      (writes [(prime-er $prime $value $H)])))
```

The skeleton is intentionally shape-binding rather than grammar-complete. LN1 must use this read path and output shape; later rungs fill in richer bodies without moving the consumption sites.

## Risk Form Shape

Risk forms are synlang objects with declared inputs and equation slots:

```metta
(risk-form {risk-form-id}
   (level {riskbook|exobook|exoasset})
   (frame {frame-id})
   (composition-constraints {predicate})
   (variables [{var-1} {var-2} ...])
   (equation-default {body})
   (equation-m2m {body-or-none})
   (equation-htm {body-or-none})
   (resolution-tier {math|simulation|heuristic|max-risk}))
```

LN1 may use a black-box-deferred body if the signature, variables, and outputs are real:

```metta
(risk-form custodial-crypto
   (level riskbook)
   (frame usd)
   (composition-constraints
      (and (senior-tranche-only)
           (collateral-asset-in [btc eth steth])
           (senior-denom-in [usdc usds usdt])
           (term-to-maturity <= 1y)
           (halo-class nfat-term)))
   (variables [exobook-state attestation-gates market-memory scenario-library])
   (equation-default black-box-deferred-ln1)
   (equation-m2m none)
   (equation-htm none)
   (resolution-tier simulation))
```

The black-box body returns seeded `custodial-crypto-crr-components` in LN1. LN6 replaces that body with the stress-envelope waterfall while keeping the same reads and output atoms.

## Deferrals

P1 does not pin the full type system, recursive forms beyond loop execution, advanced pattern matching, macros, stochastic calls, or syntax for every Noemar parser detail. Those belong to Noemar implementation once LN0/LN1 exposes what the runtime actually needs.

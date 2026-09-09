# Attestor Atom Schema — Custodial-Crypto

**Scope:** custodial-crypto borrower readiness, borrower admission, riskbook admission, and exobook term verification. (Opaque-RWA classes need a richer numeric schema — out of scope here.)

## The reframe

For custodial-crypto, **every quantitative CRR input is insyn** — collateral/debt/LT/LTV via `CHAINREAD`, price/liquidity/vol via the market-memory oracle. So the attestor is **not** an oracle of loan facts; it is a legal/operational/credit underwriter of what the chain can't show: borrower setup acceptable before Core Council inclusion, Configurator whitelist path completed, riskbook shared structure sound, exobook term enforceable.

**Account vocabulary:** *disbursement account* (borrower address receiving principal) and *collateral account* (linked account the exobook tracks and liquidates against). Onboarding the disbursement account = Configurator inclusion, not a loose address field.

## Four boolean surfaces

Two-step borrower onboarding (inclusion can't be attested current before it happens):

- **Borrower readiness** (risk-class Space) — claims: legal-framework-enforceable, account-binding-valid, custody-setup-current, credit-standing. Gates the request for Configurator inclusion only.
- **Borrower admission** (risk-class Space) — adds `configurator-whitelist-current`; this is the borrower-level rollup gate. Posted only after `relay-core-govops` records inclusion.
- **Riskbook attestation** (riskbook) — legal-structure-enforceable, credit-standing, custodian-compliance over shared structural config.
- **Exobook term attestation** (exobook) — term-enforceable, maturity/TTM-at-funding, cash-conversion-path-valid, disbursement-readiness.

Each atom carries `attestor`, `timestamp`, `refresh-due`, a status/underwriting boolean, the `claims` block, a `scope-ref` (hash binding the claim to the relevant structure — market state is never in scope), and a signature.

## Lifecycle, default-deny, slashing

Exobook stages `ready-empty` → (queue claim + `synops` book-asset assignment + term attestation) → funding tx confirms → `funded-active`; certified TTM then becomes official for SDR matching. If a send or attestation fails, the reserve unwinds to PAU cash.

**Default-deny:** a borrower/riskbook/exobook does not roll up if its required attestation is `fail`/`blocked`, stale (`now > refresh-due`), missing, or scope-mismatched — keeping stale legal/credit facts out of the rollup.

**Slashing surface:** the `claims` blocks are reactively slashable — if a position sours and post-mortem shows a claim was false at attestation time, the attestor is slashed; itemized claims let magnitude scale per claim (magnitudes belong to the Oracle Entity spec).

Risk form that consumes these gates: [`custodial-crypto-risk-form.md`](custodial-crypto-risk-form.md). Topology: [`phase-1-spaces.md`](phase-1-spaces.md).

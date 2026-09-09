# Testosynome Scenarios

Testosynome scenarios are cross-teleonome rehearsals for P1 activation and later phase upgrades. They are not a unit-test catalog and should not become a directory full of guessed fixture files.

The purpose is coverage: together, the scenarios should exercise the important authority, data-quality, receipt, lifecycle, workspace, and capital-flow permutations.

## Scenario Card Shape

Each scenario should specify:

- purpose;
- teleonomes involved;
- canonical synart Spaces touched;
- workspecs/workspaces/workcells exercised;
- initial state;
- event sequence;
- expected atoms and outputs;
- failure assertions;
- first Localnome phase that should run it;
- activation relevance.

## Coverage Matrix

| Dimension | Required coverage |
|---|---|
| Teleonome participation | synserv, entity-govops, core-govops, attestor, market-data, and all five together |
| Syngate validity | valid, bad signature, replay, rate-limited, unauthorized verb |
| Attestation state | pass, missing, stale, fail, scope mismatch |
| Market-data quality | pass, degraded, stale, failed, disputed |
| Chain/receipt state | confirmed, missing, reverted/reorged, receipt mismatch |
| Book lifecycle | ready-empty, funded-active, failed funding, unwind/closed path |
| SDR capacity | available, partially consumed, exhausted, capacity shrink |
| Workspec/workspace parity | prod/test match, declared test delta, unexpected divergence |
| Phase change | candidate package rehearsed, rejected, accepted, canary failure |

Closure means the suite covers every row, not every literal combination.

## P1 Activation Suite

| Scenario | Purpose | First Localnome phase |
|---|---|---|
| Happy path single NFAT | One borrower-to-ER flow across borrower setup, attestation, funding, market memory, risk, structbook, and ER output. | Localnome 6 |
| Attestation missing/stale/fail | Verify default-deny and scope/freshness behavior for attestation gates. | Localnome 3 |
| Market data stale/degraded/disputed | Verify risk-form behavior across market-memory quality states. | Localnome 4 |
| Syngate bad signature/replay/rate-limit | Verify invalid or unauthorized envelopes do not mutate synart. | Localnome 2 |
| Funding confirmation reorg/receipt mismatch | Verify only confirmed matching receipts activate funded exposure. | Localnome 5 |
| SDR capacity shrink | Verify matched/unmatched blends change smoothly as SDR capacity changes. | Localnome 6 |
| Phase-upgrade rehearsal | Verify a candidate package is applied in a testosynome before production mutation. | Localnome P1 Full |

Passing the suite is not sufficient for production activation by itself. Production activation still requires read-only production checks and tiny live canaries.

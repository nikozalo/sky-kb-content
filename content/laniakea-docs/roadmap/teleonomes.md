# P1 Teleonomes

P1 needs five production-candidate teleonome delivery specs. These are practical embodiment specs, not Localnome scaffolds. They describe private embodiments that mount synart, instantiate canonical workspecs into local workspaces, operate workcells and beacons, protect secure embstate, and prove readiness through rehearsal and canaries.

Canonical synart topology lives in [`phase-1-spaces.md`](phase-1-spaces.md). Testing and rehearsal doctrine lives in [`testonomes-and-phase-rehearsal.md`](testonomes-and-phase-rehearsal.md). Local build order lives in [`localnome.md`](localnome.md).

Container / telseed packaging is a later output, not a P1-local decision to freeze here. Localnome should teach the eventual package shape: what belongs in an image vs an artifact bundle; how Noemar, synlang, synart references, synlib refs or snapshots, telart seed state, embart seed state, workspecs, and installer logic are separated; how workcells are declared without embedding secrets; and how local / test / production bindings differ without changing the core teleonome code path. Doctrine for that learning loop lives in [`localnome-containers.md`](localnome-containers.md); the provisional Noemar / synlib / telseed boundary model lives in [`noemar-synlib-telseed.md`](noemar-synlib-telseed.md).

## Shared Delivery Contract

Each production-candidate teleonome spec should eventually pin:

- beacon identities it operates;
- canonical workspecs it instantiates;
- production and test workspace boundaries;
- workcells, workcell hubs, and secure embstate boundaries;
- syngate inputs and outputs;
- required testosynome scenarios;
- production canary that proves the embodiment is live without exposing secrets;
- packaging constraints learned from Localnome, when the telseed / container package shape is ready to be specified.

Testonomes may receive test workspaces and test workcells. They must never access production workspaces, production workcells, secure embstate, production keys, live nonce authority, or production endpoints.

## Production Set

| Teleonome | Role | Key responsibilities | First Localnome coverage |
|---|---|---|---|
| Synserv | Runs the canonical synserv node. | Heartbeat, sequencing, DSC processing, SDR allocation, `prime-er` publication, testosynome coordination. | Localnome 1 |
| Entity govops | Runs ordinary Prime and Halo operations. | Prime relay, Halo relay, Halo synops, constructor records, lifecycle records, receipt records, borrower setup requests. | Localnome 2; NFAT coverage in Localnome 6 |
| Core govops | Runs core-level operational coordination. | Core request status, Configurator/aBEAM operational records, phase-boundary package support. | Localnome 7 |
| Attestor | Runs custodial-crypto attestation workflows. | Borrower readiness/admission, riskbook structure, exobook term/funding-path/disbursement-readiness attestations. | Localnome 3 |
| Market-data | Runs the Crypto Majors market-memory pipeline. | Source acquisition, normalization, archive/replay/live-tail, reducer outputs, checkpoint/provenance publication. | Localnome 4; chain-backed realism in Localnome 5 |

## Workspec Families

The current P1 workspec families are:

- `ethereum.{prod,test}`;
- `syngate.{prod,test}`;
- `attestor.{prod,test}`;
- `operator-ui.{prod,test}`;
- `testonome.{prod,test}`;
- `market-data-obtainer.{prod,test}`;
- `market-data-processing.{prod,test}`.

These are synart source specs for best-practice workspace/workcell patterns. They are not live local workspaces and do not hold secrets, files, daemons, endpoints, or secure state.

## Secure Embstate Emphasis

Production embodiments protect the operational substrate around their work:

- Synserv: production syngate state, scheduler authority, indexing/receipt state, production endpoints, any local signer/operator credentials.
- Entity govops: production beacon keys, PAU/operator credentials, transaction queues, live nonce state, operator sessions, production endpoint configs.
- Core govops: Configurator/aBEAM execution credentials, approval records, transaction queues, live nonce state, core operator sessions.
- Attestor: borrower/legal/custody/credit documents, attestor signing keys, production approval sessions.
- Market-data: paid-feed credentials, source configs, archive checkpoints when restricted, publication keys, production endpoint configs.

Secure embstate is not forked into a testonome. Testonomes get test keys, fake/redacted data, test endpoints, and test workspaces only.

## Canary Shape

Production canaries are tiny normal-path actions:

- Synserv: one bounded heartbeat/output over known safe inputs.
- Entity govops: one harmless authorized syngate envelope plus replay rejection.
- Core govops: one bounded request-status update without granting sudo or applying class changes.
- Attestor: one harmless scoped attestation plus default-deny checks in rehearsal.
- Market-data: one fresh reducer-output batch with source coverage and checkpoint hashes.

Canaries are not mock modes. They prove live authority and live workcell paths with minimal blast radius.

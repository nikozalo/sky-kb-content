---
name: review-executive-doc
description: Review a Sky executive vote document for content, structure, formatting, and convention compliance. Use when asked to review, check, or give feedback on an executive vote markdown file in 2025/ or 2026/ (e.g. "review the June 4 exec doc", "check this executive vote").
allowed-tools: Bash(curl *) Bash(jq *) Bash(cast call *) Bash(cast code *) Bash(cast keccak *) Bash(cast to-check-sum-address *) Bash(cast format-bytes32-string *) Bash(npx markdownlint-cli2 *) Bash(npx --yes markdownlint-cli2 *) WebFetch(domain:forum.skyeco.com) WebFetch(domain:sky-atlas.io) WebFetch(domain:github.com) WebFetch(domain:raw.githubusercontent.com)
---

# Review Executive Doc

Structured, constructive review of a Sky executive vote document against the
project checklists, principles, and the established conventions of recent docs.

## Inputs

- The target executive doc (a markdown file in a folder corresponding to the current year e.g. `2025/` or `2026/`). If the user
  didn't name one, ask or infer from the open editor file.

## Tooling and permissions (read first)

The `allowed-tools` list in this skill's frontmatter pre-approves the fetch and
verification commands the review needs (`curl`, `jq`, read-only `cast` subcommands,
`markdownlint-cli2`, and `WebFetch` on the forum, Atlas and GitHub) for the duration of
the invocation. Anything outside that list prompts the user, so **shape every command
to stay inside it**:

- **One command per Bash call, no wrappers.** `for` loops, `export VAR=…;` prefixes and
  `python3` heredocs are not on the list and force a prompt even when the inner command
  is. Issue allowlisted commands as parallel tool calls instead of looping. Pipes and
  `&&` are fine when *every* segment is allowlisted (`curl … | jq …`,
  `cast code … | cast keccak`).
- **Pass the RPC inline**: `cast call --rpc-url https://ethereum-rpc.publicnode.com …`
  rather than exporting `ETH_RPC_URL`.
- **Parse with the Read and Grep tools, not shell.** They never prompt. When a payload
  needs inspection beyond a `jq` one-liner, `curl -sL <url> -o <scratch>/<file>` into
  the session scratchpad directory (or `/tmp`) and Read or Grep the file.
- **Do not reach for `python3`, `sed -i`, or any tool not listed** to save a step. If a
  check genuinely needs something outside the list, do it and say so in the findings;
  never silently skip a check because it would prompt.

Concrete commands for each fetch appear in the sections below.

## Process

1. **Read *and review the doc against* the governing process docs** (source of truth
   — re-read, don't rely on memory):
   - `processes/executive-doc-review-checklist.md`
   - `processes/executive-doc-creation-checklist.md`
   - `processes/executive-doc-principles.md`
   - `processes/drafting-style-guideline.md`
   - `templates/executive-vote-template.md`

   Reading each is **not** context-gathering — it commits you to checking the target
   against **every** rule in it. These docs are the source of truth; do not copy their
   rules into this skill (that just creates a second, drift-prone copy) — apply them
   directly from the file. In particular, `drafting-style-guideline.md` is a prose
   checklist (number-spelling ≥1M, abbreviation-on-first-use, full-stops on
   full-sentence list items, avoid slashes/localisms, header capitalization, entity
   name/notation consistency across title ↔ summary ↔ Executive Summary ↔ body); it is
   **not** covered by `markdownlint`, which only checks Markdown mechanics. In the
   findings, **affirmatively account for each governing doc** — a ✅ line ("conforms to
   `drafting-style-guideline.md`") or the specific deviations — so a doc you failed to
   apply shows up as a visible omission rather than a silent skip.
2. **Read 3–4 recent docs of the same shape** from `2025/`/`2026/` to anchor
   conventions: the most recent month, plus some earlier ones containing the same
   items. Use them to verify recurring addresses, link styles, and section structure.
   **Compare like-with-like** — see the principle below; when an item's convention
   is in question, find prior occurrences of *that same item type* (ideally produced
   by the same function/mechanism), not a superficially similar item elsewhere.
3. **Read the target doc in full — the LIVE file, re-read fresh at review time.**
   Review the current working-tree file, never a committed/older version and never a
   copy you read earlier in the conversation — the author iterates continuously, so a
   read from even a few messages ago is likely stale. **Re-read the file immediately
   before producing findings**, and re-read any specific line again before asserting a
   finding on it. Caveat: the file tools read from **disk**, so unsaved changes in the
   author's IDE buffer are invisible to you and the on-disk copy can lag the live
   editor. If the author is editing interactively, ask them to **save** first (or to
   confirm the exact current text of any line you're about to flag) so you're
   reviewing the live state. Do not report a finding on a line whose current content
   you have not just verified. (This has produced repeated false findings against
   already-fixed content — treat it as a hard rule.)
4. **Follow the links and read what they point to** (see below) — the linked
   content is part of the context the review depends on.
5. **Produce structured feedback** grouped by severity:
   - 🔴 **Blocking** — broken rendering, wrong/inconsistent addresses, factual errors.
   - 🟠 **Formatting/markdown** bugs.
   - 🟡 **Checklist / convention** gaps.
   - 🔵 **Clarity / accuracy** (constructive).
   - ✅ **Looks good** — call out what checks out, so the author knows it was verified.
6. Cite findings by `file:line`. Do **not** edit the file unless the user asks —
   default to feedback. When you do edit, only apply mechanical fixes and leave
   judgment calls (addresses, value wording) for the author to confirm.

## Compare like-with-like (IMPORTANT)

Before flagging anything as a convention deviation, confirm your reference point is
the **same kind of item**. A value's correct format depends on the context that
produces it, and the same token can follow different conventions in different
contexts. Anchor a convention judgement on prior occurrences of the *same item
type* — ideally generated by the same function, mechanism, or section — not on a
superficially similar item elsewhere in the docs.

- **Match the mechanism, not just the token.** Example: `cfg.ttl` in an allocator
  onboarding (`AllocatorInit.initIlk`) is written **`86,400 seconds (24 hours)`**
  (seconds first), per prior allocator onboardings. A `ttl` in a SparkLend
  cap-automator (proxy-spell) param is written in hours (e.g. `12 hours`). Same
  token, different convention — comparing across them produces a wrong finding.
- **Main-spell vs proxy-spell** items follow different conventions (see the scope
  exclusions below) — never use one to judge the other.
- **When the right comparable is unclear**, grep prior docs for the specific item
  and read the surrounding context to confirm it's the same mechanism before
  asserting a convention. If you still can't find a true match, flag it as a
  question ("confirm intended format") rather than asserting a deviation.

## Review the underlying content of links (IMPORTANT)

A link is not just a rendering target — what it points to is part of the context
the review depends on. Fetch and read the linked content so the review reflects
what the doc actually authorizes, not just how it reads.

- **Fetch the target of each substantive link** (use `WebFetch`; load it via
  `ToolSearch` with `select:WebFetch` first). Prioritize:
  - **Authorization / Proposal links** on each top-level item — confirm the linked
    page exists, resolves, and describes the *same* action the doc claims.
  - **Block-explorer links** for addresses — confirm the address resolves on the
    expected chain's explorer and (where determinable) that the contract/label
    matches (e.g. token symbol, contract name, deployer).
  - **Forum / discussion / poll links** — read enough to confirm the doc's framing,
    amounts, and parameters match what was actually discussed or approved. Use the
    Discourse JSON API rather than the HTML page — the numeric `<topic-id>` is the
    path segment after the slug:

    ```
    curl -s https://forum.skyeco.com/t/<topic-id>.json | jq -r '.post_stream.posts[] | select(.post_number == <n>) | "--- post \(.post_number) by \(.username) (\(.created_at[:10]))\n\(.cooked)"'
    ```

    Drop the `select` to get every fetched post. The `cooked` field is HTML; read
    through the tags. A doc link ending in `/<n>` points at a specific reply — read
    *that* post, not just post 1, since the *final* calculation or the Core
    Facilitator's confirmation is usually a later reply.
  - **Snapshot links** (`snapshot.org/#/s:<space>/proposal/<id>`) — the Authorization
    for Prime/proxy-spell items. snapshot.org is client-rendered, so query the GraphQL
    hub (the `<id>` is the trailing 0x…64-hex path segment):

    ```
    curl -s -X POST https://hub.snapshot.org/graphql -H 'Content-Type: application/json' -d '{"query":"{ proposal(id: \"<id>\") { title state choices scores scores_total space { id } } }"}' | jq '.data.proposal'
    ```

    A `null` proposal means the id does not resolve — that is a dead Authorization
    link (🔴), not a blank to skip. Confirm the space matches the Prime
    (`sparkfi.eth`, `grovefinance.eth`, …), the state is `closed`, the outcome passed,
    and the title describes the same action as the doc's heading.
  - **Governance poll links** (`vote.sky.money/polling/<slug>`) — `WebFetch` gets a
    **403** on the vote portal (bot-blocked and client-rendered), so use the JSON API,
    where `<slug>` is the trailing path segment of the poll URL:

    ```
    curl -s "https://vote.sky.money/api/polling/<slug>?network=mainnet" | jq '{pollId, title, type: .parameters.inputFormat.type, startDate, endDate, url, summary}'
    ```

    `url` points at the poll's source markdown. Use this to identify the poll — but
    **the summary alone is not sufficient to confirm authorization.** Atlas Edit
    Weekly Cycle polls bundle many
    changes and the summary is high-level, so a specific item may be authorized
    without appearing in the summary text. **Follow through to the underlying Atlas
    changes** — the poll's source/PR and the corresponding `next-gen-atlas` diff — and
    confirm the *specific* item (the exact parameter, contract, or action) is present
    in the Atlas edit. Only treat a poll as the wrong authorization once you've
    checked the underlying Atlas changes and the item genuinely isn't there (🔴).
    Cross-check the poll cited in the doc against the poll in the instruction sheet's
    Authority column for the same item, and reconcile any difference against the
    Atlas changes rather than assuming either is right.
    **Two items citing the same poll is not inherently an error.** One poll routinely
    bundles authorization for several unrelated items in the same exec (e.g. a single
    Atlas Edit Weekly Cycle poll covering both an allocator onboarding and a
    foundation grant). It *can* be a copy-paste error, so raise it as a question
    ("confirm poll X covers item Y") and verify against the poll's underlying Atlas
    changes — never assert it as a blocker from a forum thread's paraphrase, and never
    escalate to 🔴 because the poll itself could not be fetched.
  - **Sky Atlas links** (`sky-atlas.io/#<uuid>`) are client-rendered — `WebFetch` on
    the page URL returns only the table of contents. Fetch the flat markdown export
    once per review and Grep it; every node carries an inline
    `<!-- UUID: <uuid> -->` marker, and the `<uuid>` is the fragment after `#` in the
    doc's link:

    ```
    curl -sL https://sky-atlas.io/api/atlas.md -o <scratch>/atlas.md
    ```

    Then use the **Grep tool** on that file with pattern `UUID: <uuid>` and enough
    `-A` context to read the node (`-B` a few lines to see the parent heading). No
    match means the uuid is not in the Atlas — itself a finding, so don't swallow it.
    Grep the same file for a parameter name (`maxKbump`, `line`, …) to find where a
    value is defined.
    The export 308-redirects to `www.sky-atlas.io` and is ~3.5MB. `atlas.json`
    (~11MB; structured fields `content`, `active_data`, `tenets`, `annotations`) and
    `atlas.yaml` carry the same data — use JSON only when you need a field
    programmatically. Many linked nodes are
    *definitional* (the generic concept
    page, e.g. "Rate Limits", "Maximum Debt Ceiling (`line`)") and carry no value — for
    those, verify the item's actual number against the spell source / instruction sheet
    (see the parameter-table check below); value-bearing nodes exist too (check the
    node's `active_data`), so read the node before deciding which kind it is.
  - **Technical reference links** (e.g. spell source, MIPs, prior execs) — read for
    context that changes how an item should be interpreted.
- **Cross-check the link's content against the doc.** Flag mismatches between what
  the doc states and what the linked source says — wrong amounts, different
  parameters, a stale or superseded proposal, a link pointing to an unrelated item,
  or an action described differently. These are high-severity (🔴) findings.
- **Flag dead or wrong-destination links** — a link that 404s, redirects
  unexpectedly, or points to the wrong entity/chain/proposal.
- **If a link can't be fetched** (auth-walled, rate-limited, offline), say so
  explicitly and flag it as unverified (🔵) rather than silently skipping it — note
  which links you could not confirm so the author can check them manually.
- Be judicious: you need not fetch every boilerplate/footer link (e.g. the standard
  Operational Manual or Governance Calendar) more than once, but every
  item-specific authorization, address, and amount-bearing link should be checked.

## Cross-check against the instruction sheet (IMPORTANT)

The doc is crafted from an "Executive Contents" instruction sheet — the source of
truth for *what the spell is supposed to contain*. Reconcile the two in **both
directions**; a discrepancy either way is a high-severity (🔴) finding.

- **Sheet → doc**: every instructed item appears in the doc. A missing one is an
  **omission** — an authorized action the doc failed to describe.
- **Doc → sheet**: every doc item traces back to a sheet item. One that doesn't is
  an **unauthorized or stale addition** — the direction reviews most often miss, and
  where an un-instructed change would hide. No orphans on either side.

### Locating the sheet (public, no auth needed)

Fixed spreadsheet ID: `1w_z5WpqxzwreCcaveB2Ye1PP5B8QAHDglzyxKHG3CHw`. Only the tab
changes per spell, so **select the tab by position, not name** — the naming
convention has drifted (older tabs use `Executive Contents - <date>` with a hyphen,
recent ones `Executive Contents <date>` without), so by-name selection is brittle.

Tab positions: index 0 = *Spell Progress Tracking*, index 1 = *Executive Contents
(Template)*, index 2 = the current spell (new spells insert here, pushing prior ones
down).

1. **Fetch the bootstrap** and save it — it is large, minified HTML, so parse it with
   the Grep tool rather than reading it:

   ```
   curl -sL "https://docs.google.com/spreadsheets/d/1w_z5WpqxzwreCcaveB2Ye1PP5B8QAHDglzyxKHG3CHw/edit" -o <scratch>/sheet.html
   ```

2. **Read the ordered sheet registry** with Grep (`-o` output) using this pattern:

   ```
   \[(\d+),0,\\{1,2}"(\d+)\\{1,2}",\[\{\\{1,2}"1\\{1,2}":\[\[0,0,\\{1,2}"([^"\\]+)
   ```

   Each match is `[<index>,0,"<gid>",[{"1":[[0,0,"<name>"`. Take the entry with index
   **2** and note its gid and name. As a sanity check, the visible tab captions
   (`docs-sheet-tab-caption">([^<]*)</div>`) appear in the same order and should carry
   the same names; if the two disagree, stop and say so rather than guessing.
3. **Validate, don't assume**: the resolved name must start with `Executive Contents`
   and contain the doc's date (`YYYY-MM-DD`). If position and date disagree, **stop
   and flag it — do not review against the wrong tab.**
4. **Export the tab** as CSV and Read it:

   ```
   curl -sL "https://docs.google.com/spreadsheets/d/1w_z5WpqxzwreCcaveB2Ye1PP5B8QAHDglzyxKHG3CHw/export?format=csv&gid=<gid>" -o <scratch>/sheet.csv
   ```

   Record the fetch time in the findings, since sheet content is mutable.

Fallback if the bootstrap format changes:
`.../gviz/tq?tqx=out:csv&sheet=<url-encoded exact name>`, but only with the exact
current name. The sheet is reachable without auth as long as it stays link-shareable;
if a fetch returns HTML instead of CSV it isn't public — flag as unverified (🔵).

### Reading the sheet

- Two side-by-side blocks: **main-spell** content in cols B-G, and a **proxy spell**
  block ("… Executive Content") in cols J-N. Parse *both* — proxy items live only in
  the right block.
- `Input` rows = top-level items; `Derived` rows = the sub-bullets under them. Match
  `Input` rows to doc top-level items and `Derived` rows to the doc's bullets.
- **Checksums (the rows near the top): re-verify against the doc's arithmetic** —
  total USDS transfers, total SKY transfers, total newly-minted allocator debt must
  each equal the sum of the corresponding doc amounts. A mismatch is 🔴.
- Sheet **address/codehash instruction rows** are authoritative for the doc's spell
  addresses — diff them per the address+codehash guidance below.
- The `Confirmed`/`Unconfirmed` columns are sign-off **workflow** state, not doc
  correctness — surface as info at most, **never** as a blocker.
- Sheet content is mutable — note the fetch timestamp in the findings.
- Watch for **wording / chain-tag drift** between sheet and doc on the same item
  (e.g. a `[Robinhood Chain]` vs `[Ethereum]` tag, or a differing category prefix);
  raise as a question to confirm which is intended rather than assuming.

## High-value checks (beyond the checklists)

These recur and are easy to miss. Check each explicitly.

### Markdown rendering bugs

**Start with a mechanical Grep pass over the doc** (the Grep tool, not shell `grep`),
one pattern per call, and read every hit:

| Hazard | Grep pattern |
| --- | --- |
| Backtick-wrapped link (renders as literal text) | `` `\[[^\]]*\]\([^)]*\)` `` |
| Nested link | `\[[^\]]*\[[^\]]*\]\([^)]*\)[^\]]*\]\([^)]*\)` |
| Bullet missing the space after `-` | `^\s*-[^\s-]` |
| Leftover placeholder (only `$spell_address` may remain) | `\$[A-Za-z_]\w*` |
| Link whose href is a bare address or not a URL | `\]\([^h)]` |
| Key name pasted into an explorer URL's address slot | `/address/[^0)]` |
| Link text that is itself a URL (text/href swapped) | `\[https?://[^\]]*\]\(` |
| Every address, for the checksum and chainlog checks below | `0x[0-9a-fA-F]{40}\b` (the `\b` excludes 64-hex ids) |
| Sibling labels differing only by a suffix (`Withdraw`/`Withdrawal`) | `^\s*-\s+\**`?[A-Za-z][A-Za-z0-9 _/-]*`?\**\s*:` then compare the labels by eye |

For address-bearing links, also confirm the address in the link text equals the one
in the href — an href copy-pasted from a nearby item is a common 🔴. Treat a clean
pass as "no mechanical defects found", **not** as "the formatting is fine" — it has
no view on wording, emphasis consistency, or header capitalization.

- **Backtick-wrapped links**: a `[text](url)` wrapped entirely in backticks
  renders as literal text, not a link. Put any code span *inside* the link instead.
- **Nested/double links**: a link whose text is itself a link is malformed —
  collapse to one.
- **Bullets missing the space** after the hyphen won't render as list items.
- **Misplaced backticks** that split a word or token.
- **Plain-text trailing links**: the Review and Resources sections (Governance
  forum, Operational Manual, Sky Governance Calendar) must be hyperlinked per the
  template — these are frequently left as plain text.
- **Run markdownlint** over the doc — `npx markdownlint-cli2 <doc>` — per the
  `drafting-style-guideline.md` recommendation. The repo root carries a
  `.markdownlint-cli2.jsonc` tuned for these docs, so **a clean run means clean:
  report every finding rather than filtering a baseline.** (Historically the
  defaults produced ~1,600 findings, none real, and the noise had to be hand-
  filtered — that is no longer the case, so do not dismiss a finding as "expected
  baseline".) If the config is missing or the binary is unavailable, say so and
  check the equivalent rules manually.
  What the config does, so you can reason about a finding: MD013 (line length) is
  off, since address lines legitimately exceed 400 characters. MD025 ignores the
  frontmatter `title:` (every doc has both that and a visible H1 by design), MD024
  is `siblings_only` (agent sub-headings like "Spark"/"Grove" recur under
  different parents), and MD059 permits the `[here]` PR-link convention. Tables
  are pinned to leading+trailing pipes and compact (`| cell | cell |`) padding.
  MD004/MD049/MD050/MD003/MD035 are pinned to the style guideline's hyphen /
  underscore-italics / asterisk-bold / atx / `---` choices, so markdownlint now
  enforces those rules directly. Everything else is left at defaults and catches
  real defects — **MD037** (spaces inside emphasis markers) and **MD039** (spaces
  inside link text) are genuine rendering bugs; never wave them through.
  Note that docs from 2025 and early 2026 still carry unfixed findings (mostly
  table padding and trailing whitespace); when comparing against a prior doc for
  convention, a lint finding there is not a precedent to copy.

### Addresses
- All Ethereum addresses **checksummed** (EIP-55 casing); flag all-lowercase. Verify
  with `cast to-check-sum-address <addr>` for every distinct address from the Grep
  pass — one call per address, issued in parallel, never a loop — and flag any whose
  output differs from the doc. Do not re-derive checksums by hand. 64-hex values (pool
  ids, codehashes, Snapshot proposal ids) are not addresses and have no checksum.
- **Chainlog is the authority for any address the doc labels with a chainlog key**
  (`SPARK_SUBPROXY`, `GROVE_STARGUARD`, `REWARDS_LSSKY_USDS`, …). "It matches the last
  six docs" is **not** equivalent and is not sufficient: a copy-paste error propagated
  through prior docs survives that check, and the wrong address is often itself a
  legitimate address that appears in many docs under a *different* key — which is
  exactly what makes the error invisible. Fetch the chainlog once and keep it:

  ```
  curl -s https://chainlog.skyeco.com/api/mainnet/active.json -o <scratch>/chainlog.json
  ```

  Then, for every address the doc labels with a key (link text in `UPPER_SNAKE` shape,
  or a `Label:` prefix that normalizes to one, e.g. "Spark StarGuard" →
  `SPARK_STARGUARD`), Grep the JSON for the key and compare. The JSON is a mirror, so
  re-confirm each key that matched against the contract itself, in two calls (a
  `$(…)` substitution would take the command outside the allowlist):

  ```
  cast format-bytes32-string <KEY>
  cast call --rpc-url https://ethereum-rpc.publicnode.com 0xdA0Ab1e0017DEbCd72Be8599041a2aa3bA7e740F "getAddress(bytes32)(address)" <bytes32-from-above>
  ```

  Also Grep the JSON for each *unlabelled* doc address to see whether it is
  registered under a key the doc omits. Read the three outcomes correctly:
  - **Doc pairs `<KEY>` with an address the chainlog holds under a different value**
    — a 🔴 copy-paste error **unless this spell is itself replacing that entry**. The
    comparison is against the *current* chainlog, which is right for a doc under
    review but legitimately differs for any key the spell sets, replaces, or renames.
    Read the item before calling it: an onboarding or a `file`-a-new-address item is
    expected to differ.
  - **`<KEY>` is not in the chainlog** — expected when this spell registers the key
    (e.g. `MCD_SBEBEAM`), and expected for Prime-side keys that live in the
    spark-address-registry or a Star spell rather than Sky's chainlog. Confirm which.
  - **An address is registered as `<KEY>` but the doc does not name the key** — an
    opportunity, not a defect: the doc's own convention is to use the chainlog key as
    link text, and naming it lets a reader verify the address independently. Suggest it
    (🔵).
  Addresses genuinely absent from the chainlog (Core Council Buffer, one-off proxy
  spell addresses, Prime-side ALM contracts) have weaker provenance — fall back to the
  instruction sheet, the Prime repo, and the forum post, and say which you used.
- **Verify each address matches its label.** For non-chainlog addresses, cross-check
  recurring entities against recent docs; a label paired with an address used for a
  different entity elsewhere is a likely copy-paste error.
- **Verify each block-explorer link uses the correct explorer for the address's
  chain — this is a contextual check, driven by the address's chain, not its
  format.** The same 0x address can exist on many EVM chains, so the *context*
  decides which explorer is correct, not the address itself. Determine each
  address's chain from, in order of strength: an explicit chain prefix on the
  address (`eth:`, `rh:`, …), a `[chain]` tag on the item or section heading, the
  surrounding text, or the entity's known home chain. Then confirm the link's domain
  matches that chain. A right-address/wrong-chain-explorer link (e.g. a mainnet
  `etherscan.io` link on an Avalanche address, or vice versa) is a 🔴 finding.
  Explorer↔chain mapping (per this repo's established convention — grep recent docs
  if a chain isn't listed, and anchor on prior usage rather than guessing a domain):

  | Chain | Explorer domain |
  | --- | --- |
  | Ethereum mainnet | `etherscan.io` |
  | Optimism | `optimistic.etherscan.io` |
  | Base | `basescan.org` |
  | Arbitrum | `arbiscan.io` |
  | Unichain | `uniscan.xyz` |
  | Avalanche | `snowtrace.io` (primary; `snowscan.xyz` also seen) |
  | Solana | `solscan.io` |
  | Plume | `explorer.plume.org` |
  | X Layer | `web3.okx.com/explorer/x-layer` |
  | Robinhood Chain | `robinhoodchain.blockscout.com` |

  Notes:
  - **Bridge / cross-chain items reference addresses on more than one chain — use
    the per-address inline label, not the section `[chain]` tag.** In an
    `[Ethereum]` bridging item the `destination` may legitimately be an ALM Proxy
    "on X Layer" or a vault "on Robinhood Chain", correctly linked to that chain's
    explorer. The nearest per-address text ("destination … on X Layer", "vault on
    Robinhood Chain", "ALM Proxy on Ethereum") overrides the heading. Do not flag a
    destination whose own label names a different chain than the section.
  - Multiple valid explorers can exist for one chain (e.g. Avalanche
    `snowtrace.io`/`snowscan.xyz`) — the error to catch is the wrong *chain*, not the
    wrong vendor, so don't flag an acceptable alternate.
  - `layerzeroscan.com` is a cross-chain **messaging** explorer, not a chain
    explorer — expect it only on bridge/LayerZero message links, never as an address
    explorer.
  - While checking explorer domains, also confirm the **address shown in the link
    text matches the address in the href** — a `[0xAAA…](…/address/0xBBB…)` mismatch
    (often an href copy-pasted from a nearby item) is a 🔴 finding.
- Newly deployed contracts must have their **address given and hyperlinked**.
- **Address + codehash pairs: verify each independently against the Prime spell's
  own repo (the source of truth).** When a doc pairs a spell address with a codehash
  (e.g. the Prime Agent proxy spells), open that spell's PR and diff *both* cells
  against the doc — the address char-by-char and the codehash separately. **The
  address lives in different places per repo** — check the PR body's deployment table
  first, and if it isn't there, look in the spell's test file (e.g. Spark records it
  as `chainData[<chain>].payload` in `src/proposals/<date>/Spell_<date>.t.sol`, not
  in the PR body). Do **not** substitute the core `spells-mainnet` repo for the Prime
  repo — the Prime repo is authoritative here. A **matching codehash does not imply a
  matching address**: it proves the doc means the same spell, which makes it tempting
  to treat the whole row as verified and skip the address. Treat a matching codehash
  as *increasing* the need to scrutinize the address, not decreasing it — a
  wrong-address/right-codehash row is a 🔴 blocker. This check applies to proxy spell
  addresses too; the proxy-spell scope exclusions below cover Safe Harbor / Bug
  Bounty / before-value framing only, **never** address-vs-PR verification.
- **Codehash: verify against the deployed bytecode on-chain, not just the PR text.**
  A codehash matching the PR only proves the doc and PR agree — it does not prove
  either matches what's deployed. Confirm the address and codehash actually belong
  together on-chain: `cast code <addr> | cast keccak` (this cast build has no
  `cast codehash` subcommand) must equal the stated codehash. This is a
  *self-contained* check — it needs no PR, and it catches an address/codehash pair
  that was mixed up (a doc address holding unrelated code that hashes to something
  else, while the stated codehash belongs to a different address). Pass the RPC
  inline — `cast code --rpc-url https://ethereum-rpc.publicnode.com <addr> | cast keccak`
  — rather than exporting `ETH_RPC_URL`, which would take the command outside the
  allowlist (llamarpc/cloudflare/ankr were down or key-walled at last check). An
  address with no code (`0x`) paired with a codehash is also a 🔴 blocker.

### Consistency
- **Chain tags**: pick one convention per chain and apply it to *every* item;
  watch for a single outlier left behind after a find/replace.
- **Title ↔ Summary ↔ Executive Summary ↔ Proposal Details** must list the same
  items in the same order, ordered by judged impact.
- **Frontmatter summary wording vs. body**: match the precise body wording,
  especially for numeric/parameter changes.
- **Internal arithmetic**: verify stated deltas and totals add up and are
  consistent with prior docs.
- **Units**: every numeric parameter and amount carries the correct unit, and
  the unit matches the action (e.g. USDS vs USDC, hours vs days, % vs bps, token
  symbol). Flag missing, mismatched, or wrong-denomination units.

### Spelling & grammar
- Read for spelling and grammatical correctness throughout. Flag typos, wrong-word
  errors, and broken sentences. Use the project's spelling conventions — do not
  flag intentional protocol terms, ticker symbols, or technical identifiers.

### Framing & links
- Top-level items use future-conditional framing: "If this executive proposal
  passes, then…".
- Each top-level item has **Authorization** and **Proposal** links.
- GSM Pause Delay value, office-hours modifier, and expiry are present, and the
  GSM value reflects the current setting (confirm, don't assume).
- `$` placeholders: only `address: "$spell_address"` should remain; flag any other.
- **Frontmatter `Template -` prefix is intentional**: the frontmatter `title:`
  line begins with `Template - [Executive Vote] …` in every doc by convention — do
  **not** flag it as a leftover placeholder. The visible H1 (the `# [Executive
  Proposal] …` line) carries **no** prefix and must have the real title filled in;
  an unreplaced `$executive_title` there is a genuine blocker.

### Prime/proxy-spell parameter values — verify against all three sources (IMPORTANT)
For **prime/proxy-spell** items (Spark/Grove/Osero etc.), every numeric value in a
rate-limit / parameter table (max amount, slope, cap, slippage, …) must be cross-checked
so **all three of these agree with the doc** — a mismatch in any is a 🔴:
1. **Technical scope** — the item's **Proposal** link (the forum "Prime Technical
   Scope" post). This is the human-readable statement of the intended numbers; read it
   for each value and its rationale (e.g. *"USDS burning is unlimited to preserve the
   unwind path"*).
2. **Authorization** — the **Authorization** link, whatever its type: a governance
   poll (for an Atlas Edit Weekly Cycle poll the summary is high-level, so follow
   through to the underlying Atlas edit for the specific value — see the governance-poll
   guidance above), a forum thread, **or a `sky-atlas.io` link** used in the
   Authorization position. Read whichever it is for the value.
3. **Proxy spell PR** — the implementation source of truth: match each cell to the
   payload constant and test assertion (e.g. `*_MAX_LIMIT`, `*_SLOPE`, `*_MAX_SLIPPAGE`;
   `_assertRateLimit`, `_assertUnlimitedRateLimit`).

**Judge a `sky-atlas.io` link by its role, not its domain.** In the **Authorization**
position it *is* authorization and must be verified as in (2). An atlas link used
*inline* as reference (e.g. a `[rate limits](sky-atlas.io/#…)` beside a table) is
documentation only and does not establish the value — and such links are often
definitional concept pages anyway (see the links section). (Main-spell values instead
trace to the instruction sheet and the core `spells-mainnet` repo — see the cross-check
and address sections.)
- **Mint/burn and deposit/withdraw are independent directions — do not assume the
  outflow row mirrors the inflow row.** A common author error is copy-pasting the
  mint/deposit values into the burn/withdraw row. Burn/withdraw are frequently
  **unlimited** (`type(uint256).max`, slope `0`) even when mint/deposit are capped.
- Cross-check the two directions *within the doc* too: if the spUSDS block lists
  Withdrawals as *Unlimited* but the USDS table gives BURN a finite figure, that
  internal asymmetry is a red flag to chase down against the source.
- A wrong value here is a 🔴 factual error.

### Parameter tables — confirm intentional asymmetry
- When a list of assets each carry a set of parameters but one entry is missing a
  line its siblings have, flag it to confirm it's deliberate, not an omission.

## Proxy spell items — scope exclusions (IMPORTANT)

The Spark/Grove **Prime Agent / Star proxy spell** sub-items follow different
conventions. Do **not** flag the following for proxy spell content:

- **Safe Harbor Update**: proxy spell contracts (the proxy spells themselves and
  the contracts they touch — e.g. ALM Proxy Freezable upgrades, CCTPv2 receivers,
  vaults onboarded inside a Spark/Grove spell) are **out of scope**. Only assess
  core/main-spell contracts for the template's Safe Harbor section.
- **Bug Bounty "new contracts" check**: same exclusion — proxy spell contracts are
  not relevant.
- **Prior/before values**: proxy spell items state new values only by convention.
  Only suggest "from X to Y" framing for main-spell items (e.g. core risk
  parameters like ALLOCATOR-SPARK-A DC-IAM, the MKR-to-SKY penalty), not for proxy
  spell parameter changes (reserve factors, caps, rate limits inside Spark/Grove
  spells).

## Process / awareness checks (can't verify from the file — raise as questions)

- **Parties implicated**: if the spell offboards or removes an external party,
  confirm that party is aware of the wording used.
- **Standby Spells**: if an ilk is onboarded/offboarded, a `dss-emergency-spells`
  README PR is likely required.
- **Atlas active elements**: if the spell changes values tracked in Sky Atlas, a
  `next-gen-atlas` PR should exist.
- **Hash verification**: confirm the author's hash once the doc is approved.

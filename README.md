# sky-kb-content

A prebuilt, text-only snapshot of the Sky knowledge base. Generated nightly by CI from 43
upstream repositories plus the Atlas. **Do not edit `content/` by hand** — it is overwritten on
every build.

This exists so the `sky` skill does not have to build the KB on each user's machine. Cloning
this repo replaces 43 shallow clones driven by a Python script, which is why it needs neither
Python nor a GitHub account.

## Use it

```bash
git clone --depth 1 https://github.com/nikozalo/sky-kb-content.git ~/sky-kb
```

Update it:

```bash
git -C ~/sky-kb fetch --depth 1 origin main && git -C ~/sky-kb reset --hard origin/main
```

`fetch --depth 1` plus `reset --hard` rather than `git pull`, for two reasons: the checkout stays
shallow instead of accumulating history over months, and it cannot fail on a merge conflict if
something local touched the files. This is a read-only mirror; there is nothing to preserve.

Every upstream is public, so no credentials are involved.

## What is in it

| | |
|---|---|
| `content/` | the corpus, laid out exactly as the local sync used to produce it |
| `DIRECTORY.md` | generated index; the skill reads this first to decide where to grep |
| `manifest.json` | build timestamp, source commit, file count and byte size |

Measured on the 2026-09-09 build: **100.6 MB across 6,699 files, 19.9 MB compressed**, from
~970 MB of raw clones.

What the build discards, and why none of it is missed by a grep-based skill:

- **495 MB of `.git` objects.** A `--depth 1` clone still stores one compressed copy of every
  blob, so history roughly doubles the footprint. The skill only ever reads working files.
- **110 MB of PNG screenshots** from a single retired MakerDAO budget subproposal
  (`mips/MIP40/.../MIP40c3-SP67`), ~36 MB of near-duplicate "Maker Protocol 101" PDFs, and
  25 MB of 2019 meetup PowerPoints.

Only `.md`, `.json`, `.txt` and `.sol` survive. Filtering by extension does nearly all the
work: it keeps every one of the 43 repos, including the MakerDAO-era ones the skill cites for
legacy background, while cutting the corpus by 9.6×.

## Build it

`.github/workflows/kb.yml` runs nightly at 05:00 UTC and on manual dispatch. It syncs the
sources with `scripts/sync.py` (vendored from the public `arcniko/sky-kb`), reduces the result
with `scripts/strip.sh`, rsyncs it into `content/` with `--delete` so upstream deletions
propagate, and **commits only when the corpus actually changed**. A nightly run that finds no
diff publishes nothing, so most days there is nothing for anyone to pull.

CI commits incrementally and never force-pushes. Rewriting history would break every client's
shallow fetch and force a full re-clone, which is the whole problem this repo exists to avoid.

`presets/sky.json` is the source list. `custom_repos` is deliberately left empty: personal
additions belong on the user's own machine via `/sff:sky add repo`, not in the shared corpus.

### Knobs

`spells-mainnet` is ~49 MB, about half the remaining corpus, and almost entirely historical
`DssSpell` archives. To drop the old ones, run the workflow manually with
**prune_spell_archive_before** set to a year (e.g. `2025`), or set
`PRUNE_SPELL_ARCHIVE_BEFORE` in the schedule. Left unset, everything is kept.

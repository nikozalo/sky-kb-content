#!/usr/bin/env bash
# Reduce a freshly synced KB to the text a grep-based skill can actually read.
#
# Measured on the full 43-repo sync (2026-09-09): 970 MB in, 100.6 MB out, 19.9 MB compressed.
# The bulk that goes: 495 MB of .git objects, 110 MB of PNGs from one retired MIP40 subproposal,
# ~36 MB of duplicate "Maker Protocol 101" PDFs, 25 MB of 2019 meetup PowerPoints.
set -euo pipefail
ROOT="${1:?usage: strip.sh <kb-dir>}"

# Keep only these extensions. Everything else is not greppable and not worth cloning.
KEEP=(-name '*.md' -o -name '*.json' -o -name '*.txt' -o -name '*.sol')

# A shallow clone still stores one compressed copy of every blob, so .git roughly doubles
# the footprint. Dropping it here is what makes excluding binaries actually pay off.
find "$ROOT" -type d -name .git -prune -exec rm -rf {} + 2>/dev/null || true
find "$ROOT" -type f ! \( "${KEEP[@]}" \) -delete
find "$ROOT" -type d -empty -delete 2>/dev/null || true

# Optional knob: spells-mainnet is ~49 MB, about half the remaining corpus, almost all of it
# historical DssSpell archives. Set PRUNE_SPELL_ARCHIVE_BEFORE=YYYY to drop older ones.
if [ -n "${PRUNE_SPELL_ARCHIVE_BEFORE:-}" ]; then
  find "$ROOT/content/spells-mainnet/archive" -maxdepth 1 -type d 2>/dev/null \
    | awk -F/ -v cut="$PRUNE_SPELL_ARCHIVE_BEFORE" '$NF ~ /^[0-9]{4}-/ && substr($NF,1,4) < cut' \
    | xargs -r rm -rf
fi

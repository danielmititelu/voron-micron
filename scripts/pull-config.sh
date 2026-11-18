#!/usr/bin/env bash
# Sync config/ in this repo with ~/printer_data/config on the printer (SSH host "micron").

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# No --links: symlinks in the printer's config folder point at files owned by
# other packages (typically mainsail.cfg), so they are skipped, not copied.
# printer-<date>_<time>.cfg files are the backups SAVE_CONFIG leaves behind.
rsync --recursive --times --compress --verbose --delete \
  --exclude '.git/' \
  --exclude 'printer-[0-9]*_[0-9]*.cfg' \
  --exclude '*.secrets' \
  --exclude '*.bkp' \
  --exclude '*.bak' \
  --exclude '*.swp' \
  --exclude '*~' \
  micron:printer_data/config/ "$repo_dir/config/"

#!/usr/bin/env bash
# Sync orcaslicer/ in this repo with the OrcaSlicer user profiles on this Mac.

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
orca_dir="$HOME/Library/Application Support/OrcaSlicer/user/default"

mkdir -p "$repo_dir/orcaslicer"

rsync --recursive --times --verbose --delete \
  --exclude '.DS_Store' \
  "$orca_dir/" "$repo_dir/orcaslicer/"

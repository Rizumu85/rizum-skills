#!/usr/bin/env bash
# Pull the latest rules from GitHub and re-run the install.
# Run from anywhere: ~/rizum-agent/sync.sh

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

echo "Pulling latest from origin..."
git pull --ff-only

echo ""
bash "$REPO_DIR/install.sh"

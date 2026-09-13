#!/usr/bin/env bash
# Idempotent dependency bootstrap for BCA Property-IQ.
#
# The repository is a brand-new Blue Collar Apps "-IQ" project. Until the
# application code lands it is empty, so this script must be safe to run against
# an empty checkout. Once a package.json (mirroring the sibling Expansion-IQ:
# Node 22 + Vite + React + TypeScript + Express) is added, it installs
# dependencies from the lockfile, falling back to a plain install if no lockfile
# is present yet.
set -euo pipefail

if [ ! -f package.json ]; then
  echo "No package.json found yet — repository has no application code. Skipping dependency install."
  exit 0
fi

echo "package.json detected — installing Node dependencies..."
if [ -f package-lock.json ]; then
  npm ci
else
  npm install
fi
echo "Dependencies installed."

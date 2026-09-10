#!/usr/bin/env bash
# Development server launcher for BCA Property-IQ.
#
# When the application exists (mirroring the sibling Expansion-IQ), `npm run dev`
# starts the Vite + Express dev server on port 3000. Until then this keeps the
# terminal alive with a helpful message so the panel is visible and ready.
set -uo pipefail

has_dev_script() {
  [ -f package.json ] && node -e "process.exit(require('./package.json').scripts?.dev ? 0 : 1)" 2>/dev/null
}

if has_dev_script; then
  echo "Starting dev server (npm run dev) on port 3000..."
  exec npm run dev
fi

echo "BCA Property-IQ has no runnable application yet."
echo "Add the app (see the sibling Expansion-IQ repo) with a \"dev\" script and this"
echo "terminal will run 'npm run dev' on port 3000 automatically on the next start."
# Keep the terminal alive so it stays visible in the Cloud Agent panel.
sleep infinity

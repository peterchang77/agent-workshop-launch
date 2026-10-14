#!/usr/bin/env bash
# Workshop launcher: installs the workshop data and Kiro CLI in this Cloud Shell session.
# Cloud Shell sessions for this repo are temporary, so run this once each time you launch.
set -euo pipefail

BASE_URL="${WORKSHOP_BASE_URL:-https://peterchang77.github.io/agent-ai-skills}"

echo "Installing workshop data and Kiro CLI (about a minute)..."
curl -fsSL "$BASE_URL/install.sh" | bash -s -- --yes "$@"

# The Kiro installer adds ~/.local/bin to PATH for new shells; make it work in this one too.
export PATH="$HOME/.local/bin:$PATH"

cat <<'MSG'

Next:
  1. kiro-cli login       (choose "Use with Google"; open the URL shown in any browser and enter the code)
  2. cd ~/workshop-demo && kiro-cli
MSG

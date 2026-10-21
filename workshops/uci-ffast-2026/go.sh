# Workshop launcher: installs the workshop data and Kiro CLI in this Cloud Shell session.
# Run it with:   source go.sh
# (sourcing lets it update PATH and move you into the project folder in your current shell)
# Cloud Shell sessions for this repo are temporary, so run this once each time you launch.

_workshop_go() {
  local base_url="${WORKSHOP_BASE_URL:-https://peterchang77.github.io/agent-ai-skills}"
  local sourced=0
  [ "${BASH_SOURCE[0]}" != "$0" ] && sourced=1

  echo "Installing workshop data and Kiro CLI (about a minute)..."
  # Subshell: pipefail applies only here, and a failure cannot close your terminal.
  ( set -o pipefail; curl -fsSL "$base_url/install.sh" | bash -s -- --scenario clinical --yes "$@" ) \
    || { echo "Install failed. Check your connection and run 'source go.sh' again." >&2; return 1; }

  # The Kiro installer asks for ~/.local/bin on PATH; do it for this shell and for new tabs.
  case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
  # shellcheck disable=SC2016
  grep -qs '\.local/bin' "$HOME/.bashrc" || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"

  cd "$HOME/workshop-demo" 2>/dev/null || true

  echo
  echo "Ready. Next:"
  echo "  1. kiro-cli login    (choose \"Use with Google\"; open the URL shown and enter the code)"
  echo "  2. kiro-cli"
  if [ "$sourced" = 0 ]; then
    echo
    echo "Note: you ran this with 'bash'. Run 'source ~/.bashrc && cd ~/workshop-demo' first,"
    echo "or use 'source go.sh' next time."
  fi
}
_workshop_go "$@"; _workshop_rc=$?
unset -f _workshop_go
return "$_workshop_rc" 2>/dev/null || exit "$_workshop_rc"

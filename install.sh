#!/usr/bin/env bash
# Install rizum-agent rules globally.
# Covers every surface of every supported agent:
#
#   Claude Code  - terminal CLI, VS Code extension, JetBrains plugin, native
#                  desktop wrapper (all share ~/.claude/CLAUDE.md user memory)
#   Codex        - terminal CLI, VS Code extension, JetBrains plugin, native
#                  desktop wrapper (all share ~/.codex/AGENTS.md user memory)
#   Cursor       - User Rules stored in app settings (no file on disk) -> clipboard
#   Claude app   - Anthropic's native claude.ai desktop app, uses Personal
#                  Preferences in app settings -> clipboard
#
# Re-running is safe: it refreshes symlinks and re-copies to clipboard.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_MD="$REPO_DIR/AGENTS.md"

if [[ ! -f "$SOURCE_MD" ]]; then
  echo "Error: AGENTS.md not found at $SOURCE_MD" >&2
  exit 1
fi

# Create a symlink, backing up any existing non-symlink file.
install_symlink() {
  local target_dir="$1"
  local target_name="$2"
  local target_path="$target_dir/$target_name"

  mkdir -p "$target_dir"

  if [[ -e "$target_path" && ! -L "$target_path" ]]; then
    local backup="$target_path.backup.$(date +%Y%m%d-%H%M%S)"
    echo "  Existing file at $target_path -> backing up to $backup"
    mv "$target_path" "$backup"
  fi

  ln -sfn "$SOURCE_MD" "$target_path"
  echo "  Linked $target_path -> $SOURCE_MD"
}

copy_to_clipboard() {
  if command -v pbcopy >/dev/null 2>&1; then
    pbcopy < "$SOURCE_MD" && return 0
  elif command -v xclip >/dev/null 2>&1; then
    xclip -selection clipboard < "$SOURCE_MD" && return 0
  elif command -v wl-copy >/dev/null 2>&1; then
    wl-copy < "$SOURCE_MD" && return 0
  fi
  return 1
}

echo "Installing rizum-agent rules globally..."
echo ""

echo "[Claude Code]  CLI + VS Code + JetBrains + native desktop wrapper"
install_symlink "$HOME/.claude" "CLAUDE.md"
echo ""

echo "[Codex]  CLI + VS Code + JetBrains + native desktop wrapper"
install_symlink "$HOME/.codex" "AGENTS.md"
echo ""

echo "[Cursor]  User Rules (stored inside the app, no file on disk)"
echo "  1. Open Cursor -> Settings -> Rules -> User Rules"
echo "  2. Paste the clipboard contents"
echo ""

echo "[Claude desktop app]  Anthropic's native claude.ai app"
echo "  1. Open Claude -> Settings -> Personal Preferences (or 'Custom Instructions')"
echo "  2. Paste the clipboard contents"
echo ""

if copy_to_clipboard; then
  echo "Rules content copied to your clipboard -- paste into Cursor and/or the Claude app now."
else
  echo "(No clipboard utility found. Open AGENTS.md and copy the contents manually.)"
fi

echo ""
echo "Per-project override: copy AGENTS.md / CLAUDE.md / .cursor/rules/rizum-agent.mdc"
echo "into your project and they take precedence over the global ones."
echo ""
echo "Done. Run ./sync.sh anytime to pull latest changes."

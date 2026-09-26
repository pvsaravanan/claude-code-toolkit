#!/bin/bash
set -euo pipefail
echo "Claude Code Toolkit - macOS uninstaller"
echo
read -r -p "Remove Claude Code and its local configuration? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || { echo "Cancelled."; exit 0; }
echo "[1/5] Removing known Claude Code installations..."
rm -f "$HOME/.local/bin/claude"
rm -rf "$HOME/.local/share/claude"
if command -v brew >/dev/null 2>&1; then
  brew uninstall --cask claude-code 2>/dev/null || true
  brew uninstall claude-code 2>/dev/null || true
fi
if command -v npm >/dev/null 2>&1; then npm uninstall -g @anthropic-ai/claude-code 2>/dev/null || true; fi
echo "[2/5] Removing Claude Code configuration..."
rm -rf "$HOME/.claude"
rm -f "$HOME/.claude.json" "$HOME/.claude.json.backup"
echo "[3/5] Removing known caches..."
rm -rf "$HOME/Library/Caches/Claude Code" "$HOME/Library/Caches/ClaudeCode" "$HOME/Library/Caches/com.anthropic.claude" "$HOME/Library/Application Support/Claude Code" "$HOME/Library/Application Support/ClaudeCode" "$HOME/Library/Logs/Claude Code" "$HOME/Library/Logs/ClaudeCode"
echo "[4/5] Shell configuration is not automatically modified."
echo "[5/5] Verifying..."
hash -r 2>/dev/null || true
if command -v claude >/dev/null 2>&1; then
  echo "Claude Code is still available at: $(command -v claude)"
else
  echo "Claude Code CLI: not found."
fi
echo "Uninstall completed."

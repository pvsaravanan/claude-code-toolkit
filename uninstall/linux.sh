#!/bin/bash
set -euo pipefail

echo "======================================"
echo " Claude Code Toolkit - Linux Uninstaller"
echo "======================================"
echo

read -r -p "Remove Claude Code and its local data? [y/N] " answer

if [[ ! "$answer" =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

echo
echo "[1/4] Removing Claude Code installation..."

rm -f "$HOME/.local/bin/claude"
rm -rf "$HOME/.local/share/claude"

if command -v npm >/dev/null 2>&1; then
    npm uninstall -g @anthropic-ai/claude-code 2>/dev/null || true
fi

if command -v brew >/dev/null 2>&1; then
    brew uninstall claude-code 2>/dev/null || true
    brew uninstall --cask claude-code 2>/dev/null || true
fi

echo "[2/4] Removing Claude Code configuration..."

rm -rf "$HOME/.claude"
rm -f "$HOME/.claude.json"
rm -f "$HOME/.claude.json.backup"

echo "[3/4] Removing known caches..."

rm -rf     "$HOME/.cache/claude"     "$HOME/.cache/Claude"     "$HOME/.config/Claude Code"     "$HOME/.config/ClaudeCode"     "$HOME/.local/share/Claude Code"     "$HOME/.local/share/ClaudeCode"

echo "[4/4] Verifying installation..."

hash -r 2>/dev/null || true

echo

if command -v claude >/dev/null 2>&1; then
    echo "WARNING: Claude Code is still available at:"
    echo
    echo "  $(command -v claude)"
    echo
    echo "Inspect that installation before removing anything else."
else
    echo "Claude Code CLI: NOT FOUND"
fi

echo
echo "======================================"
echo " Claude Code removal completed."
echo "======================================"
echo
echo "Shell configuration was not modified automatically."

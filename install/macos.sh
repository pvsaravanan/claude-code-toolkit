#!/bin/bash
set -euo pipefail
echo "Claude Code Toolkit - macOS installer"
echo
if ! command -v curl >/dev/null 2>&1; then echo "Error: curl is required."; exit 1; fi
if command -v claude >/dev/null 2>&1; then
  echo "Claude Code is already installed at: $(command -v claude)"
  claude --version 2>/dev/null || true
  read -r -p "Reinstall/update using Anthropic's official installer? [y/N] " answer
  [[ "$answer" =~ ^[Yy]$ ]] || exit 0
fi
echo "Running Anthropic's official Claude Code installer..."
curl -fsSL https://claude.ai/install.sh | bash
hash -r 2>/dev/null || true
echo
if command -v claude >/dev/null 2>&1; then
  echo "Claude Code installed successfully."
  claude --version 2>/dev/null || true
  echo "Run 'claude' to start."
else
  echo "Installer completed, but 'claude' is not in the current PATH."
  echo "Restart Terminal and run: claude --version"
fi

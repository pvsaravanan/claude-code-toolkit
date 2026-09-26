#!/bin/bash
set -euo pipefail
echo "Claude Code Toolkit - macOS updater"
echo
if ! command -v claude >/dev/null 2>&1; then
  echo "Error: Claude Code is not installed or not in PATH."
  echo "Run the installer first: ./install/macos.sh"
  exit 1
fi
echo "Current version:"
claude --version 2>/dev/null || true
echo
echo "Updating Claude Code..."
claude update
hash -r 2>/dev/null || true
echo
echo "Update completed."
claude --version 2>/dev/null || true

#!/bin/bash
set -euo pipefail

echo "======================================"
echo " Claude Code Toolkit - Linux Updater"
echo "======================================"
echo

if ! command -v claude >/dev/null 2>&1; then
    echo "Error: Claude Code is not installed or not in PATH."
    echo
    echo "Run the installer first:"
    echo "  ./install/linux.sh"
    exit 1
fi

echo "Current version:"
claude --version 2>/dev/null || true
echo

echo "Updating Claude Code..."
echo

claude update

hash -r 2>/dev/null || true

echo
echo "======================================"
echo " Claude Code update completed."
echo "======================================"
echo
echo "Current version:"
claude --version 2>/dev/null || true

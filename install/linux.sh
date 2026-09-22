#!/bin/bash
set -euo pipefail

echo "======================================"
echo " Claude Code Toolkit - Linux Installer"
echo "======================================"
echo

if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is required."
    echo
    echo "Install it with your distribution's package manager:"
    echo "  Ubuntu/Debian: sudo apt install curl"
    echo "  Fedora:        sudo dnf install curl"
    echo "  Arch:          sudo pacman -S curl"
    exit 1
fi

if command -v claude >/dev/null 2>&1; then
    echo "Claude Code is already installed."
    echo "Location: $(command -v claude)"
    claude --version 2>/dev/null || true
    echo

    read -r -p "Reinstall/update Claude Code? [y/N] " answer

    if [[ ! "$answer" =~ ^[Yy]$ ]]; then
        echo "Cancelled."
        exit 0
    fi
fi

echo "Installing Claude Code using Anthropic's official installer..."
echo

curl -fsSL https://claude.ai/install.sh | bash

hash -r 2>/dev/null || true

echo
echo "======================================"

if command -v claude >/dev/null 2>&1; then
    echo " Claude Code installed successfully."
    echo "======================================"
    echo
    claude --version 2>/dev/null || true
    echo
    echo "Run the following command to start:"
    echo
    echo "  claude"
else
    echo " Installation completed."
    echo "======================================"
    echo
    echo "'claude' is not currently available in PATH."
    echo
    echo "Restart your terminal and run:"
    echo
    echo "  claude --version"
fi

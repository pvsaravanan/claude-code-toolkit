#!/bin/bash
set +e

echo "======================================"
echo " Claude Code Toolkit - Linux Doctor"
echo "======================================"
echo

echo "Operating System"
echo "----------------"

if [ -f /etc/os-release ]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    echo "Distribution: ${PRETTY_NAME:-Unknown}"
else
    echo "Distribution: Unknown"
fi

echo "Kernel:       $(uname -s)"
echo "Architecture: $(uname -m)"

echo
echo "Claude Code"
echo "-----------"

if command -v claude >/dev/null 2>&1; then
    echo "Location: $(command -v claude)"
    echo "Version:"
    claude --version 2>/dev/null || true
else
    echo "Status: NOT FOUND"
fi

echo
echo "Development Tools"
echo "------------------"

if command -v node >/dev/null 2>&1; then
    echo "Node.js: $(node --version)"
else
    echo "Node.js: NOT FOUND"
fi

if command -v npm >/dev/null 2>&1; then
    echo "npm:     $(npm --version)"
else
    echo "npm:     NOT FOUND"
fi

if command -v git >/dev/null 2>&1; then
    echo "Git:     $(git --version)"
else
    echo "Git:     NOT FOUND"
fi

if command -v curl >/dev/null 2>&1; then
    echo "curl:    $(curl --version | head -n 1)"
else
    echo "curl:    NOT FOUND"
fi

echo
echo "Claude Code Paths"
echo "-----------------"

paths=(
    "$HOME/.claude"
    "$HOME/.claude.json"
    "$HOME/.claude.json.backup"
    "$HOME/.local/bin/claude"
    "$HOME/.local/share/claude"
    "$HOME/.cache/claude"
    "$HOME/.config/Claude Code"
    "$HOME/.config/ClaudeCode"
)

for path in "${paths[@]}"; do
    if [ -e "$path" ]; then
        echo "FOUND:  $path"
    else
        echo "ABSENT: $path"
    fi
done

echo
echo "PATH"
echo "----"
echo "$PATH"

echo
echo "======================================"
echo " Diagnostics completed."
echo "======================================"

#!/bin/bash
set +e
echo "Claude Code Toolkit - macOS diagnostics"
echo "======================================="
echo
echo "OS:"
sw_vers 2>/dev/null || true
echo
echo "Claude:"
if command -v claude >/dev/null 2>&1; then echo "  $(command -v claude)"; claude --version 2>/dev/null || true; else echo "  not found"; fi
echo
echo "Node:"; node --version 2>/dev/null || echo "  not found"
echo "npm:"; npm --version 2>/dev/null || echo "  not found"
echo "Git:"; git --version 2>/dev/null || echo "  not found"
echo
echo "Claude-related paths:"
for path in "$HOME/.claude" "$HOME/.claude.json" "$HOME/.local/bin/claude" "$HOME/.local/share/claude"; do
  [ -e "$path" ] && echo "  FOUND  $path" || echo "  absent $path"
done

# Claude Code Toolkit - Windows installer
$ErrorActionPreference = "Stop"
Write-Host "Claude Code Toolkit - Windows installer"
Write-Host ""
$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) {
    Write-Host "Claude Code is already installed at: $($claude.Source)"
    try { claude --version } catch {}
    $answer = Read-Host "Reinstall/update using Anthropic's official installer? [y/N]"
    if ($answer -notmatch "^[Yy]$") { exit 0 }
}
Write-Host "Running Anthropic's official Claude Code installer..."
irm https://claude.ai/install.ps1 | iex
Write-Host ""
$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) {
    Write-Host "Claude Code installed successfully."
    try { claude --version } catch {}
    Write-Host "Run 'claude' to start."
} else {
    Write-Host "Installer completed, but 'claude' is not in the current PATH."
    Write-Host "Restart PowerShell and run: claude --version"
}

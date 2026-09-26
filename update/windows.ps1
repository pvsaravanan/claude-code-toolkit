# Claude Code Toolkit - Windows updater
$ErrorActionPreference = "Stop"
Write-Host "Claude Code Toolkit - Windows updater"
Write-Host ""
$claude = Get-Command claude -ErrorAction SilentlyContinue
if (-not $claude) {
    Write-Host "Error: Claude Code is not installed or not in PATH."
    Write-Host "Run the installer first: .\install\windows.ps1"
    exit 1
}
Write-Host "Current version:"
try { claude --version } catch {}
Write-Host ""
Write-Host "Updating Claude Code..."
claude update
if ($LASTEXITCODE -ne 0) {
    Write-Host "Claude Code update failed."
    exit $LASTEXITCODE
}
Write-Host ""
Write-Host "Update completed."
try { claude --version } catch {}

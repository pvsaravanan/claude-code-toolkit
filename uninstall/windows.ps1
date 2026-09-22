# Claude Code Toolkit - Windows uninstaller
$ErrorActionPreference = "SilentlyContinue"
Write-Host "Claude Code Toolkit - Windows uninstaller"
Write-Host ""
$answer = Read-Host "Remove Claude Code and its local configuration? [y/N]"
if ($answer -notmatch "^[Yy]$") { Write-Host "Cancelled."; exit 0 }
Write-Host "[1/5] Removing known installations..."
$paths = @("$env:USERPROFILE\.local\bin\claude.exe","$env:USERPROFILE\.local\bin\claude","$env:USERPROFILE\.local\share\claude")
foreach ($path in $paths) { Remove-Item -Path $path -Force -Recurse }
if (Get-Command npm -ErrorAction SilentlyContinue) { npm uninstall -g @anthropic-ai/claude-code 2>$null }
Write-Host "[2/5] Removing configuration..."
$paths = @("$env:USERPROFILE\.claude","$env:USERPROFILE\.claude.json","$env:USERPROFILE\.claude.json.backup")
foreach ($path in $paths) { Remove-Item -Path $path -Force -Recurse }
Write-Host "[3/5] Removing known caches..."
$paths = @("$env:LOCALAPPDATA\Claude Code","$env:LOCALAPPDATA\ClaudeCode","$env:APPDATA\Claude Code","$env:APPDATA\ClaudeCode")
foreach ($path in $paths) { Remove-Item -Path $path -Force -Recurse }
Write-Host "[4/5] PowerShell profile is not automatically modified."
Write-Host "[5/5] Verifying..."
$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) { Write-Host "Claude Code is still available at: $($claude.Source)" } else { Write-Host "Claude Code CLI: not found." }
Write-Host "Uninstall completed."

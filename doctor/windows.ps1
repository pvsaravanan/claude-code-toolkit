# Claude Code Toolkit - Windows diagnostics
Write-Host "Claude Code Toolkit - Windows diagnostics"
Write-Host "========================================="
Write-Host ""
$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) { Write-Host "Claude: $($claude.Source)"; try { claude --version } catch {} } else { Write-Host "Claude: not found" }
Write-Host ""
try { Write-Host "Node: $(node --version)" } catch { Write-Host "Node: not found" }
try { Write-Host "npm: $(npm --version)" } catch { Write-Host "npm: not found" }
try { Write-Host "Git: $(git --version)" } catch { Write-Host "Git: not found" }
Write-Host ""
$paths = @("$env:USERPROFILE\.claude","$env:USERPROFILE\.claude.json","$env:USERPROFILE\.local\bin\claude.exe","$env:USERPROFILE\.local\share\claude")
foreach ($path in $paths) { if (Test-Path $path) { Write-Host "FOUND  $path" } else { Write-Host "absent $path" } }

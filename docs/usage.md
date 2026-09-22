# Usage

Run scripts from the repository root.

## macOS

```bash
chmod +x install/macos.sh uninstall/macos.sh doctor/macos.sh
./install/macos.sh
./uninstall/macos.sh
./doctor/macos.sh
```

## Windows

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install\windows.ps1
.\uninstall\windows.ps1
.\doctor\windows.ps1
```

The uninstall scripts intentionally do not rewrite shell or PowerShell profiles automatically.

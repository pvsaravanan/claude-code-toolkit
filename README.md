# Claude Code Toolkit

Cross-platform scripts for installing, uninstalling, and diagnosing [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

> Independent community utility. Not affiliated with or endorsed by Anthropic.

## Features

- Install Claude Code
- Remove common Claude Code installations and local configuration
- Diagnose PATH and environment issues
- Simple, inspectable platform-specific scripts
- GitHub Actions validation for shell and PowerShell scripts

## Supported platforms

| Platform | Install | Uninstall | Doctor |
| --- | --- | --- | --- |
| macOS | Yes | Yes | Yes |
| Windows | Yes | Yes | Yes |

---

# Setup

You need to **download or clone this repository first**. The scripts are files inside this repository, so commands such as `./install/macos.sh` will only work after you have the repository on your computer.

## Option 1: Clone with Git

If Git is installed:

```bash
git clone https://github.com/YOUR_USERNAME/claude-code-toolkit.git
cd claude-code-toolkit
```

Replace `YOUR_USERNAME` with the GitHub username that owns the repository.

## Option 2: Download ZIP

1. Open the GitHub repository.
2. Click **Code**.
3. Click **Download ZIP**.
4. Extract the ZIP.
5. Open Terminal or PowerShell.
6. Change directory into the extracted `claude-code-toolkit` folder.

For example on macOS:

```bash
cd ~/Downloads/claude-code-toolkit
```

On Windows PowerShell:

```powershell
cd "$HOME\Downloads\claude-code-toolkit"
```

You should be in the repository root before running any of the commands below.

You can verify this with:

```bash
ls
```

or PowerShell:

```powershell
Get-ChildItem
```

You should see directories such as:

```text
install
uninstall
doctor
README.md
LICENSE
```

---

# Install Claude Code

## macOS

From the repository root:

```bash
chmod +x install/macos.sh
./install/macos.sh
```

The script uses Anthropic's official installer endpoint.

After installation:

```bash
claude --version
```

Then start Claude Code:

```bash
claude
```

## Windows

Open **PowerShell** in the repository root.

If PowerShell blocks local scripts, allow scripts for the current PowerShell session only:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
```

Then run:

```powershell
.\install\windows.ps1
```

After installation:

```powershell
claude --version
```

Then:

```powershell
claude
```

If `claude` is not recognized immediately after installation, close and reopen PowerShell and run `claude --version` again.

---

# Uninstall Claude Code

## macOS

From the repository root:

```bash
chmod +x uninstall/macos.sh
./uninstall/macos.sh
```

The script asks for confirmation before removing files.

It targets known Claude Code installation, configuration, cache, and log locations. It does **not** automatically modify your shell profile.

## Windows

From PowerShell:

```powershell
.\uninstall\windows.ps1
```

The script asks for confirmation before removing files.

It targets known Claude Code installation, configuration, and cache locations. It does **not** automatically modify your PowerShell profile.

---

# Diagnose an Installation

If Claude Code is installed but `claude` is not working correctly, use the diagnostic scripts.

## macOS

```bash
chmod +x doctor/macos.sh
./doctor/macos.sh
```

## Windows

```powershell
.\doctor\windows.ps1
```

The diagnostic scripts report useful information such as:

- Claude Code location
- Claude Code version
- Node.js availability
- npm availability
- Git availability
- Common Claude Code paths

---

# Repository Structure

```text
claude-code-toolkit/
│
├── install/
│   ├── macos.sh
│   └── windows.ps1
│
├── uninstall/
│   ├── macos.sh
│   └── windows.ps1
│
├── doctor/
│   ├── macos.sh
│   └── windows.ps1
│
├── docs/
│   └── usage.md
│
├── .github/
│   └── workflows/
│       └── validate.yml
│
├── README.md
├── LICENSE
└── .gitignore
```

---

# Security

**Read the scripts before executing them.**

This project is designed to keep the scripts small and inspectable. The uninstallers target known Claude Code paths rather than performing broad filesystem deletion.

The installers use Anthropic's official installer endpoints. This project does not request, collect, or store your Claude credentials.

For security-sensitive environments, review and pin a specific repository commit instead of executing a script fetched directly from the internet.

---

# Development Setup

If you want to contribute to this repository, clone it:

```bash
git clone https://github.com/YOUR_USERNAME/claude-code-toolkit.git
cd claude-code-toolkit
```

No project dependencies are required for the shell scripts themselves.

For local validation on macOS/Linux, install [ShellCheck](https://www.shellcheck.net/) and run:

```bash
shellcheck install/macos.sh uninstall/macos.sh doctor/macos.sh
```

For PowerShell scripts, use PowerShell 7 or Windows PowerShell and verify that the scripts parse correctly.

GitHub Actions automatically validates the shell and PowerShell scripts on pushes and pull requests.

---

# Contributing

Pull requests are welcome.

Before submitting a change:

1. Keep scripts platform-specific.
2. Avoid destructive wildcard deletion.
3. Explain any new filesystem path before adding it to an uninstall script.
4. Test changes on the target operating system.
5. Update the README when behavior changes.

---

# License

MIT. See [LICENSE](LICENSE).

# Disclaimer

This project is provided as-is. Claude Code and Anthropic are trademarks of Anthropic. This repository is an independent community project.

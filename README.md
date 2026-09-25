# claude code toolkit

Simple scripts to install, uninstall, and diagnose Claude Code on **macOS, Linux, and Windows**.

## Quick Start

### 1. Get the repository

Clone it:

```bash
git clone https://github.com/pvsaravanan/claude-code-toolkit.git
cd claude-code-toolkit
```

Or download the repository as a ZIP and extract it.

### 2. Verify

```bash
claude --version
```

That's it.

---

## Install

### macOS

```bash
chmod +x install/macos.sh
./install/macos.sh
```

### Linux

```bash
chmod +x install/linux.sh
./install/linux.sh
```

### Windows

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install\windows.ps1
```

After installation:

```bash
claude
```

---

## Uninstall

### macOS

```bash
chmod +x uninstall/macos.sh
./uninstall/macos.sh
```

### Linux

```bash
chmod +x uninstall/linux.sh
./uninstall/linux.sh
```

### Windows

```powershell
.\uninstall\windows.ps1
```

The scripts ask for confirmation before removing Claude Code.

---

## Diagnose

If Claude Code isn't working as expected, run the diagnostic script for your OS.

### macOS

```bash
chmod +x doctor/macos.sh
./doctor/macos.sh
```

### Linux

```bash
chmod +x doctor/linux.sh
./doctor/linux.sh
```

### Windows

```powershell
.\doctor\windows.ps1
```

The diagnostic scripts check Claude Code, PATH, Node.js, npm, Git, and common installation paths.

---

## Supported Platforms

| Platform | Install | Uninstall | Diagnose |
| -------- | :-----: | :-------: | :------: |
| macOS    |    ✓    |     ✓     |     ✓    |
| Linux    |    ✓    |     ✓     |     ✓    |
| Windows  |    ✓    |     ✓     |     ✓    |

---

## Security

Review scripts before running them.

The uninstall scripts:

* Ask for confirmation
* Remove only known Claude Code locations
* Avoid broad filesystem deletion
* Don't automatically modify shell profiles

The installation scripts use Anthropic's official Claude Code installer.

---

## Contributing

Found a bug or have an improvement?

Open an issue or submit a pull request.

Please test changes on the affected operating system before submitting a pull request.

---

## License

MIT

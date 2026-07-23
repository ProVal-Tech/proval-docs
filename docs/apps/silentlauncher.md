---
id: 'b0b9f423-eee3-4148-b8a0-e99400c45698'
slug: /b0b9f423-eee3-4148-b8a0-e99400c45698
title: 'SilentLauncher'
title_meta: 'SilentLauncher'
keywords: ['silent-launcher', 'silent-script-launcher', 'ps1-launcher', 'cmd-launcher', 'script-launcher', 'scheduled-task', 'scheduled-task-script-launcher']
description: 'SilentLauncher is a lightweight command-line tool for Windows designed to execute PowerShell and Batch scripts completely invisibly.'
tags: ['deployment', 'windows', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-07-22
---

<br />
<div align="center">
  <a href="https://content.provaltech.com/docs/b0b9f423-eee3-4148-b8a0-e99400c45698">
    <img src="https://raw.githubusercontent.com/ProVal-Tech/proval-docs/refs/heads/main/static/img/docs/b0b9f423-eee3-4148-b8a0-e99400c45698/icon.webp" alt="Logo" width="200" height="200" />
  </a>

  <h3 align="center">SilentLauncher</h3>

  <p align="center">Execute PowerShell and CMD scripts silently from Task Scheduler without flashing a console window.</p>
</div>


## About

SilentLauncher is a lightweight command-line tool for Windows designed to execute PowerShell and Batch scripts completely invisibly.

When you run a script using Windows Task Scheduler, the system often flashes a black console window on the screen for a fraction of a second, even if you configure the task to run hidden. Traditionally, IT teams used a VBScript (`wscript.exe`) wrapper to hide this window. However, modern Antivirus and EDR solutions frequently block VBScript from launching PowerShell due to security heuristics, and Microsoft is actively deprecating VBScript.

SilentLauncher solves this problem. Built as a native Windows GUI application, it uses the Windows API `CREATE_NO_WINDOW` flag to launch your scripts. This guarantees zero window flashing and bypasses the security restrictions associated with legacy VBScript wrappers.

### Features

- 🚫 **Zero Window Flashing**: Compiled as a GUI subsystem app with native Windows API flags.
- 🛡️ **EDR/AV Friendly**: No VBScript, no PowerShell obfuscation, just a clean, signed binary.
- 🔄 **Accurate Exit Codes**: Passes the exact exit code of your script back to Task Scheduler or your RMM.
- 📝 **Built-in Logging**: Automatically logs execution details and rotates the log file at 2 MB.
- ⚡ **Zero Dependencies**: Compiles to a single native binary. No runtime required.

### Built With

- [Go](https://go.dev/) — the programming language used to build this lightweight, dependency-free utility.
- [golang.org/x/sys/windows](https://pkg.go.dev/golang.org/x/sys/windows) — for providing the native Windows API bindings (specifically `CREATE_NO_WINDOW`) that enable truly silent, flicker-free execution.
- [goversioninfo](https://github.com/josephspurrier/goversioninfo) — the tool used to embed version metadata and custom icons into the compiled Windows executable.

## Prerequisites

- Windows OS

## Usage

SilentLauncher is designed to be called from Task Scheduler, RMM scripts, or command-line automation. It accepts a `-script` parameter for the file path and automatically passes any remaining arguments directly to your target script.

### Arguments

| Name             | Example                        | Description                                                                                       |
| ---------------- | ------------------------------ | ------------------------------------------------------------------------------------------------- |
| `-script`        | `"C:\Scripts\MyScript.ps1"`    | The absolute path to the PowerShell (`.ps1`) or Batch (`.cmd` / `.bat`) script you want to execute. |
| `[arguments]`    | `-Config "C:\config.xml"`      | Any arguments provided after the script path are passed directly and safely to the target script. |

SilentLauncher automatically detects the file extension and uses the correct executor:

- For `.ps1` files: Uses `powershell.exe` with `-NoProfile`, `-NonInteractive`, `-ExecutionPolicy Bypass`, and `-WindowStyle Hidden`.
- For `.cmd` or `.bat` files: Uses `cmd.exe /c`.

### Examples

**1. Run a PowerShell script silently (no parameters):**

```console
SilentLauncher.exe -script "C:\ProgramData\Automation\Script.ps1"
```

**2. Run a PowerShell script with multiple parameter types (strings with spaces, booleans, integers):**

```console
SilentLauncher.exe -script "C:\ProgramData\Automation\Deploy.ps1" -TargetServer "Server-01" -Port 443 -Force
```

**3. Run a Batch/CMD script silently with installer switches:**

```console
SilentLauncher.exe -script "C:\ProgramData\Automation\Install.cmd" /quiet /norestart LOGFILE="C:\Logs\install.log"
```

**4. Run a script with complex, quoted arguments:**

```console
SilentLauncher.exe -script "C:\ProgramData\Automation\Notify.ps1" -Message "System update required. Please save your work." -Priority High
```

## Logging

Every run appends a line-by-line log of what happened to `SilentLauncher.log`. This file is created in the exact same directory as the `SilentLauncher.exe` executable.

The log records:

- Initialization and the current executing user.
- The exact arguments received by the launcher.
- The fully resolved execution command.
- The final exit code (success or failure).

The log file is strictly capped at **2 MB**. Once it exceeds this size, the launcher automatically truncates it to prevent unbounded disk growth.

## Running from Task Scheduler or an RMM

To use SilentLauncher in Windows Task Scheduler, configure a new task with the following action:

1. **Action:** Start a program
2. **Program/script:** `C:\Path\To\SilentLauncher.exe`
3. **Add arguments:** `-script "C:\Path\To\YourScript.ps1" -YourParam "Value"`

*(Optional but recommended)*: In the Task Scheduler "General" tab, ensure "Run whether user is logged on or not" is selected, and check "Run with highest privileges" if your script requires Administrator rights.

The executable will start, launch your script in the background without any UI, wait for it to finish, and then exit. The exit code returned to Task Scheduler will **exactly match** the exit code of your script, allowing your RMM or monitoring tools to accurately detect success or failure.

## Changelog

### 2026-07-22

- Initial version of the document

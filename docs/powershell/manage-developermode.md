---
id: '89c84696-8c47-4dbe-a134-0f25a5822ae2'
slug: /89c84696-8c47-4dbe-a134-0f25a5822ae2
title: 'Manage-DeveloperMode'
title_meta: 'Manage-DeveloperMode'
keywords: ['developer-mode', 'enable-developer-mode', 'disable-developer-mode', 'check-developer-mode', 'manage-developer-mode']
description: 'This script quickly enables, disables, or checks Windows Developer Mode on Windows 10 and 11.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Description

This script quickly enables, disables, or checks Windows Developer Mode on Windows 10 and 11.  
Developer Mode is needed to install apps from outside the Microsoft Store or to use features like Windows Subsystem for Linux (WSL).  
Instead of digging through Settings, you can manage Developer Mode with a single command—ideal for automation or when you're working remotely.

## Requirements

- **Windows 10 or 11** (the script will refuse to run on other versions).
- **Administrator rights** (run PowerShell as Administrator).
- **PowerShell 5.1 or later** (included with Windows 10/11).
- **Internet connection** (the script downloads a required helper module on first use; after that it works offline).

## Process

1. **Run the script** with the action you want: `Enable`, `Disable`, or `Check`.
2. **The script verifies your Windows version**, then applies the change immediately.  
   (A restart is not required, but some features may need one to fully activate.)
3. **Results are shown on screen** and saved to a log file. Errors go to a separate error file.

## Payload Usage

This script does not use a separate payload. To manage Developer Mode, run the script directly.

**Enable Developer Mode:**

```powershell
.\Manage-DeveloperMode.ps1 -Action Enable
```

**Disable Developer Mode:**

```powershell
.\Manage-DeveloperMode.ps1 -Action Disable
```

**Check current status:**

```powershell
.\Manage-DeveloperMode.ps1 -Action Check
```

Omitting `-Action` also checks the current status (the default is `Check`).

## Parameters

| Parameter | Alias | Required | Default | Type   | Description |
|-----------|-------|----------|---------|--------|-------------|
| `Action`  |       | False    | `Check` | String | What to do: `Enable`, `Disable`, or `Check`. |

## Output

Logs are saved in the same folder as the script.

  .\Manage-DeveloperMode-log.txt
  .\Manage-DeveloperMode-error.txt~

- **Log file**: Records what the script did and whether it succeeded.
- **Error file**: Captures any problems (e.g., wrong OS or registry issues).
- **On‑screen result**: The script returns `Enable`, `Disable`, or `Error` to the command line.

## Changelog

### 2026-06-15

- Initial version of the document

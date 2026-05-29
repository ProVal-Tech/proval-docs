---
id: '6216c670-4c59-403f-99a1-5ee439f015e9'
slug: /6216c670-4c59-403f-99a1-5ee439f015e9
title: 'Manage-CWRMMAgent'
title_meta: 'Manage-CWRMMAgent'
keywords: ['cw-rmm', 'cw-rmm-agent', 'cw-rmm-agent-install', 'cw-rmm-agent-check', 'cw-rmm-agent-uninstall', 'cw-rmm-agent-reinstall']
description: 'Checks status, installs, uninstalls, or reinstalls the ConnectWise RMM (CWRMM) Agent.'
tags: ['connectwise', 'application', 'installation', 'uninstallation', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-28
---

## Overview

Installs, uninstalls, reinstalls, or checks the status of the ConnectWise RMM (CWRMM) Agent on Windows machines. Run this script once from your RMM or directly as an administrator - it handles everything else automatically.

## Requirements

- Windows with PowerShell 5.0 or later
- Must be run as **Administrator**
- Internet access (to download the agent installer)

## What It Does

| Action | What happens |
|---|---|
| **Status** (default) | Checks whether the agent is installed and reports its service state |
| **Install** | Downloads and installs the agent using your site token |
| **Uninstall** | Removes the agent cleanly using the standard Windows uninstaller |
| **Reinstall** | Uninstalls the existing agent, then installs a fresh copy |

Adding **`-Force`** to Uninstall or Reinstall goes further - it also stops services, kills processes, deletes leftover folders, and removes registry keys. Use this when a standard uninstall fails or leaves behind remnants.

## Basic Usage

### Check if the agent is installed

```powershell
.\Manage-CWRMMAgent.ps1
```

or explicitly:

```powershell
.\Manage-CWRMMAgent.ps1 -Status
```

Returns the installation state, service name, service status, and startup type.

### Install the agent

```powershell
.\Manage-CWRMMAgent.ps1 -Install -SiteToken 'your-site-token-here'
```

Downloads the installer for the NA region and installs it silently. The agent registers itself using your site token.

Install for a different region:

```powershell
.\Manage-CWRMMAgent.ps1 -Install -SiteToken 'your-site-token-here' -Region 'EU'
```

Valid region values: `NA` (default), `AU`, `EU`

Force install even if the agent is already present:

```powershell
.\Manage-CWRMMAgent.ps1 -Install -SiteToken 'your-site-token-here' -Force
```

### Uninstall the agent

Standard uninstall:

```powershell
.\Manage-CWRMMAgent.ps1 -Uninstall
```

Forceful cleanup (use when the standard uninstall fails or leaves remnants):

```powershell
.\Manage-CWRMMAgent.ps1 -Uninstall -Force
```

Force mode additionally stops all related services, kills running processes, and removes leftover folders and registry keys.

### Reinstall the agent

Standard reinstall:

```powershell
.\Manage-CWRMMAgent.ps1 -Reinstall -SiteToken 'your-site-token-here'
```

Reinstall with full cleanup before installing fresh:

```powershell
.\Manage-CWRMMAgent.ps1 -Reinstall -SiteToken 'your-site-token-here' -Force
```

## Parameters

| Parameter | Required | Default | Description |
|---|---|---|---|
| `-Status` | No | - | Check if the agent is installed (this is the default if nothing is specified) |
| `-Install` | Yes (for install) | - | Install the agent |
| `-Uninstall` | Yes (for uninstall) | - | Uninstall the agent |
| `-Reinstall` | Yes (for reinstall) | - | Uninstall then reinstall the agent |
| `-SiteToken` | Yes (Install / Reinstall) | - | Your ConnectWise RMM site token |
| `-Region` | No | `NA` | Download region - `NA`, `AU`, or `EU` |
| `-Force` | No | Off | Forces install over an existing copy, or performs deep cleanup on uninstall/reinstall |
| `-WhatIf` | No | Off | Shows what would happen without making any changes |

## Preview Changes Without Making Them

Append `-WhatIf` to any command to see what the script would do - no changes are made:

```powershell
.\Manage-CWRMMAgent.ps1 -Install -SiteToken 'your-site-token-here' -WhatIf
```

## Log Files

The script writes two log files in the same folder it runs from:

```PlainText
Manage-CWRMMAgent-log.txt    ← General activity and results
Manage-CWRMMAgent-error.txt  ← Errors only
```

If an MSI installation fails, a detailed MSI log is also written to:

```PlainText
C:\ProgramData\_Automation\app\ITSPlatform\ITSPlatform-install.log
```

## Common Scenarios

**Agent not registering after install** - try a reinstall with `-Force` to ensure no old configuration is interfering:

```powershell
.\Manage-CWRMMAgent.ps1 -Reinstall -SiteToken 'your-site-token-here' -Force
```

**Uninstall keeps failing** - use `-Force` to bypass the MSI uninstaller and clean up manually:

```powershell
.\Manage-CWRMMAgent.ps1 -Uninstall -Force
```

**Already installed, need to install a different version** - use `-Force` with `-Install`:

```powershell
.\Manage-CWRMMAgent.ps1 -Install -SiteToken 'your-site-token-here' -Force
```

**Not sure if the agent is running** - check status first before taking any action:

```powershell
.\Manage-CWRMMAgent.ps1 -Status
```

## ChangeLog

### 2026-05-28

- Initial version of the document

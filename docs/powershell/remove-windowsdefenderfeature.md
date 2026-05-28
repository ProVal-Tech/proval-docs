---
id: '4fcf3a89-30a1-4c63-99a1-d4d8a706f95b'
slug: /4fcf3a89-30a1-4c63-99a1-d4d8a706f95b
title: 'Remove-WindowsDefenderFeature'
title_meta: 'Remove-WindowsDefenderFeature'
keywords: ['windows-defender', 'windows-server', 'feature-removal', 'security']
description: 'Documentation for the Remove-WindowsDefenderFeature command to uninstall Windows Defender features on Windows Server and restart the server.'
tags: ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-27
---

## Description

This script removes the installed Windows Defender feature on supported Windows Server systems, then restarts the server after a successful uninstall.

## Requirements
- PowerShell v5 or later
- Run in an elevated PowerShell session (Run as Administrator)
- Windows Server operating system
- `ServerManager` module available (`Get-WindowsFeature` command)
- Access to PowerShell Gallery to install or update required module dependencies

## Usage
1. Verifies the operating system is Windows Server.
2. Verifies the `ServerManager` module is available.
3. Checks whether `Windows-Defender-Features` or `Windows-Defender` is installed.
4. If Defender is installed, uninstalls the detected feature.
5. Restarts the server when uninstall completes successfully.

```powershell
.\Remove-WindowsDefenderFeature.ps1
```

Use this command to remove the installed Windows Defender feature from Windows Server and automatically reboot on success.

## Output
- Informational and error log entries through the logging framework used by the script
- Server restart when feature removal succeeds

## Changelog

### 2026-05-27

- Initial version of the document
---
id: '41a199c6-33c0-4c76-b882-ac7b9246a3cc'
slug: /41a199c6-33c0-4c76-b882-ac7b9246a3cc
title: 'Disable-PowershellVersion2'
title_meta: 'Disable-PowershellVersion2'
keywords: ['disable', 'powershell', 'version', 'update']
description: 'Documentation for the Disable-PowerShellVersion2 command to disable the Windows PowerShell v2 feature if a newer version is installed.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Description
This script will disable the Windows PowerShell v2 feature. If no newer version of PowerShell exists, the script will not disable PowerShell v2.

## Requirements
A version of PowerShell greater than v2 must be installed to disable PowerShell v2. This script will attempt to satisfy that requirement before disabling anything. The removal of the .NET 3.0 feature requires a reboot.

## Usage
1. If there is a PowerShell version installed greater than v2, then PowerShell v2 will be disabled.
2. If there are no PowerShell versions installed greater than v2:
    1. Install the latest approved Chocolatey version of PowerShell.
    2. Verify that the installation was successful; return an error if not.
    3. Disable PowerShell version 2.

```powershell
.\Disable-PowerShellVersion2.ps1
```
This command checks for a version of PowerShell greater than v2. If one is present, it disables the PowerShell v2 feature. If not, it attempts to install a newer PowerShell version so that v2 can be disabled.

## Output
- .\Disable-PowerShellVersion2-log.txt
- .\Disable-PowerShellVersion2-error.txt


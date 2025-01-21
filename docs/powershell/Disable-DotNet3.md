---
id: ps-disable-dotnet3
title: 'Disable-DotNet3'
title_meta: 'Disable-DotNet3'
keywords: ['disable', 'dotnet', 'update', 'windows']
description: 'Documentation for the Disable-DotNet3 command to disable the .NET 3.5 Windows feature after ensuring a newer version is installed.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Description

This script will disable the .NET 3.5 Windows feature. It will attempt to install a new version of .NET prior to disabling .NET 3.5. If no new version exists and the script is unable to install a new version, it will not disable .NET 3.5.

## Requirements

- PowerShell V5
- The removal of the .NET 3.0 feature requires a reboot.

## Usage

1. Determine if a new version of .NET exists (greater than or equal to .NET 4.0). If not, install it and verify the installation.
2. Disable the .NET 3.5 feature only if a new version is present.

```powershell
.\Disable-DotNet3.ps1
```

This command will ensure that a new version of .NET is installed and disable the old versions if a newer version is available.

## Output

- `.\Disable-DotNet3-log.txt`
- `.\Disable-DotNet3-error.txt`




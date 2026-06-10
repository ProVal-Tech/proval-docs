---
id: '3e5e318a-85f8-408f-81fb-509c5afe18c9'
slug: /3e5e318a-85f8-408f-81fb-509c5afe18c9
title: 'Disable-Defender'
title_meta: 'Disable-Defender'
keywords: ['Windows Defender', 'SentinelOne', 'antivirus', 'real-time protection']
description: 'Disables Windows Defender real-time protection when a supported third-party antivirus service is detected.'
tags: ['security']
draft: false
unlisted: false
last_update:
  date: 2026-06-10
---

## Description

Disables Windows Defender real-time protection only when a supported third-party antivirus service is detected. If no supported service is found, or Defender real-time protection is already disabled, the script exits without making changes.

# Requirements

- PowerShell 5.0 or later
- Run as Administrator
- Access to PowerShell Gallery to install or update the `Strapper` module
- Windows Defender cmdlets available (`Get-MpComputerStatus`, `Set-MpPreference`)

# Process

1. Sets TLS policy for secure module and web requests.
2. Ensures the `Strapper` module is installed and up to date, then initializes the Strapper environment.
3. Checks each value passed to `-SupportedAVServices` and looks for a matching Windows service.
4. If no supported AV service is found, logs the result and exits.
5. Reads current Defender real-time protection status.
6. If Defender real-time protection is already disabled, logs the result and exits.
7. Uses ShouldProcess support to safely apply Defender changes.
8. Disables Defender real-time protection and logs success or error details.

# Payload Usage

This script is executed directly and does not use a separate payload file. The `SupportedAVServices` parameter is required.

Checks for `SentinelAgent` service and disables Defender if it is running and Defender is enabled.

```powershell
.\Disable-Defender.ps1 -SupportedAVServices 'SentinelAgent'
```

Checks for both `SentinelAgent` and `AnotherAVService` services and disables Defender if either is running and Defender is enabled.

```powershell
.\Disable-Defender.ps1 -SupportedAVServices 'SentinelAgent','AnotherAVService'
```

Checks for a non-existent AV service. Defender will not be disabled.

```powershell
.\Disable-Defender.ps1 -SupportedAVServices 'NonExistentAV'
```

Simulates the process of checking for SentinelAgent and disabling Defender without making any changes.

```powershell
.\Disable-Defender.ps1 -SupportedAVServices 'SentinelAgent' -WhatIf
```

# Parameters

| Parameter             | Alias | Required | Default | Type     | Description                                                              |
| --------------------- | ----- | -------- | ------- | -------- | ------------------------------------------------------------------------ |
| `SupportedAVServices` |       | True     |         | String[] | One or more antivirus service names to detect before disabling Defender. |
| `WhatIf`              |       | False    | False   | Switch   | Simulates execution and shows what actions would be taken.               |

# Output

Location of output for log and error files.

    .\Disable-Defender-log.txt
    .\Disable-Defender-error.txt


## Changelog

### 2026-06-10

- Initial version of the document

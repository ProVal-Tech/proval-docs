---
id: 'c64c47e7-8da3-46c6-9765-29da85addc2f'
slug: /c64c47e7-8da3-46c6-9765-29da85addc2f
title: 'Remove-SentinelOne'
title_meta: 'Remove-SentinelOne'
keywords: ['remove', 'sentinelone', 'uninstall', 'security']
description: 'Documentation for the Remove-SentinelOne command to uninstall the SentinelOne agent from a Windows system.'
tags: ['security', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Overview

This script is designed to uninstall the SentinelOne agent from a Windows system. If Anti-Tamper is enabled, a passphrase must be provided.

## Requirements

- PowerShell v5 or higher
- Administrative privileges are required for execution

## Process

1. **Environment Setup**:
   - Configures PowerShell preferences to suppress progress output.
   - Ensures secure communication protocols are enabled.
   - Bootstraps the NuGet package provider and sets the PowerShell Gallery repository as trusted.
   - Installs or updates the `Strapper` module and sets up the environment.

2. **Locate SentinelOne Agent**:
   - Dynamically searches for the SentinelOne agent installation directory under `C:\Program Files\SentinelOne\`.
   - Selects the most recently created directory matching the name "Sentinel Agent."

3. **Verify Uninstall File**:
   - Checks if the `uninstall.exe` file exists in the SentinelOne agent directory.
   - Logs an error and exits if the file is not found.

4. **Construct Uninstall Command**:
   - Builds the uninstall command with default arguments for silent and non-restarting uninstallation.
   - If a passphrase is provided, it is included in the uninstall command.
   - If no passphrase is provided, the script assumes Anti-Tamper protection is disabled and proceeds without it.

5. **Execute Uninstallation**:
   - Runs the `uninstall.exe` file with the constructed arguments.
   - Waits for the uninstallation process to complete.

6. **Post-Uninstallation Verification**:
   - Checks if the SentinelOne agent directory or `uninstall.exe` file still exists after the uninstallation process.
   - Logs success if the agent is successfully removed.
   - Logs an error if the directory or file still exists.

7. **Error Handling**:
   - Catches and logs any exceptions that occur during the process.

## Payload Usage

Uninstalls the SentinelOne agent using the provided passphrase. This is required if Anti-Tamper protection is enabled.

```PowerShell
.\Remove-SentinelOne.ps1 -PassPhrase "YourPassphraseHere"
```

Attempts to uninstall the SentinelOne agent without a passphrase. This assumes that Anti-Tamper protection is disabled. If Anti-Tamper protection is enabled, the uninstallation will fail.

```PowerShell
.\Remove-SentinelOne.ps1
```

## Parameters

| Parameter         | Alias | Required  | Default   | Type      | Description                                   |
| ----------------- | ----- | --------- | --------- | --------- | --------------------------------------------- |
| `-PassPhrase`     |       | False     |           | String    | Passphrase for disabling anti-tampering       |

## Output

- .\Remove-SentinelOne-log.txt  
- .\Remove-SentinelOne-error.txt

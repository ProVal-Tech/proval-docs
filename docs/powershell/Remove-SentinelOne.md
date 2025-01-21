---
id: ps-remove-sentinelone
title: 'Remove-SentinelOne'
title_meta: 'Remove-SentinelOne Command'
keywords: ['remove', 'sentinelone', 'uninstall', 'security']
description: 'Documentation for the Remove-SentinelOne command to uninstall the SentinelOne agent from a Windows system.'
tags: ['security', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Description
This script is designed to uninstall the SentinelOne agent from a Windows system. If Anti-Tamper is enabled, a passphrase must be provided.

## Requirements
- PowerShell v5 or higher
- Administrative privileges are required for execution

## Usage
- The script starts by setting up the necessary parameters, including the optional passphrase.
- It detects the currently installed version of the SentinelOne agent on the system.
- The script proceeds to attempt the uninstallation of the SentinelOne agent.
- If Anti-Tamper is enabled and a passphrase is required, it uses the provided passphrase.
- The script completes the uninstallation process, ensuring all necessary steps are taken to remove the agent securely.

Run the script without a passphrase:

```powershell
.\Remove-SentinelOne.ps1
```

Run the script with a passphrase:

```powershell
.\Remove-SentinelOne.ps1 -PassPhrase 'your_passphrase'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type   | Description                                   |
| ----------------- | ----- | --------- | --------- | ------ | --------------------------------------------- |
| `-PassPhrase`     |       | False     |           | String | Passphrase for disabling anti-tampering       |

## Output
Location of output for log and error files:

```
.\Remove-SentinelOne-log.txt
.\Remove-SentinelOne-error.txt
```


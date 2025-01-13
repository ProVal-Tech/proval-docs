---
id: 'ps-uninstall-sentinelone-agent'
title: 'Uninstalling the SentinelOne Agent from Windows'
title_meta: 'Uninstalling the SentinelOne Agent from Windows'
keywords: ['uninstall', 'sentinelone', 'agent', 'windows', 'security']
description: 'This document provides a comprehensive guide on how to uninstall the SentinelOne agent from a Windows system, including requirements, process steps, and usage examples. It also addresses the need for a passphrase if Anti-Tamper is enabled during the uninstallation.'
tags: ['windows', 'security', 'uninstallation']
draft: true
unlisted: true
---
# Overview
This script is designed to uninstall the SentinelOne agent from a Windows system. If Anti-Tamper is enabled, a passphrase must be provided.

# Requirements
- PowerShell v5 or higher
- Administrative privileges are required for execution

# Process
1. The script starts by setting up the necessary parameters, including the optional passphrase.
2. Detects the currently installed version of the SentinelOne agent on the system.
3. Proceeds to attempt the uninstallation of the SentinelOne agent.
4. If Anti-Tamper is enabled and a passphrase is required, it uses the provided passphrase.
5. The script completes the uninstallation process, ensuring all necessary steps are taken to remove the agent securely.

# Payload Usage
Run the script without a passphrase:
```
./Remove-SentinelOne.ps1
```
Run the script with a passphrase:
```
./Remove-SentinelOne.ps1 -PassPhrase 'your_passphrase'
```

# Parameters

| Parameter      | Alias | Required | Default | Type   | Description                            |
|----------------|-------|----------|---------|--------|----------------------------------------|
| `-PassPhrase`  |       | False    |         | String | Passphrase for disabling anti-tampering |

# Output
Location of output for log, result, and error files.
```
./Remove-SentinelOne-log.txt
./Remove-SentinelOne-error.txt
```





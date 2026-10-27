---
id: 'e0acd656-10bc-48d6-9182-41d1ff78007a'
slug: /e0acd656-10bc-48d6-9182-41d1ff78007a
title: 'New-DJoinFile'
title_meta: 'New-DJoinFile'
keywords: keywords: ['djoin', 'offline', 'domain', 'join']
description: 'Documentation for the New-DJoinFile script to generate an offline domain join provisioning file on a domain controller.'
tags: ['active-directory', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Description

This script creates a provisioning file to accomplish an offline domain join. It automatically creates the required working directory if it does not already exist and verifies that the generated provisioning file is present.

## Requirements

- The script must run on a machine with the AD-Domain-Services Windows feature installed.
- The script requires appropriate permissions to create the working directory and generate the offline domain join provisioning file.
- The script uses the Strapper module for logging and environment configuration.

## Usage

1. Define the working directory as `%ProgramData%\_Automation\Script\New-DJoinFile`.
2. Check whether the working directory exists. If it does not, create it. If directory creation fails, throw an error.
3. Configure TLS settings and initialize the Strapper module.
4. Check whether the AD-Domain-Services Windows feature is installed. If not, log an error and exit.
5. Obtain the domain controller's domain name.
6. Run the `djoin.exe` command using the domain name and target computer name to generate the offline domain join provisioning file.
7. Verify whether the expected file exists. If it is missing, log an error; otherwise, log a success message.
8. Return the results of the `djoin.exe` command.

```powershell
.\New-DJoinFile.ps1 -TargetName Dev-Win10-2
```

This creates a file named `Dev-Win10-2-OfflineJoin.txt` in the following directory:

`%ProgramData%\_Automation\Script\New-DJoinFile`

## Parameters

| Parameter | Alias | Required | Default | Type | Description |
|---|---|---|---|---|---|
| `TargetName` | | True | | String | The name of the target computer for which the offline domain join provisioning file will be generated. |

## Output

**Working Directory:**

`%ProgramData%\_Automation\Script\New-DJoinFile`

**Generated File:**

`<TargetName>-OfflineJoin.txt`

**Logs:**

- `New-DJoinFile-Log.txt`
- `New-DJoinFile-Error.txt`

**Console:**

- `djoin.exe` command results.

## Changelog

### 2026-10-27

- Added automatic working directory creation and error handling for directory creation failures.
- Updated documentation to reflect the configured output path.

### 2025-04-10

- Initial version of the document.

---
id: 'bc22877d-262a-47f7-8d2f-7e69f07c92e5'
slug: /bc22877d-262a-47f7-8d2f-7e69f07c92e5
title: 'Bitlocker - Key Retrieval'
title_meta: 'Bitlocker - Key Retrieval'
keywords: ['audit', 'recovery', 'keys', 'encrypted', 'drives', 'database']
description: 'This document details a script that audits the recovery keys for each encrypted drive on an agent and adds the information to a custom table, saving time and improving efficiency in managing BitLocker encryption.'
tags: ['database', 'encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script audits the recovery keys for each encrypted drive on an agent and adds them to a custom table.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Bitlocker---Key-Retrieval/image_1.png)

## Dependencies

- @plugin_proval_bitlocker (Table)
- @BitLocker Enabled (Role)
- @BitLocker TPM Enabled (Role)
- [BitLocker TPM Ready](/docs/e5234598-aaa5-412c-8425-f9d1c95c00b5)
- [Windows - BitLocker Eligibility](/docs/adcd54bb-9909-42c5-8da9-913718f2650f)

## Variables

- `@PowerShellResult@` -> This variable shows whether BitLocker is enabled, retrieves the keys, and returns the corresponding information if it cannot be enabled.
- `@sqlletter@` -> SQL dataset cycling that returns the drive letter checked.

## Process

1. Creates the required table if it does not already exist in the database.
2. Adds the required role definitions for the dataview.
3. Queries the target machine(s) and runs PowerShell to return the BitLocker key or the BitLocker status.
4. Writes the key back into the Automate database if it is found to be encrypted.

## Output

- Script log
- Role
- Dataview



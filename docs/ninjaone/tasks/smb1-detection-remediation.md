---
id: 'fe70a434-7acc-4f2e-8f03-68c49ba7e7aa'
slug: /fe70a434-7acc-4f2e-8f03-68c49ba7e7aa
title: 'SMB1 Detection/Remediation'
title_meta: 'SMB1 Detection/Remediation'
keywords: ['smbv1', 'remediation', 'detection', 'vulnerability']
description: 'Executes the `SMBv1 Status Audit/Autofix` automation on Windows machines where vulnerability Action is selected'
tags: ['logging', 'report', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Summary

Executes the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) daily on Windows machines where vulnerability Action is selected through [Custom Field - cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1).

## Dependencies

- [Group- cPVAL SMBv1 Status Audit](/docs/6247ac5b-7c02-4b01-ae73-32708eb3fded)
- [Custom Field - cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1) 
- [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) 
- [Solution - SMBv1 Status Audit/Autofix](/docs/d4508b91-c43e-41ca-bc94-28a4a22508d8) 

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| SMB1 Detection/Remediation | Executes the `SMBv1 Status Audit/Autofix` automation on Windows machines. | `True` | Daily | `1 Day` | `11:00 AM` | `Never` |[Group- cPVAL SMBv1 Status Audit](/docs/6247ac5b-7c02-4b01-ae73-32708eb3fded)  | |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/smb1-detection-remediation.toml)

## Changelog

### 2026-10-07

- Initial version of the document
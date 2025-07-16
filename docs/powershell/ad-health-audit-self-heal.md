---
id: '7b0266ce-2059-461e-9788-ac1b48343a7c'
slug: /7b0266ce-2059-461e-9788-ac1b48343a7c
title: 'AD Health Audit - Self Heal'
title_meta: 'AD Health Audit - Self Heal'
keywords: ['AD', 'Active Directory', 'Health', 'Self-Heal', 'Restart']
description: 'This agnostic powershell script is designed to perform the AD Audit with an optional self heal parameter and also provide option to restart the AD services or any specific services if required'
tags: ['active-directory']
draft: False
unlisted: false
---

## Description
This agnostic powershell script is designed to performs an Active Directory (AD) health audit on a Domain Controller (DC). It checks for common AD issues using tools like dcdiag and repadmin, scans event logs for errors, and optionally performs self-healing actions and restarts critical AD-related services.

## Requirements
PowerShell 5.0 +
AD Domain Controller

## Usage
Domain Controller Check: Ensures the script runs only on a DC.
Logging: Creates a timestamped log file in C:\ProgramData\_Automation\Script\ADHealthServices.
Health Checks:
dcdiag /v
repadmin /replsummary
repadmin /showrepl
Event logs: DNS Server and Directory Service
Self-Healing (optional):
Forces AD replication
Flushes and registers DNS
Re-registers DC in DNS
Service Restart (optional):
Restarts services like NTDS, DNS, kdc, Netlogon, W32Time
Can restart all or specific services

```powershell
.\ADHealthAudit_SelfHeal.ps1
.\ADHealthAudit_SelfHeal.ps1 -SelfHeal
.\ADHealthAudit_SelfHeal.ps1 -ServicesToRestart 'Netlogon','W32Time'
.\ADHealthAudit_SelfHeal.ps1 -RestartAllADServices
.\ADHealthAudit_SelfHeal.ps1 -SelfHeal -RestartAllADServices
.\ADHealthAudit_SelfHeal.ps1 -SelfHeal -ServicesToRestart 'DNS','Netlogon'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `SelfHeal`      | `a`   | False      |           | Switch    |        If specified, performs self-healing actions when issues are detected.                                   |
| `ServicesToRestart`      | `b`   | False      |           | String       |     Optional list of specific services to restart.                                      |
| `RestartAllADServices`      | `c`   | False     |    | Switch    |       If specified, restarts all core AD-related services.                                    |

## Output
- Script Log
- Log file: C:\ProgramData\_Automation\Script\ADHealthServices.
---
id: ps-get-vsaauditreports
title: 'Get-VSAAuditReports'
title_meta: 'Get-VSAAuditReports Command'
keywords: ['kaseya', 'audit', 'report', 'excel']
description: 'Documentation for the Get-VSAAuditReports command to perform a Kaseya Onboarding Audit and output results to an Excel spreadsheet.'
tags: ['report', 'software']
draft: false
unlisted: false
---

## Description
Performs much of the Kaseya Onboarding Audit and outputs to an Excel spreadsheet in the script directory.

## Requirements
- Requires an API User account with both REST and Data Warehouse access configured in the VSA.
- On-Prem Audit requires IP whitelisting to access. In lieu of whitelisting, the script can be run on the VSA server.
- The REST API requires a native VSA user. If 'UserName must be an email address' is enabled in `System > Configuration > Default Settings`, this must be temporarily disabled during API account creation.

## Usage
Uses VSAAPI to perform the following REST API requests and saves the results in CSV format in the 'CSVs' subfolder if data was returned:
- `System\Users`
- `System\Roles`
- `System\Scopes`
- `Automation\AgentProcs`
- `Assetmgmt\Agents`

Uses VSAAPI to perform the following Data Warehouse API requests and saves the results in CSV format in the 'CSVs' subfolder if data was returned:
- `DiscoveryActiveDirectoryDomainSummary`
- `DiscoveryLanWatchNetworks`
- `LanCacheAssignments`
- `PatchPolicyMembers`
- `Patches`
- `PatchConfigurations`
- `SoftwareManagementAlertProfiles`
- `SoftwareManagementByAgentStats`
- `SoftwareManagementDeploymentProfiles`
- `MonitorEventSetAgentAssignments`
- `MonitorSetAgentAssignments`
- `MonitorSNMPSetAgentAssignments`

Uses the ImportExcel module to write data to individual worksheets in an Excel spreadsheet named `AuditResults.xlsx`. Automatically creates the following pivot tables according to auditing best practices, if data for the category was returned by the API:
- Windows Build Versions
- Patch Management Policies
- Patch Reboot Actions
- Patch AutoUpdate Configurations
- Patch Statuses
- Missing Approved Patches
- SM Analysis Profiles
- SM Assigned Deploy Profiles
- SM Compliance
- SM Missing Patches
- Counter Monitors
- Event Monitors
- SNMP Monitors

Requires all parameters. The API account must be configured in VSA prior to running, and REST API / Data Warehouse scopes must be provided. The Data Warehouse token must also be gathered.

```powershell
./Get-VSAAuditReports.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-1234-efgh-5678 -DataWarehouseApiToken abcd-1234-efgh-5678
```

## Parameters
| Parameter               | Required | Type   | Description              |
| ----------------------- | -------- | ------ | ------------------------ |
| `Server`                | True     | String | VSA Base URL             |
| `APIUser`               | True     | String | API User Name            |
| `RestApiToken`          | True     | String | REST API Token           |
| `DataWarehouseApiToken` | True     | String | Data Warehouse API Token |

## Output
Location of output for log, result, and error files:

- `.\Get-VSAAuditReports-log.txt`
- `.\Get-VSAAuditReports-error.txt`
- `$env:ProgramData\_automation\Audit\AuditResults.xlsx`
- `$env:ProgramData\_automation\Audit\CSVs\AgentProcedures.csv`
- `$env:ProgramData\_automation\Audit\CSVs\Agents.csv`
- `$env:ProgramData\_automation\Audit\CSVs\discoveryDomainList.csv`
- `$env:ProgramData\_automation\Audit\CSVs\discoveryLanWatchNetworks.csv`
- `$env:ProgramData\_automation\Audit\CSVs\LanCacheAssignments.csv`
- `$env:ProgramData\_automation\Audit\CSVs\MachineGroups.csv`
- `$env:ProgramData\_automation\Audit\CSVs\MonitorEventSetAgentAssignments.csv`
- `$env:ProgramData\_automation\Audit\CSVs\MonitorSetAgentAssignments.csv`
- `$env:ProgramData\_automation\Audit\CSVs\MonitorSNMPSetAgentAssignments.csv`
- `$env:ProgramData\_automation\Audit\CSVs\PatchConfigurations.csv`
- `$env:ProgramData\_automation\Audit\CSVs\Patches.csv`
- `$env:ProgramData\_automation\Audit\CSVs\PatchPolicyMembers.csv`
- `$env:ProgramData\_automation\Audit\CSVs\Roles.csv`
- `$env:ProgramData\_automation\Audit\CSVs\Scopes.csv`
- `$env:ProgramData\_automation\Audit\CSVs\SoftwareManagementAlertProfiles.csv`
- `$env:ProgramData\_automation\Audit\CSVs\SoftwareManagementByAgentStats.csv`
- `$env:ProgramData\_automation\Audit\CSVs\SoftwareManagementDeploymentProfiles.csv`
- `$env:ProgramData\_automation\Audit\CSVs\Users.csv`


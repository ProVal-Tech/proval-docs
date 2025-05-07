---
id: '11a27ba4-705e-4bdc-8d09-a166c92d0553'
slug: /11a27ba4-705e-4bdc-8d09-a166c92d0553
title: 'Get-VsaAuditReports'
title_meta: 'Get-VsaAuditReports'
keywords: ['kaseya', 'audit', 'vsa', 'api', 'excel', 'reporting']
description: 'This document provides an overview of the Kaseya Onboarding Audit script, which performs an extensive audit of Kaseya VSA configurations and outputs the results to an Excel spreadsheet. It details the requirements, process, parameters, and output locations for the audit results, ensuring users can effectively utilize the script for auditing purposes.'
tags: ['kaseya', 'report', 'security', 'software']
draft: false
unlisted: false
---

# Overview

This script performs much of the Kaseya Onboarding Audit and outputs the results to an Excel spreadsheet in the script directory.

# Requirements

- Requires an API User account with both REST and Data Warehouse access configured in the VSA.
- On-Prem Audit requires IP whitelisting to access. In lieu of whitelisting, the script can be run on the client's VSA server via the Agent Procedure "Shared/ProVal Content Repository/Vsa/Onboarding Audit." Implementation instructions for this procedure are located at [ProVal Documentation](/docs/9c83a72d-2971-411f-84a9-d0211ffc6a4c).
- The REST API requires a native VSA user. If "UserName must be an email address" is enabled in System > Configuration > Default Settings, this must be temporarily disabled during API account creation.

# Process

The script uses VSAAPI to perform the following REST API requests and saves the results in CSV format in the 'CSVs' subfolder if data was returned:

- System/Users
- System/Roles
- System/Scopes
- Automation/AgentProcs
- Assetmgmt/Agents

Additionally, it uses VSAAPI to perform the following Data Warehouse API requests and saves the results in CSV format in the 'CSVs' subfolder if data was returned:

- DiscoveryActiveDirectoryDomainSummary
- DiscoveryLanWatchNetworks
- LanCacheAssignments
- PatchPolicyMembers
- Patches
- PatchConfigurations
- SoftwareManagementAlertProfiles
- SoftwareManagementByAgentStats
- SoftwareManagementDeploymentProfiles
- MonitorEventSetAgentAssignments
- MonitorSetAgentAssignments
- MonitorSNMPSetAgentAssignments

The script uses the ImportExcel module to write data to individual worksheets in an Excel spreadsheet named `AuditResults.xlsx`. It automatically creates the following pivot tables according to auditing best practices, if data for the category was returned by the API:

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

# Payload Usage

All parameters are required. The API account must be configured in VSA prior to running, and REST API/Data Warehouse scopes must be provided. The Data Warehouse token must also be gathered.

```powershell
./Get-VSAAuditReports.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-1234-efgh-5678 -DataWarehouseApiToken abcd-1234-efgh-5678
```

# Parameters

| Parameter                 | Required | Type   | Description                          |
|---------------------------|----------|--------|--------------------------------------|
| `BaseURL`                 | True     | String | VSA Base URL                        |
| `ClientName`              | True     | String | Client Name for Audit Directory     |
| `VsaApiUser`              | True     | String | API User Name                       |
| `RestApiToken`            | True     | String | REST API Token                      |
| `DataWarehouseApiToken`   | True     | String | Data Warehouse API Token            |

# Output

Location of output for log, result, and error files:

```
./Get-VSAAuditReports-log.txt
./Get-VSAAuditReports-error.txt
$env:ProgramData/_automation/StackContent/$ClientName/Audit/AuditResults.xlsx
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/AgentProcedures.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/Agents.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/discoveryDomainList.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/discoveryLanWatchNetworks.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/LanCacheAssignments.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/MachineGroups.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/MonitorEventSetAgentAssignments.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/MonitorSetAgentAssignments.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/MonitorSNMPSetAgentAssignments.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/PatchConfigurations.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/Patches.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/PatchPolicyMembers.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/Roles.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/Scopes.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/SoftwareManagementAlertProfiles.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/SoftwareManagementByAgentStats.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/SoftwareManagementDeploymentProfiles.csv
$env:ProgramData/_automation/StackContent/$ClientName/Audit/CSVs/Users.csv
```


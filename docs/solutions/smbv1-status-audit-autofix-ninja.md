---
id: 'd4508b91-c43e-41ca-bc94-28a4a22508d8'
slug: /d4508b91-c43e-41ca-bc94-28a4a22508d8
title: 'SMBv1 Status Audit/Autofix'
title_meta: 'SMBv1 Status Audit/Autofix'
keywords: ['smbv1', 'remediation', 'detection', 'vulnerability']
description: 'Detects SMBv1 configuration and usage, reports the vulnerability state, and optionally disables SMBv1 on Windows machines.'
tags: ['logging', 'report', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Purpose

This solution detects the current SMBv1 configuration and recent SMBv1 usage on supported Windows machines and provides an automated remediation option to disable SMBv1 when required.

The solution supports the following platforms:

* Windows Workstations
* Windows Servers

Administrators can centrally select the SMBv1 vulnerability action using a NinjaOne custom field. The [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) then evaluates the endpoint's SMBv1 configuration, reports its current state, and disables SMBv1 when remediation is selected.


## Associated Content

### Custom Fields

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [Custom Field - cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1)  | Custom Field to choose the SMB1 Vulnerability action to perform on the machine. Detection reports the current SMBv1 state without making any changes. Detection and Remediation disables SMBv1 and then reports the resulting state. |
| [Custom Field - cPVAL SMB1 Server Status](/docs/71ed69e7-e11b-412e-842b-2416bcd30f04)  | Indicates whether SMBv1 Server is enabled on the machine. This field is populated by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0). |
| [Custom Field - cPVAL SMB1 Client Status](/docs/8046e895-bb66-4559-be7b-23e17090381f)  | Indicates whether SMBv1 client is enabled on the machine. This field is populated by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0). |
| [Custom Field - cPVAL SMB1 In Use](/docs/79350222-e667-4682-8c91-06f10bf71a4b)   | Indicates whether SMBv1 traffic has been detected on the machine. This field is populated by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0).  |
| [Custom Field - cPVAL SMB1 Autofix Status](/docs/61684064-113d-40e4-ad30-0d8734e312df) | Stores the SMBv1 status after the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) executes. Indicates whether SMBv1 is enabled and whether remediation is required. |
| [Custom Field - cPVAL SMB1 Autofix Vulnerability State](/docs/8797b5e3-2672-4186-813a-7d0eac772d1d)   | Indicates whether the device is considered vulnerable after the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) executes. |
| [Custom Field - cPVAL SMB1 Autofix Logging](/docs/c8152ccc-732a-4b33-93ef-6db1788068f8)   | Stores the remediation result reported by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0). |
| [Custom Field - cPVAL SMB1 Logging Time](/docs/5525a893-e10d-4177-8374-abd8c6d10919)  | Indicates the date and time when the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) was last executed. |

### Automation

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0)  | Checks for SMBv1 vulnerabilities, detects its current state and recent usage, disables SMBv1 when remediation is selected, and verifies the resulting configuration. |

### Group

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Group- cPVAL SMBv1 Status Audit](/docs/6247ac5b-7c02-4b01-ae73-32708eb3fded)  | This group displays the SMB1 status of machines where a vulnerability action is selected using the [Custom Field - cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1). The status is populated by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0). |

### Task

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Task - SMB1 Detection/Remediation](/docs/fe70a434-7acc-4f2e-8f03-68c49ba7e7aa)  |Executes the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) daily on Windows machines where vulnerability Action is selected through [Custom Field - cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1). |



## Implementation


### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in NinjaOne. These fields are required for the solution to function correctly.

* [cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1)
* [cPVAL SMB1 Server Status](/docs/71ed69e7-e11b-412e-842b-2416bcd30f04)
* [cPVAL SMB1 Client Status](/docs/8046e895-bb66-4559-be7b-23e17090381f)
* [cPVAL SMB1 In Use](/docs/79350222-e667-4682-8c91-06f10bf71a4b)
* [cPVAL SMB1 Autofix Status](/docs/61684064-113d-40e4-ad30-0d8734e312df)
* [cPVAL SMB1 Autofix Vulnerability State](/docs/8797b5e3-2672-4186-813a-7d0eac772d1d)
* [cPVAL SMB1 Autofix Logging](/docs/c8152ccc-732a-4b33-93ef-6db1788068f8)
* [cPVAL SMB1 Logging Time](/docs/5525a893-e10d-4177-8374-abd8c6d10919)

### Step 2: Configure the SMBv1 Vulnerability Action

Set the [cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1) custom field to the action that should be performed on the endpoint.

The available actions determine whether the automation only detects the SMBv1 configuration or also performs remediation.

* Detection - Detects and reports the current SMBv1 configuration without making changes.
* Detection and Remediation - Detects the SMBv1 configuration, disables SMBv1, and then verifies and reports the resulting configuration.

Endpoints where the field is not configured are not targeted by the SMBv1 task.

### Step 3: Create the Automation

Set up the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) automation.

### Step 4: Create the Group

Create the [Group - cPVAL SMBv1 Status Audit](/docs/6247ac5b-7c02-4b01-ae73-32708eb3fded) group.

The group uses the SMBv1 status information populated by the automation to identify machines where SMBv1 status has been evaluated.

The group should target Windows machines where the [cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1) custom field has been configured.

### Step 5: Create the Task

Create the [Task - SMB1 Detection/Remediation](/docs/fe70a434-7acc-4f2e-8f03-68c49ba7e7aa) task.

Configure the task to execute the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) daily.

The task should target Windows machines where the [cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1) custom field has been configured with a supported action.


## FAQ

### Q: Which platforms are supported?

> The solution supports Windows Workstations and Windows Servers.

### Q: What does the Detection action do?

> The Detection action checks the current SMBv1 Server and SMBv1 Client configuration and reports the detected state without making changes to the endpoint.

### Q: What does the Detection and Remediation action do?

> The Detection and Remediation action checks the current SMBv1 configuration, disables SMBv1 when enabled, and then verifies the resulting configuration.

### Q: Does the solution check whether SMBv1 is being used?

> Yes. The automation checks for SMBv1 traffic usage and records the result in the [cPVAL SMB1 In Use](/docs/79350222-e667-4682-8c91-06f10bf71a4b) custom field.

### Q: How does the solution determine whether a device is vulnerable?

> The solution evaluates the SMBv1 configuration after the automation executes and records the resulting vulnerability state in the [cPVAL SMB1 Autofix Vulnerability State](/docs/8797b5e3-2672-4186-813a-7d0eac772d1d) custom field.

### Q: What happens if remediation is required?

> When Detection and Remediation is selected, the automation disables SMBv1 and then verifies the resulting SMBv1 configuration.

### Q: Where can I see the remediation result?

> The remediation result is stored in the [cPVAL SMB1 Autofix Logging](/docs/c8152ccc-732a-4b33-93ef-6db1788068f8) custom field.

### Q: Where can I see when the automation last ran?

> The last execution date and time are stored in the [cPVAL SMB1 Logging Time](/docs/5525a893-e10d-4177-8374-abd8c6d10919) custom field.

### Q: What happens when the SMBv1 Vulnerability Action field is not configured?

> When the [cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1) custom field is not configured with a supported action, the endpoint is not targeted by the SMBv1 detection and remediation task.

### Q: Can the solution remediate both SMBv1 Client and SMBv1 Server?

> Yes. The remediation process evaluates and disables the applicable SMBv1 Client and SMBv1 Server components on supported Windows endpoints.

### Q: Is any manual configuration required on the endpoint?

> No. The solution uses the configured NinjaOne custom fields, automation, group, and scheduled task to detect and remediate SMBv1.

## Changelog

### 2026-10-07

* Initial version of the document.
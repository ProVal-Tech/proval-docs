---
id: 'cwa-microsoft-365-click-to-run-update-channel'
title: 'Microsoft 365 - Click-to-Run - Update Channel Configuration'
title_meta: 'Microsoft 365 - Click-to-Run - Update Channel Configuration'
keywords: ['microsoft', 'click-to-run', 'update', 'channel', 'configuration', 'windows', 'audit', 'automation']
description: 'This document provides a comprehensive guide on configuring the Click-to-Run Update Channel for Microsoft 365 on Windows machines, including scripts, internal monitors, and alert templates necessary for effective management and auditing of the update process.'
tags: ['microsoft', 'windows', 'update', 'configuration', 'audit', 'automation', 'monitoring']
draft: false
unlisted: false
---
## Purpose

This solution aims to acquire the Click-to-Run Configuration on a Windows machine, initiate the necessary data retrieval scripts, and configure the Update Channel.

## Update Notice: 16 - September - 2024

**New Content:**

- **Custom Table:** [pvl_m365_update_channel_audit](https://proval.itglue.com/DOC-5078775-17164846)
- **Script:** [Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164646)
- **Internal Monitor:** [Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164734)
- **Alert Template:** `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel`

**Modified Content:**

- **Script:** [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
- **Internal Monitor:** [Execute Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-14568059)
- **Alert Template:** `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details`
- **Dataview:** [C2R Office Version Audit](https://proval.itglue.com/DOC-5078775-13932548)

Update the [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script from the `Prosync` plugin and execute it against any online Windows machine with the `Set_Environment` parameter set to `1` to create the newly introduced custom table and EDFs used by the solution.

![Image](5078775/docs/14613693/images/26207663)

## Associated Content

### Auditing

| Content                                                                 | Type            | Function                                                                                                                                                      |
|-------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) | Script          | This script retrieves the installed Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel.   |
| [Execute Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-14568059) | Internal Monitor | Executes the [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script once per 14 days against the agents with Managed Mode |
| `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details` | Alert Template   | Executes the [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) against the agents detected by [Execute Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-14568059) |
| [C2R Office Version Audit](https://proval.itglue.com/DOC-5078775-13932548) | Dataview        | Displays the Click-to-Run Office version, auto-update status, and Update channel obtained by [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) |
| [pvl_m365_update_channel_audit](https://proval.itglue.com/DOC-5078775-17164846) | Custom Table    | Stores the data fetched by the [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script                         |

### Automation

| Content                                                                 | Type            | Function                                                                                                                                                      |
|-------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164646) | Script          | Make changes in the registry to set the update channel for Microsoft 365 products to the value set in the Client or Computer level EDF `Update Channel`.   |
| [Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164734) | Internal Monitor | Detects computers where the Microsoft 365 update channel is different as set in the Client or Computer Level 'Update Channel'                               |
| `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel`         | Alert Template   | Executes the [Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164646) script against the machines detected by the [Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164734) internal monitor. |

## Implementation

### Auditing

1. Import the following content from the `ProSync` plugin:
   - [Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
   - [Internal Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-14568059)
   - [Dataview - C2R Office Version Audit](https://proval.itglue.com/DOC-5078775-13932548)
   - Alert Template - `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details`

2. Reload the system cache:
   ![Image](5078775/docs/14613693/images/24237700)

3. Execute the script [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) against any online Windows machine with the `Set_Environment` parameter set to `1` to create the custom table and EDFs used by the solution.
   ![Image](5078775/docs/14613693/images/26207663)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-14568059)
       - Right-click and Run Now to start the monitor
       - Setup with `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details` Alert Template

### Automation

Confirm with consultant before enabling the Automation.

1. Import the following content from the `ProSync` plugin:
   - [Script - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164646)
   - [Internal Monitor - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164734)
   - `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel`

2. Reload the system cache:
   ![Image](5078775/docs/14613693/images/24238292)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164734)
       - Setup with `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel` Alert Template
       - Right-click and Run Now to start the monitor

4. Set the appropriate value to the Client or Computer Level EDF [Update Channel](https://proval.itglue.com/5078775/docs/17164646#version=published&documentMode=edit:~:text=Run%20%2D%20Get%20Details-,Client%20Level%20EDF,-Name) to initiate the Automation.

## Deprecated Content

- **Script:** [Microsoft 365 - Update Channel - Set - Current](https://proval.itglue.com/DOC-5078775-8181470)
- **Script:** [Microsoft 365 - Update Channel - Set - Monthly Enterprise](https://proval.itglue.com/DOC-5078775-8009392)
- **Internal Monitor:** [ProVal - Production - Execute Script - Update Channel - Set - Current Channel](https://proval.itglue.com/DOC-5078775-16471652)
- **Internal Monitor:** [ProVal - Production - Execute Script - Update Channel - Set - Monthly Enterprise](https://proval.itglue.com/DOC-5078775-14568325)
- **Alert Template:** `△ Custom - Execute Script - Microsoft 365 - Update Channel - Set - Current`
- **Alert Template:** `△ Custom - Execute Script - Microsoft 365 - Update Channel - Set - Monthly Enterprise`


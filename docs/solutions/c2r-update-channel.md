---
id: '545750d5-274a-46d9-bf8a-8ad677293458'
slug: /545750d5-274a-46d9-bf8a-8ad677293458
title: 'C2R Update Channel'
title_meta: 'C2R Update Channel'
keywords: ['microsoft', 'click-to-run', 'update', 'channel', 'configuration', 'windows', 'audit', 'automation']
description: 'This document provides a comprehensive guide on configuring the Click-to-Run Update Channel for Microsoft 365 on Windows machines, including scripts, internal monitors, and alert templates necessary for effective management and auditing of the update process.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution aims to acquire the Click-to-Run Configuration on a Windows machine, initiate the necessary data retrieval scripts, and configure the Update Channel.

## Update Notice: 16 - September - 2024

**New Content:**

- **Custom Table:** [pvl_m365_update_channel_audit](/docs/18823b31-4222-4881-82f8-bc284af806cb)
- **Script:** [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/77f0982f-1be7-49a7-871e-cfc88705775e)
- **Internal Monitor:** [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/44e0a674-9e54-47ad-be29-6c93611db0b2)
- **Alert Template:** `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel`

**Modified Content:**

- **Script:** [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e)
- **Internal Monitor:** [Execute Script - Microsoft 365 - Click-to-Run - Get Details](/docs/66fedeee-80d2-482b-9520-5fdfcab42406)
- **Alert Template:** `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details`
- **Dataview:** [C2R Office Version Audit](/docs/d48f4966-b281-4aaa-8bf0-5059221b7ff3)

Update the [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) script from the `ProSync` plugin and execute it against any online Windows machine with the `Set_Environment` parameter set to `1` to create the newly introduced custom table and EDFs used by the solution.

![Image](../../static/img/docs/545750d5-274a-46d9-bf8a-8ad677293458/image_1.webp)

## Associated Content

### Auditing

| Content                                                                 | Type            | Function                                                                                                                                                      |
|-------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) | Script          | This script retrieves the installed Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel.   |
| [Execute Script - Microsoft 365 - Click-to-Run - Get Details](/docs/66fedeee-80d2-482b-9520-5fdfcab42406) | Internal Monitor | Executes the [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) script once every 14 days against the agents with Managed Mode. |
| `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details` | Alert Template   | Executes the [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) against the agents detected by [Execute Script - Microsoft 365 - Click-to-Run - Get Details](/docs/66fedeee-80d2-482b-9520-5fdfcab42406) |
| [C2R Office Version Audit](/docs/d48f4966-b281-4aaa-8bf0-5059221b7ff3) | Dataview        | Displays the Click-to-Run Office version, auto-update status, and Update channel obtained by [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) |
| [pvl_m365_update_channel_audit](/docs/18823b31-4222-4881-82f8-bc284af806cb) | Custom Table    | Stores the data fetched by the [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) script                         |

### Automation

| Content                                                                 | Type            | Function                                                                                                                                                      |
|-------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/77f0982f-1be7-49a7-871e-cfc88705775e) | Script          | Makes changes in the registry to set the update channel for Microsoft 365 products to the value set in the Client or Computer level EDF `Update Channel`.   |
| [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/44e0a674-9e54-47ad-be29-6c93611db0b2) | Internal Monitor | Detects computers where the Microsoft 365 update channel is different from what is set in the Client or Computer Level 'Update Channel'.                    |
| `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel`         | Alert Template   | Executes the [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/77f0982f-1be7-49a7-871e-cfc88705775e) script against the machines detected by the [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/44e0a674-9e54-47ad-be29-6c93611db0b2) internal monitor. |

## Implementation

### Auditing

1. Import the following content from the `ProSync` plugin:
   - [Script - Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e)
   - [Internal Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](/docs/66fedeee-80d2-482b-9520-5fdfcab42406)
   - [Dataview - C2R Office Version Audit](/docs/d48f4966-b281-4aaa-8bf0-5059221b7ff3)
   - Alert Template - `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details`

2. Reload the system cache:
   ![Image](../../static/img/docs/545750d5-274a-46d9-bf8a-8ad677293458/image_2.webp)

3. Execute the script [Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) against any online Windows machine with the `Set_Environment` parameter set to `1` to create the custom table and EDFs used by the solution.
   ![Image](../../static/img/docs/545750d5-274a-46d9-bf8a-8ad677293458/image_1.webp)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](/docs/66fedeee-80d2-482b-9520-5fdfcab42406)
       - Right-click and Run Now to start the monitor
       - Set up with `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details` Alert Template

### Automation

Confirm with a consultant before enabling the Automation.

1. Import the following content from the `ProSync` plugin:
   - [Script - Microsoft 365 - Click-to-Run - Set Update Channel](/docs/77f0982f-1be7-49a7-871e-cfc88705775e)
   - [Internal Monitor - Microsoft 365 - Click-to-Run - Set Update Channel](/docs/44e0a674-9e54-47ad-be29-6c93611db0b2)
   - `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel`

2. Reload the system cache:
   ![Image](../../static/img/docs/545750d5-274a-46d9-bf8a-8ad677293458/image_3.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Microsoft 365 - Click-to-Run - Set Update Channel](/docs/44e0a674-9e54-47ad-be29-6c93611db0b2)
       - Set up with `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel` Alert Template
       - Right-click and Run Now to start the monitor

4. Set the appropriate value for the Client or Computer Level EDF [Update Channel](/docs/77f0982f-1be7-49a7-871e-cfc88705775e) to initiate the Automation.

## Deprecated Content

- **Script:** [Microsoft 365 - Update Channel - Set - Current](/docs/68e362d9-521f-417b-93e3-81adc169b559)
- **Script:** [Microsoft 365 - Update Channel - Set - Monthly Enterprise](/docs/a7234fd9-615c-4862-ae0a-b93fd84f7af6)
- **Internal Monitor:** [ProVal - Production - Execute Script - Update Channel - Set - Current Channel](/docs/b53066d5-a2f8-4455-b43c-766a927c52f4)
- **Internal Monitor:** [ProVal - Production - Execute Script - Update Channel - Set - Monthly Enterprise](/docs/a17fd169-876b-4de8-b01c-d396ec4899cf)
- **Alert Template:** `△ Custom - Execute Script - Microsoft 365 - Update Channel - Set - Current`
- **Alert Template:** `△ Custom - Execute Script - Microsoft 365 - Update Channel - Set - Monthly Enterprise`
---
id: '2f783bba-4022-43d3-8bb4-a768f68fe8c2'
slug: /2f783bba-4022-43d3-8bb4-a768f68fe8c2
title: 'MSP360 Online Backup Deployment'
title_meta: 'MSP360 Online Backup Deployment'
keywords: ['backup', 'msp360', 'automation', 'windows']
description: 'This solution enables automated deployment of MSP360 Online Backup agents to Windows servers and workstations through NinjaOne, using custom fields to control deployment scope and provide installation URLs.'
tags: ['cleanup', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution automates the deployment of MSP360 Online Backup agents to Windows servers and workstations through NinjaOne. It uses custom fields to control deployment targets and provide installation URLs, ensuring consistent backup configuration across managed devices.

## Associated Content

### Custom Fields

| Content | Definition Scope | Required | Type | Available Options | Applicable OS | Function |
| ------- | ---------------- | -------- | ---- | ----------------- | ------------- | -------- |
| [cPVAL MSP 360 Url](/docs/7e18083b-6a0e-49da-8a08-cfe9c7fa3378) | `Organization` | Yes | Text | N/A | Windows | Provides agent download URL from MSP360 portal |
| [cPVAL Deploy MSP 360](/docs/294f2f3e-1091-45b0-b764-b16ae054fad7) | `Device/Location/Organization` | No | Drop-down | `Disabled`, `Windows Servers`, `Windows Workstations`, `Windows Servers and Workstations` | Windows | Controls deployment scope for backup agents |

### Automation

| Content | Function |
| ------- | -------- |
| [Install MSP360 Online Backup](/docs/104e0456-6bb4-4e65-b0c0-0f8b6c0a4d8b) | Installs MSP360 agent using URL from custom field |

### Compound Conditions

| Content | Function |
| ------- | -------- |
| [Install MSP360 Online Backup - Windows Workstation](/docs/9f4d1394-8444-44e3-a4a1-97d6b7c71f92) | Triggers agent install on workstations where MSP360 Deployment is enabled but the Online Backup application is not installed |
| [Install MSP360 Online Backup - Windows Server](/docs/29f5ffd2-507f-4595-92eb-7d8956f30c88) | Triggers agent install on workstations where MSP360 Deployment is enabled but the Online Backup application is not installed |

## Implementation

### Step 1: Create Custom Fields

1. Create [cPVAL MSP 360 Url](/docs/7e18083b-6a0e-49da-8a08-cfe9c7fa3378) custom field:
   - **Scope:** Organization
   - **Type:** Text
   - **Description:** "MBS backup agent URL. Copy from MSP360 portal Downloads section"

2. Create [cPVAL Deploy MSP 360](/docs/294f2f3e-1091-45b0-b764-b16ae054fad7) custom field:
   - **Scope:** Device/Location/Organization
   - **Type:** Drop-down
   - **Options:**
     - Disabled
     - Windows Servers
     - Windows Workstations
     - Windows Servers and Workstations

### Step 2: Create Automation

Import the [Install MSP360 Online Backup](/docs/104e0456-6bb4-4e65-b0c0-0f8b6c0a4d8b) automation script that:

1. Retrieves installation URL from `cPVAL MSP 360 Url`
2. Downloads and installs MSP360 agent
3. Verifies successful installation

### Step 3: Configure Deployment Rules

1. Set `cPVAL MSP 360 Url` at organization level with your MSP360 download URL
2. Configure `cPVAL Deploy MSP 360` at appropriate scopes:
   - Organization level: Set default deployment policy
   - Location/Device level: Override for specific needs

### Step 4: Create Compound Conditions

1. Create [Install MSP360 Online Backup - Windows Workstation](/docs/9f4d1394-8444-44e3-a4a1-97d6b7c71f92):
   - **Policy:** `Windows Workstation [Default]`
   - **Conditions:** 
     - "Online Backup" application not installed
     - `cPVAL Deploy MSP 360` includes workstations

2. Create [Install MSP360 Online Backup - Windows Server](/docs/29f5ffd2-507f-4595-92eb-7d8956f30c88):
   - **Policy:** `Windows Server [Default]`
   - **Conditions:** 
     - "Online Backup" application not installed
     - `cPVAL Deploy MSP 360` includes servers

## FAQ

### 1. Where do I find the MSP360 installation URL?

Navigate to your MSP360 portal > Downloads section > Copy the "Direct Download Link" for the backup agent. Paste this into the `cPVAL MSP 360 Url` custom field at the organization level.

### 2. Can I exclude specific devices from deployment?

Yes, set `cPVAL Deploy MSP 360` to "Disabled" at either the device or location level to prevent agent installation on specific targets.

### 3. What happens if the URL custom field is empty?

The installation automation will fail with a clear error message. Ensure the URL is configured at the organization level before deployment.

### 4. Can I deploy to both servers and workstations simultaneously?

Yes, set `cPVAL Deploy MSP 360` to "Windows Servers and Workstations" at the organization level. The compound conditions will automatically target both device types.

### 5. How do I verify successful deployments?

Check Automation > Activity in NinjaOne for:

- "MBSAgent service running" confirmation
- Installation logs in script output
- "Online Backup" appearing in Applications list

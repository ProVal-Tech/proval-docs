---
id: '65d0dbb6-29c1-4242-841c-1da9b92edab6'
slug: /65d0dbb6-29c1-4242-841c-1da9b92edab6
title: 'QuickPass Agent Deployment'
title_meta: 'QuickPass Agent Deployment'
keywords: ['quickpass', 'agent', 'windows', 'install', 'monitor']
description: 'Automated detection and deployment solution for QuickPass Agent on Windows endpoints using CWA scripts, a monitor and an alert template.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-10-27
---

## Purpose

Detect Windows endpoints that do not have the QuickPass Agent installed and deploy the official QuickPass Agent automatically. The solution combines an internal monitor, deployment and uninstall scripts, and an alert template to provide repeatable, auditable installations and simple exclusion controls.

## Associated Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) | Script | Downloads and installs the QuickPass Agent; supports initial environment setup via the Set_Environment parameter. |
| [Agents Missing QuickPass](/docs/b96aee11-a990-4b23-9ba8-afc420225bac) | Internal Monitor | Identifies machines without QuickPass Agent (64-bit) where deployment is enabled. |
| [Uninstall QuickPass](/docs/632a4585-aa0a-11f0-9766-92000234cfc2) | Script | Silently removes the QuickPass Agent from a device when required. |
| **△ Custom - Execute Script - Deploy QuickPass Agent** | Alert Template | Executes the deployment script against devices flagged by the internal monitor. |

## Optional Content

- Import this solution if you have DUO in your environment to prevent glitch

| Content | Type | Function |
| ------- | ---- | -------- |
| [Enabling the CyberQP Credential Provider while using Duo](/docs/249507b6-c45d-4be0-b1e9-1204a4931c8d) | Script | This script will only perform the whitelist if the `QuickpassServerAgent` service is running and `Duo Authentication for Windows Logon x64` is installed.|
| [ProVal Production - CyberQP DUO Cred Provider](/docs/27dec940-59f6-407b-bdbb-2b8432a30467) | Remote Monitor |This document outlines the implementation details for a remote monitor that checks for agents where "QuickPassInstalled" is true, "DuoInstalled" is true, and the registry for the DUO whitelist exists. If the registry does not exist, it will trigger the autofix script "Enabling the CyberQP Credential Provider while using Duo" to set the registry on the agent. |
| **△ Custom - Execute Script - Enable CyberQP DUO** | Alert Template | Executes the deployment script against devices flagged by the remote monitor. |

## Associated Implementation

### Step 1 — Import

Import the following assets from the ProSync package or repository:

- Script - [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198)
- Script - [Uninstall QuickPass](/docs/632a4585-aa0a-11f0-9766-92000234cfc2)
- Internal Monitor - [Agents Missing QuickPass](/docs/b96aee11-a990-4b23-9ba8-afc420225bac)
- Alert Template - `△ Custom - Execute Script - Deploy QuickPass Agent`

### Step 2 — Reload System Cache

Refresh the CWA System cache (Ctrl + R) so imported items appear in the interface.

### Step 3 — Initialize EDFs and System Property

Run the [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) script once with the user parameter `Set_Environment`=`1`. This creates required Extra Data Fields (EDFs) and the System Property `QuickpassInstallToken` used by the deployment script.

### Step 4 — Configure Monitor and Alert

- Enable the internal monitor [Agents Missing QuickPass](/docs/b96aee11-a990-4b23-9ba8-afc420225bac) and attach the alert template `△ Custom - Execute Script - Deploy QuickPass Agent`.

### Step 5 — Exclusions and Overrides

- Use the client-level EDF `QuickPass` to opt a client into deployment.
- Use `QuickPass Agent ID` at client or location level to provide the CustomerID required by the installer.
- Use the `Exclude from QuickPass Deployment` EDF at location or computer level to prevent deployment to specific scopes.

### Step 6 — Remediation and Verification

- Monitor deployment results via script logs and CWA script history.
- Use the [Uninstall QuickPass](/docs/632a4585-aa0a-11f0-9766-92000234cfc2) script to remove the agent where required.
- Configure ticketing options in the deployment script global parameters to get failure notifications.


## Optional Implementation 

### Step 1

- Script - [Enabling the CyberQP Credential Provider while using Duo](/docs/249507b6-c45d-4be0-b1e9-1204a4931c8d)
- Remote Monitor - [ProVal Production - CyberQP DUO Cred Provider](/docs/27dec940-59f6-407b-bdbb-2b8432a30467)
- Alert Template - `△ Custom - Execute Script - Enable CyberQP DUO`


### Step 2 — Reload System Cache

- Refresh the CWA System cache (Ctrl + R) so imported items appear in the interface.

### Step 3 

- Apply the alert template to the monitor.
- Right Click, Run now and reset monitor.

## Changelog


### 2026-03-12

- Added this new script to enable the CyberQP Credential Provider while using Duo as per the article referenced below:
  https://support.getquickpass.com/hc/en-us/articles/22720858271895-Enabling-the-CyberQP-Credential-Provider-while-using-Duo#h_01HWB3Q6E45JJC9SYE5RG996XT

### 2026-03-06

- Added the EDFs import in the script
- Added the latest vendor specific logic in the script
- Modified to fetch the EDFs and properties values using SQL
- Added the logic to have ticket creation automatically enabled once the `TicketCategory` is set inside the monitor.

### 2025-10-30

- Added a location-level EDF QuickPass Agent ID to allow overriding the client-level ID when specified. The client-level setting remains in place, but if the location EDF is filled, the script will prioritize it. Additionally, updated the deployment script and monitor to install the "QuickPass Agent (64-bit)" version of QuickPass Agent and remove the older version  "QuickPass Agent", which was not functioning correctly on computers.

### 2025-04-10

- Initial version of the document



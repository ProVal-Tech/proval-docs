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
---

## Purpose

Detect Windows endpoints that do not have the QuickPass Agent installed and deploy the official QuickPass Agent automatically. The solution combines an internal monitor, deployment and uninstall scripts, and an alert template to provide repeatable, auditable installations and simple exclusion controls.

## Associated Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) | Script | Downloads and installs the QuickPass Agent; supports initial environment setup via the Set_Environment parameter. |
| [Agents Missing QuickPass](/docs/b96aee11-a990-4b23-9ba8-afc420225bac) | Internal Monitor | Identifies machines without QuickPass Agent (64-bit) where deployment is enabled. |
| [Uninstall QuickPass](/docs/632a4585-aa0a-11f0-9766-92000234cfc2) | Script | Silently removes the QuickPass Agent from a device when required. |
| △ Custom - Execute Script - Deploy QuickPass Agent | Alert Template | Executes the deployment script against devices flagged by the internal monitor. |

## Implementation

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

## FAQ

Q: How do I prepare for the first run?  
A: Execute the [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) script with `Set_Environment`=`1` to create EDFs and import the `QuickpassInstallToken` system property. Populate `QuickPass Agent ID` and `QuickpassInstallToken` before mass deployment.

Q: Where do I get the QuickPass Agent ID and Install Token?  
A: Obtain the Agent ID (CustomerID) and Install Token from the QuickPass dashboard (Settings → Admin Login Details). Populate the EDFs and System Property accordingly.

Q: Can I exclude specific locations or machines from deployment?  
A: Yes — set the `Exclude from QuickPass Deployment` EDF at the Location or Computer level to prevent deployments to those scopes.

Q: What happens on installation failure?  
A: The script can create a ticket (if TicketCreationCategory is configured). Detailed installer output is written to the script log and included in the ticket body for troubleshooting.

Q: Can I run installs manually?  
A: Yes — the Deploy [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) script supports manual execution with runtime parameters to override EDF values when necessary.

Q: How do I remove QuickPass from a device?  
A: Run the [Uninstall QuickPass](/docs/632a4585-aa0a-11f0-9766-92000234cfc2) script on the target device. The script will silently remove QuickPass and report results to the job log.

Q: Why does the script [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198)  uninstall `QuickPass Agent` before installing `QuickPass Agent (64-bit)`?  
A: To ensure a clean, conflict‑free upgrade path. Removing the older package avoids file/service conflicts and helps the 64‑bit installer complete successfully.

Q: How does the [Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) script know when to uninstall?  
A: The script checks for the presence of the legacy "QuickPass Agent" installation and only runs the uninstall routine if that product is detected on the device.

Q: How can I verify the upgrade completed successfully?  
A: Check the CWA script log for a successful install entry, confirm the `QuickPass Agent (64-bit)` is listed in installed programs, and validate the agent reports to its management platform.

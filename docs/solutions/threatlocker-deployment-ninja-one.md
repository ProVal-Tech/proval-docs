---
id: 'a1efd808-41ad-4dee-9ea1-ff0c2a36e019'
slug: /a1efd808-41ad-4dee-9ea1-ff0c2a36e019
title: 'Threatlocker Deployment [NinjaOne]'
title_meta: 'Threatlocker Deployment [NinjaOne]'
keywords: ['threatlocker', 'deployment', 'windows', 'mac', 'agent', 'customfield', 'dynamicgroup', 'task']
description: 'This solution is designed to configure the automatic deployment of the Threatlocker Agent on Windows and Macintosh machines that are missing the agent, using the NinjaOne platform.'
tags: ['deployment', 'security', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-05-29
---

## Purpose

This solution is designed to configure the automatic deployment of the Threatlocker Agent on Windows and Macintosh machines that are missing the agent, using the NinjaOne platform.

## Associated Content

### Custom Field

| Content | Type | Available Options | Function |
| ------- | ---- | ----------------- | -------- |
|[cPVAL Threatlocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2) | Drop-down |`All`, `Windows`, `Windows and Macintosh`, `Disabled`, `windows workstations`, `windows servers and Macs`, `windows workstaions and macs`, `windows servers`, `macs`, `Uninstall` | Custom Field to select OS to enable auto-deployment of Threatlocker. Select 'Uninstall' to uninstall Threatlocker if its already installed on the machines.  |
| [cPVAL Threatlocker Auth Key](/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a) | Text | | Stores the Threatlocker authorization key for Windows machines. |
| [cPVAL Threatlocker Organization Name](/docs/573751d4-0648-4da9-8ec3-0ab96d4730de)  | Text | | Fill it with the organization name under which the Threatlocker agent is to be installed in Threatlocker Portal |
| [cPVAL ThreatLocker Mac GroupKey](/docs/8305e5b2-41ee-44bb-848e-758ac72b185f) | Text | | Stores one or more tags, separated by commas (optional).|

### Automation

| Content | Function |
| ------- | -------- | 
| [Threatlocker Deployment](/docs/11444307-4a3f-4388-b5c5-096a50725b4e) | Installs Threatlocker agent on Windows operating systems.          | 
| [Threatlocker Deployment - MAC](/docs/1196b011-bfba-486a-8653-92066f19e527) | Installs Threatlocker agent on Macintosh operating systems.  | 
| [Uninstall Threatlocker](/docs/74fed1e5-d84f-4435-adc5-661cff43129c) | Uninstalls ThreatLocker from a Windows machine. Tamper Protection must be disabled before running this script, otherwise the uninstall may fail. |

### Compound Conditions

| Content | Function |
| ------- | -------- | 
| [Threatlocker Deployment - Workstations](/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28) | Triggers the [Threatlocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527) automation on Windows workstations where deployment is enabled and `Threatlocker` is not installed. |
| [Threatlocker Deployment - Servers](/docs/1f27cc9b-0d7f-4ec6-a235-d3c318f3abb5) | Triggers the [ThreatLocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527) automation on Windows servers where deployment is enabled and `Threatlocker` is not installed.  |
| [Threatlocker Deployment - MAC](/docs/73470264-63c3-43d1-a727-1e813cfe768d) | Triggers the [Threatlocker Deployment [MAC]](/docs/11444307-4a3f-4388-b5c5-096a50725b4e) automation on Macintosh machines where deployment is enabled and `Threatlocker` is not installed. | 
| [Uninstall Threatlocker - Windows](/docs/4e517727-01c3-4357-81c2-43eea78e45ed) | Triggers the [Uninstall Threatlocker](/docs/74fed1e5-d84f-4435-adc5-661cff43129c) automation on Windows machines where uninstallation is enabled and threatlocker is installed. | 

## Implementation

### Step 1

Create the following custom fields:

- [cPVAL Threatlocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2)
- [cPVAL Threatlocker Auth Key](/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a)  
- [cPVAL Threatlocker Organization Name](/docs/573751d4-0648-4da9-8ec3-0ab96d4730de)  
- [cPVAL ThreatLocker Mac GroupKey](/docs/8305e5b2-41ee-44bb-848e-758ac72b185f)


### Step 2

Create the following automations:

- [Threatlocker Deployment](/docs/11444307-4a3f-4388-b5c5-096a50725b4e)
- [Threatlocker Deployment - MAC](/docs/1196b011-bfba-486a-8653-92066f19e527)
- [Uninstall Threatlocker](/docs/74fed1e5-d84f-4435-adc5-661cff43129c) 

### Step 3

Create the following Compound conditions:

- [Threatlocker Deployment - Workstations](/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28) 
- [Threatlocker Deployment - Servers](/docs/1f27cc9b-0d7f-4ec6-a235-d3c318f3abb5)
- [Threatlocker Deployment - MAC](/docs/73470264-63c3-43d1-a727-1e813cfe768d) 
- [Uninstall Threatlocker - Windows](/docs/4e517727-01c3-4357-81c2-43eea78e45ed) 


## FAQ

**Q. What is this solution used for?**

**A.** This solution is used to automatically deploy the ThreatLocker agent on Windows and macOS endpoints managed by NinjaOne when the agent is missing. It ensures consistent security coverage without requiring manual installation.


**Q. Which operating systems are supported**?

**A.** Windows and macOS

**Q. Will this reinstall ThreatLocker if it is already installed?**

**A.** No. The compound conditions explicitly check whether the ThreatLocker agent is not installed. If the agent is already present, the deployment script will not run.

**Q. Where are the ThreatLocker credentials stored?**

**A.**  Credentials are stored securely using NinjaOne Custom Fields:  
   * Windows Auth Key: cPVAL Threatlocker Auth Key  
   * Windows Organization Name: cPVAL Threatlocker Organization Name  
   * macOS Group Key: cPVAL ThreatLocker Mac GroupKey  

These values are retrieved dynamically at runtime by the deployment scripts.

**Q. Can this be enabled or disabled per organization?**

**A.** Yes. The custom field cPVAL Threatlocker Deployment controls whether automatic deployment is enabled at the organization level. This allows granular control over where ThreatLocker is deployed.

**Q. Does this require user interaction?**

**A.** No. The deployment runs silently in the background via NinjaOne automations and does not require any user interaction.

## Changelog

### 2026-05-29

- Added Uninstall option in the `cPVAL Threatlocker Deployment` custom field.
- Added missing components to the documents as per our new document standards.
- Renamed the compound condition from `threatlocker-deployment-windows` to `threatlocker-deployment-workstations`. Separated workstations and servers compound conditions because servers use different Custom fields for deployment.
- Added Threatlocker uninstallation script for windows and its corresponding Custom Field.

### 2025-05-27

- Initial version of the document

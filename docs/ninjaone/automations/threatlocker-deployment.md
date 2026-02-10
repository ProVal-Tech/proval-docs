
---
id: '1196b011-bfba-486a-8653-92066f19e527'
slug: /1196b011-bfba-486a-8653-92066f19e527
title: 'Threatlocker Deployment'
title_meta: 'Threatlocker Deployment'
keywords: ['Threatlocker','windows','GroupKey','Deployment']
description: 'This script will check for ThreatLocker and attempt to install if not present on Windows Machines. It matches the organization to the client name. If no match is found, it will create the company in the Threatlocker Portal. By default, servers will be installed into the Servers group, and workstations will be installed into the Workstations group'
tags: ['security','setup','windows']
draft: false
unlisted: false
---

## Overview

This script will check for ThreatLocker and attempt to install if not present on Windows Machines. It matches the organization to the client name. If no match is found, it will create the company in the Threatlocker Portal. By default, servers will be installed into the Servers group, and workstations will be installed into the Workstations group.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/1196b011-bfba-486a-8653-92066f19e527/samplerun.webp)

## Dependencies

- [cPVAL Threatlocker Auth Key](/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a)
- [cPVAL Threatlocker Organization Name](/docs/573751d4-0648-4da9-8ec3-0ab96d4730de)
- [cPVAL Threatlocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2)
- [cPVAL Threatlocker Deployment - Exclude](/docs/c3329dd9-bdf8-42f6-aacc-bcfde0fa94da)
- [Solution - Threatlocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Parameters

| Name |  Required | Default | Type | Description |
| ---- | -------- | ------- | ---- | ----------- |
| Threatlocker AuthKey | False  | -- | `String/Text` | Set this variable to override the value stored in the organization-level custom field cPVAL Threatlocker AuthKey |
| ThreatLocker Org Key | False  | -- | `String/Text` | Set this variable to override the value stored in the organization-level custom field cPVAL Threatlocker OrganizationName |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/threatlocker-deployment-windows.ps1)

## Output

- Activity Details

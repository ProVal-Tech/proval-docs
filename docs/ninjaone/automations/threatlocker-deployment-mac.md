---
id: '11444307-4a3f-4388-b5c5-096a50725b4e'
slug: /11444307-4a3f-4388-b5c5-096a50725b4e
title: 'Threatlocker Deployment [MAC]'
title_meta: 'Threatlocker Deployment [MAC]'
keywords: ['Threatlocker','MAC','GroupKey','Deployment']
description: 'This script deploys threatlocker agent on Mac machines'
tags: ['security','setup','macos']
draft: false
unlisted: false
---

## Overview

This script deploys threatlocker agent on Mac machines.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/1196b011-bfba-486a-8653-92066f19e527/samplerun.webp)

## Dependencies

- [cPVAL ThreatLocker Mac GroupKey](/docs/8305e5b2-41ee-44bb-848e-758ac72b185f)
- [cPVAL Threatlocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2)
- [Solution - Threatlocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Parameters

| Name |  Required | Default | Type | Description |
| ---- | -------- | ------- | ---- | ----------- |
| Threatlocker Mac Groupkey | False  | -- | `String/Text` | Set this variable to override the value stored in the organization-level custom field cPVAL ThreatLocker Mac GroupKey |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/threatlocker-deployment-mac.sh)

## Output

- Activity Details

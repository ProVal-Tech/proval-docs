---
id: 'a818ac38-9841-4049-9fda-1b87fa1bd19a'
slug: /a818ac38-9841-4049-9fda-1b87fa1bd19a
title: 'New Domain Admin Detected'
title_meta: 'New Domain Admin Detected'
keywords: ['domain', 'administrators', 'windows', 'alerts']
description: 'This script detects the user or group of users if its promoted to domain administrator on a Windows domain controller '
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Overview
This script detects the user or group of users if its promoted to domain administrator on a Windows domain controller. It excludes the default administrators and any user mentioned in the cpvalExcludedDomainAdmins. 

## Sample Run

`Play Button` > `Run Automation` > `Script`

![SampleRun1](../../../static/img/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a.webp)

## Dependencies
- [Ticket Template : New Domain Admin Detected](/docs/355a03b6-61f8-45c4-92f9-43f13b5dd7ac)
- [cPval Excluded Domain Admins](/docs/32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0)
- [Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/new-domain-admin-detected.ps1)

## Output

- Activity Details 

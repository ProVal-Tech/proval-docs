---
id: '8111fecc-61de-4c72-933c-b719351b7a1e'
slug: /8111fecc-61de-4c72-933c-b719351b7a1e
title: 'Installed Remote Tool Audits'
title_meta: 'Installed Remote Tool Audits'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'This script scans the Windows registry (both 32-bit and 64-bit uninstall locations) to identify installed software matching known Remote Monitoring & Management (RMM), remote access, and support tool signatures.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-05-21
---

## Overview

This script scans the Windows registry (both 32-bit and 64-bit uninstall locations) to identify installed software matching known Remote Monitoring & Management (RMM), remote access, and support tool signatures.


## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

- Search for the `Installed Remote Tools Audit` and then click on it

![Sample Run 2](../../../static/img/docs/8111fecc-61de-4c72-933c-b719351b7a1e/image.webp)

- Click Run

![Sample Run 2](../../../static/img/docs/8111fecc-61de-4c72-933c-b719351b7a1e/image1.webp)

## Dependencies

- [Custom field - cPVAL Remote Audits](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/installed-remote-tools-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-05-21

- Initial version of the document
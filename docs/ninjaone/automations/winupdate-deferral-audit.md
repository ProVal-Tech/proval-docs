---
id: '79c86028-fa08-450f-bc45-e2f3f2026732'
slug: /79c86028-fa08-450f-bc45-e2f3f2026732
title: 'WinUpdate Deferral Audit'
title_meta: 'WinUpdate Deferral Audit'
keywords: ['registry','feature','check','deferral']
description: 'Reads current Windows Update deferral registry values and compares them against Ninja Custom Field desired values. Exits with 1 if drift is detected.'
tags: ['updates','registry','auditing']
draft: false
unlisted: false
last_update:
  date: 2026-03-06
---

## Overview

Reads current Windows Update deferral registry values and compares them against Ninja Custom Field desired values. Exits with 1 if drift is detected.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/79c86028-fa08-450f-bc45-e2f3f2026732/winupdate-deferral.webp)

## Dependencies

- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)
- [Solution: Update Windows Deferral Settings](/docs/56e6b247-f80a-4bd8-b2e2-8cf44f76b7e1)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/winupdate-deferral-Audit.ps1)

## Output

- Activity Details

## Changelog

### 2026-03-06

- Initial version of the document

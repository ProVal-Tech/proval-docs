---
id: '33446436-a337-411d-99ae-299046ba30d9'
slug: /33446436-a337-411d-99ae-299046ba30d9
title: 'SecureBoot Compliance - Audit'
title_meta: 'SecureBoot Compliance - Audit'
keywords: ['secure','secure-boot','audit']
description: 'This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026.'
tags: ['security','custom-fields','Secureboot','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Overview

This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026.

Microsoft is replacing legacy Secure Boot certificates with updated 2023-era certificates (KEK and DB). Devices that do not contain these updated certificates may be considered "at risk" once older certificates expire.

The script performs the following checks:

  1. `Secure Boot`
    - Verifies whether Secure Boot is enabled or disabled on the device.

  2. `Windows Telemetry`
    - Determines CA2023 compliance based on Secure Boot state and certificate presence.

  3. `Windows DB Certificate`
    - Checks for presence of the 'Windows UEFI CA 2023' certificate in the DB store.

  4. `Windows KEK Certificate`
    - Checks for presence of the 'Microsoft Corporation KEK 2K CA 2023' certificate.

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/33446436-a337-411d-99ae-299046ba30d9/sample-run.webp)

## Dependencies

[Custom Field - cPVAL Secure Boot Status](/docs/1d87004f-2ab3-4dd3-9f62-472172678982)
[Custom Field - cPVAL Windows Telemetry Status](/docs/e000a063-1286-41e1-a6f5-54afab3939a0)
[Custom Field - cPVAL Windows KEK Certificate](/docs/d131c730-502b-4f00-8461-ecef6766c161)
[Custom Field - cPVAL Windows DB Certificate](/docs/1eaeb929-0df9-4482-be5c-f78c6f993487)
[Solution - Secure Boot Compliance - Audit](/docs/b037020a-1af5-4ecb-bb6b-62d59c123937)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/secureboot-compliance-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

- Initial Creation

---
id: '0ad6a640-bcd2-4d87-8c7d-ace30dbf7044'
slug: /0ad6a640-bcd2-4d87-8c7d-ace30dbf7044
title: 'Entra Provisioning Package'
title_meta: 'Entra Provisioning Package'
keywords: ['entra', 'provisioning-package', 'ppkg', 'bulk-enrollment', 'file-transfer']
description: 'Places the Entra ID bulk enrollment provisioning package on the device so Join Computer to Entra can apply it from a local path.'
tags: ['azure', 'provisioning', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-17
---

## Overview

This file transfer places the Microsoft Entra ID bulk enrollment provisioning package (`.ppkg`) on the device, so [Join Computer to Entra](/docs/c6612702-1dff-47e5-91b7-9ad4fa237f22) can apply it from a local path. Upload a package created in Windows Configuration Designer with a bulk token from Microsoft Entra ID. Then set the automation's **Entra Provisioning Package Path** to the full path of the file, for example `C:\ProgramData\_automation\script\Entra\EntraBulkEnrollment.ppkg`.

**Path Location:** `C:\ProgramData\_automation\script\Entra`


## Dependencies

* [Solution: Domain to Entra ID and Intune Migration](/docs/7264fd6b-4957-473f-9d3e-75471c0fce73)
* [Automation: Join Computer to Entra](/docs/c6612702-1dff-47e5-91b7-9ad4fa237f22)

## Template Creation

[File Transfer](https://github.com/ProVal-Tech/ninjarmm/blob/main/file-transfer/entra-provisioning-package.toml)

## Changelog

### 2026-11-17

- Initial version of the document

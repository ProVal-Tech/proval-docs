---
id: '5cda8c79-bcd0-4226-b5a4-db846b9b35a9'
slug: /5cda8c79-bcd0-4226-b5a4-db846b9b35a9
title: 'Windows Server Roles Detection'
title_meta: 'Windows Server Roles Detection'
keywords: ['roles', 'server-roles', 'powershell', 'custom-fields']
description: 'Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable).'
tags: ['custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-05-12
---

## Overview

Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable).

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Windows Server Roles Detection`  
![image1](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image1.webp)

- **Run As:** `System`  
- **Preset Parameter:** `Leave it untouched`  
- **Custom Field:** `cpvalRolesDetected` 

![image2](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image2.webp)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies
- [Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6)  
- [Custom Field - cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/windows-server-roles-detection.ps1)

## Output

- Activity Details
- Custom field

## Changelog

### 2026-05-12

- Updated the document with configuration steps

### 2025-10-31

- Updated the script to detect SMB1 role

### 2025-03-28

- Initial version of the document

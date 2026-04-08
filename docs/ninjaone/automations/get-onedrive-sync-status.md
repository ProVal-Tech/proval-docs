---
id: '29e62bb2-d641-472d-a92b-11404471b915'
slug: /29e62bb2-d641-472d-a92b-11404471b915
title: 'Get OneDrive Sync Status'
title_meta: 'Get OneDrive Sync Status'
keywords: ['onedrive', 'sync']
description: 'NinjaRMM wrapper for the agnostic ODSyncUtil script; formats results into NinjaRMM custom fields.'
tags: ['onedrive']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Overview
NinjaRMM wrapper for the agnostic [ODSyncUtil](https://github.com/rodneyviana/ODSyncUtil/tree/master/ODSyncUtil) script that retrieves the OneDrive Sync Status and Quota Information. This data is then stored in a custom field [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f).

## Sample Run

`Play Button` > `Run Automation` > `Script`  


Search and select `Get OneDrive Sync Status`
![Image1](../../../static/img/docs/d7a2d79d-7b3c-47bd-9666-492e423e7b97/image.webp)

Set the required arguments and click the `Run` button to run the script.  
- **Run As:** `System`  
- **Preset Parameter:** `<Leave it Blank>` 

![Image2](../../../static/img/docs/d7a2d79d-7b3c-47bd-9666-492e423e7b97/image1.webp)

**Run Automation:** `Yes`  
![Image1](../../../static/img/docs/d7a2d79d-7b3c-47bd-9666-492e423e7b97/image2.webp)

## Dependencies

- [Get-ODStatus](https://github.com/rodneyviana/ODSyncUtil/blob/master/ODSyncUtil/Get-ODStatus.ps1)
- [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f)
- [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56)
- [Solution - Get OneDrive Sync Status](/docs/22d8abe0-2ea4-48e9-8b02-6108cd2de889)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/get-onedrive-sync-status.ps1)  


## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-04-08

- Added a custom field so that it can be used to store the Sync status of OneDrive, which can be further used to apply a filter to audit failed sync status machines.

### 2026-02-19

- Initial version of the document

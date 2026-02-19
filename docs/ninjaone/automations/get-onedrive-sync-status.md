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
---

## Overview
NinjaRMM wrapper for the agnostic ODSyncUtil script; formats results into NinjaRMM custom fields.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Get OneDrive Sync Status`
![Image1](../../../static/img/docs/d7a2d79d-7b3c-47bd-9666-492e423e7b97/image.webp)

Set the required arguments and click the `Run` button to run the script.  
**Run As:** `System`  
**Preset Parameter:** `<Leave it Blank>`  
![Image2](../../../static/img/docs/d7a2d79d-7b3c-47bd-9666-492e423e7b97/image1.webp)

**Run Automation:** `Yes`  
![Image1](../../../static/img/docs/d7a2d79d-7b3c-47bd-9666-492e423e7b97/image2.webp)

## Dependencies

https://github.com/rodneyviana/ODSyncUtil/blob/master/ODSyncUtil/Get-ODStatus.ps1

## Automation Setup/Import

[Get OneDrive Sync Status](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/get-onedrive-sync-status.ps1)

[cPVAL OneDrive Sync Status](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/cpval-onedrive-sync-status.toml)

## Output

- Activity Details  
- Custom Field

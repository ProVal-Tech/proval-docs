---
id: 'a65607e3-42b0-473c-bf09-36e63107a835'
slug: /a65607e3-42b0-473c-bf09-36e63107a835
title: 'SMB1 Access Audit And Detection'
title_meta: 'SMB1 Access Audit And Detection'
keywords: ['smb1', 'traffic', 'audit', 'detection']
description: 'Enables SMB1 access auditing if disabled and scans event logs for recent SMB1 access attempts (Event IDs 1001, 3000) within the last hour. Returns exit codes for detection or script failure.'
tags: ['alerting', 'auditing', 'eventlogs', 'smb']
draft: false
unlisted: false
---

## Overview
Enables SMB1 access auditing if disabled and scans event logs for recent SMB1 access attempts (Event IDs 1001, 3000) within the last hour. Returns exit codes for detection or script failure.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)  

![Image1](../../../static/img/docs/a65607e3-42b0-473c-bf09-36e63107a835/image1.webp)

![Image2](../../../static/img/docs/a65607e3-42b0-473c-bf09-36e63107a835/image2.webp)

## Dependencies

[Solution - SMB1 Access Audit](/docs/b9c24693-91db-4014-a5d9-7208d7fe492a)  
[Compound Condition - SMB1 Traffic Audit](/docs/f6b984a2-acbe-40fa-93e3-43682acde7ca)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/smb1-access-audit-and-detection.ps1)

## Output

- Activity Details  

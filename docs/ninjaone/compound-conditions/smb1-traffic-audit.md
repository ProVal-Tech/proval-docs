---
id: 'f6b984a2-acbe-40fa-93e3-43682acde7ca'
slug: /f6b984a2-acbe-40fa-93e3-43682acde7ca
title: 'SMB1 Traffic Audit'
title_meta: 'SMB1 Traffic Audit'
keywords: ['smb1', 'traffic', 'audit', 'detection']
description: 'This Compound Condition creates an alert on Servers with SMB1 Protocol enabled and if SMB1 access attempts (Event IDs 1001, 3000) is detected within the last hour'
tags: ['alerting', 'auditing', 'eventlogs', 'smb']
draft: false
unlisted: false
---

## Summary
This Compound Condition creates an alert on Servers with SMB1 Protocol enabled and if SMB1 access attempts (Event IDs 1001, 3000) is detected within the last hour

## Details

**Name:** `SMB1 Traffic Audit`  
**Description:** `This Compound Condition creates an alert on Servers with SMB1 Protocol enabled and if SMB1 access attempts (Event IDs 1001, 3000) is detected within the last hour`  
**Recommended Agent Policies:** `Windows Server`  

## Dependencies
[Solution - SMB1 Access Audit](/docs/b9c24693-91db-4014-a5d9-7208d7fe492a)  
[Automation - SMB1 Access Audit And Detection](/docs/a65607e3-42b0-473c-bf09-36e63107a835)

## Compound Condition Creation 

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/smb1-access-audit-and-detection.toml)

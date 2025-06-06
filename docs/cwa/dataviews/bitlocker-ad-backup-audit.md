---
id: '1bd41d12-c68a-4e68-a7eb-ac2d58538187'
slug: /1bd41d12-c68a-4e68-a7eb-ac2d58538187
title: 'Bitlocker - AD Backup Audit'
title_meta: 'Bitlocker - AD Backup Audit'
keywords: ['bitlocker', 'key', 'protectors', 'active', 'directory', 'backup']
description: 'This document provides an overview of the Bitlocker key protectors that have been backed up to Active Directory, including details about the audited domain controller and the status of each key protector.'
tags: ['active-directory', 'backup', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays Bitlocker key protectors backed up to Active Directory.

## Dependencies

- [SEC - Encryption - Script - Bitlocker - Audit AD Key Protector Backups](/docs/d533538b-8b00-425e-849f-434518296b2d)  
- [SEC - Encryption - Custom Table - plugin_proval_ad_bitlocker_keyprotectors](/docs/23777e5f-2cdd-414c-9938-2293223df3ac)  

## Columns

| Column             | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| DCComputerID       | The ComputerID of the audited domain controller.                           |
| DC                 | The name of the audited domain controller.                                  |
| Client             | The client of the audited domain controller.                                |
| KeyProtectorDN     | The full DN of the audited key protector.                                   |
| KeyProtectorName   | The name of the audited key protector.                                      |
| Created            | The date and time that the key protector was backed up to AD.              |
| Deleted            | True or False indicating if the key protector was deleted from AD.         |
| RecoveryGUID       | The GUID of the key protector (KeyProtectorID on the local machine).       |
| RecoveryPassword   | The recovery password (if applicable) for the key protector.               |
| VolumeGUID         | The GUID of the volume that is protected by the key protector.              |
| ParentDN           | The full DN of the parent of the key protector object in AD (generally a computer object). |
| ParentSID          | The SID of the parent of the key protector object in AD (generally a computer object). |
| LastScan           | The date and time that the audit was last run.                             |
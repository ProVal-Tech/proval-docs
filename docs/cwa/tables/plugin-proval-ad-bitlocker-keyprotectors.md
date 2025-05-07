---
id: '23777e5f-2cdd-414c-9938-2293223df3ac'
slug: /23777e5f-2cdd-414c-9938-2293223df3ac
title: 'plugin_proval_ad_bitlocker_keyprotectors'
title_meta: 'plugin_proval_ad_bitlocker_keyprotectors'
keywords: ['bitlocker', 'active', 'directory', 'key', 'protectors', 'backup', 'audit']
description: 'This document provides information about BitLocker key protectors that have been backed up to Active Directory. It includes details about the data gathered by the associated audit script, as well as the structure of the database table used to store this information.'
tags: ['active-directory', 'backup', 'database', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores information about BitLocker key protectors backed up to Active Directory. Data gathered by [SEC - Encryption - Script - BitLocker - AD Key Protector - Audit](/docs/d533538b-8b00-425e-849f-434518296b2d)

## Dependencies

@script

## Tables

#### plugin_proval_ad_bitlocker_keyprotectors

| Column                   | Type     | Explanation                                                                                           |
|-------------------------|----------|-------------------------------------------------------------------------------------------------------|
| ComputerID              | INT      | The ComputerID of the domain controller that the audit was performed against.                        |
| DistinguishedName       | TEXT     | The full DN of the audited key protector.                                                             |
| Name                    | VARCHAR  | The name of the audited key protector.                                                                |
| Created                 | DATETIME | The date and time that the key protector was backed up to AD.                                        |
| Deleted                 | TINYINT  | True or False if the key protector was deleted from AD.                                              |
| RecoveryGUID            | VARCHAR  | The GUID of the key protector (KeyProtectorID on the local machine).                                 |
| RecoveryPassword        | VARCHAR  | The recovery password (if applicable) for the key protector.                                         |
| VolumeGUID              | VARCHAR  | The GUID of the volume that is protected by the key protector.                                        |
| ParentDistinguishedName | TEXT     | The full DN of the parent of the key protector object in AD (generally a computer object).           |
| ParentSID               | VARCHAR  | The SID of the parent of the key protector object in AD (generally a computer object).               |
| Timestamp               | DATETIME | The date and time that the audit was last run.                                                       |


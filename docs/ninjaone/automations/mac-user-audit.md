---
id: '4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97'
slug: /4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97
title: 'Mac User Audit'
title_meta: 'Mac User Audit'
keywords: ['user', 'profiles', 'data', 'gather', 'information']
description: 'Audits local and directory based macOS user accounts'
tags: ['report', 'security']
draft: False
unlisted: false
last_update:
  date: 2026-08-14
---

## Overview
Audits local and directory based macOS user accounts and updates [Custom field - cPVAL MAC User Audit](/docs/01108e2-70fe-4510-8614-11081d489ffc) with the collected user account information.

## Sample Run

## Dependencies

- [Custom field - cPVAL MAC User Audit](/docs/01108e2-70fe-4510-8614-11081d489ffc)
- [Solution - Mac Users Audit](/docs/d4d9f6a6-92f9-4a6c-a197-136ff523c547)

## Custom Fields

| Field Name | Type | Mandatory | Scope | Description |
| ---------- | ---- | --------- | ----- | ----------- |
| cPVAL MAC User Audit | WYSIWYG | False | Devices | Displays local macOS user account details, including username, account type, status, UID, and last login information. This custom field is updated by the script |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/mac-user-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-08-14

- Initial version of the document


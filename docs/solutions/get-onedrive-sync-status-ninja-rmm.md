---
id: '22d8abe0-2ea4-48e9-8b02-6108cd2de889'
slug: /22d8abe0-2ea4-48e9-8b02-6108cd2de889
title: 'Get OneDrive Sync Status'
title_meta: 'Get OneDrive Sync Status'
keywords: ['onedrive', 'sync']
description: 'This is a Ninja RMM solution that uses the agnostic ODSyncUtil script to populate the OneDrive sync status of the users.'
tags: ['onedrive']
draft: false
unlisted: false
last_update:
  date: 2026-06-08
---

## Purpose

This is a Ninja RMM solution that uses the [ODSyncUtil](https://github.com/rodneyviana/ODSyncUtil/tree/master/ODSyncUtil) to populate the OneDrive sync status of the users and store it to the custom fields.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915)     | Script | NinjaRMM wrapper for the agnostic script [Get-ODStatus](https://github.com/rodneyviana/ODSyncUtil/blob/master/ODSyncUtil/Get-ODStatus.ps1)  that retrieves the OneDrive Sync Status and Quota Information. This data is then stored in a custom field [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f). |
|[cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f) | Custom Field | This device custom field stores the OneDrive Sync Status gathered by the automation [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915). |
|[cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56) | Custom Field | This device custom field stores the OneDrive Sync Status gathered by the automation [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915). It can be used to audit the agents where sync is failed. |
|[OneDrive Sync Failure Audit](/docs/301bd2d5-ba87-4bf2-ae1b-c1165c7347e7) | Group | This group includes agents for which OneDrive is not syncing properly or where the user is not logged in to OneDrive. |
|[OneDrive Sync Audit](/docs/156a5913-4d5d-45ad-9cfc-313bb3b7a21d)  | Group | This group shows information from the custom field [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56) on computers for OneDrive sync auditing. |

## Implementation

- Create the script [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915) 
- Create the below custom fields:
  -  [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f)
  - [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56)
- Create the below groups:
  - [OneDrive Sync Failure Audit](/docs/301bd2d5-ba87-4bf2-ae1b-c1165c7347e7)
  - [OneDrive Sync Audit](/docs/156a5913-4d5d-45ad-9cfc-313bb3b7a21d)
- Schedule the Automation that triggers the script weekly (recommended) to the target as requested by the client.

## FAQ

**Q.** Does this capture the status for the not signed case where the OneDrive process is running, but no user is signed in?  

**A.** Yes

## Changelog

### 2026-06-08

- Updated the [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915) to update custom field "cPVAL OneDrive Sync Status Audit" if onedrive process is not running.
- Updated Group configuration to include the computers where OneDrive process is not running.

### 2026-04-08

- Initial version of the document
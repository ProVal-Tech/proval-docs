---
id: 'cfba27cd-1b8d-4e4f-810a-0c5885ae840d'
slug: /cfba27cd-1b8d-4e4f-810a-0c5885ae840d
title: 'VSS Admin Storage Audit and Resize'
title_meta: 'VSS Admin Storage Audit and Resize'
keywords: ['vssadmin', 'shadow', 'copies', 'audit', 'resize']
description: 'This document outlines a solution for auditing VSSAdmin shadow copies and resizing them if necessary. It includes associated content such as reports, tables, and scripts that assist in the auditing and resizing processes.'
tags: ['database', 'report', 'storage']
draft: false
unlisted: false
---

## Purpose

This solution audits VSSAdmin shadow copies and, if needed, will resize them.

## Associated Content

| Content                                                                                 | Type      | Function                                                                                             |
|-----------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------|
| [VSSAdmin Storage Report](https://proval.itglue.com/5078775/docs/10728930)           | Dataview  | This shows the report of VSSAdmin storage of the agent                                              |
| [VSSAdmin Data Table](https://proval.itglue.com/5078775/docs/10728928)               | Table     | `plugin_proval_vssadminstorage`, this table stores the VSSAdmin data                                 |
| [VSSAdmin Auditing Script](https://proval.itglue.com/5078775/docs/10728929)          | Script    | This script helps to perform the VSSAdmin auditing using PowerShell                                 |
| [VSSAdmin Resize Script](https://proval.itglue.com/5078775/docs/10728931)            | Script    | This script helps to resize the VSSAdmin MAX value and modify the data in the table as well.       |

## Implementation

The [VSSAdmin List Storage Audit](/docs/0de90f98-d7ae-4a79-a851-30829a596846) script must be run to start the process. After that, the [VSS Resize](/docs/0600e89c-06a5-42da-9ed8-41e43d9cfd7d) script can be used to resize the VSSAdmin storage.

## FAQ

*(This section can be filled out with frequently asked questions related to the auditing and resizing of VSSAdmin shadow copies.)*



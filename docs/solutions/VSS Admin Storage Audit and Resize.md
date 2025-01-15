---
id: 'cfba27cd-1b8d-4e4f-810a-0c5885ae840d'
title: 'Audit and Resize VSSAdmin Shadow Copies'
title_meta: 'Audit and Resize VSSAdmin Shadow Copies'
keywords: ['vssadmin', 'shadow', 'copies', 'audit', 'resize']
description: 'This document outlines a solution for auditing vssadmin shadow copies and resizing them if necessary. It includes associated content such as reports, tables, and scripts that assist in the auditing and resizing processes.'
tags: ['audit', 'resize', 'storage', 'script', 'report', 'database']
draft: false
unlisted: false
---
## Purpose

This solution audits vssadmin shadow copies and if needed, will resize them.

## Associated Content

| Content                                                                                 | Type      | Function                                                                                             |
|-----------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------|
| [https://proval.itglue.com/5078775/docs/10728930](https://proval.itglue.com/5078775/docs/10728930) | Dataview  | This shows the report of vssadmin storage of the agent                                              |
| [https://proval.itglue.com/5078775/docs/10728928](https://proval.itglue.com/5078775/docs/10728928) | Table     | plugin_proval_vssadminstorage, this table stores the vssadmin data                                  |
| [https://proval.itglue.com/5078775/docs/10728929](https://proval.itglue.com/5078775/docs/10728929) | Script    | This script helps to perform the vssadmin auditing using PowerShell                                 |
| [https://proval.itglue.com/5078775/docs/10728931](https://proval.itglue.com/5078775/docs/10728931) | Script    | This script helps to resize the vssadmin MAX value and modify the data in the table as well.       |

## Implementation

The [Vssadmin List Storage Audit](https://proval.itglue.com/DOC-5078775-10728929) script must be run to start the process. After that, the [VSS Resize](https://proval.itglue.com/DOC-5078775-10728931) script can be used to resize the vssadmin storage.

## FAQ










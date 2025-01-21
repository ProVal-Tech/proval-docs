---
id: 'f83e6218-da9e-451c-b8ec-fd57d32690f6'
title: 'A Complete Drive Monitoring Solution for the VSA'
title_meta: 'A Complete Drive Monitoring Solution for the VSA'
keywords: ['drive', 'monitoring', 'solution', 'vsa', 'disk']
description: 'This document outlines a comprehensive drive monitoring solution for Kaseya VSA, detailing associated procedures, custom fields, monitor sets, views, and policies necessary for effective implementation and management of disk monitoring on endpoints.'
tags: ['disk']
draft: false
unlisted: false
---

## Purpose

A Complete Drive Monitoring Solution for the VSA

## Associated Content

| Content                                                                                           | Type                | Function                                                            |
|---------------------------------------------------------------------------------------------------|---------------------|---------------------------------------------------------------------|
| [EMP - Disk - Agent Procedure - Soji - Disk Cleaner](<../vsa/procedures/Soji - Disk Cleaner.md>) | Agent Procedure      | Performs a disk cleanup on the endpoint. Configurable.             |
| [EPM - Disk - Agent Procedure - Drive List Collection](<../vsa/procedures/Drive List Collection.md>) | Agent Procedure      | Collects all actual physical drive letters for application via view/policy |
| [EPM - Disk - Custom Field - xPVAL Drive List](<../vsa/custom-fields/xPVAL Drive List.md>) | Machine Custom Field | Stores distinct physical drive letters on the endpoint              |
| [EPM - Disk - Monitor Set - VSA HDD Monitoring Solution Monitor Sets](https://proval.itglue.com/DOC-5078775-10793257) | Multiple Monitor Sets | Monitors the specified drive letter for low capacity               |
| [EPM - Disk - View - VSA HDD Monitoring Solution Views](<../vsa/views/VSA HDD Monitoring Solution Views.md>) | Multiple Views       | Shows all endpoints with the specified Drive Letter                 |
| [EPM - Disk - Policy - VSA HDD Monitoring Solution Policies](<../vsa/policies/VSA HDD Monitoring Solution Policies.md>) | Multiple Policies    | Assigns monitoring to all endpoints with the specified drive letter. |

## Implementation

1. Create the Machine Custom Field.
2. Import both Procedures.
3. Import all Views and ensure the advanced filter is properly set on each.
4. Import all Monitor Sets.
5. Import all Policies.


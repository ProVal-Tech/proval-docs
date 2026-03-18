---
id: '1e54cc97-a5af-4dc9-9d79-00fd052c8454'
slug: /1e54cc97-a5af-4dc9-9d79-00fd052c8454
title: 'Windows 11 Machines'
title_meta: 'Windows 11 Machines'
keywords: ['windows-11', 'feature-update', 'feature-update-deferral', 'defer-feature-update', 'windows-update-policy', 'operating-system']
description: 'This group contains all Windows 11 machines.'
tags: ['windows', 'patching', 'registry']
draft: false
unlisted: false
last_update:
  date: 2026-03-11
---

## Summary

This group contains all Windows 11 machines.

## Dependencies

- [Solution: Manage Feature Update Deferral](/docs/800f96cd-5e64-48dd-bb9a-f17822db38e8)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Windows 11 Machines`  
- **Category:** `Operating System`  
- **Description:** `This group contains all Windows 11 machines.`

![Image1](../../../static/img/docs/1e54cc97-a5af-4dc9-9d79-00fd052c8454/image1.webp)

## Group Criteria

The group is defined by the following **criteria block**. The block uses **AND** logic between its conditions.

| Block | Criteria Name          | Operator        | Value(s)                                 |
|-------|-----------------------|-----------------|-------------------------------------------|
| 1     | OS         | Contains any of | `Microsoft Windows 11` |

- **Block 1:** Targets Windows 11 machines where the company-level custom field "Days to Defer Feature Updates" is not empty.

**Logic:**  
A machine matches the group if it meets ALL criteria in Block 1.

![Image2](../../../static/img/docs/1e54cc97-a5af-4dc9-9d79-00fd052c8454/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/1e54cc97-a5af-4dc9-9d79-00fd052c8454/image3.webp)

## Changelog

### 2026-03-11

- Initial version of the document

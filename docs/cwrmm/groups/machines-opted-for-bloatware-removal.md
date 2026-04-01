---
id: '9ab7b938-24e3-47dc-b884-487ca0a8188f'
slug: /9ab7b938-24e3-47dc-b884-487ca0a8188f
title: 'Machines Opted for Bloatware Removal'
title_meta: 'Machines Opted for Bloatware Removal'
keywords:  ['bloatware', 'pua', 'remove-pua', 'remove-bloatware', 'uninstallation', 'application-management']
description: 'This includes Windows machines on which bloatware removal is enabled.'
tags:  ['windows', 'uninstallation', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-03-30
---

## Summary
This includes Windows machines on which bloatware removal is enabled.

## Dependencies

- [Solution - Remove Bloatware](/docs/0b1f4077-1cf3-43ea-9c9d-93e2db94e24f)


## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Machines Opted for Bloatware Removal`  
- **Description:** `This includes Windows machines on which bloatware removal is enabled.`

![Image1](../../../static/img/docs/9ab7b938-24e3-47dc-b884-487ca0a8188f/image1.webp)

## Group Criteria

The group is defined by the following **criteria blocks**, joined by an **OR**. Each block uses **AND** logic between its conditions.

| Block | Criteria Name          | Operator        | Value(s)                                 |
|-------|-----------------------|-----------------|-------------------------------------------|
| 1     | Enable Bloatware Removal | Contains any of | `Windows Workstations`, `Both`|
| 1     | Exclude Bloatware Removal (Site) | Equal           | `False`              |
| 1     | Exclude Bloatware Removal (Endpoint) | Equal           | `False`              |
| 1     | OS Type                | Equal           | `Windows`       |
| 1     | Endpoint Type          | Not Equal       | `Server`        |
| 1     | Available        | Equals     | `True`        |
| 2     | Enable Bloatware Removal | Contains any of | `Windows Servers`, `Both` |
| 2     | Exclude Bloatware Removal  (Site) | Equal           | `False`     |
| 2     | Exclude Bloatware Removal (Endpoint) | Equal           | `False`     |
| 2     | OS Type                | Equal           | `Windows`     |
| 2     | Endpoint Type          | Equal           | `Server`      |
| 2     | Available        | Equals     | `True`        |


- **Block 1:** Targets Windows Workstations
- **Block 2:** Targets Windows Servers

**Logic:**  
A machine joins the group if it meets ALL criteria in Block 1 OR ALL criteria in Block 2.

![Image2](../../../static/img/docs/9ab7b938-24e3-47dc-b884-487ca0a8188f/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/9ab7b938-24e3-47dc-b884-487ca0a8188f/image3.webp)

## Changelog

### 2026-03-30

- Initial version of the document

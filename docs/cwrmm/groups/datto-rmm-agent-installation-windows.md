---
id: 'f2349473-6980-4336-a294-37d9cdbc7e4d'
slug: /f2349473-6980-4336-a294-37d9cdbc7e4d
title: 'Datto RMM Agent Installation [Windows]'
title_meta: 'Datto RMM Agent Installation [Windows]'
keywords: ['datto-rmm', 'migration', 'datto']
description: 'Group of Windows devices where the Datto RMM Agent is not installed, and auto‑installation is enabled.'
tags: ['application', 'installation']
draft: false
unlisted: false
---

## Summary

Group of Windows devices where the Datto RMM Agent is not installed, and auto‑installation is enabled.

## Dependencies

- [Custom Field: Datto RMM Site ID](/docs/b5af697b-7eeb-4395-8962-44b76645fdc5)
- [Solution : Deploy Datto RMM Agent](/docs/b646e989-5515-4bda-9728-107ac03cdc07)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Datto RMM Agent Installation [Windows]`  
- **Description:** `Group of Windows devices where the Datto RMM Agent is not installed, and auto‑installation is enabled.`

![Image1](../../../static/img/docs/f2349473-6980-4336-a294-37d9cdbc7e4d/image1.webp)

## Group Criteria

The group is defined by the following **criteria block**. Each block uses **AND** logic between its conditions.

| Block | Criteria Name          | Operator        | Value(s)                                 |
|-------|-----------------------|-----------------|-------------------------------------------|
| 1     | Datto RMM Site ID      | Is Blank | `False` |
| 1     | Datto RMM Site ID      | Not Equal | `NA` |
| 1     | OS Type                | Equal           | `Windows` |

- **Block 1:** Targets Windows machines (Both Servers and Workstations).

**Logic:**  
A machine matches the group if it meets ALL criteria in Block 1.

![Image2](../../../static/img/docs/f2349473-6980-4336-a294-37d9cdbc7e4d/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/f2349473-6980-4336-a294-37d9cdbc7e4d/image3.webp)

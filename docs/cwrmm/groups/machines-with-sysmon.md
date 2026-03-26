---
id: '03938ade-e9a6-4f71-b0d6-3208659796f5'
slug: /03938ade-e9a6-4f71-b0d6-3208659796f5
title: 'Machines with Sysmon'
title_meta: 'Machines with Sysmon'
keywords: ['sysmon', 'windows','configuration', 'installation', 'endpoint']
description: 'Includes machines with Sysmon installed on them.'
tags: ['installation','windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-26
---

## Summary
Includes machines with Sysmon installed on them.

## Dependencies

- [Solution - Sysmon Solution ](/docs/2db51f41-1313-46c4-81f1-8c67ed578b73) 

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Machines with Sysmon`  
- **Category:** `Application`  
- **Description:** `Includes machines with Sysmon installed on them.`

![Image](../../../static/img/docs/03938ade-e9a6-4f71-b0d6-3208659796f5/image1.webp)

## Group Criteria

The group is defined by the following **criteria** joined by `AND` condition.

| Criteria Name   | Operator   | Value(s)   |
|------------|--------|-----------|
| Available   | Equal    | `True` |
| OS Type  | Equal    | `Windows` |
| Service Display Name | Contains any of  | `Sysmon` |


## Completed Group

![Image](../../../static/img/docs/03938ade-e9a6-4f71-b0d6-3208659796f5/image2.webp)

## Changelog

### 2026-03-26

- Initial version of the document

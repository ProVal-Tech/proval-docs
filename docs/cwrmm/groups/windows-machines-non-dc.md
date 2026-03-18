---
id: 'aa76fac8-dac7-44d9-897d-d0f6f15609dc'
slug: /aa76fac8-dac7-44d9-897d-d0f6f15609dc
title: 'Windows Machines (Non‑DC)'
title_meta: 'Windows Machines (Non‑DC)'
keywords:  ['windows', 'group', 'dynamic', 'machines', 'criteria']
description: 'This group contains online windows machines excluding Domain Controllers.'
tags: ['setup', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-11
---

## Summary

This group contains online windows machines excluding Domain Controllers.

## Dependencies

- [Solution - Windows User Profiles](/docs/0ebb7e89-d2d8-40d4-ba1e-330ab20f86cd)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Windows Machines (Non‑DC)`  
- **Category:** `Auditing`  
- **Description:** `This group contains online windows machines excluding Domain Controllers`

![Image1](../../../static/img/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc/image1.webp)

## Group Criteria

The group is defined by the following **criteria** joined by `AND` condition.

| Criteria Name          | Operator        | Value(s)                                 |
|-----------------------|-----------------|-------------------------------------------|
| Service Display Name      | Does Not Contain any of   | `Active Directory Domain Services` |
| Available   | Equal    | `True` |
| OS Type  | Equal    | `Windows` |


## Completed Group

![Image4](../../../static/img/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc/image2.webp)

## Changelog

### 2026-03-11

- Initial version of the document
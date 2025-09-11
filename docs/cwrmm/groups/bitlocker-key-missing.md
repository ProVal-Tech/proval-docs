---
id: '819b7ac8-aa64-41b8-84d0-2123df0ef68e'
slug: /819b7ac8-aa64-41b8-84d0-2123df0ef68e
title: 'BitLocker Key Missing'
title_meta: 'BitLocker Key Missing'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password', 'backup', 'domain']
description: 'Group of machines where BitLocker Key was not found.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
---

## Summary

Group of machines where BitLocker Key was not found.

## Dependencies
- [Custom Field - BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f)
- [Task - BitLocker Recovery Key Backup](/docs/b469ea90-0c1b-421b-89e2-be5c91501035)
- [Solution - BitLocker Key Backup](/docs/fecda0ff-5a3e-4cc5-b6a7-fd37732aa2e9)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `BitLocker Key Missing`  
- **Description:** `Group of machines where BitLocker Key was not found.`

![Image1](../../../static/img/docs/819b7ac8-aa64-41b8-84d0-2123df0ef68e/image1.webp)

## Group Criteria

The group is defined by the following **criteria**:

| Block | Criteria Name          | Operator        | Value(s)                                 |
|-------|-----------------------|-----------------|-------------------------------------------|
| 1     | BitLocker Key Backup Status        | Contains any of | `Not Available` |

**Logic:**  
A machine matches the group if it meets ALL criteria in Block 1.

![Image2](../../../static/img/docs/819b7ac8-aa64-41b8-84d0-2123df0ef68e/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/819b7ac8-aa64-41b8-84d0-2123df0ef68e/image3.webp)

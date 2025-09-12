---
id: '5cedafdb-6a2f-4ec5-9c46-869986eb186e'
slug: /5cedafdb-6a2f-4ec5-9c46-869986eb186e
title: 'BitLocker Key Backup Successful'
title_meta: 'BitLocker Key Backup Successful'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password', 'backup', 'domain']
description: 'Group of machines where BitLocker Key Backup Successful.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
---

## Summary

Group of machines where BitLocker Key Backup Successful.

## Dependencies


- [Custom Field - BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f)
- [Task - BitLocker Recovery Key Backup](/docs/b469ea90-0c1b-421b-89e2-be5c91501035)
- [Solution - BitLocker Key Backup](/docs/fecda0ff-5a3e-4cc5-b6a7-fd37732aa2e9)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `BitLocker Key Backup Successful`  
- **Description:** `Group of machines where BitLocker Key Backup Successful.`

![Image1](../../../static/img/docs/5cedafdb-6a2f-4ec5-9c46-869986eb186e/image1.webp)

## Group Criteria

The group is defined by the following **criteria**:

| Block | Criteria Name          | Operator        | Value(s)                                 |
|-------|-----------------------|-----------------|-------------------------------------------|
| 1     | BitLocker Key Backup Status        | Contains any of | `All BitLocker keys are backed up successfully` |

**Logic:**  
A machine matches the group if it meets ALL criteria in Block 1.

![Image2](../../../static/img/docs/5cedafdb-6a2f-4ec5-9c46-869986eb186e/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/5cedafdb-6a2f-4ec5-9c46-869986eb186e/image3.webp)

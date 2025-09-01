---
id: '848f6711-4aef-47a7-b221-1c44af841843'
slug: /848f6711-4aef-47a7-b221-1c44af841843
title: 'BitLocker Disabled'
title_meta: 'BitLocker Disabled'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password']
description: 'Group of machines where BitLocker is disabled.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
---

## Summary

Group of machines where BitLocker is disabled.

## Dependencies

- [Custom Field - Enable BitLocker Status Audit](/docs/c917557c-89d3-4487-a5f1-56ffd0fdac9c)
- [Custom Field - Disable BitLocker Status Audit](/docs/fb66191c-89d5-4712-a4a3-e1c90f943b7b)
- [Custom Field - Disable BitLocker Status Audit](/docs/bf4fbfbb-28ae-4357-a81c-f407fa847128)
- [Custom Field - BitLocker Status and Key](/docs/a7785954-5a6d-4003-9d0e-c919e1a96b0c)
- [Group - BitLocker Status Audit Enabled](/docs/8d034710-66c7-4f8e-8feb-740c9fa109f2)
- [Task - BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015)
- [Solution - BitLocker Status and Recovery Key Audit](/docs/b2a974b2-c231-4197-a639-d0775d77d7c7)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `BitLocker Disabled`  
- **Description:** `Group of machines where BitLocker is disabled.`

![Image1](../../../static/img/docs/848f6711-4aef-47a7-b221-1c44af841843/image1.webp)

## Group Criteria

The group is defined by the following **criteria**:

| Block | Criteria Name          | Operator        | Value(s)                                 |
|-------|-----------------------|-----------------|-------------------------------------------|
| 1     | BitLocker Status and Key        | Contains any of | `Disabled` |

**Logic:**  
A machine matches the group if it meets ALL criteria in Block 1.

![Image2](../../../static/img/docs/848f6711-4aef-47a7-b221-1c44af841843/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/848f6711-4aef-47a7-b221-1c44af841843/image3.webp)

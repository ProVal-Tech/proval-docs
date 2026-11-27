---
id: 'c114a048-e3f7-4fdf-8cb5-047311bdb66c'
slug: /c114a048-e3f7-4fdf-8cb5-047311bdb66c
title: 'Entra Password Protection Proxy Health'
title_meta: 'Entra Password Protection Proxy Health'
keywords: ['entra', 'password-protection', 'proxy', 'dynamic-group', 'monitoring']
description: 'Windows servers with the Entra Password Protection Proxy installed where monitoring is turned on through the EPP_Monitoring custom fields.'
tags: ['active-directory', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **Entra Password Protection Proxy Health** group holds the Windows servers that have the Entra Password Protection Proxy installed, where monitoring is turned on through the EPP_Monitoring custom fields. The [Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd) task is scheduled against it, and the [Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2) monitor targets it.

The `Installed Software Name` criterion keeps the group to proxy servers, so turning monitoring on for a whole company doesn't add its other devices. The most specific level that holds a value wins: endpoint, then site, then company.

## Dependencies

- [Custom Field: EPP_Monitoring](/docs/bec78a0c-3524-45c2-8229-46daadacb5e6)
- [Custom Field: EPP_Monitoring_Site](/docs/f0aac000-1eb0-4f95-bf9a-d3d4b453e870)
- [Custom Field: EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13)
- [Task: Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd)
- [Monitor: Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2)
- [Solution: Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Entra Password Protection Proxy Health`
- **Category:** `Security`
- **Description:** `Windows servers with the Entra Password Protection Proxy installed, where monitoring is turned on through the EPP_Monitoring custom fields.`

![Image1](../../../static/img/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c/image1.webp)

## Criteria

The group is defined by the following **criteria blocks**, joined by an **OR**. Each block uses **AND** logic between its conditions.

| Block | Criteria Name | Operator | Value(s) |
|-------|---------------|----------|----------|
| 1 | EPP_Monitoring | Contains any of | `Enabled` |
| 1 | EPP_Monitoring_Site | Does Not Contain any of | `Disabled` |
| 1 | EPP_Monitoring_Endpoint | Does Not Contain any of | `Disabled` |
| 1 | OS Type | Contains any of | `Windows` |
| 1 | Installed Software Name | Contains any of | `Password Protection Proxy` |
| 2 | EPP_Monitoring_Site | Contains any of | `Enabled` |
| 2 | EPP_Monitoring_Endpoint | Does Not Contain any of | `Disabled` |
| 2 | OS Type | Contains any of | `Windows` |
| 2 | Installed Software Name | Contains any of | `Password Protection Proxy` |
| 3 | EPP_Monitoring_Endpoint | Contains any of | `Enabled` |
| 3 | OS Type | Contains any of | `Windows` |
| 3 | Installed Software Name | Contains any of | `Password Protection Proxy` |

- **Block 1:** Windows devices with the proxy installed whose company (**EPP_Monitoring**) is `Enabled`, unless the site (**EPP_Monitoring_Site**) or the device (**EPP_Monitoring_Endpoint**) is set to `Disabled`.
- **Block 2:** Windows devices with the proxy installed whose site (**EPP_Monitoring_Site**) is `Enabled`, unless the device (**EPP_Monitoring_Endpoint**) is set to `Disabled`.
- **Block 3:** Windows devices with the proxy installed that are included directly with **EPP_Monitoring_Endpoint** set to `Enabled`.

**Logic:**  
A device matches the group if it meets **ALL** criteria in **Block 1**, **OR** **ALL** criteria in **Block 2**, **OR** **ALL** criteria in **Block 3**.

![Image2](../../../static/img/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c/image3.webp)

## Implementation

Install the group from the `ProVal - Content` Community, selecting the **Groups** repository. Install the three EPP_Monitoring custom fields first, because the criteria use them.

![Image4](../../../static/img/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c/image4.webp)

## Changelog

### 2026-11-27

- Initial version of the document

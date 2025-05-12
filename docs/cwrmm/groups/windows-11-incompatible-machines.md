---
id: '6b52f66a-4b64-4d36-9f9f-74379510cf68'
slug: /6b52f66a-4b64-4d36-9f9f-74379510cf68
title: 'Windows 11 incompatible machines'
title_meta: 'Windows 11 incompatible machines'
keywords: ['windows', 'group', 'incompatible', 'machines', 'custom', 'criteria']
description: 'This document provides a step-by-step guide on how to create a dynamic group in ConnectWise RMM for Windows 10 computers that are not compatible with Windows 11. It includes instructions on setting up custom fields and criteria to accurately identify incompatible machines.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to identify Windows 10 computers that are not compatible with Windows 11.

## Dependencies

[CW RMM - Custom Field - Endpoint - Windows 11 Compatible](/docs/99719e54-ce8f-4b76-93f4-cc832a3b88cf)

## Group Creation

Navigate to `Devices` > `Device Groups`.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_1.webp)

### 1. Create a Dynamic Group

Create a new dynamic group by clicking the `Dynamic Group` button.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_2.webp)

This page will appear after clicking on the `Dynamic Group` button:

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_3.webp)

### 2. Set Group Name and Description

Set the group name to `Windows 11 incompatible machines`.  
Description: `Windows 10 computers which are not compatible with Windows 11.`

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_4.webp)

### 3. Add Criteria

Click the `+ Add Criteria` button in the `Criteria` section of the group.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_5.webp)

This search box will appear.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_6.webp)

### 4. Select Custom Field

Search and select the `Windows 11 compatible` custom field from the search box.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_7.webp)

Set `No` in the comparison condition.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_8.webp)

**Condition:** `Enable Windows 11 Compatible` `Contains any of` `No`

### 5. Add Additional Criteria

Click the `+ Add Criteria` button.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_9.webp)

A new search box will appear.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_10.webp)

Search and select the `OS` criteria.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_11.webp)

Select `Microsoft Windows 10` in the comparison condition.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_12.webp)  
![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_13.webp)

**Condition:** `OS` `Contains any of` `Microsoft Windows 10`

### 6. Save the Group

Click the `Save` button to save/create the group.

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_14.webp)

## Completed Group

![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_15.webp)  
![Image](../../../static/img/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68/image_16.webp)
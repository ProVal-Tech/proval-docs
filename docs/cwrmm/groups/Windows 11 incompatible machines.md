---
id: '6b52f66a-4b64-4d36-9f9f-74379510cf68'
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

[CW RMM - Custom Field - Endpoint - Windows 11 Compatible](<../custom-fields/Endpoint - Windows 11 Compatible.md>)

## Group Creation

Navigate to `Devices` > `Device Groups`.

![Image](../../../static/img/Windows-11-incompatible-machines/image_1.png)

### 1. Create a Dynamic Group

Create a new dynamic group by clicking the `Dynamic Group` button.

![Image](../../../static/img/Windows-11-incompatible-machines/image_2.png)

This page will appear after clicking on the `Dynamic Group` button:

![Image](../../../static/img/Windows-11-incompatible-machines/image_3.png)

### 2. Set Group Name and Description

Set the group name to `Windows 11 incompatible machines`.  
Description: `Windows 10 computers which are not compatible with Windows 11.`

![Image](../../../static/img/Windows-11-incompatible-machines/image_4.png)

### 3. Add Criteria

Click the `+ Add Criteria` button in the `Criteria` section of the group.

![Image](../../../static/img/Windows-11-incompatible-machines/image_5.png)

This search box will appear.

![Image](../../../static/img/Windows-11-incompatible-machines/image_6.png)

### 4. Select Custom Field

Search and select the `Windows 11 compatible` custom field from the search box.

![Image](../../../static/img/Windows-11-incompatible-machines/image_7.png)

Set `No` in the comparison condition.

![Image](../../../static/img/Windows-11-incompatible-machines/image_8.png)

**Condition:** `Enable Windows 11 Compatible` `Contains any of` `No`

### 5. Add Additional Criteria

Click the `+ Add Criteria` button.

![Image](../../../static/img/Windows-11-incompatible-machines/image_9.png)

A new search box will appear.

![Image](../../../static/img/Windows-11-incompatible-machines/image_10.png)

Search and select the `OS` criteria.

![Image](../../../static/img/Windows-11-incompatible-machines/image_11.png)

Select `Microsoft Windows 10` in the comparison condition.

![Image](../../../static/img/Windows-11-incompatible-machines/image_12.png)  
![Image](../../../static/img/Windows-11-incompatible-machines/image_13.png)

**Condition:** `OS` `Contains any of` `Microsoft Windows 10`

### 6. Save the Group

Click the `Save` button to save/create the group.

![Image](../../../static/img/Windows-11-incompatible-machines/image_14.png)

## Completed Group

![Image](../../../static/img/Windows-11-incompatible-machines/image_15.png)  
![Image](../../../static/img/Windows-11-incompatible-machines/image_16.png)




---
id: '1b2c0555-1eea-4816-bbfc-bca1e29c9d5c'
slug: /1b2c0555-1eea-4816-bbfc-bca1e29c9d5c
title: 'Windows 10 - Build Out of DateBuild Up to Date'
title_meta: 'Windows 10 - Build Out of DateBuild Up to Date'
keywords: ['windows', 'device', 'group', 'upgrade', 'assistance']
description: 'This document provides a guide on creating two specific device groups related to the Windows 10 Upgrade Assistance solution within ConnectWise RMM. It includes steps for creating dynamic groups and details on criteria for each group.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

There are two device groups related to the Windows 10 Upgrade Assistance solution. Please see the guide below to create separate device groups.

## Dependencies

- [CW RMM - Custom Field - Win10UpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de)
- [CW RMM - Task - Feature Update Install (Windows 10) With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)
- [CW RMM - Task - Windows 10 Feature Update Attempt Tracking (Subscript)](/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c)

## Create Device Groups

There are two device groups for this solution. To create device groups, please navigate to **Devices > Device Groups**.

**![Add Dynamic Group](../../../static/img/docs/1b2c0555-1eea-4816-bbfc-bca1e29c9d5c/image_1.webp)**

Select **Add > Dynamic Group**.

![Dynamic Group](../../../static/img/docs/1b2c0555-1eea-4816-bbfc-bca1e29c9d5c/image_2.webp)

Please repeat the above steps for each device group.

---

### Device Group Name: Windows 10 - Build Up to Date

![Windows 10 - Build Up to Date](../../../static/img/docs/1b2c0555-1eea-4816-bbfc-bca1e29c9d5c/image_3.webp)

**Description:** Machines that are up to the latest Windows 10 feature build.  
**Criteria:**  
![Criteria](../../../static/img/docs/1b2c0555-1eea-4816-bbfc-bca1e29c9d5c/image_4.webp)

When adding criteria, please search for the **OS Version**.  
**Equal:** 10.0.19045  
**AND**  
**Endpoint Type**  
**Equal:** Desktop  
**AND**  
**OS Product**  
**Contains any of:** Windows 10  

This group holds all workstations that are up to the latest feature build.

---

### Device Group Name: Windows 10 - Build Out of Date

![Windows 10 - Build Out of Date](../../../static/img/docs/1b2c0555-1eea-4816-bbfc-bca1e29c9d5c/image_5.webp)

**Description:** Machines that are not up to the latest Windows 10 feature build.  
**Criteria:**  
![Criteria](../../../static/img/docs/1b2c0555-1eea-4816-bbfc-bca1e29c9d5c/image_6.webp)

When adding criteria, please search for the **OS Version**.  
**Not Equal:** 10.0.19045  
**AND**  
**Endpoint Type**  
**Equal:** Desktop  
**AND**  
**OS Product**  
**Contains any of:** Windows 10  

This group holds all workstations that are not up to the latest feature build.
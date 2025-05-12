---
id: 'b9c9e1fe-57af-4816-befb-f2701ba009ba'
slug: /b9c9e1fe-57af-4816-befb-f2701ba009ba
title: 'Feature Pack Update Automation'
title_meta: 'Feature Pack Update Automation'
keywords: ['windows', 'build', 'update', 'group', 'criteria', 'dynamic', 'automation']
description: 'This document outlines the process for organizing computers running on older build versions of Windows 10 and 11 by creating a dynamic group that categorizes these systems based on their OS build numbers and other criteria. It includes step-by-step instructions and dependencies for effective implementation.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

Organize computers operating on older build versions of Windows 10 and 11. The grouping involves comparing the computer's build version with the latest available build for the operating system. Currently, the latest builds are 22631 for Windows 11 and 19045 for Windows 10; these values should be updated manually in the group's criteria after Microsoft releases the newer builds.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)
- [CW RMM - Custom Field - WinFeatUpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de)
- [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56)

## Group Overview

![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_1.webp)

**Group Type:** Dynamic Group  
**Group Name:** Feature Pack Update Automation  
**Description:** Categorize computers running Windows 10 and 11 that are using the older build version.

## Criteria

- Select `OS Build Number` for the Criteria `Does Not Contain any` for the comparator and type `19045` and `22631` in the condition box.  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_2.webp)  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_3.webp)  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_4.webp)

- Click the `Add Criteria` button to add another criterion.  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_5.webp)

- Select `OS` for the Criteria `Contains any of` for the comparator and `Microsoft Windows 10 and 11` for the condition.  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_6.webp)  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_7.webp)  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_8.webp)

- Add another criterion by clicking the `Add Criteria` button.

- Select the `Feature Update Reboot Pending` custom field for criteria, `Equal` for the comparator, and type `False` in the condition box.  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_9.webp)

- Add another criterion by clicking the `Add Criteria` button.

- Choose the `WinFeatUpgradeAttempts` custom field for criteria, select `Does Not Contain any` for the comparator, and enter the integers from 3 to 15 in the condition field. Enter each number individually, pressing Enter after each one: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15.  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_10.webp)  
  ![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_11.webp)

## Group Creation

Click the Save button to save the group.  
![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_12.webp)

![Image](../../../static/img/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba/image_13.webp)
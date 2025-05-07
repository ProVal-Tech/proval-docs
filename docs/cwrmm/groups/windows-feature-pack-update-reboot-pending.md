---
id: '72a7b834-70a2-4b4f-becb-bb77fa83a28d'
slug: /72a7b834-70a2-4b4f-becb-bb77fa83a28d
title: 'Windows Feature Pack Update Reboot Pending'
title_meta: 'Windows Feature Pack Update Reboot Pending'
keywords: ['windows', 'reboot', 'feature', 'update', 'pending', 'dynamic', 'group']
description: 'This document outlines the process for categorizing Windows 10 and 11 computers where the Feature Update Install with Tracking script has been completed but a reboot is still pending. It includes dependencies, criteria for selection, and steps to create a dynamic group for better management.'
tags: ['reboot', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

Categorize the Windows 10 and 11 computers where the `Feature Update Install with Tracking` script is completed but a reboot is pending.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)  
- [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56)  
- [CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7)  

## Group Overview

![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_1.png)  
**Group Type:** Dynamic  
**Group Name:** Windows Feature Pack Update: Reboot Pending  
**Description:** Categorize the Windows 10 and 11 computers where the `Feature Update Install with Tracking` script is completed but a reboot is pending.

## Criteria

- Select `OS Build Number` for the criteria, use `Does Not Contain any` for the comparator, and type `19045` and `22631` in the condition box.  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_2.png)  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_3.png)  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_4.png)  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_5.png)  

- Click the `Add Criteria` button to add another criterion.  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_6.png)  

- Select the `Feature Update Reboot Pending` custom field for criteria, use `Equal` for the comparator, and type `True` in the condition box.  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_7.png)  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_8.png)  

## Group Creation

Click the Save button to save the group.  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_9.png)  
![Image](../../../static/img/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d/image_10.png)  


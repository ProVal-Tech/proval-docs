---
id: '891dd514-bfc7-4dba-b09c-7597145bb3e2'
slug: /891dd514-bfc7-4dba-b09c-7597145bb3e2
title: 'Windows Feature Pack Update Failure Volume Health Error'
title_meta: 'Windows Feature Pack Update Failure Volume Health Error'
keywords: ['windows', 'feature', 'update', 'failure', 'volume', 'health', 'error']
description: 'This document provides a comprehensive guide to categorizing Windows 10 and 11 computers where the Feature Update Install with Tracking script failed due to a Volume Health Error. It includes dependencies, criteria for grouping, and visual aids to assist in the process.'
tags: []
draft: false
unlisted: false
---

## Summary

This document categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed due to a Volume Health Error.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)
- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)

## Visual Summary

![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_1.png)

**Group Type:** Dynamic

**Group Name:** Windows Feature Pack Update Failure: Volume Health Error

**Description:** Categorize the Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed due to a Volume Health Error.

## Criteria

- Select `\\<font>OS Build Number\\</font>` for the Criteria, choose `Does Not Contain any` for the comparator, and type `19045` and `22631` in the condition box.  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_2.png)  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_3.png)  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_4.png)  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_5.png)

- Click the `Add Criteria` button to add another criterion.  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_6.png)

- Select the `Feature Update Install Failure` custom field for criteria, choose `Equal` for the comparator, and type `Volume Health Error` in the condition box.  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_7.png)  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_8.png)

## Group

Click the `Save` button to save the group.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_9.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Volume-Health-Error/image_10.png)




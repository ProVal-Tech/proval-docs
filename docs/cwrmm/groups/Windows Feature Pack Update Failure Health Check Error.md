---
id: '1b9f901e-ea4e-4ed0-9b62-01d667196d48'
slug: /1b9f901e-ea4e-4ed0-9b62-01d667196d48
title: 'Windows Feature Pack Update Failure Health Check Error'
title_meta: 'Windows Feature Pack Update Failure Health Check Error'
keywords: ['windows', 'feature', 'update', 'install', 'failure', 'health', 'check', 'error', 'categorize']
description: 'This document provides a guide to categorize Windows 10 and 11 computers where the Feature Update Install with Tracking script failed due to a Health Check Error. It outlines the necessary criteria and steps to effectively filter and save the group of affected computers.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This document categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed due to a Health Check Error.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](<../tasks/Feature Update Install With Tracking.md>)  
- [CW RMM - Custom Field - Feature Update Install Failure](<../custom-fields/Feature Update Install Failure.md>)

## Criteria

- Select `OS Build Number` for the criteria `Does Not Contain Any`, and type `19045` and `22631` in the condition box.  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Health-Check-Error/image_1.png)  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Health-Check-Error/image_2.png)  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Health-Check-Error/image_3.png)  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Health-Check-Error/image_4.png)  

- Click the `Add Criteria` button to add another criterion.  
  ![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Health-Check-Error/image_5.png)  

- Select the `Feature Update Install Failure` custom field for criteria, `Equal` for comparator, and type `Health Check Error` in the condition box.  

## Group

Click the `Save` button to save the group.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Health-Check-Error/image_6.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Health-Check-Error/image_7.png)  




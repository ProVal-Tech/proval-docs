---
id: '2eff2df6-a435-433a-8664-79cdda6fdedc'
slug: /2eff2df6-a435-433a-8664-79cdda6fdedc
title: 'Windows Feature Pack Update Failure Compatibility Check Error'
title_meta: 'Windows Feature Pack Update Failure Compatibility Check Error'
keywords: ['windows', 'feature', 'update', 'failure', 'compatibility', 'check', 'error']
description: 'This document outlines the process for categorizing Windows 11 computers where the Feature Update Install with Tracking script has failed due to a Compatibility Check Error. It includes criteria for selection and steps for creating a dynamic group in ConnectWise RMM.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document categorizes Windows 11 computers where the `Feature Update Install with Tracking` script failed due to a Compatibility Check Error.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](<../tasks/Feature Update Install With Tracking.md>)
- [CW RMM - Custom Field - Feature Update Install Failure](<../custom-fields/Feature Update Install Failure.md>)

## Criteria

- Select `OS Build Number` for the Criteria `Does Not Contain any` for the comparator and type `22631` in the condition box.

  ![Image 1](../../../static/img/Windows-Feature-Pack-Update-Failure-Compatibility-Check-Error/image_1.png)  
  ![Image 2](../../../static/img/Windows-Feature-Pack-Update-Failure-Compatibility-Check-Error/image_2.png)  
  ![Image 3](../../../static/img/Windows-Feature-Pack-Update-Failure-Compatibility-Check-Error/image_3.png)  
  ![Image 4](../../../static/img/Windows-Feature-Pack-Update-Failure-Compatibility-Check-Error/image_4.png)

- Click the `Add Criteria` button to add another criterion.

  ![Image 5](../../../static/img/Windows-Feature-Pack-Update-Failure-Compatibility-Check-Error/image_5.png)

- Select the `Feature Update Install Failure` custom field for criteria, `Equal` for the comparator, and type `Compatibility Check Error` in the condition box.

## Group Type: Dynamic

## Group Name: Windows Feature Pack Update Failure: Compatibility Check Error

Click the `Save` button to save the group.

![Image 6](../../../static/img/Windows-Feature-Pack-Update-Failure-Compatibility-Check-Error/image_6.png)

## Group

Click the `Save` button to save the group.

![Image 7](../../../static/img/Windows-Feature-Pack-Update-Failure-Compatibility-Check-Error/image_7.png)




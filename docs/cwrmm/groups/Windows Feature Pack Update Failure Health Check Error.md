---
id: 'rmm-categorize-windows-feature-update-failure'
title: 'Categorize Windows 10 and 11 Computers with Feature Update Install Failure'
title_meta: 'Categorize Windows 10 and 11 Computers with Feature Update Install Failure'
keywords: ['windows', 'feature', 'update', 'install', 'failure', 'health', 'check', 'error', 'categorize']
description: 'This document provides a guide to categorize Windows 10 and 11 computers where the Feature Update Install with Tracking script failed due to a Health Check Error. It outlines the necessary criteria and steps to effectively filter and save the group of affected computers.'
tags: ['windows', 'update', 'failure', 'health', 'check', 'configuration']
draft: false
unlisted: false
---
## Summary

Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed because of a Health Check Error.

## Dependencies

[CW RMM - Task - Feature Update Install With Tracking](https://proval.itglue.com/DOC-5078775-12947845)  
[CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254)

## Summary

Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed because of a Health Check Error.

## Criteria

- Select `OS Build Number` for the Criteria `Does Not Contain any` for comparator and type `19045` and `22631` in the condition box.  
![Image](..\..\..\static\img\Windows-Feature-Pack-Update-Failure-Health-Check-Error\image_1.png)  
![Image](..\..\..\static\img\Windows-Feature-Pack-Update-Failure-Health-Check-Error\image_2.png)  
![Image](..\..\..\static\img\Windows-Feature-Pack-Update-Failure-Health-Check-Error\image_3.png)  
![Image](..\..\..\static\img\Windows-Feature-Pack-Update-Failure-Health-Check-Error\image_4.png)  

- Click the `Add Criteria` button to add another Criteria.  
![Image](..\..\..\static\img\Windows-Feature-Pack-Update-Failure-Health-Check-Error\image_5.png)  

- Select `Feature Update Install Failure` custom field for criteria, `Equal` for comparator and type `Health Check Error` in the condition box.  

## Group

Click the `Save` button to Save the Group.  
![Image](..\..\..\static\img\Windows-Feature-Pack-Update-Failure-Health-Check-Error\image_6.png)  
![Image](..\..\..\static\img\Windows-Feature-Pack-Update-Failure-Health-Check-Error\image_7.png)



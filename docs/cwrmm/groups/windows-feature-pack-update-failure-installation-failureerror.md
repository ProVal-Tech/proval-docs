---
id: '998b5859-608f-4c0c-abd2-75356b272102'
slug: /998b5859-608f-4c0c-abd2-75356b272102
title: 'Windows Feature Pack Update Failure Installation FailureError'
title_meta: 'Windows Feature Pack Update Failure Installation FailureError'
keywords: ['windows', 'feature', 'update', 'failure', 'tracking', 'os', 'build', 'criteria', 'group']
description: 'This document provides a detailed guide on how to categorize Windows 10 and 11 computers where the Feature Update Install with Tracking script has failed. It outlines the criteria for selection and the steps to create a group based on installation failures.'
tags: ['report', 'update', 'windows']
draft: false
unlisted: false
---

## Summary
This document categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed for an unknown reason.

## Dependencies
- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)  
- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)

## Criteria
1. Select `OS Build Number` for the criteria, set the comparator to `Does Not Contain any`, and type `19045` and `22631` in the condition box.  
   ![Image 1](../../../static/img/docs/998b5859-608f-4c0c-abd2-75356b272102/image_1.png)  
   ![Image 2](../../../static/img/docs/998b5859-608f-4c0c-abd2-75356b272102/image_2.png)  
   ![Image 3](../../../static/img/docs/998b5859-608f-4c0c-abd2-75356b272102/image_3.png)  
   ![Image 4](../../../static/img/docs/998b5859-608f-4c0c-abd2-75356b272102/image_4.png)

2. Click the `Add Criteria` button to add another criterion.  
   ![Image 5](../../../static/img/docs/998b5859-608f-4c0c-abd2-75356b272102/image_5.png)

3. Select the `Feature Update Install Failure` custom field for criteria, set the comparator to `Equal`, and type `Installation Failure/Error` in the condition box.

## Group
Click the `Save` button to save the group.  
![Image 6](../../../static/img/docs/998b5859-608f-4c0c-abd2-75356b272102/image_6.png)  
![Image 7](../../../static/img/docs/998b5859-608f-4c0c-abd2-75356b272102/image_7.png)



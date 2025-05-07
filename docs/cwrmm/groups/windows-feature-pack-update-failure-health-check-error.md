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

- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)  
- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)

## Criteria

- Select `OS Build Number` for the criteria `Does Not Contain Any`, and type `19045` and `22631` in the condition box.  
  ![Image](../../../static/img/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48/image_1.webp)  
  ![Image](../../../static/img/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48/image_2.webp)  
  ![Image](../../../static/img/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48/image_3.webp)  
  ![Image](../../../static/img/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48/image_4.webp)  

- Click the `Add Criteria` button to add another criterion.  
  ![Image](../../../static/img/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48/image_5.webp)  

- Select the `Feature Update Install Failure` custom field for criteria, `Equal` for comparator, and type `Health Check Error` in the condition box.  

## Group

Click the `Save` button to save the group.  
![Image](../../../static/img/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48/image_6.webp)  
![Image](../../../static/img/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48/image_7.webp)  


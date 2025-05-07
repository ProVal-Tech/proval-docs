---
id: '4611eb6b-e00e-4e38-9935-531f71852e8c'
slug: /4611eb6b-e00e-4e38-9935-531f71852e8c
title: 'Office C2R Auditing'
title_meta: 'Office C2R Auditing'
keywords: ['microsoft', 'group', 'auditing', 'software', 'dynamic']
description: 'This document provides a step-by-step guide on how to create a dynamic group for auditing computers with Microsoft 365 installed using ConnectWise Automate. It includes navigation instructions, criteria setup, and completion verification.'
tags: ['setup', 'software']
draft: false
unlisted: false
---

## Summary

This document outlines the process for creating a dynamic group for computers with Microsoft 365 installed.

## Group Creation

1. Navigate to `Endpoints` > `Groups`.
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_3.webp)

3. Set the group name to `Office C2R Auditing`.  
   Description: `Computers with Microsoft 365 installed`  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_5.webp)  
   This search box will appear.  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_6.webp)

5. Search and select the `Installed Software Name` custom field from the search box.  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_7.webp)  
   Set the operator to `Contains any of` and enter `Microsoft 365` in the comparison condition.  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_8.webp)  
   **Condition:** `Installed Software Name` `Contains any of` `Microsoft 365`

6. Click the `Save` button to save/create the group.  
   ![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_9.webp)

## Completed Group

![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_10.webp)  
![Image](../../../static/img/docs/4611eb6b-e00e-4e38-9935-531f71852e8c/image_11.webp)

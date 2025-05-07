---
id: '12423bcf-17d9-417e-ad6e-b862dd04f184'
slug: /12423bcf-17d9-417e-ad6e-b862dd04f184
title: 'Out of Date CU _ Install Failure'
title_meta: 'Out of Date CU _ Install Failure'
keywords: ['cumulative', 'update', 'failure', 'detection', 'windows']
description: 'This document outlines the steps to create a dynamic group in ConnectWise RMM that detects computers where the latest cumulative update installation failed to complete after a reboot. It includes dependencies, group creation steps, and criteria for filtering devices based on the installation status.'
tags: ['connectwise', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The group will detect the computers where the latest cumulative update installation failed to complete after reboot.

## Dependencies

[CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](/docs/2d24daab-16cb-4b2d-b7e6-0e757b4f2523)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_3.webp)

3. Set the group name to `Out of Date CU - Install Failure`.  
   Description: `The group will detect the computers where the latest cumulative update installation failed to complete after reboot.`  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_5.webp)  
   This search box will appear.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_6.webp)

5. Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_7.webp)  
   Type `Failed` in the comparison condition and press `Enter`.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_8.webp)  
   **Condition:** `Out_of_Date_CU_Autofix_Result` `Contains any of` `Failed`

6. Click the `+ Add Criteria` button.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_9.webp)  
   A new search box will appear.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_10.webp)  
   Search and select the `OS` criteria.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_11.webp)  
   Select all available instances of `Microsoft Windows` `10`, `11`, `Server 2016`, `2019`, and `2022` in the comparison field.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_12.webp)  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_13.webp)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11`, `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`

7. Click the `Save` button to save/create the group.  
   ![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_14.webp)

## Completed Group

![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_15.webp)

![Image](../../../static/img/docs/12423bcf-17d9-417e-ad6e-b862dd04f184/image_16.webp)

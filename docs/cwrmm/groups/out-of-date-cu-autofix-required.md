---
id: '7ef49988-2b75-441e-9373-bda734a03ea1'
slug: /7ef49988-2b75-441e-9373-bda734a03ea1
title: 'Out of Date CU _ Autofix Required'
title_meta: 'Out of Date CU _ Autofix Required'
keywords: ['cumulative', 'update', 'autofix', 'group', 'criteria']
description: 'This document provides a comprehensive guide on creating a dynamic group in ConnectWise RMM to detect computers that have not installed a Cumulative Update in the past 75 days. It includes detailed steps and dependencies for setting up the group correctly.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

The group will detect the computers where the Latest Cumulative Update Custom Field contains "failed," indicating that the machine has not installed a Cumulative Update in the past 75 days.

## Dependencies

- [CW RMM - Custom Field - Latest Cumulative Update](/docs/67416ac2-2311-43c4-8fbf-c5b0c9a48e71)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](/docs/2d24daab-16cb-4b2d-b7e6-0e757b4f2523)
- [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206)
- [CW RMM Custom Field - Site - Out_of_Date_CU_Autofix](/docs/7eb4d98b-4199-4f59-a28f-bfdf50f3e36a)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix](/docs/a9e84f5a-0afa-44ef-98b7-c5a70f6a25ea)

## Group Creation

### 1.
Navigate to `Devices` > `Device Groups`.  
![Step 1 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_1.webp)

### 2.
Create a new dynamic group by clicking the `Dynamic Group` button.  
![Step 2 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_2.webp)  
This page will appear after clicking on the `Dynamic Group` button:  
![Step 2 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_3.webp)

### 3.
Set the group name to `Out of Date CU - Autofix Required`.  
Description: `The group will detect the computers where the Latest Cumulative Update Custom Field contains failed, indicating that the machine has not installed a Cumulative Update in the past 75 days.`  
![Step 3 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_4.webp)

### 4.
Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step 4 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_5.webp)  
This search box will appear.  
![Step 4 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_6.webp)

### 5.
Search and select the `Latest Cumulative Update` custom field from the search box.  
![Step 5 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_7.webp)  
Type `Failed` in the comparison condition and press `Enter`.  
![Step 5 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_8.webp)  
**Condition:** `Latest Cumulative Update` `Contains any of` `Failed`

### 6.
Click the `+ Add Criteria` button.  
![Step 6 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_9.webp)  
A new search box will appear.  
![Step 6 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_10.webp)  
Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
![Step 6 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_11.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 6 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_12.webp)  
Type `Reboot Pending` and `Installed` in the comparison condition and press `Enter`.  
![Step 6 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_13.webp)  
**Condition:** `Out_of_Date_CU_Autofix_Result` `Does Not Contain any of` `Reboot Pending`, `Installed`

### 7.
Click the `+ Add Criteria` button.  
![Step 7 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_14.webp)  
A new search box will appear.  
![Step 7 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_15.webp)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box. Remember, there are three different `Out_of_Date_CU_Autofix` custom fields, and we are going to use all three of these one after another in the conditions.  
We are selecting the `company` level custom field in this step.  
![Step 7 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_16.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 7 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_17.webp)  
Select `Disable` in the comparison field.  
![Step 7 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_18.webp)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 8.
Click the `+ Add Criteria` button.  
![Step 8 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_19.webp)  
A new search box will appear.  
![Step 8 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_20.webp)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box. We are selecting the `site` level custom field in this step.  
![Step 8 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_21.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 8 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_17.webp)  
Select `Disable` in the comparison field.  
![Step 8 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_22.webp)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 9.
Click the `+ Add Criteria` button.  
![Step 9 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_23.webp)  
A new search box will appear.  
![Step 9 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_24.webp)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box. We are selecting the `Endpoint` level custom field in this step.  
![Step 9 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_25.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 9 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_17.webp)  
Select `Disable` in the comparison field.  
![Step 9 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_26.webp)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 10.
Click the `+ Add Criteria` button.  
![Step 10 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_23.webp)  
A new search box will appear.  
![Step 10 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_24.webp)  
Search and select the `OS` criteria.  
![Step 10 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_27.webp)  
Leave the comparator set to `Contain any of`.  
![Step 10 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_28.webp)  
Select `Microsoft Windows`, `10`, and `11` in the comparison field.  
![Step 10 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_29.webp)  
**Condition:** `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11`

### 11.
**From this step onward, we will work in an Outer Block.**  
Click the `Add Outer Block` button to create a new block.  
![Step 11 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_30.webp)  
A new block will appear.  
![Step 11 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_31.webp)  
Change the logical operator to `OR` from `AND`.  
![Step 11 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_32.webp)

### 12.
Click the `+ Add Criteria` in the newly added `Outer Block`.  
![Step 12 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_33.webp)  
This search box will appear.  
![Step 12 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_34.webp)  
Search and select the `Latest Cumulative Update` custom field from the search box.  
![Step 12 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_35.webp)  
Type `Failed` in the comparison condition and press `Enter`.  
![Step 12 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_36.webp)  
**Condition:** `Latest Cumulative Update` `Contains any of` `Failed`

### 13.
Click the `+ Add Criteria` button.  
![Step 13 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_37.webp)  
A new search box will appear.  
![Step 13 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_10.webp)  
Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
![Step 13 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_11.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 13 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_12.webp)  
Type `Reboot Pending` and `Installed` in the comparison condition and press `Enter`.  
![Step 13 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_13.webp)  
**Condition:** `Out_of_Date_CU_Autofix_Result` `Does Not Contain any of` `Reboot Pending`, `Installed`

### 14.
Click the `+ Add Criteria` button.  
![Step 14 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_14.webp)  
A new search box will appear.  
![Step 14 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_15.webp)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box.  
We are selecting the `company` level custom field in this step.  
![Step 14 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_16.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 14 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_17.webp)  
Select `Disable` and `Enable` in the comparison field.  
![Step 14 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_38.webp)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`, `Enable`

### 15.
Click the `+ Add Criteria` button.  
![Step 15 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_39.webp)  
A new search box will appear.  
![Step 15 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_40.webp)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box.  
We are selecting the `site` level custom field in this step.  
![Step 15 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_21.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 15 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_17.webp)  
Select `Disable`, `Disable for Servers`, and `Enable` in the comparison field.  
![Step 15 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_41.webp)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`, `Disable for Servers`, `Enable`

### 16.
Click the `+ Add Criteria` button.  
![Step 16 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_42.webp)  
A new search box will appear.  
![Step 16 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_43.webp)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box.  
We are selecting the `Endpoint` level custom field in this step.  
![Step 16 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_25.webp)  
Change the comparator to `Does Not Contain any of`.  
![Step 16 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_17.webp)  
Select `Disable` in the comparison field.  
![Step 16 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_26.webp)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 17.
Click the `+ Add Criteria` button.  
![Step 17 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_23.webp)  
A new search box will appear.  
![Step 17 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_24.webp)  
Search and select the `OS` criteria.  
![Step 17 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_27.webp)  
Leave the comparator set to `Contain any of`.  
![Step 17 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_28.webp)  
Select `Microsoft Windows`, `Server`, `2016`, `2019`, and `2022` in the comparison field.  
![Step 17 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_44.webp)  
**Condition:** `OS` `Contains any of` `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`

### 18.
Click the `Save` button to save/create the group.  
![Step 18 Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_45.webp)

## Completed Group

![Completed Group Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_46.webp)

![Completed Group Image](../../../static/img/docs/7ef49988-2b75-441e-9373-bda734a03ea1/image_47.webp)

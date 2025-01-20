---
id: '7ef49988-2b75-441e-9373-bda734a03ea1'
title: 'Out of Date CU - Autofix Required'
title_meta: 'Out of Date CU - Autofix Required'
keywords: ['cumulative', 'update', 'autofix', 'group', 'criteria']
description: 'This document provides a comprehensive guide on creating a dynamic group in ConnectWise RMM to detect computers that have not installed a Cumulative Update in the past 75 days. It includes detailed steps and dependencies for setting up the group correctly.'
tags: ['update', 'windows']
draft: false
unlisted: false
---
## Summary

The group will detect the computers where the Latest Cumulative Update Custom Field contains failed, indicating that the machine has not installed a Cumulative Update in the past 75 days.

## Dependencies

- [CW RMM - Custom Field - Latest Cumulative Update](<../custom-fields/Latest Cumulative Update.md>)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](<../custom-fields/EndPoint - Out_of_Date_CU_Autofix_Result.md>)
- [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](<../custom-fields/Company - Out_of_Date_CU_Autofix.md>)
- [CW RMM Custom Field - Site - Out_of_Date_CU_Autofix](<../custom-fields/Site - Out_of_Date_CU_Autofix.md>)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix](<../custom-fields/EndPoint - Out_of_Date_CU_Autofix.md>)

## Group Creation

### 1.
Navigate to `Devices` > `Device Groups`.  
![Step 1 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_1.png)

### 2.
Create a new dynamic group by clicking the `Dynamic Group` button.  
![Step 2 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_2.png)  
This page will appear after clicking on the `Dynamic Group` button:  
![Step 2 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_3.png)

### 3.
Set the group name to `Out of Date CU _ Autofix Required`.  
Description: `The group will detect the computers where the Latest Cumulative Update Custom Field contains failed, indicating that the machine has not installed a Cumulative Update in the past 75 days.`  
![Step 3 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_4.png)

### 4.
Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step 4 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_5.png)  
This search box will appear.  
![Step 4 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_6.png)

### 5.
Search and select the `Latest Cumulative Update` custom field from the search box.  
![Step 5 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_7.png)  
Type `Failed` in the comparison condition and press `Enter`.  
![Step 5 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_8.png)  
**Condition:** `Latest Cumulative Update` `Contains any of` `Failed`

### 6.
Click the `+ Add Criteria` button.  
![Step 6 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_9.png)  
A new search box will appear.  
![Step 6 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_10.png)  
Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
![Step 6 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_11.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 6 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_12.png)  
Type `Reboot Pending` and `Installed` in the comparison condition and press `Enter`.  
![Step 6 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_13.png)  
**Condition:** `Out_of_Date_CU_Autofix_Result` `Does Not Contain any of` `Reboot Pending`, `Installed`

### 7.
Click the `+ Add Criteria` button.  
![Step 7 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_14.png)  
A new search box will appear.  
![Step 7 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_15.png)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box. Remember there are three different `Out_of_Date_CU_Autofix` custom fields and we are going to use all three of these one after another in the conditions.  
We are selecting the `company` level custom field in this step.  
![Step 7 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_16.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 7 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_17.png)  
Select `Disable` in the comparison field.  
![Step 7 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_18.png)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 8.
Click the `+ Add Criteria` button.  
![Step 8 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_19.png)  
A new search box will appear.  
![Step 8 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_20.png)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box. We are selecting the `site` level custom field in this step.  
![Step 8 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_21.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 8 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_17.png)  
Select `Disable` in the comparison field.  
![Step 8 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_22.png)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 9.
Click the `+ Add Criteria` button.  
![Step 9 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_23.png)  
A new search box will appear.  
![Step 9 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_24.png)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box. We are selecting the `Endpoint` level custom field in this step.  
![Step 9 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_25.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 9 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_17.png)  
Select `Disable` in the comparison field.  
![Step 9 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_26.png)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 10.
Click the `+ Add Criteria` button.  
![Step 10 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_23.png)  
A new search box will appear.  
![Step 10 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_24.png)  
Search and select the `OS` criteria.  
![Step 10 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_27.png)  
Leave the comparator to `Contain any of`.  
![Step 10 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_28.png)  
Select `Microsoft Windows` `10` and `11` in the comparison field.  
![Step 10 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_29.png)  
**Condition:** `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11`

### 11.
**From this step onward we will work in an Outer Block.**  
Click the `Add Outer Block` button to create a new block.  
![Step 11 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_30.png)  
A new block will appear.  
![Step 11 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_31.png)  
Change the logical operator to `OR` from `AND`.  
![Step 11 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_32.png)

### 12.
Click the `+ Add Criteria` in the newly added `Outer Block`.  
![Step 12 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_33.png)  
This search box will appear.  
![Step 12 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_34.png)  
Search and select the `Latest Cumulative Update` custom field from the search box.  
![Step 12 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_35.png)  
Type `Failed` in the comparison condition and press `Enter`.  
![Step 12 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_36.png)  
**Condition:** `Latest Cumulative Update` `Contains any of` `Failed`

### 13.
Click the `+ Add Criteria` button.  
![Step 13 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_37.png)  
A new search box will appear.  
![Step 13 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_10.png)  
Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
![Step 13 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_11.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 13 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_12.png)  
Type `Reboot Pending` and `Installed` in the comparison condition and press `Enter`.  
![Step 13 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_13.png)  
**Condition:** `Out_of_Date_CU_Autofix_Result` `Does Not Contain any of` `Reboot Pending`, `Installed`

### 14.
Click the `+ Add Criteria` button.  
![Step 14 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_14.png)  
A new search box will appear.  
![Step 14 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_15.png)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box.  
We are selecting the `company` level custom field in this step.  
![Step 14 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_16.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 14 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_17.png)  
Select `Disable` and `Enable` in the comparison field.  
![Step 14 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_38.png)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`, `Enable`

### 15.
Click the `+ Add Criteria` button.  
![Step 15 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_39.png)  
A new search box will appear.  
![Step 15 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_40.png)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box.  
We are selecting the `site` level custom field in this step.  
![Step 15 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_21.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 15 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_17.png)  
Select `Disable`, `Disable for Servers`, and `Enable` in the comparison field.  
![Step 15 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_41.png)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`, `Disable for Servers`, `Enable`

### 16.
Click the `+ Add Criteria` button.  
![Step 16 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_42.png)  
A new search box will appear.  
![Step 16 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_43.png)  
Search and select the `Out_of_Date_CU_Autofix` custom field from the search box.  
We are selecting the `Endpoint` level custom field in this step.  
![Step 16 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_25.png)  
Change the comparator to `Does Not Contain any of`.  
![Step 16 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_17.png)  
Select `Disable` in the comparison field.  
![Step 16 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_26.png)  
**Condition:** `Out_of_Date_CU_Autofix` `Does Not Contain any of` `Disable`

### 17.
Click the `+ Add Criteria` button.  
![Step 17 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_23.png)  
A new search box will appear.  
![Step 17 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_24.png)  
Search and select the `OS` criteria.  
![Step 17 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_27.png)  
Leave the comparator to `Contain any of`.  
![Step 17 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_28.png)  
Select `Microsoft Windows` `Server` `2016` `2019` and `2022` in the comparison field.  
![Step 17 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_44.png)  
**Condition:** `OS` `Contains any of` `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`

### 18.
Click the `Save` button to save/create the group.  
![Step 18 Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_45.png)

## Completed Group

![Completed Group Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_46.png)

![Completed Group Image](../../../static/img/Out-of-Date-CU-_-Autofix-Required/image_47.png)













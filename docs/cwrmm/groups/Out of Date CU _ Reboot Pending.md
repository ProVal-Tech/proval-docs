---
id: 'rmm-out-of-date-cu-reboot-pending'
title: 'Out of Date CU - Reboot Pending Group Creation'
title_meta: 'Out of Date CU - Reboot Pending Group Creation'
keywords: ['cumulative', 'update', 'reboot', 'pending', 'group', 'creation', 'criteria', 'windows']
description: 'This document details the steps to create a dynamic group in ConnectWise RMM that identifies computers where a Cumulative Update has been installed but requires a reboot. It includes dependencies, group creation steps, and criteria for filtering devices based on their update status.'
tags: ['group', 'criteria', 'windows', 'update', 'reboot']
draft: false
unlisted: false
---
## Summary

Groups computers where Cumulative Update was installed by the Out of Date Cumulative Update (Autofix) task but a reboot is pending.

## Dependencies

[CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](https://proval.itglue.com/DOC-5078775-15748265)  
[CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Date](https://proval.itglue.com/DOC-5078775-15748263)  

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Step 1](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Step 2](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_3.png)

3. Set the group name to `Out of Date CU _ Reboot Pending`.  
   Description: `Groups computers where Cumulative Update was installed by the Out of Date Cumulative Update (Autofix) task but a reboot is pending.`  
   ![Step 3](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_5.png)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_6.png)

5. Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
   ![Step 5](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_7.png)  
   Type `Reboot Pending` in the comparison condition and press `Enter`.  
   ![Step 5 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_8.png)  
   **Condition:** `Out_of_Date_CU_Autofix_Result` `Contains any of` `Reboot Pending`

6. Click the `+ Add Criteria` button.  
   ![Step 6](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_9.png)  
   A new search box will appear.  
   ![Step 6 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_10.png)  
   Search and select the `OS` Criteria.  
   ![Step 6 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_11.png)  
   Select all available instances of `Microsoft Windows` `10`, `11`, `Server 2016`, `2019`, and `2022` in the comparison Field.  
   ![Step 6 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_12.png)  
   ![Step 6 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_13.png)  
   Condition: `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11`, `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`

7. Click the `+ Add Criteria` button.  
   ![Step 7](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_14.png)  
   A new search box will appear.  
   ![Step 7 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_15.png)  
   Search and select the `Out_of_Date_CU_Autofix_Date` custom field from the search box.  
   ![Step 7 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_16.png)  
   Change the comparator to `Does Not Contain any of`.  
   ![Step 7 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_17.png)  
   Type `0001-01-01 00:00:00` in the comparison field and press `Enter`.  
   ![Step 7 Continued](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_18.png)  
   **Condition:** `Out_of_Date_CU_Autofix_Date` `Does Not Contain any of` `0001-01-01 00:00:00`

8. Click the `Save` button to save/create the group.  
   ![Step 8](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_19.png)

## Completed Group

![Completed Group 1](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_20.png)  
![Completed Group 2](../../../static/img/Out-of-Date-CU-_-Reboot-Pending/image_21.png)




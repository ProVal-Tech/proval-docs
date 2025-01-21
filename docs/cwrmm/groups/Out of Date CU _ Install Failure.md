---
id: '12423bcf-17d9-417e-ad6e-b862dd04f184'
title: 'Out of Date CU Installation Failure Detection'
title_meta: 'Out of Date CU Installation Failure Detection'
keywords: ['cumulative', 'update', 'failure', 'detection', 'windows']
description: 'This document outlines the steps to create a dynamic group in ConnectWise RMM that detects computers where the latest cumulative update installation failed to complete after a reboot. It includes dependencies, group creation steps, and criteria for filtering devices based on the installation status.'
tags: ['connectwise', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The group will detect the computers where the latest cumulative update installation failed to complete after reboot.

## Dependencies

[CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](<../custom-fields/EndPoint - Out_of_Date_CU_Autofix_Result.md>)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_3.png)

3. Set the group name to `Out of Date CU - Install Failure`.  
   Description: `The group will detect the computers where the latest cumulative update installation failed to complete after reboot.`  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_5.png)  
   This search box will appear.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_6.png)

5. Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_7.png)  
   Type `Failed` in the comparison condition and press `Enter`.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_8.png)  
   **Condition:** `Out_of_Date_CU_Autofix_Result` `Contains any of` `Failed`

6. Click the `+ Add Criteria` button.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_9.png)  
   A new search box will appear.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_10.png)  
   Search and select the `OS` criteria.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_11.png)  
   Select all available instances of `Microsoft Windows` `10`, `11`, `Server 2016`, `2019`, and `2022` in the comparison field.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_12.png)  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_13.png)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11`, `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`

7. Click the `Save` button to save/create the group.  
   ![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_14.png)

## Completed Group

![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_15.png)

![Image](../../../static/img/Out-of-Date-CU-_-Install-Failure/image_16.png)

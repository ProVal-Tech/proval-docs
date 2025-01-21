---
id: '685b1f1d-527a-4d66-acb2-d1329ee8a368'
title: 'Cumulative Update Audit Monitor Setup'
title_meta: 'Cumulative Update Audit Monitor Setup'
keywords: ['monitor', 'alert', 'cumulative', 'update', 'audit']
description: 'This document provides a step-by-step guide on setting up a monitor in ConnectWise RMM to alert for computers with failed cumulative updates and automatically resolve tickets when updates are successful.'
tags: ['update']
draft: false
unlisted: false
---

## Summary

The monitor set will generate an alert for computers in which the custom field [CW RMM - Custom Field - Latest Cumulative Update](<../custom-fields/Latest Cumulative Update.md>) contains 'Failed.' Furthermore, it will automatically resolve the associated ticket if 'Success' is present in the aforementioned custom field.

`Failed` in the custom field indicates that a Cumulative Update has not been installed on the machine for `75` days. This threshold can be updated in `Row 1` of the [CW RMM - Task - Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029442) task.

## Monitor

1. Go to **Alert Management > Monitors**.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_1.png)

2. Click the **Add Monitor** button.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_2.png)

3. This screen will appear.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_3.png)

4. Fill in the Name and Description boxes.  
   **Name:** Cumulative Update Audit  
   **Description:** The monitor set will generate an alert for computers in which the custom field `Latest Cumulative Update` contains 'Failed.' Furthermore, it will automatically resolve the associated ticket if 'Success' is present in the aforementioned custom field.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_4.png)

5. Select the **Custom Field** in the Type dropdown.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_5.png)

6. Select **Text Box** from the **Custom Field Type** dropdown and **Latest Cumulative Update** from the **Custom Field Name** dropdown for both **Conditions** and **Ticket Resolution** sections.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_6.png)

7. Add **Failed** in the **Enter Value Field** of the **Conditions** section and **Success** in the **Enter Value Field** of the **Ticket Resolution** section.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_7.png)

8. Select the Resources/Clients to apply the monitor set against.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_8.png)

9. Select **Patch Management** for the **Family** and **Others** or any relevant option for the **Severity**.  
   ![Image](../../../static/img/Cumulative-Update-Audit/image_9.png)

10. This is how the monitor set should look before saving it.  
    ![Image](../../../static/img/Cumulative-Update-Audit/image_10.png)

11. Click the **Save** button to save the monitor set.  
    ![Image](../../../static/img/Cumulative-Update-Audit/image_11.png)

## Dependencies

- [CW RMM - Custom Field - Latest Cumulative Update](<../custom-fields/Latest Cumulative Update.md>)
- [CW RMM - Task - Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029442)


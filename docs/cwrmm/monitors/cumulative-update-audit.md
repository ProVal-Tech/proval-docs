---
id: '685b1f1d-527a-4d66-acb2-d1329ee8a368'
slug: /685b1f1d-527a-4d66-acb2-d1329ee8a368
title: 'Cumulative Update Audit'
title_meta: 'Cumulative Update Audit'
keywords: ['monitor', 'alert', 'cumulative', 'update', 'audit']
description: 'This document provides a step-by-step guide on setting up a monitor in ConnectWise RMM to alert for computers with failed cumulative updates and automatically resolve tickets when updates are successful.'
tags: ['update']
draft: false
unlisted: false
---

## Summary

The monitor set will generate an alert for computers in which the custom field [CW RMM - Custom Field - Latest Cumulative Update](/docs/67416ac2-2311-43c4-8fbf-c5b0c9a48e71) contains 'Failed.' Furthermore, it will automatically resolve the associated ticket if 'Success' is present in the aforementioned custom field.

`Failed` in the custom field indicates that a Cumulative Update has not been installed on the machine for `75` days. This threshold can be updated in `Row 1` of the [CW RMM - Task - Cumulative Update Audit](/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368) task.

## Monitor

1. Go to **Alert Management > Monitors**.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_1.webp)

2. Click the **Add Monitor** button.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_2.webp)

3. This screen will appear.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_3.webp)

4. Fill in the Name and Description boxes.  
   **Name:** Cumulative Update Audit  
   **Description:** The monitor set will generate an alert for computers in which the custom field `Latest Cumulative Update` contains 'Failed.' Furthermore, it will automatically resolve the associated ticket if 'Success' is present in the aforementioned custom field.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_4.webp)

5. Select the **Custom Field** in the Type dropdown.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_5.webp)

6. Select **Text Box** from the **Custom Field Type** dropdown and **Latest Cumulative Update** from the **Custom Field Name** dropdown for both **Conditions** and **Ticket Resolution** sections.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_6.webp)

7. Add **Failed** in the **Enter Value Field** of the **Conditions** section and **Success** in the **Enter Value Field** of the **Ticket Resolution** section.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_7.webp)

8. Select the Resources/Clients to apply the monitor set against.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_8.webp)

9. Select **Patch Management** for the **Family** and **Others** or any relevant option for the **Severity**.  
   ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_9.webp)

10. This is how the monitor set should look before saving it.  
    ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_10.webp)

11. Click the **Save** button to save the monitor set.  
    ![Image](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_11.webp)

## Dependencies

- [CW RMM - Custom Field - Latest Cumulative Update](/docs/67416ac2-2311-43c4-8fbf-c5b0c9a48e71)
- [CW RMM - Task - Cumulative Update Audit](/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368)


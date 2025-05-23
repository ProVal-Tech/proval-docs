---
id: '8ceb86c8-23b2-4a95-b920-f78e446d9e59'
slug: /8ceb86c8-23b2-4a95-b920-f78e446d9e59
title: 'Crystal Disk Info Health Status'
title_meta: 'Crystal Disk Info Health Status'
keywords: ['monitor', 'alert', 'disk', 'health', 'custom', 'field']
description: 'This document provides a step-by-step guide on setting up a monitor in ConnectWise RMM that generates alerts based on the health status of disks as reported by the Crystal Disk Info custom field. It also details how to automate ticket resolution based on the disk health status.'
tags: ['disk', 'setup']
draft: false
unlisted: false
---

## Summary

The monitor set will generate an alert for computers in which the custom field [CW RMM - Custom Field - Crystal Disk Info_Disk Health](/docs/1e713ef3-1378-4601-a00a-c8a8ecd60c01) contains either 'Bad' or 'Caution.' Furthermore, it will automatically resolve the associated ticket if neither 'Bad' nor 'Caution' is present in the aforementioned custom field.

## Monitor

1. Go to **Alert Management > Monitors**.  
   ![Step 1](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_1.webp)

2. Click the **Add Monitor** button.  
   ![Step 2](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_2.webp)

3. This screen will appear.  
   ![Step 3](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_3.webp)

4. Fill in the Name and Description boxes.  
   **Name:** Crystal Disk Info Health Status  
   **Description:** This monitor set will generate an alert for computers in which the custom field `Crystal Disk Info_Disk Health` contains either 'Bad' or 'Caution'. Furthermore, it will automatically resolve the associated ticket if neither 'Bad' nor 'Caution' is present in the aforementioned custom field.  
   ![Step 4](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_4.webp)

5. Select the **Custom Field** in the Type dropdown.  
   ![Step 5](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_5.webp)

6. Select the **Text Box** from the **Custom Field Type** dropdown and **Crystal Disk Info_Disk Health** from the **Custom Field Name** dropdown for both **Conditions** and **Ticket Resolution** sections.  
   ![Step 6](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_6.webp)

7. Leave the **Conditions** section condition as `Contains` and select `Does not contain` condition for the **Ticket Resolution** section. Select `OR` for the operator in the **Conditions** section and `AND` as the operator in the **Ticket Resolution** section. For the **value field**, type `Bad`, then press Enter, and type `Caution`, pressing Enter for both sections.  
   ![Step 7](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_7.webp)

8. Select the Resources/Clients to apply the monitor set against.  
   ![Step 8](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_8.webp)

9. Select **Hardware** for the **Family** and **Critical Impact Alerts** or any relevant option for the **Severity**.  
   ![Step 9](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_9.webp)

10. This is how the monitor set should look before saving it.  
    ![Step 10](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_10.webp)

11. Click the **Save** button to save the monitor set.  
    ![Step 11](../../../static/img/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59/image_11.webp)

## Dependencies

- [CW RMM - Custom Field - Crystal Disk Info_Disk Health](/docs/1e713ef3-1378-4601-a00a-c8a8ecd60c01)  
- [CW RMM - Task - Get Crystal Disk Info (Disk Health)](/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b)
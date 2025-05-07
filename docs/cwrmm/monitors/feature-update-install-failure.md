---
id: '67eaa7f5-bf6c-4680-982b-8b64fc27a76f'
slug: /67eaa7f5-bf6c-4680-982b-8b64fc27a76f
title: 'Feature Update Install Failure'
title_meta: 'Feature Update Install Failure'
keywords: ['alerts', 'monitor', 'failure', 'update', 'tracking']
description: 'This document provides a step-by-step guide to create alerts for monitoring failures during the Feature Update Install process using the ConnectWise RMM platform. It includes dependencies, monitor setup instructions, and visual aids for clarity.'
tags: ['update']
draft: false
unlisted: false
---

## Summary

This document outlines how to set up alerts for computers where the `Feature Update Install with Tracking` script failed to upgrade the machine for any reason.

## Dependencies

- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)
- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)

## Monitor

1. Go to **Alert Management > Monitors.**  
   ![Step 1](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_3.png)

2. Click the **Create Monitor** button.  
   ![Step 2](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_4.png)

3. This screen will appear.  
   ![Step 3](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_5.png)

4. Fill in the Name and Description boxes.  
   **Name:** Feature Update Install Failure  
   **Description:** Alerts on the computer where the `Feature Update Install with Tracking` script failed to upgrade the machine for any reason.  
   ![Step 4](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_6.png)

5. Select **Custom Field** in the Type dropdown, **Others** in the Severity, and **Patch Management** for the Family.  
   ![Step 5](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_7.png)

6. Select **Text Box** from the **Custom Field Type** dropdown and **Feature Update Install Failure** from the **Custom Field Name** dropdown menu. Type **Error** and press enter in the **Enter Value** field.  
   ![Step 6](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_8.png)

7. Choose the same values/options in the **Ticket Resolution** section, with the only difference being to use **Does Not Contain** as the operator instead of **Contains**.  
   ![Step 7](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_9.png)

8. Click the **Select Targets** button to select the clients to monitor.  
   ![Step 8](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_10.png)

9. Select the relevant clients to monitor and click the **Save Selection** button.  
   ![Step 9](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_11.png)

10. Confirm that this is the final appearance of the monitor set, then save it by clicking the **Save** button.  
    ![Step 10](../../../static/img/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3/image_12.png)



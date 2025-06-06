---
id: '94a786f8-dfa2-416c-aa3b-e57acbba1cb2'
slug: /94a786f8-dfa2-416c-aa3b-e57acbba1cb2
title: 'Feature Update Install Reboot Pending'
title_meta: 'Feature Update Install Reboot Pending'
keywords: ['notifications', 'feature', 'update', 'install', 'reboot', 'pending', 'monitor']
description: 'This document outlines the steps to create a monitor for notifications regarding computers where the Feature Update Install with Tracking script has completed, but a restart is still pending. It includes dependencies and detailed instructions for setting up the monitor in Alert Management.'
tags: []
draft: false
unlisted: false
---

## Summary

Notifications for computers where the `Feature Update Install with Tracking` script has completed, but a restart is pending.

## Dependencies

- [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56)
- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)

## Monitor

1. Go to Alert Management > Monitors.  
   ![Step 1](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_1.webp)

2. Click the `Create Monitor` button.  
   ![Step 2](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_2.webp)

3. This screen will appear.  
   ![Step 3](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_3.webp)

4. Fill in the Name and Description fields.  
   **Name:** Feature Update Install Reboot Pending  
   **Description:** Notifications for computers where the `Feature Update Install with Tracking` script has completed, but a restart is pending.  
   ![Step 4](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_4.webp)

5. Select `Custom Field` in the Type dropdown, `Others` in the Severity dropdown, and `Patch Management` for the Family.  
   ![Step 5](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_5.webp)

6. Select `Flag` from the `Custom Field Type` dropdown and `Feature Update Reboot Pending` from the `Custom Field Name` dropdown menu. Select `Yes` for the `Flag Value`.  
   ![Step 6](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_6.webp)

7. Choose the same values/options in the `Ticket Resolution` section, with the only difference being to use `No` for the Flag Value instead of `Yes`.  
   ![Step 7](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_7.webp)

8. Click the `Select Targets` button to select the clients to monitor.  
   ![Step 8](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_8.webp)

9. Select the relevant clients to monitor and click the `Save Selection` button.  
   ![Step 9](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_9.webp)

10. Confirm that this is the final appearance of the monitor set, then save it by clicking the `Save` button.  
    ![Step 10](../../../static/img/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2/image_10.webp)
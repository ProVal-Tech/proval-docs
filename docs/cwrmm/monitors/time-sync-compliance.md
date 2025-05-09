---
id: 'e6735934-f31f-4993-94b5-c297546ede23'
slug: /e6735934-f31f-4993-94b5-c297546ede23
title: 'Time Sync Compliance'
title_meta: 'Time Sync Compliance'
keywords: ['time', 'sync', 'monitor', 'ntp', 'compliance']
description: 'This document provides a step-by-step guide on creating a Time Sync Compliance Monitor that syncs machine time with us.pool.ntp.org, ensuring accurate timekeeping across devices.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will sync the machine's time with us.pool.ntp.org.

## Monitor

1. Navigate to `Endpoints` > `Alerts` > `Monitors`
   
   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_1.webp)

2. Click the `Create Monitor` button.

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_2.webp)

3. This screen will appear.

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_3.webp)

4. **Name:** Time Sync Compliance  
   **Description:** This monitor will sync machine time with us.pool.ntp.org.  
   **Type:** Script  
   **Family:** Desktop Operating System  
   **Severity:** Others  

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_4.webp)

5. The `Conditions` tab will start looking like this:

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_5.webp)

6. Set the `Repeat every` to `24` Hours:

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_6.webp)

7. Disable the `Ticket Resolution` section by clicking the `Automatically resolve` button.

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_7.webp)

8. Paste this PowerShell script in the `Script` box.

   ```powershell
   $S = 'W32Time';
   $peerList = 'us.pool.ntp.org';
   $syncOutput = '';
   if ((Get-Service $S).Status -ne 'Running') 
   {Try
      {Start-Service $S -Confirm:$False -ErrorAction Stop | Out-Null}
   catch 
      {return "Failed to start $S Service. Reason: $($Error.Exception.Message)"}
      };
   $syncOutput += w32tm /config /manualpeerlist:$peerList;
   Start-Sleep -Seconds 5;
   $syncOutput += "`n" + (W32tm /resync /force);
   if ($syncOutput -match 'The computer did not resync') 
      {return 'Failed: The computer did not resync.'} 
   else 
      {return 'Success: The computer resynced successfully.'}
   ```

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_8.webp)

9. Set `Failed` to the `Script Output` box.

   ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_9.webp)

10. Select the required client or group to target from the `Select Targets` button.

    ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_10.webp)  
    ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_11.webp)

11. Monitors Final Look

    ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_12.webp)

12. Click the `Save` button to save the monitor set.

    ![Image](../../../static/img/docs/e6735934-f31f-4993-94b5-c297546ede23/image_13.webp)

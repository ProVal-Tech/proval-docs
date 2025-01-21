---
id: 'e6735934-f31f-4993-94b5-c297546ede23'
title: 'Time Sync Compliance Monitor'
title_meta: 'Time Sync Compliance Monitor'
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
   
   ![Image](../../../static/img/Time-Sync-Compliance/image_1.png)

2. Click the `Create Monitor` button.

   ![Image](../../../static/img/Time-Sync-Compliance/image_2.png)

3. This screen will appear.

   ![Image](../../../static/img/Time-Sync-Compliance/image_3.png)

4. **Name:** Time Sync Compliance  
   **Description:** This monitor will sync machine time with us.pool.ntp.org.  
   **Type:** Script  
   **Family:** Desktop Operating System  
   **Severity:** Others  

   ![Image](../../../static/img/Time-Sync-Compliance/image_4.png)

5. The `Conditions` tab will start looking like this:

   ![Image](../../../static/img/Time-Sync-Compliance/image_5.png)

6. Set the `Repeat every` to `24` Hours:

   ![Image](../../../static/img/Time-Sync-Compliance/image_6.png)

7. Disable the `Ticket Resolution` section by clicking the `Automatically resolve` button.

   ![Image](../../../static/img/Time-Sync-Compliance/image_7.png)

8. Paste this PowerShell script in the `Script` box.

   ```powershell
   $S = 'W32Time';
   $peerList = 'us.pool.ntp.org';
   $syncOutput = '';
   if ((Get-Service $S).Status -ne 'Running') 
   {
       Try
       {
           Start-Service $S -Confirm:$False -ErrorAction Stop | Out-Null
       }
       catch 
       {
           return "Failed to start $S Service. Reason: $($Error.Exception.Message)"
       };
   }
   $syncOutput += w32tm /config /manualpeerlist:$peerList;
   Start-Sleep -Seconds 5;
   $syncOutput += "`n" + (W32tm /resync /force);
   if ($syncOutput -match 'The computer did not resync') 
   {
       return 'Failed: The computer did not resync.'
   } 
   else 
   {
       return 'Success: The computer resynced successfully.'
   }
   ```

   ![Image](../../../static/img/Time-Sync-Compliance/image_8.png)

9. Set `Failed` to the `Script Output` box.

   ![Image](../../../static/img/Time-Sync-Compliance/image_9.png)

10. Select the required client or group to target from the `Select Targets` button.

    ![Image](../../../static/img/Time-Sync-Compliance/image_10.png)  
    ![Image](../../../static/img/Time-Sync-Compliance/image_11.png)

11. Monitors Final Look

    ![Image](../../../static/img/Time-Sync-Compliance/image_12.png)

12. Click the `Save` button to save the monitor set.

    ![Image](../../../static/img/Time-Sync-Compliance/image_13.png)


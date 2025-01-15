---
id: '32a21209-8991-4302-b40c-e9c16ebe4331'
title: 'Windows License Status Monitor'
title_meta: 'Windows License Status Monitor'
keywords: ['monitor', 'license', 'windows', 'status', 'alert']
description: 'This document provides a step-by-step guide to creating a Windows License Status Monitor that identifies computers with expired or inactive Windows license keys, ensuring compliance and operational efficiency.'
tags: ['monitor', 'license', 'windows', 'alert', 'configuration']
draft: false
unlisted: false
---
## Summary

This monitor will identify computers where the license key is reported as inactivated or in a grace period.

## Monitor

1. Go to `Alert Management` > `Monitors` > `Add monitor`  
   ![Step 1](../../../static/img/Windows-License-Status/image_2.png)

2. Click the `Create Monitor` button.  
   ![Step 2](../../../static/img/Windows-License-Status/image_3.png)

3. This screen will appear.  
   ![Step 3](../../../static/img/Windows-License-Status/image_4.png)

4. **Name:** Windows License Status  
   **Description:** The monitor will detect computers with expired Windows license keys.  
   **Type:** Script  
   **Family:** Critical Impact Alerts  
   **Severity:** Desktop Operating System  
   ![Step 4](../../../static/img/Windows-License-Status/image_5.png)

5. The `Conditions` tab will start looking like this:  
   ![Step 5](../../../static/img/Windows-License-Status/image_6.png)

6. Set the `Repeat every` to 24 Hours:  
   ![Step 6](../../../static/img/Windows-License-Status/image_7.png)

7. Disable the `Ticket Resolution` section by clicking the `Automatically resolve` button.  
   ![Step 7](../../../static/img/Windows-License-Status/image_8.png)

8. The `Conditions` section will change to this:  
   ![Step 8](../../../static/img/Windows-License-Status/image_9.png)

9. Paste this PowerShell script in the `Script` box.  
   ```powershell
   $ErrorActionPreference = 'SilentlyContinue';

   (Get-CimInstance -Class SoftwareLicensingProduct -Filter "Name LIKE 'Windows%'" |
       Where-Object { $_.PartialProductKey } |
       Select-Object @{
           label = 'LStatus';
           expression = {
               switch ($_.LicenseStatus) {
                   0 { 'Unlicensed' }
                   1 { 'Licensed' }
                   2 { 'OOBGrace' }
                   3 { 'OOTGrace' }
                   4 { 'NonGenuineGrace' }
                   5 { 'Notification' }
                   6 { 'ExtendedGrace' }
               }
           }
       }).LStatus
   ```
   ![Step 9](../../../static/img/Windows-License-Status/image_10.png)

10. Change the comparator to `OR` from `AND`  
    ![Step 10a](../../../static/img/Windows-License-Status/image_11.png)  
    ![Step 10b](../../../static/img/Windows-License-Status/image_12.png)

11. Set `Unlicensed` and `NonGenuineGrace` to the `Script Output` box.  
    ![Step 11](../../../static/img/Windows-License-Status/image_13.png)

12. Enable the `Escalate ticket on script failure`.  
    ![Step 12](../../../static/img/Windows-License-Status/image_14.png)

13. Select the required client to target from the `Select Targets` button.  
    ![Step 13a](../../../static/img/Windows-License-Status/image_15.png)  
    ![Step 13b](../../../static/img/Windows-License-Status/image_16.png)

14. Final look:  
    ![Step 14](../../../static/img/Windows-License-Status/image_17.png)

15. Click the `Save` button to save the monitor set.  
    ![Step 15](../../../static/img/Windows-License-Status/image_18.png)








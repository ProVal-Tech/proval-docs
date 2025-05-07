---
id: '32a21209-8991-4302-b40c-e9c16ebe4331'
slug: /32a21209-8991-4302-b40c-e9c16ebe4331
title: 'Windows License Status'
title_meta: 'Windows License Status'
keywords: ['monitor', 'license', 'windows', 'status', 'alert']
description: 'This document provides a step-by-step guide to creating a Windows License Status Monitor that identifies computers with expired or inactive Windows license keys, ensuring compliance and operational efficiency.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This monitor will identify computers where the license key is reported as inactivated or in a grace period.

## Monitor

1. Go to `Alert Management` > `Monitors` > `Add monitor`  
   ![Step 1](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_2_1.webp)

2. Click the `Create Monitor` button.  
   ![Step 2](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_3.webp)

3. This screen will appear.  
   ![Step 3](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_4.webp)

4. **Name:** Windows License Status  
   **Description:** The monitor will detect computers with expired Windows license keys.  
   **Type:** Script  
   **Family:** Critical Impact Alerts  
   **Severity:** Desktop Operating System  
   ![Step 4](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_5.webp)

5. The `Conditions` tab will start looking like this:  
   ![Step 5](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_6.webp)

6. Set the `Repeat every` to 24 Hours:  
   ![Step 6](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_7.webp)

7. Disable the `Ticket Resolution` section by clicking the `Automatically resolve` button.  
   ![Step 7](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_8.webp)

8. The `Conditions` section will change to this:  
   ![Step 8](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_9.webp)

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
   ![Step 9](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_10.webp)

10. Change the comparator to `OR` from `AND`  
    ![Step 10a](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_11.webp)  
    ![Step 10b](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_12.webp)

11. Set `Unlicensed` and `NonGenuineGrace` to the `Script Output` box.  
    ![Step 11](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_13.webp)

12. Enable the `Escalate ticket on script failure`.  
    ![Step 12](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_14.webp)

13. Select the required client to target from the `Select Targets` button.  
    ![Step 13a](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_15.webp)  
    ![Step 13b](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_16.webp)

14. Final look:  
    ![Step 14](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_17.webp)

15. Click the `Save` button to save the monitor set.  
    ![Step 15](../../../static/img/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e/image_18.webp)

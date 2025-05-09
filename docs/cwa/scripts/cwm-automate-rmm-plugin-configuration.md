---
id: 'f99ddaae-0cb3-4941-b2aa-dc93671dd246'
slug: /f99ddaae-0cb3-4941-b2aa-dc93671dd246
title: 'CWM - Automate - RMM+ Plugin Configuration'
title_meta: 'CWM - Automate - RMM+ Plugin Configuration'
keywords: ['rmm', 'plugin', 'session', 'machines', 'checkin']
description: 'This document provides a detailed guide on configuring the RMM+ Plugin, including steps to create sessions for machines that have not checked in for a specified number of days. It covers the necessary settings in the client control portal and the Automate control center, ensuring a seamless integration and management of remote sessions.'
tags: ['networking', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

This document assists with configuring the RMM+ Plugin and explains how to create sessions for machines that have not checked in for over **`X`** number of days.

## Implementation

1. Log in to the client's control portal and check if the extension for RMM+ has been updated.

2. Go to `Edit Settings` for the RMM+ plugin.  
   ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_1.webp)

3. Navigate to RMMPlus.AccessKey and select the `Custom` option. Create a random password as the custom value.

4. Go to AllowedOrigin and select the `Custom` option. Enter the FQDN of the client's environment.  
   The FQDN should not contain `https://`.  
   For example, Origin: [labtech.provaltech.com](http://labtech.provaltech.com)  
   ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_2.webp)

5. Save the settings.

6. Open the Automate control center of the client. Navigate to System Dashboard > Config > Configuration > Properties.

7. Add the following values in Properties:  

   | Parameter                       | Value                                                                                      |
   |---------------------------------|--------------------------------------------------------------------------------------------|
   | RMMPlus_AccessKey               | Enter the value you entered in Step 3                                                     |
   | RMMPlus_Headers                 | Origin: FQDN as entered in Step 4 (For example - Origin: [labtech.provaltech.com](http://labtech.provaltech.com)) |
   | RMMPlus_StaleAgentThreshold     | 30                                                                                         |
   | RMMPlus_Timeout                 | 10000                                                                                      |  
   ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_3.webp)

8. Add the Get Post Plugin in the client's environment. Follow the steps below:  
   - Open Plugin Manager. Navigate to Advanced > Manage Plugins > Add Plugin.  
     ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_4.webp)  
   - Select the .dll file for the Get Post Plugin. See attachment.  
   - Check the box for a remote agent.  
   - Enable the plugin. This will restart the DB agent.  
   - Reload DB agent plugins.

9. Reload the System Cache.  
   ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_5.webp)

10. Open the `ScreenConnect Client - Command - Execute` script and check if you can see the `Plugin Function DataComm - HTTP GET/POST` step.  
    ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_6.webp)

## Optional

Create a session group in the ScreenConnect portal for machines that have not checked into Control for over **`X`** days.  
- Go to the ScreenConnect Web Portal.  
- Navigate to the `Access` portal.  
  ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_7.webp)  
- Click on the `+ Create Session Group` option available at the bottom of the screen.  
  ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_8.webp)  
- Enter the name for the session and add the filter as below. You can customize it as per your requirements by clicking on the **`+`** icon in front of the `Session Filter` option. You can also select the `Show Reference` option for more clarity.  
  ```
  GuestConnectedCount = 0 AND LastEventTime < $30DAYSAGO
  ```  
  Change the number of days in `$30DAYSAGO` as per your requirement.  
  ![Image](../../../static/img/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246/image_9.webp)  
- Click on Create. Now you can see the agents that have not checked in for over **`X`** days.
## Attachments
[HTTP-GET-POST.dll](<../../../static/attachments/itg/9770217/HTTP-GET-POST.dll>)
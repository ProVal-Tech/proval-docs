---
id: 'cwa_configuring_rmm_plus_plugin'
title: 'Configuring the RMM+ Plugin'
title_meta: 'Configuring the RMM+ Plugin for Efficient Session Management'
keywords: ['rmm', 'plugin', 'session', 'machines', 'checkin']
description: 'This document provides a detailed guide on configuring the RMM+ Plugin, including steps to create sessions for machines that have not checked in for a specified number of days. It covers the necessary settings in the client control portal and the Automate control center, ensuring a seamless integration and management of remote sessions.'
tags: ['configuration', 'setup', 'software', 'windows', 'networking']
draft: false
unlisted: false
---
## Purpose

This document helps with Configuring the RMM+ Plugin and explains how to create sessions for machines that have not checked in for over **`X`** number of days.

## Implementation

1. Log in to the client's control portal and check if the extension for RMM+ has been updated.

2. Go to `edit setting` for the RMM+ plugin  
   ![Image](5078775/docs/9770217/images/13563970)

3. Go to RMMPlus.Accesskey and select the `custom` option. Create a random password as the custom value.

4. Go to AllowedOrigin and select the `custom` option. Enter the FQDN of the client's environment.  
   The FQDN should not contain `https://`  
   For Ex- Origin: [labtech.provaltech.com](http://labtech.provaltech.com)  
   ![Image](5078775/docs/9770217/images/21296464)

5. Save the setting.

6. Open the Automate control center of the client. Navigate to System dashboard > config > Configuration > Properties.

7. Add the below values in properties:  

   | Parameter                       | Value                                                                                      |
   |---------------------------------|--------------------------------------------------------------------------------------------|
   | RMMPlus_AccessKey               | Enter the value you entered in Step 3                                                     |
   | RMMPlus_Headers                 | Origin: FQDN as entered in step 4 (For ex - Origin: [labtech.provaltech.com](http://labtech.provaltech.com)) |
   | RMMPlus_StaleAgentThreshold     | 30                                                                                         |
   | RMMPlus_Timeout                 | 10000                                                                                      |  
   ![Image](5078775/docs/9770217/images/22119383)

8. Add the Get Post Plugin in the client's environment. Follow the below steps:  
   - Open Plugin Manager. Navigate to advanced > Manage Plugins > Add Plugin  
     ![Image](5078775/docs/9770217/images/13565273)
   - Select the .dll file for the Get Post Plugin. See attachment.
   - Check the box for a remote agent.
   - Enable the plugin. It will restart the DB agent.
   - Reload DB agent plugins.

9. Reload the System Cache.  
   ![Image](5078775/docs/9770217/images/22119456)

10. Open the `ScreenConnect Client - Command - Execute*` script and check if you can see the `Plugin Function DataComm - HTTP GET/POST` step.  
    ![Image](5078775/docs/9770217/images/22119517)

## Optional

Create a session group in the ScreenConnect portal for machines that have not checked into Control for over **`X`** days.  
- Go to ScreenConnect Web Portal.
- Navigate to the `Access` portal.  
  ![Image](5078775/docs/9770217/images/22119726)
- Click on the `+ Create session group` option available at the bottom of the screen.  
  ![Image](5078775/docs/9770217/images/22119701)
- Enter the name for the session and add the filter as below. You can customize it as per the requirement by clicking on the **`+`** icon in front of the `Session Filter` option. You can also select the `Show reference` option for more clarity.  
  ```
  GuestConnectedCount = 0 AND LastEventTime < $30DAYSAGO
  ```
  Change the number of days in `$30DAYSAGO` as your requirement.  
  ![Image](5078775/docs/9770217/images/22119999)
- Click on Create. Now you can see the agents that have not checked in for over **`X`** days.



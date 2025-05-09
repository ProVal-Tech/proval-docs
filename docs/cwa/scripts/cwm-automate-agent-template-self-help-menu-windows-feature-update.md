---
id: '0c25060b-1272-449f-af97-64169e636e95'
slug: /0c25060b-1272-449f-af97-64169e636e95
title: 'CWM - Automate - Agent Template - Self Help Menu - Windows Feature Update'
title_meta: 'CWM - Automate - Agent Template - Self Help Menu - Windows Feature Update'
keywords: ['windows', 'feature', 'update', 'self', 'help', 'menu', 'script']
description: 'This article outlines the step-by-step process to add the Windows Feature Update option in the Self Help menu, enabling the installation of the latest feature pack for Windows 10 and 11 through a script.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

This article outlines the process to add the `Windows Feature Update` option in the `Self Help` menu.  
![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_1.webp)  

The `Windows Feature Update` option runs the `Install Windows Upgrade` [script](/docs/4a0526ef-6e45-4053-9a64-27713b7f4d28) to install the latest available feature pack for the computer.

## Dependencies

[EPM - Windows Configuration - Script - Install Windows Upgrade](/docs/4a0526ef-6e45-4053-9a64-27713b7f4d28)  

## Implementation

1. Update/Import the [Install Windows Upgrade](/docs/4a0526ef-6e45-4053-9a64-27713b7f4d28) using the `Prosync` Plugin.

2. Reload System Cache:  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_2.webp)  

3. Navigate to Automation > Templates > Agent Templates:  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_3.webp)  

4. The Agent Templates menu will appear:  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_4.webp)  

5. Double-click and open the agent template being used to manage the `Self Help` menu. We are using the `Default` agent template in the illustrations:  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_5.webp)  

6. Navigate to `Tray Menus` and click the `New Menu` button:  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_6.webp)  

7. - **Name**: Windows Feature Update  
   - **Description**: Performs Windows 10 and 11 Feature Update  
   - **Menu Text**: Windows Feature Update  
   - **Menu Action**: Script  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_7.webp)  

8. Select the `ProVal/Windows/Install Windows Upgrade*` script from the `Select a Script` dropdown menu.  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_8.webp)  

9. Click the `Save` button to save the changes made to the `Custom Tray Menu Editor`:  
   ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_9.webp)  

10. Double-click the `Self Help - Menu`:  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_10.webp)  

11. Select `Self Help - Menu` from the `Tray Menus` dropdown and click the `Edit` button to add the `Windows Feature Update` menu to the `Self Help - Menu`.  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_11.webp)  

12. The `Custom Tray Menu Editor` will appear for the `Self Help - Menu`:  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_12.webp)  

13. Select the `Windows Feature Update` menu from the `Tray Menus` dropdown.  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_13.webp)  

14. Click the `Add` button to add the `Windows Feature Update` menu to the Active Menus list.  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_14.webp)  

15. Click the `Save` button to save the changes made to the `Self Help - Menu`.  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_15.webp)  

16. Add back the `Self Help - Menu` to the agent template's active menus:  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_16.webp)  

17. Click the `Save` button to save the changes made to the agent template.  
    ![Image](../../../static/img/docs/0c25060b-1272-449f-af97-64169e636e95/image_17.webp)  

Configuration updates will take effect on devices after running the `Update Config` command.
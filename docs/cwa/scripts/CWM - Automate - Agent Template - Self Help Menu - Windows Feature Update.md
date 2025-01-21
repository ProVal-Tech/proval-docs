---
id: '0c25060b-1272-449f-af97-64169e636e95'
title: 'Adding Windows Feature Update to Self Help Menu'
title_meta: 'Adding Windows Feature Update to Self Help Menu'
keywords: ['windows', 'feature', 'update', 'self', 'help', 'menu', 'script']
description: 'This article outlines the step-by-step process to add the Windows Feature Update option in the Self Help menu, enabling the installation of the latest feature pack for Windows 10 and 11 through a script.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

This article outlines the process to add the `Windows Feature Update` option in the `Self Help` menu.  
![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_1.png)  

The `Windows Feature Update` option runs the `Install Windows Upgrade` [script](<./Install Windows Upgrade.md>) to install the latest available feature pack for the computer.

## Dependencies

[EPM - Windows Configuration - Script - Install Windows Upgrade](<./Install Windows Upgrade.md>)  

## Implementation

1. Update/Import the [Install Windows Upgrade](<./Install Windows Upgrade.md>) using the `Prosync` Plugin.

2. Reload System Cache:  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_2.png)  

3. Navigate to Automation > Templates > Agent Templates:  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_3.png)  

4. The Agent Templates menu will appear:  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_4.png)  

5. Double-click and open the agent template being used to manage the `Self Help` menu. We are using the `Default` agent template in the illustrations:  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_5.png)  

6. Navigate to `Tray Menus` and click the `New Menu` button:  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_6.png)  

7. - **Name**: Windows Feature Update  
   - **Description**: Performs Windows 10 and 11 Feature Update  
   - **Menu Text**: Windows Feature Update  
   - **Menu Action**: Script  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_7.png)  

8. Select the `ProVal/Windows/Install Windows Upgrade*` script from the `Select a Script` dropdown menu.  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_8.png)  

9. Click the `Save` button to save the changes made to the `Custom Tray Menu Editor`:  
   ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_9.png)  

10. Double-click the `Self Help - Menu`:  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_10.png)  

11. Select `Self Help - Menu` from the `Tray Menus` dropdown and click the `Edit` button to add the `Windows Feature Update` menu to the `Self Help - Menu`.  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_11.png)  

12. The `Custom Tray Menu Editor` will appear for the `Self Help - Menu`:  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_12.png)  

13. Select the `Windows Feature Update` menu from the `Tray Menus` dropdown.  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_13.png)  

14. Click the `Add` button to add the `Windows Feature Update` menu to the Active Menus list.  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_14.png)  

15. Click the `Save` button to save the changes made to the `Self Help - Menu`.  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_15.png)  

16. Add back the `Self Help - Menu` to the agent template's active menus:  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_16.png)  

17. Click the `Save` button to save the changes made to the agent template.  
    ![Image](../../../static/img/CWM---Automate---Agent-Template---Self-Help-Menu---Windows-Feature-Update/image_17.png)  

Configuration updates will take effect on devices after running the `Update Config` command.


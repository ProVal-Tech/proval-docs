---
id: 'f4a08fe7-fb91-4bfb-9650-fb8da3ebd5b2'
title: 'Script Permissions - Set Properties'
title_meta: 'Script Permissions - Set Properties'
keywords: ['permissions', 'scripts', 'user-classes', 'access', 'security']
description: 'This document outlines a script designed for managing view and edit permissions for scripts within specific folders. It details the necessary system properties, user classes, and implementation steps to ensure secure access control.'
tags: ['security', 'setup']
draft: false
unlisted: false
---

## Summary

The script is designed to manage view and edit permissions for scripts within specific script folders. It relies on system properties to determine folder IDs, user classes for view permissions, and user classes for edit permissions.

- The folder IDs of the scripts are expected to be stored in the `SSP_Script_Folder_Ids` system property.
- User classes designated for view permissions should be specified in the `SSP_View_Permission_User_Classes` system property.
- User classes designated for edit permissions should be specified in the `SSP_Edit_Permission_User_Classes` system property.

Importantly, if the `SSP_Script_Folder_Ids` property is missing or not set, the script will not execute any changes.

Furthermore, if the system properties for user classes regarding view and edit permissions are not set, the script will default to granting both edit and view permissions to the `Super Admin` user class.

In essence, this script ensures proper management of permissions for scripts within designated folders, ensuring security and access control based on the system properties.

![Image](../../../static/img/Script-Permissions---Set-Properties/image_1.png)

**Note:** Prior to proceeding, kindly obtain the name(s) of the script folder(s) and the user class(es) from the consultant.

## Show the Folder IDs of Script Folders

1. Navigate to `Preferences`  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_2.png)

2. Enable the `Show` option for `Object IDs` and click the `SAVE` button to apply and save the preferences.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_3.png)

## Find the Folder IDs of Script Folders

3. Navigate to Automation > Scripts > View Scripts.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_4.png)

4. Navigate to the search field located on the left-hand side of the screen and search for the name(s) of the script folder(s). As an example, you can search for the `_Automation` folder. The number displayed within parentheses alongside the folder name represents the folder's ID.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_5.png)

## Find the Name of the User Classes

1. Navigate to System > User and Contacts > User Class Manager to access the `User Class Manager`.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_6.png)

2. Retrieve the name(s) of the user class(es) from the `User Class Manager` to which the script permissions will be restricted.

## Implementation

1. Import the [Script Permissions - Set [Properties]](https://proval.itglue.com/5078775/docs/15204546) script from the `ProSync` plugin.

2. Execute the script against any client with the `Set_Environment` parameter set to `1` to create the associated system properties.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_8.png)

3. Reload the System Cache.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_9.png)

4. Navigate to System > Configuration > Dashboard > Config > Configurations > Properties.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_10.png)  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_11.png)

5. Locate the `SSP_Script_Folder_Ids` system property and set the ID(s) of the desired script folder(s).  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_12.png)  
   Multiple IDs can be set by separating them with a comma without any spaces between them.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_13.png)

6. Locate the `SSP_View_Permission_User_Classes` system property and set the name(s) of the User Class(es) that require view permissions for the scripts.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_14.png)  
   Multiple User Class names can be set by separating them with a comma without any spaces between them.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_15.png)

7. Locate the `SSP_Edit_Permission_User_Classes` system property and set the name(s) of the User Class(es) that require edit permissions for the scripts.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_16.png)  
   Multiple User Class names can be set by separating them with a comma without any spaces between them.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_17.png)

8. Navigate to Management > Scheduled Client Scripts inside the `Dashboard` and schedule the script to run once per hour.  
   ![Image](../../../static/img/Script-Permissions---Set-Properties/image_18.png)

## System Properties

| Name                          | Default      | Required | Description                                                                                               |
|-------------------------------|--------------|----------|-----------------------------------------------------------------------------------------------------------|
| `SSP_Script_Folder_Ids`       | 0            | True     | Stores the IDs of the Script Folder(s) of the scripts for which script permissions need to be restricted. |
| `SSP_View_Permission_User_Classes` | Super Admin | True     | Stores the name(s) of the User Class(es) that require view permissions for the scripts.                  |
| `SSP_Edit_Permission_User_Classes` | Super Admin | True     | Stores the name(s) of the User Class(es) that require edit permissions for the scripts.                  |




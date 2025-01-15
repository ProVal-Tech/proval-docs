---
id: '5c889aef-ed96-405b-b44f-511436105f2c'
title: 'SWM - Software Configuration - Prevent Saving Browser Passwords'
title_meta: 'SWM - Software Configuration - Prevent Saving Browser Passwords'
keywords: ['browser', 'passwords', 'registry', 'security', 'configuration']
description: 'This document details a script that prevents browsers from prompting to save passwords by modifying the registry settings for Internet Explorer, Chrome, Firefox, and Edge. It includes options to enable password saving and remove currently saved passwords, along with sample runs and variable descriptions.'
tags: ['configuration', 'security', 'windows', 'software', 'uninstallation']
draft: false
unlisted: false
---
## Summary

This is a new version of the [SWM - Software Configuration - Script - Prevent Saving Browser Passwords (IE.Chrome.FF)](https://proval.itglue.com/DOC-5078775-8014332) script. 

This script currently supports IE, Chrome, Firefox, and Edge and will lock those browsers from prompting for saving passwords by making changes in the registry.

It gives you an option to Enable the Password Saving Feature for the concerned browsers as well. All you need to do is to put 1 for the `@Enable_Password_Saving_Feature@` parameter.

There's an additional feature available to Remove/Delete the currently Saved passwords for these browsers as well. All you need to do is to put 1 for the `@Remove_Saved_Password@` parameter. By default, it's disabled because the concerned browser has to be closed/terminated in order to remove the password.

## Sample Run

![Sample Run](../../../static/img/Prevent-Saving-Browser-Passwords-(IE.Chrome.FF,Edge)Params,ss/image_1.png)

In the above screenshot, Password Saving Feature for the Browsers will be disabled for the computer. Along with that, currently saved passwords will be removed as well, but it will close the concerned browser as well.

## Variables

| Name   | Description                                                       |
|--------|-------------------------------------------------------------------|
| OutCome| OutPut of the PowerShell script performing the action.           |

#### User Parameters

| Name                         | Example | Required | Description                                                                                  |
|------------------------------|---------|----------|----------------------------------------------------------------------------------------------|
| Enable_Password_Saving_Feature | 1       | False    | (empty or anything else) = Disables Password Saving, 1= Enable Password Saving              |
| Remove_Saved_Passwords       | 1       | False    | (empty or anything else) = Leave behind the currently saved password, 1= Remove the Currently Saved Password |

#### Script States

| Name                           | Example                 | Description                                                                                     |
|--------------------------------|------------------------|-------------------------------------------------------------------------------------------------|
| Date Disabled Password Saving Feature | 31/08/2022 02:00:00 AM | Last time the Password Saving Feature was disabled for the computer, can be used to create a dataview if needed. |
| Date Enabled Password Saving Feature  | 31/08/2022 02:00:00 AM | Last time the Password Saving Feature was Enabled for the computer, can be used to create a dataview if needed.  |

## Process

1. The script checks the parameter if it is to allow/disable the passwords to be saved.
2. It executes a PowerShell to perform the concerned action. Along with the feature to disable password saving feature, it removes the saved passwords as well and that depends on the value inputted to the Remove_Saved_Password parameter.
3. Verifies the PowerShell's outcome and logs the result.
4. Saves the current time to the script state.

## Output

- Script Log
- Script State








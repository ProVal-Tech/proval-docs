---
id: 'cwa-lock-browsers-password-saving-feature'
title: 'Lock Browsers Password Saving Feature'
title_meta: 'Lock Browsers Password Saving Feature'
keywords: ['browsers', 'passwords', 'registry', 'security', 'automation']
description: 'This document outlines a PowerShell script designed to lock password saving features in Internet Explorer, Chrome, Firefox, and Edge by modifying the Windows registry. It includes options to enable password saving and to remove saved passwords, with detailed instructions and a sample run for user guidance.'
tags: ['browsers', 'security', 'configuration', 'windows', 'setup']
draft: false
unlisted: false
---
## Summary

This script currently supports IE, Chrome, Firefox, and Edge and will lock those browsers from prompting for saving passwords by making changes in the registry.

It gives you an option to Enable the Password Saving Feature for the concerned browsers by setting the `@Enable_Password_Saving_Feature@` parameter to 1.

There's an additional feature available to Remove/Delete the currently Saved passwords for these browsers by setting the `@Remove_Saved_Password@` parameter to 1. By default, this is disabled because the concerned browser has to be closed/terminated in order to remove the password.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Prevent-Saving-Browser-Passwords-(IE.Chrome.FF)\image_1.png)

In the above screenshot, Password Saving Feature for the Browsers will be disabled for the computer, and any currently saved passwords will be removed. Selecting to remove saved passwords will close the concerned browser.

## Variables

| Name                     | Description                                                   |
|--------------------------|---------------------------------------------------------------|
| OutCome                  | OutPut of the PowerShell script performing the action.       |

### User Parameters

| Name                       | Example | Required | Description                                                                                   |
|----------------------------|---------|----------|-----------------------------------------------------------------------------------------------|
| Enable_Password_Saving_Feature | 1       | False    | (empty or anything else) = Disables Password Saving, 1= Enable Password Saving               |
| Remove_Saved_Passwords     | 1       | False    | (empty or anything else) = Leave behind the currently saved password, 1= Remove the Currently Saved Password |

## Script States

| Name                             | Example                  | Description                                                                                                        |
|----------------------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------|
| Date Disabled Password Saving Feature | 31/08/2022 02:00:00 AM | Last time the Password Saving Feature was disabled for the computer, can be used to create a dataview if needed. |
| Date Enabled Password Saving Feature  | 31/08/2022 02:00:00 AM | Last time the Password Saving Feature was Enabled for the computer, can be used to create a dataview if needed.  |

## Process

1. The script verifies the parameter requests.
2. It executes a PowerShell to perform the appropriate action(s).
3. Verifies the PowerShell's outcome and logs the result.
4. Saves the current time to the script state.

## Output

- Script log
- Script State




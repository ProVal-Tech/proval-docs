---
id: '5e0e3054-ce35-494b-bdde-c8b0c56305d0'
title: 'Lock Browsers Password Saving Feature'
title_meta: 'Lock Browsers Password Saving Feature'
keywords: ['browsers', 'passwords', 'registry', 'security', 'automation']
description: 'This document outlines a PowerShell script designed to lock password saving features in Internet Explorer, Chrome, Firefox, and Edge by modifying the Windows registry. It includes options to enable password saving and to remove saved passwords, with detailed instructions and a sample run for user guidance.'
tags: ['browsers', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script currently supports Internet Explorer, Chrome, Firefox, and Edge and will lock those browsers from prompting to save passwords by making changes in the registry.

It provides an option to enable the password saving feature for the concerned browsers by setting the `@Enable_Password_Saving_Feature@` parameter to 1.

There is an additional feature available to remove/delete the currently saved passwords for these browsers by setting the `@Remove_Saved_Password@` parameter to 1. By default, this is disabled because the concerned browser must be closed/terminated in order to remove the passwords.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Prevent-Saving-Browser-Passwords-(IE.Chrome.FF)/image_1.png)

In the above screenshot, the password saving feature for the browsers will be disabled for the computer, and any currently saved passwords will be removed. Selecting to remove saved passwords will close the concerned browser.

## Variables

| Name                     | Description                                                   |
|--------------------------|---------------------------------------------------------------|
| OutCome                  | Output of the PowerShell script performing the action.       |

### User Parameters

| Name                       | Example | Required | Description                                                                                   |
|----------------------------|---------|----------|-----------------------------------------------------------------------------------------------|
| Enable_Password_Saving_Feature | 1       | False    | (empty or anything else) = Disables password saving, 1 = Enables password saving            |
| Remove_Saved_Passwords     | 1       | False    | (empty or anything else) = Leaves the currently saved password, 1 = Removes the currently saved password |

## Script States

| Name                             | Example                  | Description                                                                                                        |
|----------------------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------|
| Date Disabled Password Saving Feature | 31/08/2022 02:00:00 AM | Last time the password saving feature was disabled for the computer; can be used to create a dataview if needed. |
| Date Enabled Password Saving Feature  | 31/08/2022 02:00:00 AM | Last time the password saving feature was enabled for the computer; can be used to create a dataview if needed.  |

## Process

1. The script verifies the parameter requests.
2. It executes a PowerShell command to perform the appropriate action(s).
3. It verifies the PowerShell's outcome and logs the result.
4. It saves the current time to the script state.

## Output

- Script log
- Script state


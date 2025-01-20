---
id: '3f819775-4c68-4511-ad44-d97a37ca3869'
title: 'Update Windows 10 with Reboot Options'
title_meta: 'Update Windows 10 with Reboot Options'
keywords: ['windows', 'update', 'reboot', 'notification', 'log']
description: 'This document provides a comprehensive guide on updating Windows 10 to the latest release, including options for rebooting or aborting the reboot process. It outlines important notes regarding user notifications and potential data loss in the C://windows directory, as well as parameters for running the update script.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

Updates Windows 10 to the latest release with the option to either prompt the user to Reboot (Prompt) or abort the reboot altogether (None).

### *** IMPORTANT NOTES ***

### If aborting the reboot, and a user is logged in the user will see the following
1. A blue box saying the computer will reboot will pop up with a close button, it will last about 5 seconds and vanish.

![image](../../../static/img/Windows-10---Update/image_1.png)

2. After the blue box vanishes a black notification may appear in the lower right-hand side of the screen saying a user logout was aborted.

![image](../../../static/img/Windows-10---Update/image_2.png)

### ***IMPORTANT FUNCTIONALITY NOTE***
If aborting the reboot, between the time that a user sees the blue banner and the time the computer is restarted **any change made to the C:/windows directory and its subfolders will be LOST after rebooting.**

### ****RUNNING AS AUTOFIX NOTE ****
**If you are running this as an autofix the reboot parameter WILL DEFAULT TO PROMPT.**

**This Means it will reboot.**

## Sample Run

![image](../../../static/img/Windows-10---Update/image_3.png)

## Dependencies

- [SEC - WindowsPatching - Agnostic - Update-Windows10](<../../powershell/Update-Windows10.md>)

### User Parameters

| Name    | Example        | Required | Description                                                                                      |
|---------|----------------|----------|--------------------------------------------------------------------------------------------------|
| Reboot  | None / Prompt  | True     | A Reboot value of None aborts the reboot, a value of Prompt will prompt the user.              |

## Process

Please review the document at [SEC - WindowsPatching - Agnostic - Update-Windows10](<../../powershell/Update-Windows10.md>).

## Output

- Script log














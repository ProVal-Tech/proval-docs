---
id: 'cwa-set-lastloggedonuser'
title: 'Set Last Logged On User Implementation'
title_meta: 'Set Last Logged On User Implementation for ConnectWise Automate'
keywords: ['automate', 'windows', 'login', 'user', 'management']
description: 'This document details the implementation of the agnostic script Set-LastLoggedOnUser for ConnectWise Automate, which manages the last logged-in user information displayed on the Windows login screen. It covers usage notes, sample runs, variables, user parameters, and output expectations.'
tags: ['configuration', 'windows', 'security', 'setup', 'user']
draft: false
unlisted: false
---
## Summary

This is an Automate implementation of the agnostic script [Set-LastLoggedOnUser](https://proval.itglue.com/DOC-5078775-16017466) to manage the last logged-in user's information displayed on the Windows login screen.

**Notes:**
- The user must have logged on to the computer at least once to be set at the login screen by this script.
- It is mandatory to restart the computer to implement changes. `Reboot` parameter can be used to forcefully restart the computer.
  - You can circumvent the need to reboot the machine if you are logged in while the script is running. Once you log out, the changes will be applied.

## Sample Run

- Clears the last logged-in user's information from the login screen. The computer must be restarted manually afterwards to implement the changes.
  
  ![Sample Run 1](../../../static/img/Set-Last-Logged-In-User/image_1.png)

- Clears the last logged-in user's information from the login screen and forcefully restarts the computer.
  
  ![Sample Run 2](../../../static/img/Set-Last-Logged-In-User/image_2.png)

- Sets the specified local user as the last logged-in user. The computer must be restarted manually afterwards to implement the changes.
  
  ![Sample Run 3](../../../static/img/Set-Last-Logged-In-User/image_3.png)

- Sets the specified domain user as the last logged-in user and forcefully restarts the computer.
  
  ![Sample Run 4](../../../static/img/Set-Last-Logged-In-User/image_4.png)

## Variables

| Name             | Description                                         |
|------------------|-----------------------------------------------------|
| ProjectName      | Set-LastLoggedOnUser                               |
| WorkingDirectory  | C:/ProgramData/_Automation/Script/Set-LastLoggedOnUser |

#### User Parameters

| Name         | Example              | Required | Description                                                                                     |
|--------------|----------------------|----------|-------------------------------------------------------------------------------------------------|
| Clear        | 1                    | True     | Clears the last logged-in user's information from the login screen.                           |
| UserName     | Domain/UserName      | True     | Sets the specified username as the last logged-in user. The username should be in the format 'Domain/User' or 'User'. |
| DisplayName  | User Name            | False    | Optionally specifies the display name to set for the last logged-in user. If not provided, it defaults to the username. |
| Reboot       | 1                    | False    | Optionally restarts the computer to apply the changes immediately.                             |

## Output

- Script log




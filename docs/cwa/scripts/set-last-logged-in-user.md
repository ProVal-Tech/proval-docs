---
id: 'd8fcfe10-81c9-42d9-b56b-a4021601f842'
slug: /d8fcfe10-81c9-42d9-b56b-a4021601f842
title: 'Set Last Logged In User'
title_meta: 'Set Last Logged In User'
keywords: ['automate', 'windows', 'login', 'user', 'management']
description: 'This document details the implementation of the agnostic script Set-LastLoggedOnUser for ConnectWise Automate, which manages the last logged-in user information displayed on the Windows login screen. It covers usage notes, sample runs, variables, user parameters, and output expectations.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This is an Automate implementation of the agnostic script [Set-LastLoggedOnUser](/docs/d657bd73-5526-4f27-93bb-9dbae3fe2f6e) to manage the last logged-in user's information displayed on the Windows login screen.

**Notes:**
- The user must have logged on to the computer at least once to be set on the login screen by this script.
- It is mandatory to restart the computer to implement changes. The `Reboot` parameter can be used to forcefully restart the computer.
  - You can circumvent the need to reboot the machine if you are logged in while the script is running. Once you log out, the changes will be applied.

## Sample Run

- Clears the last logged-in user's information from the login screen. The computer must be restarted manually afterward to implement the changes.
  
  ![Sample Run 1](../../../static/img/docs/d8fcfe10-81c9-42d9-b56b-a4021601f842/image_1.webp)

- Clears the last logged-in user's information from the login screen and forcefully restarts the computer.
  
  ![Sample Run 2](../../../static/img/docs/d8fcfe10-81c9-42d9-b56b-a4021601f842/image_2.webp)

- Sets the specified local user as the last logged-in user. The computer must be restarted manually afterward to implement the changes.
  
  ![Sample Run 3](../../../static/img/docs/d8fcfe10-81c9-42d9-b56b-a4021601f842/image_3.webp)

- Sets the specified domain user as the last logged-in user and forcefully restarts the computer.
  
  ![Sample Run 4](../../../static/img/docs/d8fcfe10-81c9-42d9-b56b-a4021601f842/image_4.webp)

## Variables

| Name              | Description                                          |
|-------------------|------------------------------------------------------|
| ProjectName       | Set-LastLoggedOnUser                                |
| WorkingDirectory   | C:/ProgramData/_Automation/Script/Set-LastLoggedOnUser |

#### User Parameters

| Name        | Example              | Required | Description                                                                                     |
|-------------|----------------------|----------|-------------------------------------------------------------------------------------------------|
| Clear       | 1                    | True     | Clears the last logged-in user's information from the login screen.                           |
| UserName    | Domain/UserName      | True     | Sets the specified username as the last logged-in user. The username should be in the format 'Domain/User' or 'User'. |
| DisplayName | User Name            | False    | Optionally specifies the display name to set for the last logged-in user. If not provided, it defaults to the username. |
| Reboot      | 1                    | False    | Optionally restarts the computer to apply the changes immediately.                             |

## Output

- Script log

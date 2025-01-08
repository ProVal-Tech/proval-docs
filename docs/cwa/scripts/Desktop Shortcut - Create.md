---
id: 'cwa-create-desktop-shortcut-for-all-users'
title: 'Create Desktop Shortcut for All Users'
title_meta: 'Create Desktop Shortcut for All Users'
keywords: ['desktop', 'shortcut', 'uri', 'icon', 'windows']
description: 'This document provides a guide on how to create a desktop shortcut for all users on a Windows system. It includes sample runs, user parameters, and dependencies for successful implementation.'
tags: ['windows', 'setup', 'configuration', 'software']
draft: false
unlisted: false
---
## Summary

Creates a desktop shortcut for all users.

## Sample Run

![Image 1](5078775/docs/11686735/images/19020009)  
![Image 2](5078775/docs/11686735/images/16342925)  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
![Image 3](5078775/docs/11686735/images/16342949)  
![Image 4](5078775/docs/11686735/images/19020012)  
![Image 5](5078775/docs/11686735/images/16342966)  

## Dependencies

- [EPM - Windows Configuration - Agnostic - New-DesktopUriShortcut](https://proval.itglue.com/DOC-5078775-11676992) 

#### User Parameters

| Name        | Example                                                                                   | Required | Description                                                       |
|-------------|-------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------|
| TargetUri   | [Https://www.google.com](Https://www.google.com) or C:\Somedirectory\somefile.someextension | True     | The shortcut target.                                             |
| ShortcutName| SomethingIWantToCallThis                                                                  | False    | The name of the shortcut as seen on the desktop.                |
| IconURL     | [https://www.google.com/favicon.ico](https://www.google.com/favicon.ico)                 | False    | Download URL to download the *.ico file to set as the shortcut's icon. |

## Process

Please reference the agnostic documentation for process.



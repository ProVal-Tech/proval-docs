---
id: 'de971be6-bd0c-432c-a0de-94119ee0da2b'
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

![Image 1](../../../static/img/Desktop-Shortcut---Create/image_1.png)  
![Image 2](../../../static/img/Desktop-Shortcut---Create/image_2.png)  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
![Image 3](../../../static/img/Desktop-Shortcut---Create/image_3.png)  
![Image 4](../../../static/img/Desktop-Shortcut---Create/image_4.png)  
![Image 5](../../../static/img/Desktop-Shortcut---Create/image_5.png)  

## Dependencies

- [EPM - Windows Configuration - Agnostic - New-DesktopUriShortcut](https://proval.itglue.com/DOC-5078775-11676992) 

#### User Parameters

| Name        | Example                                                                                   | Required | Description                                                       |
|-------------|-------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------|
| TargetUri   | [Https://www.google.com](Https://www.google.com) or C:/Somedirectory/somefile.someextension | True     | The shortcut target.                                             |
| ShortcutName| SomethingIWantToCallThis                                                                  | False    | The name of the shortcut as seen on the desktop.                |
| IconURL     | [https://www.google.com/favicon.ico](https://www.google.com/favicon.ico)                 | False    | Download URL to download the *.ico file to set as the shortcut's icon. |

## Process

Please reference the agnostic documentation for process.








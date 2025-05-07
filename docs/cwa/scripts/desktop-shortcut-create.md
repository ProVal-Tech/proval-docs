---
id: 'de971be6-bd0c-432c-a0de-94119ee0da2b'
slug: /de971be6-bd0c-432c-a0de-94119ee0da2b
title: 'Desktop Shortcut - Create'
title_meta: 'Desktop Shortcut - Create'
keywords: ['desktop', 'shortcut', 'uri', 'icon', 'windows']
description: 'This document provides a guide on how to create a desktop shortcut for all users on a Windows system. It includes sample runs, user parameters, and dependencies for successful implementation.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document explains how to create a desktop shortcut for all users.

## Sample Run

![Image 1](../../../static/img/docs/1575f234-039a-4d1c-a4e5-ce0656e82c4f/image_1.png)  
![Image 2](../../../static/img/docs/1575f234-039a-4d1c-a4e5-ce0656e82c4f/image_2.png)  
![Image 3](../../../static/img/docs/1575f234-039a-4d1c-a4e5-ce0656e82c4f/image_3.png)  
![Image 4](../../../static/img/docs/1575f234-039a-4d1c-a4e5-ce0656e82c4f/image_4.png)  
![Image 5](../../../static/img/docs/1575f234-039a-4d1c-a4e5-ce0656e82c4f/image_5.png)  

## Dependencies

- [EPM - Windows Configuration - Agnostic - New-DesktopUriShortcut](/docs/56fa7d90-7c83-4c4a-ac0e-c49a6d5701af) 

### User Parameters

| Name          | Example                                                                                   | Required | Description                                                       |
|---------------|-------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------|
| TargetUri     | [https://www.google.com](https://www.google.com) or C:/Somedirectory/somefile.someextension | True     | The shortcut target.                                             |
| ShortcutName  | SomethingIWantToCallThis                                                                  | False    | The name of the shortcut as seen on the desktop.                |
| IconURL       | [https://www.google.com/favicon.ico](https://www.google.com/favicon.ico)                 | False    | Download URL to download the *.ico file to set as the shortcut's icon. |

## Process

Please reference the agnostic documentation for the process.


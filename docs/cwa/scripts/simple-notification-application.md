---
id: '52ca1112-b256-46e7-9a76-7c6941d71d76'
slug: /52ca1112-b256-46e7-9a76-7c6941d71d76
title: 'Simple Notification App [Param]'
title_meta: 'Simple Notification App [Param]'
keywords: ['custom', 'notification', 'message', 'branding', 'windows']
description: 'This document details a script designed to deliver a one-time, customized message to users, featuring optional branding through an image URL. It outlines the requirements, user parameters, process, and examples of usage.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script is designed to deliver a one-time, customized message to the partner, featuring your company's branding through an optional image URL. For branding purposes, using a PNG or JPEG image URL is recommended, though not mandatory. Once executed, the script will display the message on the logged-in user's screen within one minute.

## File Hash

**File Path:** `C:\ProgramData\_automation\Script\Run-SimpleNotification\Run-SimpleNotification.ps1`  
**File Hash (Sha256):** `436B5392177E8980BB9260A4836DDEF03D3B4F2814FFB201419D448246CD6C01`  
**File Hash (MD5):** `38C6FD44FF80351059C8FDC2A5ED29D2`  

**File Path:** `C:\ProgramData\_automation\Script\Run-SimpleNotification\SimpleNotification.exe`  
**File Hash (Sha256):** `1AE4D2EE58285E0D37D89BA654CCC2205A98A108205BCC1FE14100974F16103A`  
**File Hash (MD5):** `1C7B2CB1A3F7436467A01A716EFBA691`  

## Sample Run

![Sample Image](../../../static/img/docs/52ca1112-b256-46e7-9a76-7c6941d71d76/image_1_1.webp)

The message parameter is mandatory to display the message to the user. All other parameters are optional; however, if no image is specified, it will result in a blank popup with only the message, which may cause trust issues with users.

## Dependencies

[SimpleNotification](/docs/df3d2cab-2568-4b41-b447-7b21ef64220b)

## Requirements

- Windows Operating System
- .NET 4.5

## Variables

| Name | Value |
| ---- | ----- |
| ProjectName | Run-SimpleNotification |
| AppName | SimpleNotification |
| WorkingDirectory | C:\ProgramData\_Automation\Script\Run-SimpleNotification |
| ScriptPath | C:\ProgramData\_Automation\Script\Run-SimpleNotification\Run-SimpleNotification.ps1 |
| AppPath | C:\ProgramData\_Automation\Script\Run-SimpleNotification\SimpleNotification.exe |
| ConfigFile | C:\ProgramData\_Automation\Script\Run-SimpleNotification\Config.toml |

## User Parameters

| Name      | Example                                                                                                       | Required | Description                                           |
|-----------|---------------------------------------------------------------------------------------------------------------|----------|-------------------------------------------------------|
| Message   | This is a test message                                                                                       | True     | The message is displayed to the end user. (Maximum 300 characters).  |
| ImageURL  | [http://p.favim.com/orig/2018/08/24/cute-beautiful-couple-avatar-Favim.com-6224738.jpg](http://p.favim.com/orig/2018/08/24/cute-beautiful-couple-avatar-Favim.com-6224738.jpg) | False    | The URL for the image to display instead of the default. |
| Email     | [someone@testing.com](mailto:someone@testing.com)                                                           | False    | The support e-mail address is displayed to the user. |
| Phone     | 000-000-0000                                                                                                 | False    | The support phone number is displayed to the user.   |

## Example

### Parameters

| Name | Value |
| ---- | ----- |
| ImageURL | `https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg` |
| Message | `They said it's a secret mission, but I say it's a fashion emergency—Bond and I am armed with style and suspicious sunglasses!` |
| Email | `ram.kishor@provaltech.com` |
| Phone | `1234565432` |

### Notification

![Image1](../../../static/img/docs/52ca1112-b256-46e7-9a76-7c6941d71d76/image1.webp)

## Output

- Script Log
- Popup Message on User's desktop

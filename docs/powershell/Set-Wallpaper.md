---
id: ps-set-wallpaper
title: 'Set-Wallpaper'
title_meta: 'Set-Wallpaper Command'
keywords: ['wallpaper', 'desktop', 'background', 'image']
description: 'Documentation for the Set-Wallpaper command to set the active desktop wallpaper for all users.'
tags: ['windows']
draft: false
unlisted: false
---

## Description
Sets the active desktop wallpaper for all users.

## Requirements
- Must be run as an Administrator
- PowerShell v5+

## Usage
The script has two primary modes: Set and Reset.

### Set Mode
In set mode, the wallpaper is set based on the URI passed into the script via the `-Uri` parameter. If `-Enforce` is passed, a scheduled task will be created to set the wallpaper to the specified image on each user login.

### Reset Mode
In reset mode, the wallpaper for all users is reset to the last known wallpaper, and any scheduled tasks or policies are removed. Enter reset mode by passing the `-Reset` parameter.

Sets the target image as the wallpaper for all users.

```powershell
.\Set-Wallpaper.ps1 -Uri "C:\user\user\Pictures\Wallpapers\generic-background.jpg"
```

Downloads the image from the remote server and sets it as the current wallpaper for all users. Creates a scheduled task to set the wallpaper on each user login.

```powershell
.\Set-Wallpaper.ps1 -Uri "https://www.nerdchefs.com/wp-content/uploads/2020/07/generic-background.jpg" -Enforce
```

## Parameters
| Parameter | Required | Default | Type       | Description                                                                                         |
| --------- | -------- | ------- | ---------- | --------------------------------------------------------------------------------------------------- |
| `Uri`     | True     |         | System.URI | The local path or URL to the image file to set as the wallpaper. Must be a valid local path or URL. |
| `Enforce` | False    | False   | Switch     | A scheduled task will be created to set the wallpaper for each user that logs into the machine.      |
| `Reset`   | False    | False   | Switch     | Resets each user's wallpaper to their last used wallpaper and removes enforcement.                  |

## Output
`PSCustomObject`

Returns the registry settings edited by the script.


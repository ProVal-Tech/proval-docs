---
id: 'bd6b7507-eccf-4fce-a4e4-62b9b7c97a08'
title: 'Set Active Desktop Wallpaper for All Users'
title_meta: 'Set Active Desktop Wallpaper for All Users'
keywords: ['desktop', 'wallpaper', 'enforcement', 'login', 'users', 'local', 'url']
description: 'This document provides a detailed guide on how to set the active desktop wallpaper for all users from a local path or a URL. It includes options for enforcing the wallpaper on user login and resetting to previous wallpapers, along with user parameters and expected output.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to set the active desktop wallpaper for all users from a local path or a URL. It can optionally enforce the wallpaper for all users on login.

**Time Saved by Automation:** 10 Minutes

## Sample Run

**Set Mode:**
![Set Mode](../../../static/img/Windows---Set-Wallpaper/image_1.png)

**Enforcement Mode:**
![Enforcement Mode](../../../static/img/Windows---Set-Wallpaper/image_2.png)

**Reset Mode:**
![Reset Mode](../../../static/img/Windows---Set-Wallpaper/image_3.png)

### User Parameters

| Name      | Example                                             | Required | Description                                                                                                   |
|-----------|-----------------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------|
| Path      | C:/user/myuser/Pictures/CoolWallpaper.png          | Semi     | Either a path to a local image or a URL.                                                                      |
| AllUsers  | True                                               | False    | Set this to "True" to enforce the wallpaper for all users on login.                                          |
| Reset     | True                                               | Semi     | Set only this parameter to "True" to remove all enforcement and reset all users' wallpapers back to their previous one. If they do not have a previous wallpaper, the default Windows wallpaper will be used. |

## Output

```
C:/ProgramData/_automation/script/Set-Wallpaper/Set-Wallpaper-log.txt
```


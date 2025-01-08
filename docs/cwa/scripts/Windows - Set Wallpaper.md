---
id: 'cwa-set-desktop-wallpaper'
title: 'Set Active Desktop Wallpaper for All Users'
title_meta: 'Set Active Desktop Wallpaper for All Users'
keywords: ['desktop', 'wallpaper', 'enforcement', 'login', 'users', 'local', 'url']
description: 'This document provides a detailed guide on how to set the active desktop wallpaper for all users from a local path or a URL. It includes options for enforcing the wallpaper on user login and resetting to previous wallpapers, along with user parameters and expected output.'
tags: ['configuration', 'windows', 'setup', 'security']
draft: false
unlisted: false
---
## Summary

Sets the active desktop wallpaper for all users from a local path or a URL. Can optionally be switched to enforce the wallpaper for all users on login.

Time Saved by Automation: 10 Minutes

## Sample Run

Set Mode:
![Set Mode](5078775/docs/8115944/images/16668348)

Enforcement mode:
![Enforcement mode](5078775/docs/8115944/images/16668364)

Reset Mode:
![Reset Mode](5078775/docs/8115944/images/16668381)

#### User Parameters

| Name      | Example                                             | Required | Description                                                                                                   |
|-----------|-----------------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------|
| Path      | C:\user\myuser\Pictures\CoolWallpaper.png          | Semi     | Either a path to a local image or URL.                                                                        |
| AllUsers  | True                                               | False    | Set this to "True" to enforce the wallpaper for all users on login.                                          |
| Reset     | True                                               | Semi     | Set only this parameter to "True" to remove all enforcement and reset all users' wallpapers back to their previous one. If they do not have a previous wallpaper, the default Windows wallpaper will be used. |

## Output

```
C:\ProgramData\_automation\script\Set-Wallpaper\Set-Wallpaper-log.txt
```



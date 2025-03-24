---
id: 'd9f38912-7b4a-4da1-a880-210aae4fbb02'
title: 'Remove-WifiProfile'
title_meta: 'Remove-WifiProfile'
keywords: ['remove', 'wifi', 'profile', 'network']
description: 'Documentation for the Remove-WifiProfile command to remove a specified Wi-Fi profile from the system.'
tags: ['networking', 'wireless']
draft: false
unlisted: false
---

## Description
The script removes the specified Wi-Fi profile from the system. `ProfileName` is case-sensitive.

## Usage
1. Install and import the `Strapper` module.
2. Install and import the `wifiprofilemanagement` module.
3. Check for the existence of the specified Wi-Fi profile.
4. Attempt to remove the specified Wi-Fi profile.

Removes the Wi-Fi profile named 'MyWifi' from the system.
```powershell
.\Remove-WifiProfile.ps1 -ProfileName 'MyWifi'
```

## Parameters
| Parameter      | Alias | Required | Default | Type   | Description                               |
|----------------|-------|----------|---------|--------|-------------------------------------------|
| `ProfileName`  |       | True     |         | String | The name of the Wi-Fi profile to remove. |

## Output
- .\Remove-WifiProfile-log.txt
- .\Remove-WifiProfile-error.txt




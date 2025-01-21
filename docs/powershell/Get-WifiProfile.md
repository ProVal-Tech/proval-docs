---
id: ps-get-wifiprofile
title: 'Get-WifiProfile'
title_meta: 'Get-WifiProfile Command'
keywords: ['retrieve', 'wifi', 'profile', 'network']
description: 'Documentation for the Get-WifiProfile command to retrieve and return Wi-Fi profiles on the system.'
tags: ['networking', 'wireless']
draft: false
unlisted: false
---

## Description
Retrieves and returns Wi-Fi profiles on the system.

## Usage
1. Install and import the `Strapper` module.
2. Install and import the `wifiprofilemanagement` module.
3. Retrieve Wi-Fi profiles and process each profile to extract relevant details.
4. Handle errors during the Wi-Fi profile retrieval process and log any failures.
5. Return the output object.

To retrieve Wi-Fi profiles without passwords:

```powershell
.\Get-WiFiProfile.ps1
```

To retrieve Wi-Fi profiles with passwords in plain text:

```powershell
.\Get-WiFiProfile.ps1 -ClearKey
```

## Parameters
| Parameter   | Alias | Required | Default | Type   | Description                                             |
|-------------|-------|----------|---------|--------|---------------------------------------------------------|
| `ClearKey`  |       | False    |         | Switch | To retrieve Wi-Fi profiles with passwords in plain text.|

## Output
- .\Get-WifiProfiles-log.txt
- .\Get-WifiProfiles-error.txt

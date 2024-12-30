---
id: ps-get-wifiprofile
title: 'Get-WifiProfile'
title_meta: 'Get-WifiProfile Command'
keywords: ['retrieve', 'wifi', 'profile', 'network']
description: 'Documentation for the Get-WifiProfile command to retrieve and return Wi-Fi profiles on the system.'
tags: ['networking', 'wireless', 'configuration']
draft: false
unlisted: false
---
## Description
Retrieves and returns Wi-Fi profiles on the system.

## Usage
1. Install and import the `Strapper` module.
2. Install and import the `wifiprofilemanagement` module.
3. Retrieves Wi-Fi profiles and processes each profile to extract relevant details.
4. Handles errors during the Wi-Fi profile retrieval process and logs any failures.
4. Returns output object.


To retrieve Wi-Fi profiles without password:

```powershell
.\Get-WiFiProfile.ps1
```

To retrieve Wi-Fi profiles with passwords in plain text:

```powershell
.\Get-WiFiProfile.ps1 -ClearKey
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                             |
| ----------------- | ----- | --------- | --------- | --------- | ------------------------------------------------------- |
| `ClearKey`        |       | False     |           | Switch    | To retrieve Wi-Fi profiles with passwords in plain text.|

## Output
    .\Get-WifiProfiles-log.txt
    .\Get-WifiProfiles-error.txt

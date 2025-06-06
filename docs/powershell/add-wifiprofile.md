---
id: '6e1f420f-5a5a-49e1-a7cc-943e258d2ae5'
slug: /6e1f420f-5a5a-49e1-a7cc-943e258d2ae5
title: 'Add-WifiProfile'
title_meta: 'Add-WifiProfile'
keywords: ['networking', 'wireless', 'setup', 'configuration']
description: 'Documentation for the Add-WifiProfile command to configure WiFi profiles.'
tags: ['networking', 'setup', 'wireless']
draft: false
unlisted: false
---

## Description
This script creates a new WiFi profile.

## Usage
1. Install and import the `Strapper` module.
2. Install and import the `wifimanagementprofile` module.
3. Attempt to create a new Wi-Fi profile with the specified parameters.

Create a new WiFi profile named 'MyWiFi' with the password 'MyPassword', using the default `ConnectionMode`, `Authentication`, and `Encryption`. The profile will overwrite the existing WiFi profile if it already exists.

```powershell
.\Add-WifiProfile.ps1 -ProfileName 'MyWiFi' -Password (ConvertTo-SecureString 'MyPassword' -AsPlainText -Force)
```

## Parameters
| Parameter              | ValidateSet                                          | Required | Default   | Type   | Description                                        |
|------------------------|-----------------------------------------------------|----------|-----------|--------|----------------------------------------------------|
| `ProfileName`          |                                                     | True     |           | String | The name of the WiFi profile to be created.        |
| `Password`             |                                                     | True     |           | String | The password of the WiFi profile.                  |
| `ConnectionMode`       | manual, auto                                        | False    | auto      | String | The connection mode of the WiFi profile.           |
| `Authentication`       | open, shared, WPA, WPAPSK, WPA2, WPA2PSK, WPA3SAE, WPA3ENT192, OWE | False    | WPA2PSK  | String | The authentication method used by the WiFi profile.|
| `Encryption`           | none, WEP, TKIP, AES, GCMP256                      | False    | AES       | String | The encryption method used by the WiFi profile.    |
| `ConnectHiddenSSID`    |                                                     | False    | $False    | Boolean| Whether to connect to the WiFi even if the SSID is hidden. |
| `Overwrite`            |                                                     | False    | $True     | Boolean| Whether to overwrite the WiFi profile if it already exists. |

## Output
- .\Add-WifiProfile-log.txt
- .\Add-WifiProfile-error.txt
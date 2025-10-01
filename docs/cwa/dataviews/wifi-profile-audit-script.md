---
id: '40d25f32-9014-44ea-8332-0ab24d59ab43'
slug: /40d25f32-9014-44ea-8332-0ab24d59ab43
title: 'WiFi Profile - Audit Script'
title_meta: 'WiFi Profile - Audit Script'
keywords: ['html', 'markdown', 'conversion', 'guide', 'formatting']
description: 'This dataview displays the WiFi Profiles information for each computer'
tags: ['setup', 'software']
draft: false
unlisted: false
---

## Summary

This dataview WiFi Profiles information for each computer fetched by the [Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596) script.

## Dependencies

[EPM - Windows Configuration - Script - Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596)

## Columns

| Column               | Explanation                                             |
|----------------------|---------------------------------------------------------|
| clientid             | clientid (Hidden)                                       |
| locationid           | locationid (Hidden)                                     |
| computerid           | computerid                                              |
| Client               | Client Name                                             |
| Location             | Location Name                                           |
| Computer             | Computer Name                                           |
| Operating System     | Operating System (Hidden)                               |
| Last Contact         | Last Contact with RMM (Hidden)                          |
| computerid           | Identifier for the computer                             |
| SSID                 | SSID of the WiFi Profile                                |
| Hex                  | Hexadecimal representation of the WiFi Profile          |
| ConnectionMode       | Connection mode of the WiFi Profile                     |
| ConnectionType       | Connection type of the WiFi Profile                     |
| ConnectHiddenSSID    | Is it allowed to connect to hidden SSID or not        |
| Authentication       | Authentication type of the WiFi Profile                 |
| Encryption           | Encryption type of the WiFi Profile                     |
| SharedKeyType        | Type of the shared key (password) of the WiFi Profile   |
| IsProtected          | If it is protected or not                                 |
| IsAvailable          | Is it currently available or not                  |
| IsConnected          | Is the computer actively using it or not                 |
| Password             | Password of the WiFi profile stored in encrypted format |
| scriptruntime        | Data collection time                                    |
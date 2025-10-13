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

This dataview displays WiFi Profiles information for each computer fetched by the [Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596) script.

## Dependencies

[Script - Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596)

## Columns

| Column               | Explanation                                             |
|----------------------|---------------------------------------------------------|
| clientid             | clientid (Hidden)                                       |
| locationid           | locationid (Hidden)                                     |
| computerid           | computerid                                              |
| Client               | Client Name                                             |
| Location             | Location Name                                           |
| Computer             | Computer Name                                           |
| Operating System     | Operating System                                |
| Last Contact         | Last Contact with Automate (Hidden)                          |                            
| SSID                 | SSID of the WiFi Profile                                |
| Hex                  | Hexadecimal representation of the WiFi Profile          |
| Connection Mode       | Connection mode of the WiFi Profile                     |
| Connection Type       | Connection type of the WiFi Profile                     |
| Connect Hidden SSID    | Is it allowed to connect to hidden SSID or not        |
| Authentication       | Authentication type of the WiFi Profile                 |
| Encryption           | Encryption type of the WiFi Profile                     |
| Shared Key Type        | Type of the shared key (password) of the WiFi Profile   |
| Is Protected          | If it is protected or not                                 |
| Is Available          | Is it currently available or not                  |
| Is Connected          | Is the computer actively using it or not                 |
| Last Logged In User             | User that logged in recently |
| Script Run Time        | Data collection time                                    |
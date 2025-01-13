---
id: 'cwa_custom_table_wifi_profiles'
title: 'Custom Table for WiFi Profiles'
title_meta: 'Custom Table for WiFi Profiles'
keywords: ['wifi', 'profiles', 'database', 'configuration', 'encryption', 'authentication']
description: 'This document outlines the purpose and structure of a custom table designed to store WiFi Profiles information for each computer, including dependencies and detailed column explanations.'
tags: ['database', 'configuration', 'encryption', 'authentication', 'networking']
draft: false
unlisted: false
---
## Purpose

The purpose of the custom table is to store the WiFi Profiles information for each computer fetched by the [Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355) script.

## Dependencies

[EPM - Windows Configuration - Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355)

## Tables

#### pvl_wifi_profiles

| Column              | Type         | Explanation                                               |
|---------------------|--------------|----------------------------------------------------------|
| computerid          | int(11)     | computerid                                              |
| SSID                | varchar(128) | SSID of the WiFi Profile                                |
| Hex                 | varchar(64)  | Hex of the WiFi Profile                                 |
| ConnectionMode      | varchar(16)  | Connection Mode of the WiFi Profile                     |
| ConnectionType      | varchar(16)  | Connection Type of the WiFi Profile                     |
| ConnectHiddenSSID    | tinyint(4)  | Is it allowed to connect Hidden SSID? (0/1)            |
| Authentication      | varchar(16)  | Authentication Type of the WiFi Profile                 |
| Encryption          | varchar(16)  | Encryption Type of the WiFi Profile                     |
| SharedKeyType       | varchar(32)  | Type of the Shared Key (Password) of the WiFi Profile   |
| IsProtected         | tinyint(4)   | Is it Protected? (0/1)                                  |
| IsAvailable         | tinyint(4)   | Is it Currently Available? (0/1)                        |
| IsConnected         | tinyint(4)   | Is the Computer actively using it? (0/1)                |
| Password            | blob         | Password of the Wifi Profile stored in encrypted format  |
| scriptruntime       | datetime     | Data Collection Time                                     |




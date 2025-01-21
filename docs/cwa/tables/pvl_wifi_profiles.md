---
id: 'f317da6e-0ea2-4c1e-bad9-4d0ad25684d3'
title: 'pvl_wifi_profiles'
title_meta: 'pvl_wifi_profiles'
keywords: ['wifi', 'profiles', 'database', 'configuration', 'encryption', 'authentication']
description: 'This document outlines the purpose and structure of a custom table designed to store WiFi Profiles information for each computer, including dependencies and detailed column explanations.'
tags: ['database', 'encryption', 'networking']
draft: false
unlisted: false
---

## Purpose

The purpose of the custom table is to store the WiFi Profiles information for each computer fetched by the [Get Wifi Profile](<../scripts/Get Wifi Profile.md>) script.

## Dependencies

[EPM - Windows Configuration - Script - Get Wifi Profile](<../scripts/Get Wifi Profile.md>)

## Tables

#### pvl_wifi_profiles

| Column               | Type         | Explanation                                               |
|----------------------|--------------|----------------------------------------------------------|
| computerid           | int(11)     | Identifier for the computer                              |
| SSID                 | varchar(128) | SSID of the WiFi Profile                                 |
| Hex                  | varchar(64)  | Hexadecimal representation of the WiFi Profile           |
| ConnectionMode       | varchar(16)  | Connection mode of the WiFi Profile                      |
| ConnectionType       | varchar(16)  | Connection type of the WiFi Profile                      |
| ConnectHiddenSSID    | tinyint(4)   | Is it allowed to connect to hidden SSID? (0/1)          |
| Authentication       | varchar(16)  | Authentication type of the WiFi Profile                  |
| Encryption           | varchar(16)  | Encryption type of the WiFi Profile                      |
| SharedKeyType        | varchar(32)  | Type of the shared key (password) of the WiFi Profile    |
| IsProtected          | tinyint(4)   | Is it protected? (0/1)                                   |
| IsAvailable          | tinyint(4)   | Is it currently available? (0/1)                         |
| IsConnected          | tinyint(4)   | Is the computer actively using it? (0/1)                 |
| Password             | blob         | Password of the WiFi profile stored in encrypted format   |
| scriptruntime        | datetime     | Data collection time                                      |




---
id: 'cwa-wifi-profile-storage'
title: 'WiFi Profile Storage for Later Application'
title_meta: 'WiFi Profile Storage for Later Application'
keywords: ['wifi', 'profile', 'storage', 'configuration', 'clientid', 'ssid']
description: 'This document outlines the purpose and structure of storing WiFi profiles gathered from the WiFi Profile - Get script for later application using the WiFi Profile - Apply script. It includes details about dependencies and the database table structure used for storage.'
tags: ['configuration', 'database', 'software', 'wifi']
draft: false
unlisted: false
---
## Purpose

Stores information about gathered WiFi profiles from [WiFi Profile - Get](https://proval.itglue.com/DOC-5078775-8041474) for later application by the script [WiFi Profile - Apply](https://proval.itglue.com/DOC-5078775-8140815).

## Dependencies

[WiFi Profile - Get](https://proval.itglue.com/DOC-5078775-8041474)

## Table

#### plugin_proval_wifi_profiles

| Column   | Type    | Explanation                                      |
|----------|---------|--------------------------------------------------|
| clientid | INT     | The ClientID associated with the WiFi profile.   |
| ssid     | VARCHAR | The SSID of the WiFi profile.                    |
| xml      | BLOB    | The configuration information of the WiFi profile.|



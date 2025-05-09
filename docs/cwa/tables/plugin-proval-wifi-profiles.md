---
id: '561c4377-7634-4596-9d06-7101e2ef7b65'
slug: /561c4377-7634-4596-9d06-7101e2ef7b65
title: 'plugin_proval_wifi_profiles'
title_meta: 'plugin_proval_wifi_profiles'
keywords: ['wifi', 'profile', 'storage', 'configuration', 'clientid', 'ssid']
description: 'This document outlines the purpose and structure of storing WiFi profiles gathered from the WiFi Profile - Get script for later application using the WiFi Profile - Apply script. It includes details about dependencies and the database table structure used for storage.'
tags: ['database', 'software']
draft: false
unlisted: false
---

## Purpose

This document stores information about gathered WiFi profiles from [WiFi Profile - Get](/docs/95ecf8ed-f2ac-46fa-ad7a-05894d0743be) for later application by the script [WiFi Profile - Apply](/docs/52b6b460-b6bd-48cf-aab1-8484149578f0).

## Dependencies

- [WiFi Profile - Get](/docs/95ecf8ed-f2ac-46fa-ad7a-05894d0743be)

## Table

### plugin_proval_wifi_profiles

| Column   | Type    | Explanation                                      |
|----------|---------|--------------------------------------------------|
| clientid | INT     | The ClientID associated with the WiFi profile.   |
| ssid     | VARCHAR | The SSID of the WiFi profile.                    |
| xml      | BLOB    | The configuration information of the WiFi profile. |

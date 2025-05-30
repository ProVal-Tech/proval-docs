---
id: '95ecf8ed-f2ac-46fa-ad7a-05894d0743be'
slug: /95ecf8ed-f2ac-46fa-ad7a-05894d0743be
title: 'WiFi Profile - Get'
title_meta: 'WiFi Profile - Get'
keywords: ['wifi', 'profile', 'ssid', 'export', 'database']
description: 'This document outlines a script designed to gather a specific WiFi profile from a target machine based on the SSID. It is intended for use before applying a WiFi profile to ensure the target machine has the necessary configuration. The script saves approximately 5 minutes of time through automation and includes detailed processes for exporting and logging the WiFi profile data.'
tags: ['database', 'setup']
draft: false
unlisted: false
---

## Summary

This script helps gather a specific WiFi profile from the target machine based on the SSID.  
It is to be used before the @Apply WiFi Profile script against a machine with the target WiFi profile already set up.  

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/95ecf8ed-f2ac-46fa-ad7a-05894d0743be/image_1.webp)

## Variables

@WifiProfile@ - Shows the data of the exported WiFi profile

#### User Parameters

| Name  | Example     | Required | Description                     |
|-------|-------------|----------|---------------------------------|
| SSID  | Guest_wifi  | True     | SSID of the WiFi profile        |

## Process

- Creates the `plugin_proval_wifi_profiles` table if it does not exist.
- Runs the command to export the WiFi profile from the target machine.
- Exports the profile to `%ltsvcdir%/Wifiprofiles` and writes the information to the database.

## Output

- Script log
- Table `plugin_proval_wifi_profiles`
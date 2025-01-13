---
id: 'cwa-gather-wifi-profile'
title: 'Gather WiFi Profile'
title_meta: 'Gather WiFi Profile for SSID Management'
keywords: ['wifi', 'profile', 'ssid', 'export', 'database']
description: 'This document outlines a script designed to gather a specific WiFi profile from a target machine based on the SSID. It is intended for use before applying a WiFi profile to ensure the target machine has the necessary configuration. The script saves approximately 5 minutes of time through automation and includes detailed processes for exporting and logging the WiFi profile data.'
tags: ['wifi', 'database', 'export', 'configuration', 'setup']
draft: false
unlisted: false
---
## Summary

This script helps gathering a specific WiFi profile from the target machine based on SSID.  
To be used before the @Apply WiFi Profile script against a machine with the target WiFi profile already set up.  

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\WiFi-Profile---Get\image_1.png)

## Variables

@WifiProfile@ - Shows the data of the exported wifi profile

#### User Parameters

| Name  | Example     | Required | Description                     |
|-------|-------------|----------|---------------------------------|
| SSID  | Guest_wifi  | True     | SSID of the wifi profile        |

## Process

- Creates the plugin_proval_wifi_profiles table if it does not exist.
- Runs the command to export the WiFi profile from the target machine.
- Exports the profile to %ltsvcdir%\Wifiprofiles and writes the information to the database.

## Output

- Script log
- Table plugin_proval_wifi_profiles



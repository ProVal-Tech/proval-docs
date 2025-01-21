---
id: '3a1d1f7d-a655-40bf-a048-5e861aee00ae'
title: 'Monitor Set for Wi-Fi Profiles Management'
title_meta: 'Monitor Set for Wi-Fi Profiles Management'
keywords: ['wifi', 'monitor', 'profiles', 'audit', 'script']
description: 'This document outlines the purpose and functionality of a monitor set designed to identify computers lacking specified Wi-Fi profiles. It details how the monitor set utilizes data from a custom table and triggers a script to implement missing profiles, ensuring proper configuration and management of Wi-Fi settings across client environments.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to identify computers where the Wi-Fi profiles specified in the Client or Location level EDF, `WiFi Profiles To Add`, are not available based on the data in the [Wi-Fi Profile - Audit [Script]](<../dataviews/WiFi Profile - Audit Script.md>) dataview. Subsequently, the monitor set triggers the execution of the [Implement Wifi Profile](https://proval.itglue.com/DOC-5078775-16111356) script using the `△ Custom - Execute Script - Implement Wifi Profile` alert template to add the missing profiles. Detailed information about the EDFs can be referenced in the [script's documentation](https://proval.itglue.com/DOC-5078775-16111356).

The monitor set relies entirely on the data in the custom table [pvl_wifi_profiles](https://proval.itglue.com/5078775/docs/12979849). Therefore, the internal monitor must execute [Script - Get - Wifi Profiles](<./Execute Script - Get - Wifi Profiles.md>) to be operational within the environment.

## Dependencies

- [EPM - Windows Configuration - Script - Get Wifi Profile](<../scripts/Get Wifi Profile.md>)
- [EPM - Windows Configuration - Script - Implement Wifi Profile](https://proval.itglue.com/DOC-5078775-16111356)
- [CWM - Automate - Custom Table - pvl_wifi_profiles](<../tables/pvl_wifi_profiles.md>)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Implement Wifi Profile`


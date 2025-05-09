---
id: '3a1d1f7d-a655-40bf-a048-5e861aee00ae'
slug: /3a1d1f7d-a655-40bf-a048-5e861aee00ae
title: 'Wifi Profiles - Add'
title_meta: 'Wifi Profiles - Add'
keywords: ['wifi', 'monitor', 'profiles', 'audit', 'script']
description: 'This document outlines the purpose and functionality of a monitor set designed to identify computers lacking specified Wi-Fi profiles. It details how the monitor set utilizes data from a custom table and triggers a script to implement missing profiles, ensuring proper configuration and management of Wi-Fi settings across client environments.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to identify computers where the Wi-Fi profiles specified in the Client or Location level EDF, `WiFi Profiles To Add`, are not available based on the data in the [Wi-Fi Profile - Audit [Script]](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) dataview. Subsequently, the monitor set triggers the execution of the [Implement Wifi Profile](/docs/cffbdce7-7390-4b11-9300-6a34799b7d82) script using the `△ Custom - Execute Script - Implement Wifi Profile` alert template to add the missing profiles. Detailed information about the EDFs can be referenced in the [script's documentation](/docs/cffbdce7-7390-4b11-9300-6a34799b7d82).

The monitor set relies entirely on the data in the custom table [pvl_wifi_profiles](/docs/237fb012-73a7-498d-a76c-304367fee659) to be operational within the environment.

## Dependencies

- [EPM - Windows Configuration - Script - Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596)
- [EPM - Windows Configuration - Script - Implement Wifi Profile](/docs/cffbdce7-7390-4b11-9300-6a34799b7d82)
- [CWM - Automate - Custom Table - pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Implement Wifi Profile`
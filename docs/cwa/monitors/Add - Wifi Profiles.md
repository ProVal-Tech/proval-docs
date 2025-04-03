---
id: '51eaeefd-b300-4f9a-be28-fa01e6e83b5e'
slug: /51eaeefd-b300-4f9a-be28-fa01e6e83b5e
title: 'Add - Wifi Profiles'
title_meta: 'Add - Wifi Profiles'
keywords: ['monitoring', 'wifi', 'profiles', 'automation', 'management']
description: 'This document outlines the purpose and functionality of a monitor set designed to identify computers lacking specified Wi-Fi profiles. It details how the monitor set interacts with the relevant dataview and triggers scripts to ensure proper Wi-Fi configuration on managed Windows workstations.'
tags: ['networking', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to identify computers where the Wi-Fi profiles specified in the Client or Location level EDF, `WiFi Profiles To Add`, are not available based on the data present in the [CWM - Automate - Dataview - Wi-Fi Profiles](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) dataview. Subsequently, the monitor set triggers the execution of the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) script using the `△ CUSTOM - Execute Script - Get - Wifi Profiles` alert template to add the missing profiles. Detailed information about the EDFs can be referenced in the [script's](/docs/47e125c4-26df-4b47-811b-b856f3395290) documentation.

The monitor set relies entirely on the data available in the custom table [pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3). Therefore, it is imperative that the internal monitor [Execute Script - Get - Wifi Profiles](https://proval.itglue.com/5078775/docs/12979845) is operational within the environment.

## Dependencies

- [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290)
- [CWM - Automate - Custom Table - pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3)
- [CWM - Automate - Internal Monitor - Execute Script - Get - Wifi Profiles](/docs/237fb012-73a7-498d-a76c-304367fee659)

## Target

Managed Windows Workstations

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Get - Wifi Profiles`

**Note:** The alert template should be running the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) script.



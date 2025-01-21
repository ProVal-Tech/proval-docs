---
id: '237fb012-73a7-498d-a76c-304367fee659'
title: 'Monitor Set for Wifi Profile Management'
title_meta: 'Monitor Set for Wifi Profile Management'
keywords: ['wifi', 'profiles', 'audit', 'windows', 'workstations', 'management']
description: 'This document outlines the purpose and setup of a monitor set designed to execute the Wifi Profiles management script in Audit only mode on physical Windows workstations, specifically excluding Windows 7 and XP, on a monthly basis.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to execute the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](<../scripts/GetRemoveAdd Wifi Profiles.md>) script in Audit only mode once per month against physical Windows workstations, excluding Windows 7 and XP.

## Dependencies

- [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](<../scripts/GetRemoveAdd Wifi Profiles.md>)
- [CWM - Automate - Custom Table - pvl_wifi_profiles](<../tables/pvl_wifi_profiles.md>)

## Target

Managed Windows Workstations

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Get - Wifi Profiles`

**Note:** The alert template should be running the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](<../scripts/GetRemoveAdd Wifi Profiles.md>) script.


---
id: '237fb012-73a7-498d-a76c-304367fee659'
slug: /237fb012-73a7-498d-a76c-304367fee659
title: 'Execute Script - Get - Wifi Profiles'
title_meta: 'Execute Script - Get - Wifi Profiles'
keywords: ['wifi', 'profiles', 'audit', 'windows', 'workstations', 'management']
description: 'This document outlines the purpose and setup of a monitor set designed to execute the Wifi Profiles management script in Audit only mode on physical Windows workstations, specifically excluding Windows 7 and XP, on a monthly basis.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to execute the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) script in Audit only mode once per month against physical Windows workstations, excluding Windows 7 and XP.

## Dependencies

- [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290)
- [CWM - Automate - Custom Table - pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3)

## Target

Managed Windows Workstations

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Get - Wifi Profiles`

**Note:** The alert template should be running the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) script.


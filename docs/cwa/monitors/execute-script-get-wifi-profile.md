---
id: 'ab5fe07a-d644-4011-96bf-67aa8019216f'
slug: /ab5fe07a-d644-4011-96bf-67aa8019216f
title: 'Execute Script - Get Wifi Profile'
title_meta: 'Execute Script - Get Wifi Profile'
keywords: ['wifi', 'monitor', 'windows', 'audit', 'script']
description: 'This document outlines the setup of a monitor set designed to execute the Get Wifi Profile script in Audit only mode on physical Windows workstations, excluding older versions such as Windows XP, 7, 8, and 8.1, on a monthly basis.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to execute the [Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596) script in Audit only mode once per month against physical Windows workstations, excluding Windows XP, 7, 8, and 8.1.

## Dependencies

- [EPM - Windows Configuration - Script - Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596)
- [CWM - Automate - Custom Table - pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3)

## Target

Global

## Alert Template

```
△ Custom - Execute Script - Get Wifi Profile
```
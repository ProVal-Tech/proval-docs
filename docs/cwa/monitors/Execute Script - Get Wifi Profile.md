---
id: 'ab5fe07a-d644-4011-96bf-67aa8019216f'
title: 'Get Wifi Profile Monitor Set'
title_meta: 'Get Wifi Profile Monitor Set'
keywords: ['wifi', 'monitor', 'windows', 'audit', 'script']
description: 'This document outlines the setup of a monitor set designed to execute the Get Wifi Profile script in Audit only mode on physical Windows workstations, excluding older versions such as Windows XP, 7, 8, and 8.1, on a monthly basis.'
tags: ['windows', 'monitor', 'script', 'configuration', 'networking']
draft: false
unlisted: false
---
## Summary

The purpose of the monitor set is to execute [Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355) script in Audit only mode once per month against physical windows workstations excluding windows XP, 7, 8, and 8.1. 

## Dependencies

- [EPM - Windows Configuration - Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355)
- [CWM - Automate - Custom Table - pvl_wifi_profiles](https://proval.itglue.com/DOC-5078775-12979849)

## Target

Global

## Alert Template

```
△ Custom - Execute Script - Get Wifi Profile
```







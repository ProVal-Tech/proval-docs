---
id: '14f60d04-7fd3-4e80-ab47-aaa26bbfec8b'
title: 'Collect Device Current Location'
title_meta: 'Collect Device Current Location - Script Overview'
keywords: ['device', 'location', 'ip', 'city', 'state', 'country', 'timezone']
description: 'This document provides an overview of a script designed to collect the current location details of a device. It utilizes the ipinfo.io website to gather information such as device IP, city, state, country, map location, postal address, and timezone, along with a timestamp of when the data was collected.'
tags: ['timezone']
draft: true
unlisted: false
---

## Summary

This script collects the current location details of a device.

## Sample Run

![Sample Run](../../static/img/IPGeolocation-Audit/image_1.png)

## Dependencies

- @plugin_proval_ipinfo - Table

## Process

This script scans the device to collect information about its current location. It uses the ipinfo.io website to gather this information, which includes:
- Device IP
- City
- State
- Country
- Map Location
- Postal Address
- Timezone
- Date when the data was collected

## Output

- Script log
- Dataview
- Custom table plugin_proval_ipinfo

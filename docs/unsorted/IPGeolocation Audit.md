---
id: 'cwa-collect-device-location'
title: 'Collect Device Current Location'
title_meta: 'Collect Device Current Location - Script Overview'
keywords: ['device', 'location', 'ip', 'city', 'state', 'country', 'timezone']
description: 'This document provides an overview of a script designed to collect the current location details of a device. It utilizes the ipinfo.io website to gather information such as device IP, city, state, country, map location, postal address, and timezone, along with a timestamp of when the data was collected.'
tags: ['location', 'ip', 'city', 'state', 'country', 'timezone', 'data', 'plugin']
draft: true
unlisted: true
---
## Summary

This script collects device current location detail.

## Sample Run

![Sample Run](..\..\static\img\IPGeolocation-Audit\image_1.png)

## Dependencies

- @plugin_proval_ipinfo - Table

## Process

This script scans the device to collect information for its current location. It uses ipinfo.io website to collect this information. The information fetches as:
- Device IP
- City
- State
- Country
- Map Location
- Postal address
- Timezone
- Date when data collected

## Output

- Script log
- Dataview
- Custom table plugin_proval_ipinfo




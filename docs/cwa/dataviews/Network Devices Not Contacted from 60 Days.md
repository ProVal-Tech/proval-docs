---
id: 'cwa_dataview_network_devices_inactive'
title: 'Dataview for Inactive Network Devices in Automate'
title_meta: 'Dataview for Inactive Network Devices in Automate'
keywords: ['dataview', 'network', 'devices', 'inactive', 'automate', 'monitoring']
description: 'This document provides a comprehensive overview of the Dataview designed to identify network devices that have not been active in ConnectWise Automate for the past 60 days. It outlines dependencies, columns included in the Dataview, and how it can be utilized for monitoring and management of network devices.'
tags: ['networking', 'monitoring', 'report', 'configuration']
draft: false
unlisted: false
---
## Summary

The Dataview helps to catch all network devices which have not been active in Automate for the last 60 days.

## Dependencies

This Dataview works as part of the solution to remove the network devices that have last contact > 60 days in Automate. This Dataview can be used separately as well to view the network devices that having last contact older than 60 Days.

- @Remove Network Devices Older Than 60 Days
- @Network Device Not Contacted from 60 Days Detection

## Columns

| Column             | Description                                         |
|--------------------|-----------------------------------------------------|
| Client Name        | Displays the name of the client                     |
| Location Name      | Displays the name of the location                   |
| DeviceID           | Displays the ID of the device in Automate           |
| Device Name        | Displays the Device name                             |
| IPAddress          | Displays the IP address of the device               |
| MAC                | Displays the MAC address of the device              |
| ManufacturerName   | Displays the name of the manufacturer                |
| Alert Template      | Displays if an alert template is applied            |
| LastDate           | Displays the last contact date of the device in Automate |



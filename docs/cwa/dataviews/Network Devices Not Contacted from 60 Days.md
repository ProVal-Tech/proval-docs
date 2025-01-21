---
id: 'a54c73f8-ca6b-4adb-988c-705818e804f7'
title: 'Dataview for Inactive Network Devices in Automate'
title_meta: 'Dataview for Inactive Network Devices in Automate'
keywords: ['dataview', 'network', 'devices', 'inactive', 'automate', 'monitoring']
description: 'This document provides a comprehensive overview of the Dataview designed to identify network devices that have not been active in ConnectWise Automate for the past 60 days. It outlines dependencies, columns included in the Dataview, and how it can be utilized for monitoring and management of network devices.'
tags: ['networking', 'report']
draft: false
unlisted: false
---

## Summary

The Dataview helps identify all network devices that have not been active in Automate for the last 60 days.

## Dependencies

This Dataview is part of the solution to remove network devices that have had no contact for over 60 days in Automate. It can also be used separately to view network devices with last contact older than 60 days.

- @Remove Network Devices Older Than 60 Days
- @Network Device Not Contacted from 60 Days Detection

## Columns

| Column             | Description                                         |
|--------------------|-----------------------------------------------------|
| Client Name        | Displays the name of the client                     |
| Location Name      | Displays the name of the location                   |
| DeviceID           | Displays the ID of the device in Automate           |
| Device Name        | Displays the name of the device                      |
| IPAddress          | Displays the IP address of the device               |
| MAC                | Displays the MAC address of the device              |
| Manufacturer Name   | Displays the name of the manufacturer                |
| Alert Template     | Indicates if an alert template is applied           |
| Last Date          | Displays the last contact date of the device in Automate |

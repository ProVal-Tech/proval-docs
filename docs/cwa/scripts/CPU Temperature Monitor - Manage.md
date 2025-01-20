---
id: '56c1260c-a689-45e9-a226-49bf31444750'
title: 'Client Script for CPU Temperature Monitor Management'
title_meta: 'Client Script for CPU Temperature Monitor Management'
keywords: ['client', 'script', 'cpu', 'temperature', 'monitor', 'management']
description: 'This document provides an overview of a client script that manages remote monitors for CPU temperature monitoring. It ensures that installed monitor sets align with the configuration in the EDF and System properties, removing or updating monitors as necessary.'
tags: ['software', 'update']
draft: false
unlisted: false
---
## Summary

This client script manages the remote monitors created by the [EPM - Sensors - Script - CPU Temperature Monitor - Create](<./CPU Temperature Monitor - Create.md>) script. It compares the installed monitor sets with the configuration in the EDF and System properties.

If the script detects that a machine is excluded from monitoring and the monitor set exists on that machine, it removes the monitor set from the computer and also executes a command to remove the dependent files from the machine.

If the script finds that the configuration of the installed monitor set on the machine differs from the configured EDF or system properties, it executes the [EPM - Sensors - Script - CPU Temperature Monitor - Create](<./CPU Temperature Monitor - Create.md>) script on the machine to re-create the monitor set with the correct configuration.

The script can also be used to update the monitor set installed on the machines after making any configuration changes. For instance, if a configuration change is made in a client-level EDF, this script can be run against that client, and the changes will be reflected in the end machine remote monitor after some time.

## Sample Run

For optimal results and to keep the CPU Temperature Monitoring solution up-to-date, it is recommended to schedule the script to run once per day.

![Sample Run](../../../static/img/CPU-Temperature-Monitor---Manage/image_1.png)

## Dependencies

- [EPM - Sensors - Script - CPU Temperature Monitor - Create](<./CPU Temperature Monitor - Create.md>)
- [EPM - Sensors - Remote Monitor - CPU Temperature Monitoring Process](<../monitors/CPU Temperature Monitoring Process.md>)













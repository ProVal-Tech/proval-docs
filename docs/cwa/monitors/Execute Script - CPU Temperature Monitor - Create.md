---
id: 'cwa-cpu-temperature-monitor'
title: 'CPU Temperature Monitor Setup'
title_meta: 'CPU Temperature Monitor Setup for Windows Machines'
keywords: ['cpu', 'temperature', 'monitor', 'windows', 'sensors']
description: 'This document provides a detailed overview of setting up a CPU Temperature Monitor on Windows machines using the EPM - Sensors - Script - CPU Temperature Monitor - Create script. It explains how to enable or disable monitoring through system properties and EDFs, along with the necessary alert template configurations.'
tags: ['configuration', 'monitoring', 'windows', 'sensors', 'alert']
draft: false
unlisted: false
---
## Summary

The monitor set runs the [EPM - Sensors - Script - CPU Temperature Monitor - Create](https://proval.itglue.com/DOC-5078775-14323116) script once a week on Windows machines where CPU Temperature monitoring is enabled. The monitoring can be turned on or off using the system properties and the EDFs, as explained in the [script’s](https://proval.itglue.com/DOC-5078775-14323116) documentation.

## Dependencies

[EPM - Sensors - Script - CPU Temperature Monitor - Create](https://proval.itglue.com/DOC-5078775-14323116)

## Target

Global

## Alert Template

**Name:** △ CUSTOM - Execute Script - CPU Temperature Monitor - Create

**The alert template should run the** [EPM - Sensors - Script - CPU Temperature Monitor - Create](https://proval.itglue.com/DOC-5078775-14323116) **script for `Error`.**

![Image 1](5078775/docs/14323118/images/20699868)  
![Image 2](5078775/docs/14323118/images/20699855)



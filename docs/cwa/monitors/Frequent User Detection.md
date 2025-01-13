---
id: 'cwa-internal-monitor-windows-workstation-agent'
title: 'Internal Monitor for Windows Workstation Agent'
title_meta: 'Internal Monitor for Windows Workstation Agent'
keywords: ['monitor', 'windows', 'workstation', 'agent', 'user', 'detection']
description: 'This document outlines an internal monitor designed to detect online Windows workstation agents where user detection has not occurred in the last 14 days. It allows customization of the detection frequency based on the stored value of the EDF "LogonUserCheckDate".'
tags: ['monitoring', 'windows', 'user', 'detection', 'configuration']
draft: false
unlisted: false
---
## Summary

This internal monitor is designed to detect the online Windows workstation agent where frequent user detection has not been detected in the last 14 days.

You can change this day number on the monitor to set different script run frequencies and freely set it to any number as the dates are compared from the stored value of the EDF "LogonUserCheckDate".

![Image](../../../static/img/Frequent-User-Detection/image_1.png)

## Dependencies

[CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](https://proval.itglue.com/DOC-5078775-16300164)

## Target

Windows Workstations




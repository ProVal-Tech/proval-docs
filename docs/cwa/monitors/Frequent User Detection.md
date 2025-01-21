---
id: '925ec2d0-a4f0-4bff-8482-f0f4137885ce'
title: 'Internal Monitor for Windows Workstation Agent'
title_meta: 'Internal Monitor for Windows Workstation Agent'
keywords: ['monitor', 'windows', 'workstation', 'agent', 'user', 'detection']
description: 'This document outlines an internal monitor designed to detect online Windows workstation agents where user detection has not occurred in the last 14 days. It allows customization of the detection frequency based on the stored value of the EDF "LogonUserCheckDate".'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This internal monitor is designed to detect online Windows workstation agents where user detection has not occurred in the last 14 days.

You can change the number of days in the monitor to set different script run frequencies, allowing you to customize it to any value, as the dates are compared from the stored value of the EDF "LogonUserCheckDate".

![Image](../../../static/img/Frequent-User-Detection/image_1.png)

## Dependencies

[CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](<../scripts/Detect Frequent Logon User (Set Computer Contact).md>)

## Target

Windows Workstations

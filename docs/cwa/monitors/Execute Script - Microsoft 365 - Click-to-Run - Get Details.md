---
id: '66fedeee-80d2-482b-9520-5fdfcab42406'
title: 'Execute Script - Microsoft 365 - Click-to-Run - Get Details'
title_meta: 'Execute Script - Microsoft 365 - Click-to-Run - Get Details'
keywords: ['microsoft', 'office', 'monitor', 'click-to-run', 'script']
description: 'This document outlines the internal monitor that executes the Microsoft 365 - Click-to-Run - Get Details script on online machines with Microsoft Office 365 installed. It targets machines that have not run the script for over 14 days and selectively focuses on those under a Managed Mode policy in Automate.'
tags: ['office', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor executes the [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775) script on online machines with Microsoft Office 365 installed. It will execute the script on machines where it has not been run for over 14 days. Additionally, the monitor selectively targets machines with a Managed Mode policy in Automate.

## Dependencies

- [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
- [SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit](<../../unsorted/SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit.md>)

## Target

Managed Windows Computers

![Image](../../../static/img/Execute-Script---Microsoft-365---Click-to-Run---Get-Details/image_1.png)

## Alert Template

**Name:** `△ Custom - Execute Script - Microsoft 365 - Click-to-Run - Get Details`




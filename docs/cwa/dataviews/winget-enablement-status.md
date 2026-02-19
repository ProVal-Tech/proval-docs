---
id: '0beb37c7-823a-4dd3-9c5a-79db928cdc3b'
slug: /0beb37c7-823a-4dd3-9c5a-79db928cdc3b
title: 'Winget Enablement Status'
title_meta: 'Winget Enablement Status'
keywords: ['winget', 'enablement-status', 'availability', 'winget-status']
description: 'The dataview shows the Winget enablement status for Windows machines, indicating whether Winget is available or not.'
tags: ['windows', 'application']
draft: false
unlisted: false
---

## Summary

The dataview shows the Winget enablement status for Windows machines, indicating whether Winget is available or not.

## Dependencies

- [Script: Get Winget Enablement Status](/docs/a5e852f4-0ca3-11f1-963a-92000234cfc2)
- [Solution: Winget Enablement Status](/docs/7d348f5c-3c23-4efb-b402-0ffba0492117)

## Columns

| Column | Description |
| ------ | ----------- |
| Clientid | Clientid (Hidden) |
| Locationid | Locationid (Hidden) |
| Computerid | Computerid (Hidden) |
| Client | Client Name |
| Location | Location Name |
| Computer | Computer Name |
| Operating System | Operating System |
| Form Factor | Form Factor (HyperV Host/Virtual Server/Physical Server/Virtual Workstation/Laptop/Desktop) |
| Last Contact | Last Contact with RMM |
| Last Logged In User | Last Logged In User |
| Winget Enablement Status | Winget Enablement Status (Available/Unavailable/Not Logged In) |
| Winget Enablement Data Collection Time | Data Collection Time |

## Color Coding

| Column | Value | Color |
| ------ | ----- | ----- |
| Winget Enablement Status | Unavailable | Red |
| Winget Enablement Status | Not Logged In | Orange |
| Winget Enablement Status | Available | Green |

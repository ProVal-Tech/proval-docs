---
id: 'd48f4966-b281-4aaa-8bf0-5059221b7ff3'
slug: /d48f4966-b281-4aaa-8bf0-5059221b7ff3
title: 'C2R Office Version Audit'
title_meta: 'C2R Office Version Audit'
keywords: ['office', 'update', 'audit', 'status', 'version', 'channel']
description: 'This document details a dataview that populates the Click-to-Run Office version, auto-update status, and update channel information on a machine, along with basic system information. It includes dependencies for data collection and monitoring scripts.'
tags: ['report', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This dataview populates the Click-to-Run Office version, auto-update status, and update channel information on the machine, along with some basic system information.

## Dependencies

- [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e)
- [SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit](/docs/18823b31-4222-4881-82f8-bc284af806cb)
- [SWM - Data Collection - Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](/docs/66fedeee-80d2-482b-9520-5fdfcab42406)

## Columns

| Column                     | Description                                                         |
|---------------------------|---------------------------------------------------------------------|
| clientid                  | clientid (Hidden)                                                  |
| locationid                | locationid (Hidden)                                                |
| computerid                | computerid                                                        |
| Client                    | Client Name                                                       |
| Location                  | Location Name                                                     |
| Computer                  | Computer Name                                                     |
| Operating System          | Operating System                                                  |
| Last Contact              | Last Contact of the machine                                       |
| Last Logged In User       | Last Logged In User                                              |
| Form Factor               | Form Factor                                                      |
| C2R Office version        | C2R Office version installed on the machine                       |
| Auto Update               | Whether Office Auto Update is enabled on the machine             |
| Update Channel            | Update Channel for Office installed on the machine                |
| Script Run Time           | Last time [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) ran on the machine |
---
id: '84cd2c82-8c0b-4f7e-9240-6b640add79e0'
slug: /84cd2c82-8c0b-4f7e-9240-6b640add79e0
title: 'Auto Close - Feature Update Tickets Autofix'
title_meta: 'Auto Close - Feature Update Tickets Autofix'
keywords: ['tickets', 'feature', 'update', 'windows', 'monitor']
description: 'This document outlines a script designed to finalize new or open tickets related to the feature pack upgrade solution for Windows 10 machines that have been updated to the latest build. It details the affected ticket subjects, sample run, dependencies, and variables used in the script.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the script is to finish the new or open tickets created by the feature pack upgrade solution for Windows 10 machines that are already updated to the latest build.

### Affected Ticket Subjects:

- Pre-Reboot Installation Failure of Feature Update for %ClientName%/%ComputerName%
- Feature Update Reboot Ignored on %ClientName%/%ComputerName%

## Sample Run

![Sample Run](../../../static/img/Auto-Close---Feature-Update-Tickets-Autofix/image_1.png)

## Dependencies

- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)

## Variables

| Name        | Description                                    |
|-------------|------------------------------------------------|
| STATUS      | Status returned by the monitor set (FAILED/SUCCESS) |
| Count       | Number of tickets to finish                     |
| SQLTicketid | Ticket ID to finish/close                       |



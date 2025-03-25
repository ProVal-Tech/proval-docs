---
id: '52254d14-bc24-4f32-bb3c-7447756ec15f'
slug: /52254d14-bc24-4f32-bb3c-7447756ec15f
title: 'NinjaRMMAgent Uninstaller'
title_meta: 'NinjaRMMAgent Uninstaller'
keywords: ['uninstall', 'ninjarmagent', 'script', 'ticketing', 'failure']
description: 'This document outlines a script designed to uninstall the NinjaRMMAgent from a machine. It includes a global parameter for ticketing, which, when enabled, generates a support ticket if the uninstallation process fails. The document also provides a summary of the script functionality and sample run output.'
tags: ['software', 'ticketing', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

The script attempts to uninstall the NinjaRMMAgent from the machine. If the global variable `Ticketing` is set to `1`, it generates a ticket when the uninstallation fails.

## Sample Run

![Sample Run](../../../static/img/NinjaRMMAgent-Uninstaller/image_1.png)

#### Global Parameters

| Name      | Default | Required | Description                                              |
|-----------|---------|----------|----------------------------------------------------------|
| Ticketing | 0       | True     | Set this variable to 1 to enable ticket creation on failure. |

## Output

- Script Log
- Ticket



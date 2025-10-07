---
id: '53371c3c-92ce-468b-8017-cacce1921b26'
slug: /53371c3c-92ce-468b-8017-cacce1921b26
title: 'Windows Telemetry'
title_meta: 'Windows Telemetry'
keywords: ['role','audit']
description: 'Automate role to detect if a Windows agent has telemetry enabled'
tags: ['windows','auditing']
draft: false
unlisted: false
---

## Summary

Automate role to detect if a Windows agent has telemetry enabled. If the Windows Telemetry role is detected, telemetry data is being sent to Microsoft. This includes any configuration that does not have telemetry disabled.

## Settings

### Role Name
- `Windows Telemetry`

### Type
- `PowerShell`

### Sub-Type
- `Security`
### Detection String

- `{%-HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection:AllowTelemetry-%}`

### Comparator

- `Regex Match`

### Result

- `[1-3]`

### Applicable OS

- `Windows`
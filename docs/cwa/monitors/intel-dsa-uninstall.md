---
id: 'a0bada01-f2d4-4e3d-a4d4-7aa558ec27a3'
slug: /a0bada01-f2d4-4e3d-a4d4-7aa558ec27a3
title: 'ProVal Production - Intel DSA Uninstall'
title_meta: 'ProVal Production - Intel DSA Uninstall'
keywords: ['intel', 'driver', 'assistant', 'support', 'uninstallation']
description: 'This detects the online Windows Workstations that have the `Intel® Driver & Support Assistant` installed.'
tags: ['drivers']
draft: false
unlisted: false
last_update:
  date: 2026-02-25
---

## Summary

This detects the online Windows Workstations that have the `Intel® Driver & Support Assistant` installed to perform uninstallation.

## Dependencies

- `Alert Template - △ Custom - Execute Script - Intel DSA Uninstall`
- [Script - Intel DSA uninstall](/docs/1d65e4c6-7d5c-419d-9e53-6cf3f12f6fff)
- [Intel® Driver & Support Assistant Solution](/docs/26bda8e8-6bca-46c3-894f-3eb838340982)

## Target

- Windows Workstations with Intel Processor

## Implementation

- Import the monitor
- Import the [Script - Intel DSA uninstall](/docs/1d65e4c6-7d5c-419d-9e53-6cf3f12f6fff)
- Import the alert template - `△ Custom - Execute Script - Intel DSA Uninstall`
- Apply the alert template - `△ Custom - Execute Script - Intel DSA Uninstall` to the monitor
- Right click the monitor and then click `Run now and Reset`
  ![Sample Run 1](../../../static/img/docs/fb522a1e-8ebd-43fd-9f18-f47bfd63f6df/image3.webp)

## Changelog

### 2026-02-24

- Initial version of the document

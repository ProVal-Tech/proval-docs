---
id: 'abc5e9cd-9e2c-4df0-b129-be342008e554'
title: 'PowerShell Out of Date'
title_meta: 'PowerShell Out of Date'
keywords: ['windows', 'monitor', 'powershell', 'version', 'detection']
description: 'This document outlines a monitor set designed to detect Windows machines where the PowerShell version is older than 5.0. It includes necessary adjustments for functionality and dependencies for implementation.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

The monitor set will detect Windows machines where the PowerShell version is older than 5.0.

**NOTE:** Adjustments to the SQL must be made at `AgentID = 'TYPE YOUR MONITOR ID HERE'` to make this functional.

## Dependencies

- [Dynamic PowerShell Role](<../roles/Dynamic PowerShell Role.md>)
- [SWM - Software Installation - Script - Update PowerShell](<../scripts/Update PowerShell.md>)

## Target

Managed Windows Workstations and Servers

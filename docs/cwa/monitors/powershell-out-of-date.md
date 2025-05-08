---
id: 'abc5e9cd-9e2c-4df0-b129-be342008e554'
slug: /abc5e9cd-9e2c-4df0-b129-be342008e554
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

- [Dynamic PowerShell Role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81)
- [SWM - Software Installation - Script - Update PowerShell](/docs/a95013e7-7091-4d99-a772-4223230789d9)

## Target

Managed Windows Workstations and Servers
---
id: '52e8e3aa-75ec-47fe-8f23-6f8378cff4bf'
slug: /52e8e3aa-75ec-47fe-8f23-6f8378cff4bf
title: 'Execute Script - Get Winget Enablement Statuss'
title_meta: 'Execute Script - Get Winget Enablement Status'
keywords: ['winget', 'enablement-status', 'availability', 'winget-status']
description: 'The monitor set runs the Get Winget Enablement script on Windows machines. The script will run daily on any machine where Winget is not available or where no user was logged in during the previous audit. It will not run again on machines where Winget was already confirmed as available.'
tags: ['windows', 'application']
draft: false
unlisted: false
---

## Summary

The monitor set runs the [Get Winget Enablement Status](/docs/a5e852f4-0ca3-11f1-963a-92000234cfc2) script on Windows machines. The script will run daily on any machine where Winget is not available or where no user was logged in during the previous audit. It will not run again on machines where Winget was already confirmed as available.

## Dependencies

- [Script: Get Winget Enablement Status](/docs/a5e852f4-0ca3-11f1-963a-92000234cfc2)
- [Solution: Winget Enablement Status](/docs/7d348f5c-3c23-4efb-b402-0ffba0492117)

## Alert Template

- `△ Custom - Execute Script - Get Winget Enablement Status`

## Target

- Global

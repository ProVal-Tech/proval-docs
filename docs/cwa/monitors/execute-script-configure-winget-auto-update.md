---
id: 'a2fa065f-6f76-4442-a0e0-a64365f6c331'
slug: /a2fa065f-6f76-4442-a0e0-a64365f6c331
title: 'Execute Script - Configure Winget Auto Update'
title_meta: 'Execute Script - Configure Winget Auto Update'
keywords: ['winget', 'update', 'monitor', 'script', 'windows']
description: 'This internal monitor executes the Configure Winget Auto Update script on Windows machines where the solution is enabled. It detects changes made to the client-level EDFs and runs the script on the relevant computers. If a computer was previously included in the solution and then excluded, the script will be executed with the Uninstall parameter.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor executes the **[Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55)** script on Windows machines where the solution is enabled. It detects changes made to the client-level EDFs and runs the script on the relevant computers. If a computer was previously included in the solution and then excluded, the script will be executed with the `Uninstall` parameter.

## Dependencies

- **[SWM - Software Update - Script - Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55)**
- **[SWM - Software Update - Custom Table - pvl_wau_config](/docs/be117f3c-0af2-4edb-8fcc-06da1a4db062)**

## Target

Global

## Alert Template

`△ Custom - Execute Script - Configure Winget Auto Update`


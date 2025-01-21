---
id: 'a2fa065f-6f76-4442-a0e0-a64365f6c331'
title: 'Execute Script - Configure Winget Auto Update'
title_meta: 'Execute Script - Configure Winget Auto Update'
keywords: ['winget', 'update', 'monitor', 'script', 'windows']
description: 'This internal monitor executes the Configure Winget Auto Update script on Windows machines where the solution is enabled. It detects changes made to the client-level EDFs and runs the script on the relevant computers. If a computer was previously included in the solution and then excluded, the script will be executed with the Uninstall parameter.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor executes the **[Configure Winget Auto Update](https://proval.itglue.com/DOC-5078775-17973896)** script on Windows machines where the solution is enabled. It detects changes made to the client-level EDFs and runs the script on the relevant computers. If a computer was previously included in the solution and then excluded, the script will be executed with the `Uninstall` parameter.

## Dependencies

- **[SWM - Software Update - Script - Configure Winget Auto Update](https://proval.itglue.com/DOC-5078775-17973896)**
- **[SWM - Software Update - Custom Table - pvl_wau_config](<../../unsorted/SWM - Software Update - Custom Table - pvl_wau_config.md>)**

## Target

Global

## Alert Template

`△ Custom - Execute Script - Configure Winget Auto Update`




---
id: '4a1b21f7-1b25-4640-9405-8c07277c54f0'
slug: /4a1b21f7-1b25-4640-9405-8c07277c54f0
title: 'Windows Update Report'
title_meta: 'Windows Update Report'
keywords: ['monitor', 'windows', 'update', 'report', 'ticket']
description: 'This document outlines an optional monitor set designed to track machines where the Windows Update Report script has executed but failed to retrieve data. It includes SQL queries and dependencies necessary for effective monitoring and ticket creation if issues are detected.'
tags: ['report', 'sql', 'windows']
draft: false
unlisted: false
---

## Summary

This is an optional monitor set to keep an eye on the machines where [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>) script has executed at least twice in a month but failed to fetch any data.

By default, it's a view-only monitor set, but the `default - create automate ticket` alert template can be used to create tickets.

## Dependencies

- [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>)
- [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](<./Get Windows Update Report DV.md>)
- [CWM - Automate - Solution - Windows Update Report](<../../solutions/Windows Update Report.md>)
- [CWM - Automate - Custom Table - plugin_proval_windows_update_report](<../tables/plugin_proval_windows_update_report.md>)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)

## Target

The SQL query is limiting the monitor to the machines that are supported by Microsoft and have a Managed Patch policy applied.
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

This is an optional monitor set to keep an eye on the machines where [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script has executed at least twice in a month but failed to fetch any data.

By default, it's a view-only monitor set, but the `default - create automate ticket` alert template can be used to create tickets.

## Dependencies

- [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f)
- [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](/docs/fa9b4535-5711-4cde-ac58-cb9759dbd65a)
- [CWM - Automate - Solution - Windows Update Report](/docs/affc0b47-f0fe-43f9-95f6-0e0d1205b4d6)
- [CWM - Automate - Custom Table - plugin_proval_windows_update_report](/docs/845fe569-12ec-48e3-86f4-34377aba03ec)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)

## Target

The SQL query is limiting the monitor to the machines that are supported by Microsoft and have a Managed Patch policy applied.
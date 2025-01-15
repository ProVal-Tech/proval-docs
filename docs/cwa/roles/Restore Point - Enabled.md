---
id: '93829155-7945-440a-bf26-775f090df083'
title: 'Check if Restore Point is Enabled'
title_meta: 'Check if Restore Point is Enabled in ConnectWise Automate'
keywords: ['restore', 'point', 'enabled', 'registry', 'machine']
description: 'This document provides a detailed overview of a role that checks whether the Restore Point feature is enabled in the Windows registry. If enabled, the role applies the necessary settings to the machine in the ConnectWise Automate database, ensuring proper system restore functionality.'
tags: ['configuration', 'windows', 'database', 'security']
draft: false
unlisted: false
---
## Summary

This role checks the registry if Restore point is enabled or not, if so it applies this role to the machine in the Automate database.

## Settings

| Detection String                                             | Comparator | Result | Applicable OS |
|------------------------------------------------------------|------------|--------|----------------|
| {%-HKLM/SOFTWARE/Microsoft/Windows NT/CurrentVersion/SystemRestore:RPSessionInterval-%} | Equals     | 1      | Windows        |







---
id: 'a2fa065f-6f76-4442-a0e0-a64365f6c331'
slug: /a2fa065f-6f76-4442-a0e0-a64365f6c331
title: 'Execute Script - Configure Winget Auto Update'
title_meta: 'Execute Script - Configure Winget Auto Update'
keywords: ['winget', 'update', 'monitor', 'script', 'windows']
description: 'This internal monitor executes the Configure Winget Auto Update script on Windows machines where the solution is enabled. It detects changes made to the client-level EDFs and automatically repairs missing components. If a computer was previously included in the solution and then excluded, the script will be executed with the Uninstall parameter.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-30
---

## Summary

This internal monitor executes the **[Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55)** script on Windows machines where the solution is enabled. It compares the current client‑level EDFs with the values stored in the [pvl_wau_config](/docs/be117f3c-0af2-4edb-8fcc-06da1a4db062) table and also checks whether the **[Winget Auto Update Configuration Check](/docs/a6200c89-b918-43a9-8632-fa2effac2e0c)** remote monitor exists on the endpoint.

Depending on the detected state, the monitor returns one of three actions:

- **Uninstall** – The solution was previously enabled but is now disabled or excluded; the script runs with `-Uninstall` to remove all components.
- **Force** – The solution is enabled but the configuration monitor is missing (or the configuration has drifted); the script runs with `-Force` to recreate the monitor and repair the environment.
- **Configure** – The solution is enabled but one or more EDF values differ from the stored configuration; the script runs without `-Force` to apply the updated settings.

If the solution is enabled and the configuration is already up‑to‑date (and the monitor is present), the computer is not returned by this internal monitor.

## Dependencies

- [Script - Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55)
- [Custom Table - pvl_wau_config](/docs/be117f3c-0af2-4edb-8fcc-06da1a4db062)
- [Remote Monitor - Winget Auto Update Configuration Check](/docs/a6200c89-b918-43a9-8632-fa2effac2e0c)
- [Solution - Winget Auto Update](/docs/92b2ccf2-534f-46b6-b1d1-dd77dea47ba8)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Configure Winget Auto Update`

## Changelog

### 2026-06-30

- Updated to support the new portable Winget solution and the `Audit Only` EDF option.
- Added detection for missing **[Winget Auto Update Configuration Check](/docs/a6200c89-b918-43a9-8632-fa2effac2e0c)** remote monitor; the monitor now returns `'Force'` to trigger a repair when the configuration monitor is absent.
- Removed dependency on the deprecated `WAU - NotificationLevel` EDF.

### 2025-04-10

- Adjusted to exclude computers where the script had failed twice in the week.

### 2025-04-08

- Initial version of the document

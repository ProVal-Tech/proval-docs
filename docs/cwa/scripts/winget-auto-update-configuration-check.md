---
id: 'a6200c89-b918-43a9-8632-fa2effac2e0c'
slug: /a6200c89-b918-43a9-8632-fa2effac2e0c
title: 'Winget Auto Update Configuration Check'
title_meta: 'Winget Auto Update Configuration Check'
keywords: ['winget', 'monitor', 'configuration', 'repair', 'update']
description: 'This remote monitor verifies the integrity of the Winget Auto Update configuration. It ensures that the required scheduled tasks and stored configuration table are present. If not, it triggers an automatic repair by executing the Configure Winget Auto Update script with the Force parameter.'
tags: ['update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-30
---

## Summary

The **Winget Auto Update Configuration Check** remote monitor is automatically created by the [Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55) script on every computer where the Winget Auto Update solution is enabled (i.e., the client‑level EDF `Winget Auto Update` is not `Disabled` and the computer is not excluded). Unlike the [Winget Auto Update Errors](/docs/68a14948-368f-4064-97a3-d1928e122013) monitor, it does **not** depend on the `WAU - MonitorFailures` EDF.

The monitor performs two checks every hour:

1. **Scheduled task integrity** – Verifies that the number of tasks under the `\WAU\` path is either 1 (system only) or 2 (system + user context). If no tasks exist, or there are more than 2, the check fails.
2. **Stored configuration table** – Confirms that the `windowsAutoUpdateConfig` table (used for auditing and policy storage) is accessible. If the table is missing, the check fails.

If either check fails, the monitor returns the string **`Force`**. The monitor is linked to the alert template `△ Custom - Execute Script - Configure Winget Auto Update`, which directly executes the [Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55) script with the `-Force` parameter. This immediately repairs the configuration.

## Details

**Alert Template:** `△ Custom - Execute Script - Configure Winget Auto Update`  
**Suggested Alert Style:** Once  
**Check Interval:** 3600 seconds (1 hour)

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval |
|--------------|----------------|------------|---------------|-------------|----------|
| System       | 127.0.0.1      | Run File   | **REDACTED**  | State Based | 3600     |

The monitor executes a PowerShell command that:

1. Counts the scheduled tasks under `\WAU\`.
2. Attempts to read the `windowsAutoUpdateConfig` stored object.
3. Returns `"Force"` if either count is outside 1–2 or the table access fails; otherwise returns nothing.

When the result is `"Force"`, the alert template fires and runs the configuration script with the **Force** parameter – no additional variables or manual steps are needed.

## Dependencies

- [Script - Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55)
- [Custom Table - pvl_wau_config](/docs/be117f3c-0af2-4edb-8fcc-06da1a4db062) (for configuration reference)
- [Solution - Winget Auto Update](/docs/92b2ccf2-534f-46b6-b1d1-dd77dea47ba8)

## Target

Local Machine

## Ticketing

This monitor does **not** create tickets directly. Its alert template `△ Custom - Execute Script - Configure Winget Auto Update` runs the configuration script immediately. The script itself may log its actions, but no ticket is opened by this monitor.

## Changelog

### 2026-06-30

- Initial release. Introduced as part of the new portable Winget Auto Update solution.

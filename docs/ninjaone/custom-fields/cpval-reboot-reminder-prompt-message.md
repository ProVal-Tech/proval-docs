---
id: 'c738149c-3efb-459e-8bff-96653fa028c4'
slug: /c738149c-3efb-459e-8bff-96653fa028c4
title: 'cPVAL Reboot Reminder Prompt Message'
title_meta: 'cPVAL Reboot Reminder Prompt Message'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Sets the message displayed on the pre-reboot reminder window. Supports message substitution variables (e.g., ScheduledRebootTime, MinutesUntilReboot).'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-09-09
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Sets the message displayed on the pre-reboot reminder window. Supports message substitution variables (e.g., ScheduledRebootTime, MinutesUntilReboot).

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Reminder Prompt Message` - acts as the ultimate fallback default)

This field only applies when the reboot scheduler is enabled through `cPVAL Reboot Schedule Max Hours`. The message is used verbatim, with no additional text appended.

The `ScheduledRebootTime` and `MinutesUntilReboot` substitution variables resolve to the actual restart time the user selected and the real number of minutes remaining at the moment the reminder is displayed, so a single message stays accurate wherever inside the reminder window it appears.

>**💡 Note:** Avoid single quotes (`'`) in this message.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot Reminder Prompt Message` | `cpvalRebootReminderPromptMessage` | `Your computer will restart at ScheduledRebootTime.` | `Organization, Location, Device` | `Multi-line` | `False` | `Your computer is scheduled to restart...` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Reminder Prompt Message`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-reminder-prompt-message.toml)

## Changelog

### 2026-09-09

- Initial version of the document

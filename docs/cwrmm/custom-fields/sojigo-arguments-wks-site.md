---
id: '248a3007-7a4f-4962-91f3-01ec4d2c8a39'
slug: /248a3007-7a4f-4962-91f3-01ec4d2c8a39
title: 'SojiGo_Arguments_Wks_Site'
title_meta: 'SojiGo_Arguments_Wks_Site'
keywords: ['sojigo', 'disk-cleanup', 'arguments', 'drive', 'space']
description: 'Site-level SojiGo arguments for Workstations. Overrides Company level, but overridden by Endpoint.'
tags: ['disk', 'disk-cleanup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-20
---

## Summary

Site-level SojiGo arguments for Workstations. Overrides Company level, but overridden by Endpoint. The [SojiGo task](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0) runs the [SojiGo](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df) drive cleaner with these arguments.

## Dependencies

- [Task: SojiGo](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0)
- [Application: SojiGo](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df)
- [Solution: SojiGo](/docs/215f93ac-aca7-4ccd-8f3e-1b241bd32353)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SojiGo_Arguments_Wks_Site | Site-level SojiGo arguments for Workstations. Overrides Company level, but overridden by Endpoint. | `Site` | `Text Area` | SojiGo arguments, e.g. --drives C --days 21. Type each single quote twice. |  | `Yes` |

:::note

Type every single quote twice. Wrap values that contain spaces, commas or `|` in two single quotes on each side, for example `--exclude-volumecache ''Temporary Files,Recycle Bin''`. See [Writing arguments](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0#writing-arguments) for all the rules.

:::

## Completed Custom Field

![Image1](../../../static/img/docs/248a3007-7a4f-4962-91f3-01ec4d2c8a39/image1.webp)

## Changelog

### 2026-10-20

- Initial version of the document

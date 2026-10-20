---
id: '91d0fa29-3c12-4e9c-b65b-b23e64a93c66'
slug: /91d0fa29-3c12-4e9c-b65b-b23e64a93c66
title: 'SojiGo_Arguments_Wks'
title_meta: 'SojiGo_Arguments_Wks'
keywords: ['sojigo', 'disk-cleanup', 'arguments', 'drive', 'space']
description: 'Company baseline SojiGo arguments for Workstations. Overridden if Site or Endpoint arguments exist.'
tags: ['disk', 'disk-cleanup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-20
---

## Summary

Company baseline SojiGo arguments for Workstations. Overridden if Site or Endpoint arguments exist. The [SojiGo task](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0) runs the [SojiGo](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df) drive cleaner with these arguments.

## Dependencies

- [Task: SojiGo](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0)
- [Application: SojiGo](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df)
- [Solution: SojiGo](/docs/215f93ac-aca7-4ccd-8f3e-1b241bd32353)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SojiGo_Arguments_Wks | Company baseline SojiGo arguments for Workstations. Overridden if Site or Endpoint arguments exist. | `Company` | `Text Area` | SojiGo arguments, e.g. --drives C --days 21. Type each single quote twice. | `--drives C --days 21 --csv --log-retention-days 60 --exclude-path ''C:\Windows\SoftwareDistribution\Download'' --exclude-volumecache ''Temporary Files,Recycle Bin,Update Cleanup''` | `Yes` |

:::note

Type every single quote twice. Wrap values that contain spaces, commas or `|` in two single quotes on each side, for example `--exclude-volumecache ''Temporary Files,Recycle Bin''`. See [Writing arguments](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0#writing-arguments) for all the rules.

:::

## Completed Custom Field

![Image1](../../../static/img/docs/91d0fa29-3c12-4e9c-b65b-b23e64a93c66/image1.webp)

## Changelog

### 2026-10-20

- Initial version of the document

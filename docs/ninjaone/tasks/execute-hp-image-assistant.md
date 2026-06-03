---
id: '5732428a-7410-49b6-a4e7-06fb906f424c'
slug: /5732428a-7410-49b6-a4e7-06fb906f424c
title: 'Execute HP Image Assistant'
title_meta: 'Execute HP Image Assistant'
keywords: ['hp','hpia','hp-image-assistant','image-assistant','drivers','firmware','driver-updates','bios']
description: 'This group contains Hewlett Packard Windows 10 and Windows 11 devices with HP Image Assistant auditing enabled.'
tags: ['hp','firmware','bios','drivers']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Summary
This task executes [Automation - Initialize HP Image Assistant](/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3) on [ Group - cPVAL HPIA Enabled Machines](/docs/a194d71e-2a83-46ed-8894-3137db6571d0) weekly.

## Dependencies

- [Solution - HP Image Assistant](/docs/4c4053fb-301c-4c77-8e7f-97ed2f00b391)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Execute HP Image Assistant | This task executes `Initialize HP Image Assistant` automation on `cPVAL HPIA Enabled Machines` group. | True | Weekly | Monday | 1 week(s) | 06/03/2026 11:00 AM | Never |  [ Group - cPVAL HPIA Enabled Machines](/docs/a194d71e-2a83-46ed-8894-3137db6571d0) | [Automation - Initialize HP Image Assistant](/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3) |

## Dependencies

- [Solution - HP Image Assistant](/docs/4c4053fb-301c-4c77-8e7f-97ed2f00b391)

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/execute-hp-image-assistant.toml)

## Changelog

### 2026-06-03

- Initial version of the document
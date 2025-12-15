---
id: '6ae9f202-1695-4894-9e26-4ab72275fd43'
slug: /6ae9f202-1695-4894-9e26-4ab72275fd43
title: 'Hyper-V Vhdx Audit'
title_meta: 'Hyper-V Vhdx Audit'
keywords: ['hyper-v', 'vhdx', 'virtualization', 'drive', 'vhdx-auditing']
description: 'Executes "Audit Hyper-V VHDX" script once per day against Hyper-V Hosts.'
tags: ['hyper-v', 'auditing', 'disk', 'diskspace']
draft: false
unlisted: false
---

## Summary

Executes [Audit Hyper-V VHDX](/docs/73c2e2db-d5ee-4d7f-80eb-6593abe5abbf) script once per day against Hyper-V Hosts.

## Dependencies

- [Script: Audit Hyper-V VHDX](/docs/73c2e2db-d5ee-4d7f-80eb-6593abe5abbf)
- [Solution: Hyper-V VHDX Auditing](/docs/ac904ba5-b501-4137-9f09-9960c88f4aa4)
- [Custom Field: cPVAL - Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)
- [Group: cPVAL - Server Role - Hyper-V Host](/docs/cf5d5ac8-bc9c-400d-a130-2e19866df942)
- [Solution: Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Hyper-V Vhdx Audit | Executes 'Audit Hyper-V VHDX' script once per day against Hyper-V Hosts. | True | Daily | 1 day(s) | 02:00 PM | Never | [Group: cPVAL - Server Role - Hyper-V Host](/docs/cf5d5ac8-bc9c-400d-a130-2e19866df942) | [Audit Hyper-V VHDX](/docs/73c2e2db-d5ee-4d7f-80eb-6593abe5abbf) |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/hyperv-vhdx-audit.toml)

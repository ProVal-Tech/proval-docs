---
id: 'a04599cc-fb39-4e06-94bb-fe4ddaca358b'
slug: /a04599cc-fb39-4e06-94bb-fe4ddaca358b
title: 'Audit Internet Speed'
title_meta: 'Audit Internet Speed'
keywords: ['internet', 'speed', 'audit', 'monitoring', 'network']
description: 'Executes `Internet Speed - Audit` script once per day against Windows Machines.'
tags: ['database', 'performance']
draft: false
unlisted: false
last_update:
  date: 2026-10-28
---

## Summary

Executes 'Internet Speed - Audit' script once per day against Windows Machines.

## Dependencies

* [Automation - Internet Speed - Audit](/docs/5d4e181e-6fc8-4dfb-ad53-e8aae1a784a0)
* [Solution - Internet Speed Audit](/docs/7dc8d18c-aab4-4ad1-80bc-4e7beef98530)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Audit Internet Speed | Executes 'Internet Speed - Audit' script once per day against Windows Machines. | True | Daily | 1 day(s) | 10/28/2026 11:30 AM | Never | `cPVAL Windows Workstations`, `cPVAL Windows Servers` | [Automation - Internet Speed - Audit](/docs/5d4e181e-6fc8-4dfb-ad53-e8aae1a784a0) | 

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/audit-internet-speed.toml)

## Changelog

### 2026-10-28

- Initial version of the document


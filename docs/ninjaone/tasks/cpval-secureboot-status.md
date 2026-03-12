---
id: 'aedc9657-d670-4057-b7dd-c75e214a7ad8'
slug: /aedc9657-d670-4057-b7dd-c75e214a7ad8
title: 'cPVAL SecureBoot Status'
title_meta: 'cPVAL SecureBoot Status'
keywords: ['secure','secure-boot','audit']
description: 'This task checks and records the SecureBoot status on devices, including SecureBoot certificates.'
tags: ['security','custom-fields','Secureboot','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This task checks and records the SecureBoot status on devices, including SecureBoot certificates.

## Dependencies

[Group- cPVAL SecureBoot Disabled](/docs/f60be794-9c67-48fe-9e2d-694c6ed58246)
[Automation - SecureBoot Compliance - Audit](/docs/33446436-a337-411d-99ae-299046ba30d9)
[Solution - Secure Boot Compliance - Audit](/docs/b037020a-1af5-4ecb-bb6b-62d59c123937)

## Details

| Name | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| cPVAL SecureBoot Status | This task checks and records the SecureBoot status on devices, including SecureBoot certificates. | `Yes` | `Weekly` | `Every 1 Week` | `03/12/2026` | `Never` | cPVAL SecureBoot Disabled | SecureBoot Compliance - Audit |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/cpval-secureboot-status.toml)

## Changelog

Initial Version

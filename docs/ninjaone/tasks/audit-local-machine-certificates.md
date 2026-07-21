---
id: 'f83dd443-cd43-45ce-8f05-a09e78b9ac0d'
slug: /f83dd443-cd43-45ce-8f05-a09e78b9ac0d
title: 'Audit Local Machine Certificates'
title_meta: 'Audit Local Machine Certificates'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This task executes Windows - Certificates (My) - Local Machine - Audit once per day.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-20 
---

## Summary
This task executes [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) once per day on windows machines.

## Dependencies

- [Solution - SSL Certificate Audit](/docs/cf5acc69-183c-4838-9484-2f3d9a247877)
- [Group : cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256)
- [Group : cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422)
- [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5)


## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Audit Local Machine Certificates | This task executes 'Windows - Certificates (My) - Local Machine - Audit' once per day. | True | Daily | 1 Day | 07/17/2026 10:00 AM | Never | [Group : cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256), [Group : cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422)| [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/audit-local-machine-certificates.toml)

## Changelog

### 2026-07-20

- Initial version of the document
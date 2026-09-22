---
id: '8cc5ecd5-036e-4fb2-b07d-14e738289f8f'
slug: /8cc5ecd5-036e-4fb2-b07d-14e738289f8f
title: 'Configure BgInfo - Workstations'
title_meta: 'Configure BgInfo - Workstations'
keywords:  ['bginfo', 'configuration', 'download', 'tool', 'script']
description: 'Triggers the scripts to Configure BGInfo'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-22
---

## Summary
This condition triggers the [File Transfer - BGI File](/docs/3201c4cc-a76e-4df9-8195-8663a320964d) and [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3) on Windows workstations where BGInfo deployment is enabled through the [Custom Field - cPVAL Configure BGInfo](/docs/4055f1a8-0faa-47f6-b476-e50973bc5a25).The condition also verifies that the "BGInfo scheduled task" has not already been created. This is validated using [Automation - BGInfo - Verify Scheduled Task](/docs/012a3d2e-4524-4fd3-9705-81a2ef0ca253).

## Details
- **Name:** `Configure BgInfo - Workstations`
- **Description:**  `This condition triggers the [File Transfer - BGI File](/docs/3201c4cc-a76e-4df9-8195-8663a320964d) and [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3) on Windows workstations where BGInfo deployment is enabled through the [Custom Field - cPVAL Configure BGInfo](/docs/4055f1a8-0faa-47f6-b476-e50973bc5a25).The condition also verifies that the "BGInfo scheduled task" has not already been created. This is validated using [Automation - BGInfo - Verify Scheduled Task](/docs/012a3d2e-4524-4fd3-9705-81a2ef0ca253).` 
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Automation - BGInfo - Verify Scheduled Task](/docs/012a3d2e-4524-4fd3-9705-81a2ef0ca253)
- [File Transfer - BGI File](/docs/3201c4cc-a76e-4df9-8195-8663a320964d)
- [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3)
- [Custom Field - cPVAL Configure BGInfo](/docs/4055f1a8-0faa-47f6-b476-e50973bc5a25)
- [Solution - Configure BgInfo](/docs/e6f8548f-1459-4f72-9d77-be33dc4d89a6)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/configure-bginfo-workstations.toml)

## Changelog

### 2026-09-22

- Initial version of the document

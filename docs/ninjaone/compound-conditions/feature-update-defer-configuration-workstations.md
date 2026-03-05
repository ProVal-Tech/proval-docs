---
id: '73c10fcb-2102-4e7d-80b6-e051cf8e55ec'
slug: /73c10fcb-2102-4e7d-80b6-e051cf8e55ec
title: 'Feature Update Defer Configuration workstations'
title_meta: 'Feature Update Defer Configuration workstations'
keywords: ['windows','feature','update','deferral']
description: 'This condition ensures that the Enable or Disable Update Windows Deferral script runs on Windows workstations where the current configuration does not match the desired value. The mechanism is controlled through the cPVAL Feature Update Configuration custom field.'
tags: ['updates','registry','auditing']
draft: false
unlisted: false
last_update:
  date: 2026-03-05
---

## Summary

This condition ensures that the Enable or Disable Update Windows Deferral script runs on Windows Servers where the current configuration does not match the desired value. The mechanism is controlled through the cPVAL Feature Update Configuration custom field.

## Details

- **Name:** `Feature Update Defer Configuration - Workstations`
- **Description:** `This condition ensures that the Enable or Disable Update Windows Deferral script runs on Windows workstations where the current configuration does not match the desired value. The mechanism is controlled through the cPVAL Feature Update Configuration custom field.`
- **Recommended Agent Policies:** Windows Workstation Policy

## Dependencies

- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)
- [Solution: Update Windows Deferral Settings](/docs/56e6b247-f80a-4bd8-b2e2-8cf44f76b7e1)
- [Custom Field: cPVAL Feature Update Configuration](/docs/29e44495-0c4b-425c-bb1f-118dab2633e2)
- [Automation: WinUpdate Deferral Audit](/docs/79c86028-fa08-450f-bc45-e2f3f2026732)
- [Automation: Update Windows Deferral Settings](/docs/5d4e1aa7-4ec8-4a7a-ba50-7a93366a232a)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/feature-update-defer-configuration-workstations.toml )

## Changelog

### 2026-03-06

- Initial version of the document

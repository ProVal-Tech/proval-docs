---
id: '73c10fcb-2102-4e7d-80b6-e051cf8e55ec'
slug: /73c10fcb-2102-4e7d-80b6-e051cf8e55ec
title: 'Feature Update Defer Configuration Workstations'
title_meta: 'Feature Update Defer Configuration Workstations'
keywords: ['windows','feature','update','deferral','update']
description: 'This condition ensures that the Enable or Disable Update Windows Deferral script runs on Windows workstations where the current configuration does not match the desired value. The mechanism is controlled through the cPVAL Feature Update Configuration custom field.'
tags: ['updates','registry','auditing']
draft: false
unlisted: false
last_update:
  date: 2026-03-05
---

## Summary

This condition ensures that the Enable or Disable Update Windows Deferral script runs on Windows workstations where the current configuration does not match the desired value. The mechanism is controlled through the `cPVAL Feature Update Configuration` custom field.

## Details

- **Name:** `Feature Update Defer Configuration - Workstations`
- **Description:** `This condition ensures that the Enable or Disable Update Windows Deferral script runs on Windows workstations where the current configuration does not match the desired value. The mechanism is controlled through the "cPVAL Feature Update Configuration" custom field.`
- **Recommended Agent Policies:** Windows Workstation Policy

## Dependencies

- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)
- [Solution: Update Windows Deferral Settings](/docs/56e6b247-f80a-4bd8-b2e2-8cf44f76b7e1)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/feature-update-defer-configuration-workstations.toml )

## Changelog

### 2026-03-06

- Initial version of the document

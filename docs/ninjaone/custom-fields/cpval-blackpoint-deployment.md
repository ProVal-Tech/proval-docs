---
id: 'd858853c-665a-4283-a653-6655c2477993'
slug: /d858853c-665a-4283-a653-6655c2477993
title: 'cPVAL Blackpoint Deployment'
title_meta: 'cpvalBlackpointDeployment'
keywords: ['mac','windows','deployment']
description: 'This custom field is used when creating compound conditions for automation.'
tags: ['security','custom-fields','windows','macos']
draft: false
unlisted: false
---

## Summary

This custom field is utilized as part of compound condition logic during the blackpoint automation. It holds data like enabled or disabled.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Blackpoint Deployment | cpvalBlackpointDeployment | `Device`, `organization`, `Location` | Text | True | `Disabled`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macs`, `Windows and Macs`, `Windows Servers and Macs`, `Windows Workstations and Macs` | Editable | `Read/Write` | `Read/Write`   |     This field stores the unique Blackpoint AccountUID, which is the identifier used by Blackpoint to associate endpoints and services with the correct customer account. It ensures accurate mapping and automation when deploying agents.   |   This custom field is used when creating compound conditions for automation..   | This custom field is used when creating compound conditions for automation. | BlackPoint |

## Dependencies

- [Compound Condition - BlackPoint SNAP Installer - MacOS](docs/c4c8973c-059f-4d8b-a091-8ad01760831b)
- [Compound Condition - BlackPoint SNAP Installer - Windows Server](docs/729cb4c0-adc7-4c9b-9274-5dd4ff093ca3)
- [Compound Condition - BlackPoint SNAP Installer - Windows Workstations](docs/85a2de03-5004-4e90-9598-9de731bb5b6b)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-blackpoint-deployment.toml)

## Sample Screenshot

![AccountUid](../../../static/img/docs/d858853c-665a-4283-a653-6655c2477993/BPDeployment.webp)
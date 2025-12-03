---
id: 'dba79f8f-132d-41cd-ae1c-6da6964bc418'
slug: /dba79f8f-132d-41cd-ae1c-6da6964bc418
title: 'cPVAL Blocker_Mode'
title_meta: 'cPVAL Blocker_Mode'
keywords: ['agent','windows','deployment']
description: 'Blocker Mode is used during the autoelevate deployment.'
tags:  ['security','application']
draft: false
unlisted: false
---

## Summary

Blocker Mode is used during the autoelevate deployment.

## Details

| Label                          | Field Name                 | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description                             | Tool Tip | Footer Text | Custom Field Tab Name |
| ------------------------------ | -------------------------- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | --------------------------------------- | -------- | ----------- | --------------------- |
| cPVAL Blocker_Mode | cpvalBlockermode | Organization, Location, Device     | Text | No     | -             | Editable              | Read/Write            | Read/Write     | Used to hold the blocker mode data that is used within the script. | Blocker Mode       | Blocker Mode         | AutoElevate     |

## Dependencies

- [AutoElevate Agent Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-blocker-mode.toml)

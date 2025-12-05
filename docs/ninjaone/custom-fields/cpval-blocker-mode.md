---
id: 'dba79f8f-132d-41cd-ae1c-6da6964bc418'
slug: /dba79f8f-132d-41cd-ae1c-6da6964bc418
title: 'cPVAL Blocker_Mode'
title_meta: 'cPVAL Blocker_Mode'
keywords: ['agent','windows','deployment']
description: 'Blocker Mode is a required parameter that needs to be passed during the AutoElevate agent deployment. This parameter is used to set the Blocker Mode configuration for the end user at the time of installation'
tags:  ['security','application','security','application','custom-fields']
draft: false
unlisted: false
---

## Summary

Blocker Mode is a required parameter that needs to be passed during the AutoElevate agent deployment. This parameter is used to set the Blocker Mode configuration for the end user at the time of installation.

## Details

| Label                          | Field Name                 | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description                             | Tool Tip | Footer Text | Custom Field Tab Name |
| ------------------------------ | -------------------------- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | --------------------------------------- | -------- | ----------- | --------------------- |
| cPVAL Blocker_Mode | cpvalBlockermode | `Organization`, `Location`, `Device`     | Text | No     | -             | Editable              | Read/Write            | Read/Write     | This custom field sets the Blocker Mode configuration for the end user at the time of installation. | Blocker Mode       | Blocker Mode         | AutoElevate     |

## Dependencies

- [AutoElevate Agent Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-blocker-mode.toml)

## Sample Screenshot

![Blocker Mode](../../../static/img/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418/Blocker-mode.webp)
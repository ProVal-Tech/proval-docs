---
id: 'ff8d3f33-14ea-4e5b-9cec-95fab016f633'
slug: /ff8d3f33-14ea-4e5b-9cec-95fab016f633
title: 'Lenovo System Update Scan'
title_meta: 'Lenovo System Update Scan'
keywords: ['lenovo', 'bios', 'firmware', 'drivers', 'vendor-specific', 'driver-updates', 'lenovo-workstations']
description: 'This monitor executes the Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix] script once per day against Lenovo workstations.'
tags: ['lenovo', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
last_update:
  date: 2026-04-30
---

## Summary

This monitor executes the [Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010) script once per day against Lenovo workstations.

## Dependencies

- [Script: Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010)
- [Custom Table: pvl_lsuclient_audit](/docs/14af3c59-efba-4f62-959a-50ad6e382836)
- [Solution: Lenovo System Update Handler](/docs/d801eded-6c8e-413b-852a-5ff83058667b)

## Target

Global

## Alert Template

- `△ Custom - Execute Script - Lenovo System Update Scan`

## Changelog

### 2026-04-30

- Initial version of the document.

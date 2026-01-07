---
id: 'a7c72ccd-b604-4d7f-aefe-3fd5393d7f01'
slug: /a7c72ccd-b604-4d7f-aefe-3fd5393d7f01
title: 'cPVAL Cumulative Update Audit Status'
title_meta: 'cPVAL Cumulative Update Audit Status'
keywords: ['Cumulative', 'Update', 'Audit']
description: 'Shows the most recently installed Windows Cumulative Update. Useful for verifying patch status and update compliance.'
tags: ['compliance', 'patching', 'windows']
draft: false
unlisted: false
---

## Summary

Shows the most recently installed Windows Cumulative Update. Useful for verifying patch status and update compliance.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
|cPVAL Cumulative Update Audit Status| cpvalCumulativeUpdateAuditStatus| Device | Text | No | |Read Only | Read_Write | Read_Write |Shows the most recently installed Windows Cumulative Update. Useful for verifying patch status and update compliance. | Current Cumulative Update| |

## Dependencies

- [Automation - Cumulative Update Audit](/docs/4b49b89f-51f8-4f6b-9f1e-28b8f9800991)
- [Group - cPVAL Cumulative Update Older than threshold Days](/docs/577bdd4f-439e-4462-aac8-184b6b6d40a6)
- [Solution - Cumulative Update Audit](/docs/72aee984-4fb3-4a1a-9df3-8b12b726f967)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-cumulative-update-audit-status.toml)

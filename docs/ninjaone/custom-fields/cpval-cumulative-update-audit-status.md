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

[Script : New Domain Admin Detected](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23)
[Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-excluded-domain-admins.toml)

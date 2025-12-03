---
id: '7061a031-f078-4ee0-b87c-83595adf0a64'
slug: /7061a031-f078-4ee0-b87c-83595adf0a64
title: 'cPVAL Addigy Policy ID'
title_meta: 'cPVAL Addigy Policy ID'
keywords: ['addigy', 'addigy-agent', 'install-addigy-agent', 'mac-manage', 'mac-manage-helper']
description: 'Stores the Addigy Policy ID for this organization. Ensures all macOS devices report to the correct policy bucket in Addigy for proper management and compliance.'
tags: ['installation', 'application', 'macos']
draft: false
unlisted: false
---

## Summary

Stores the Addigy Policy ID for this organization. Ensures all macOS devices report to the correct policy bucket in Addigy for proper management and compliance.

## Details

| Label | Field Name | Definition Scope | Type | Options | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---------- | ---------------- | ---- | ------- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Addigy Policy ID | cpvalAddigyPolicyId | Organization | Text | | Partially | | Editable | Read_Write | Read_Write | Stores the Addigy Policy ID for this organization. Ensures all macOS devices report to the correct policy bucket in Addigy for proper management and compliance. | Enter the Addigy Policy ID to link devices to the correct policy bucket in Addigy. | This field is critical for accurate policy mapping in Addigy. Verify the Policy ID before saving to avoid misreporting or incorrect device grouping. | Addigy Agent |

## Dependencies

- [Solution: Addigy Agent Deployment](/docs/1f1e6543-8ab7-4b30-adde-ac0f0b2f54a1)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-addigy-policy-id.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/7061a031-f078-4ee0-b87c-83595adf0a64/image1.webp)

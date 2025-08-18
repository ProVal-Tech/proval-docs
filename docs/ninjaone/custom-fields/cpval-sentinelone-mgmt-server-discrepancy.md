---
id: '1de41dd5-c222-45cb-9b74-5ae45bb86dd8'
slug: /1de41dd5-c222-45cb-9b74-5ae45bb86dd8
title: 'cPVAL SentinelOne Mgmt Server Discrepancy'
title_meta: 'cPVAL SentinelOne Mgmt Server Discrepancy'
keywords: ['sentinelone', 's1', 'management-console', 'management-server-url']
description: 'If the S1 Management URL on the endpoint matches the value stored in the NinjaOne custom field, or if there is any discrepancy between the two.'
tags: ['antivirus', 'auditing']
draft: false
unlisted: false
---

## Summary

If the S1 Management URL on the endpoint matches the value stored in the NinjaOne custom field, or if there is any discrepancy between the two.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name Workstations  | Custom Field Tab Name Servers |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- |
| cPVAL SentinelOne Mgmt Server Discrepancy | cpvalSentineloneMgmtServerDiscrepancy | Device | CheckBox | false | | Editable | Read/Write | Read/Write | If the S1 Management URL on the endpoint matches the value stored in the NinjaOne custom field, or if there is any discrepancy between the two. | If the S1 Management URL on the endpoint matches the value stored in the NinjaOne custom field, or if there is any discrepancy between the two. | SentinelOne Mgmt Server Discrepancy. | SentinelOne Management Server Url Wks | SentinelOne Management Server Url Svr |

## Dependencies

- [SentinelOne Management Console Validation](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-sentinelone-mgmt-server-discrepancy.toml)

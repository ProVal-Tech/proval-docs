---
id: 'f71f62c5-0cb9-48fc-9c47-85e8df9f252a'
slug: /f71f62c5-0cb9-48fc-9c47-85e8df9f252a
title: 'cPVAL Hyper-V Replication Status'
title_meta: 'cPVAL Hyper-V Replication Status'
keywords: ['hyper-v', 'backup', 'integration', 'replication']
description: 'This custom field stores the Hyper-V replication status detail fetched from the [Script - HyperV Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2)'
tags: ['hyper-v', 'backup']
draft: false
unlisted: false
last_update:
  date: 2026-05-11
---

## Summary

This custom field stores the Hyper-V replication status detail fetched from the [Script - Hyper-V Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2).

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Hyper-V Replication Status | cpvalHypervReplicationStatus | `Device` | Multi-line | False |  | Read Only | Read/Write | Read/Write | This custom field stores the Hyper-V replication status detail fetched from the [Script - Hyper-V Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2). |  |  | Hyper-V |

## Dependencies

- [Script - Hyper-V Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2)
- [Solution - Hyper-V Replication Integration Alert](/docs/4deaf362-a762-4a05-9118-326edc7ff523)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-hyperv-replication-status.toml)

## Sample Screenshot

![SampleScreenshot](../../../static/img/docs/577db7ae-37bc-42f7-84e3-5346a6089972/image1.webp)

## Changelog

### 2026-05-11

- Initial version of the document
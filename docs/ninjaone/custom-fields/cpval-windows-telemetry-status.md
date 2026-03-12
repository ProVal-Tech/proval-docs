---
id: 'e000a063-1286-41e1-a6f5-54afab3939a0'
slug: /e000a063-1286-41e1-a6f5-54afab3939a0
title: 'cPVAL Windows Telemetry Status'
title_meta: 'cPVAL Windows Telemetry Status'
keywords: ['secure','secure-boot','audit']
description: 'This custom field indicates the current telemetry (diagnostic data) level on Windows. Shows whether Windows telemetry is enabled and its level (Basic, Enhanced, Full)'
tags: ['security','custom-fields','Secureboot','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This custom field indicates the current telemetry (diagnostic data) level on Windows. Shows whether Windows telemetry is enabled and its level (Basic, Enhanced, Full)

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Windows Telemetry Status | cpvalWindowsTelemetryStatus | `Device` | `Text` | False | -- | `Editable` | `Read/Write` | `Read/Write` | This custom field indicates the current telemetry (diagnostic data) level on Windows. | Shows whether Windows telemetry is enabled and its level (Basic, Enhanced, Full). | Helps track privacy and data collection settings across devices. | SecureBoot Audit |

## Dependencies

[Automation - SecureBoot Compliance - Audit](/docs/33446436-a337-411d-99ae-299046ba30d9)
[Solution - Secure Boot Compliance Audit](/docs/b037020a-1af5-4ecb-bb6b-62d59c123937)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-telemetry-status.toml)

## Sample Screenshot

![cPVAl Secure Boot Status](../../../static/img/docs/e000a063-1286-41e1-a6f5-54afab3939a0/telementry.webp)

## Changelog

Initial Version

---
id: 'f0bef227-5f8b-4c6e-bfd4-9940fde736c8'
slug: /f0bef227-5f8b-4c6e-bfd4-9940fde736c8
title: 'cPVAL Supported AV Services'
title_meta: 'cPVAL Supported AV Services'
keywords: ['security','antivirus','defender','other av']
description: 'This custom field will require the list of AV that are active and running; if found, then the Defender gets disabled. Provide the value of AVs in a comma-separated list within the single quotes. For example: SentinelAgent,AnotherAVService'
tags: ['security','antivirus']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Summary

This custom field will require the list of AV that are active and running; if found, then the Defender gets disabled. Provide the value of AVs in a comma-separated list within the single quotes.
For example: SentinelAgent,AnotherAVService

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Supported AV Services | cpvalSupportedAvServices | `Organization`, `Location`, `Device` | Text | False |  | Editable | Read/Write | Read/Write | This custom field will require the list of AV that are active and running; if found, then the Defender gets disabled. Provide the value of AVs in a comma-separated list within the single quotes. For example: SentinelAgent,AnotherAVService |  | Supported AV Lists | Security Tool |

## Dependencies

- [Solution - Disable Defender](/docs/496a399f-7746-4cc6-9c31-476193d5ee9e)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-supported-av-services.toml)

## Sample Screenshot

![Organization/Location Sample](../../../static/img/docs/f0bef227-5f8b-4c6e-bfd4-9940fde736c8/image.webp)

![Device Sample](../../../static/img/docs/f0bef227-5f8b-4c6e-bfd4-9940fde736c8/image-1.webp)


## Changelog

- Initial version of the document
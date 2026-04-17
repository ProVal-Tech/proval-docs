---
id: 'e030318d-537b-4a81-ba82-d0e4b9a50ab7'
slug: /e030318d-537b-4a81-ba82-d0e4b9a50ab7
title: 'cPVAL Mac Admins'
title_meta: 'cPVAL Mac Admins'
keywords: ['mac', 'macOS', 'administrators', 'admins', 'local-admins']
description: 'This field stores a comma-separated list of local administrator accounts on this macOS device. It automatically excludes the default root account and hidden system accounts to only show actual user or service accounts.'
tags: ['custom-fields', 'macos', 'accounts']
draft: false
unlisted: false
last_update:
  date: 2026-04-17
---

## Summary

This field stores a comma-separated list of local administrator accounts on this macOS device. It automatically excludes the default root account and hidden system accounts to only show actual user or service accounts.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Mac Admins | cpvalMacAdmins | Device | Multi-line | No | N/A | Editable | Read/Write | Read/Write | This field stores a comma-separated list of local administrator accounts on this macOS device. It automatically excludes the default root account and hidden system accounts to only show actual user or service accounts. | Displays the usernames of local administrators on this Mac. Hidden system services and the root user are filtered out for a cleaner list. | Automatically updated by the 'Get macOS Administrator Accounts' script. Displays human and standard service admins only. | Admin Accounts |

## Dependencies

- [Automation: Get macOS Administrator Accounts](/docs/ee0d1171-bad5-4a32-9c07-9cc0098d3618)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-mac-admins.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/e030318d-537b-4a81-ba82-d0e4b9a50ab7/image1.webp)

## Changelog

### 2026-04-17

- Initial version of the document.

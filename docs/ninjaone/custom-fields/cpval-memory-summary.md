---
id: 'ca470e3b-6664-46ed-b2f8-31e281db0e2f'
slug: /ca470e3b-6664-46ed-b2f8-31e281db0e2f
title: 'cPVAL Memory Summary'
title_meta: 'cPVAL Memory Summary'
keywords: ['memory', 'ram', 'hardware', 'inventory', 'audit', 'ninjaone', 'wysiwyg', 'custom-field', 'windows']
description: 'Collects and displays a summary of physical memory information from Windows endpoints using NinjaOne and stores the consolidated memory inventory details in the cPVAL Memory Summary WYSIWYG custom field.'
tags: ['hardware', 'windows', 'custom-fields', 'memory', 'data-collection', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-23
---

## Summary

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| cPVAL Memory Summary | cpvalMemorySummary | -- | `Location`, `Organization`,`device`, `system` | `DropDown` | `WYSIWYG` | True | --- | -- | True | memory Details |

## Dependencies

- [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76)
- [Solution: Get Detailed Memory Information](/docs/fd8c41d3-ecf7-4eb8-95f5-4317a787a579)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-memory-summary.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/ca470e3b-6664-46ed-b2f8-31e281db0e2f/summary-cf.webp)

## Changelog

### 2026-10-23

- Initial version of the document

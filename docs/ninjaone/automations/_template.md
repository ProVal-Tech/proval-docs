---
id: 'New GUID'
slug: /New GUID
title: 'Automation Name'
title_meta: 'Automation Name'
keywords: []
description: ''
tags: []
draft: true
unlisted: false
last_update:
  date: YYYY-MM-DD
---

## Overview

Two to four sentences: what the automation collects or changes, where it stores the result, and when to use it.

:::note  
Anything the reader must know before running it, for example where to schedule it or when it shows as failed.  
:::

## Requirements

- Supported operating system and device role
- Run As: `System`
- PowerShell 5.1
- Anything else the device needs, for example internet access or a signed-in user

## Sample Run

![Image1](../../../static/img/docs/New GUID/image1.webp)

## Custom Fields

| Custom Field | Scope | Type | Description |
| ------------ | ----- | ---- | ----------- |
| [cPVAL Field Name](/docs/GUID) | Device | WYSIWYG | One-sentence description. |

## Dependencies

* [Custom Field: Name](/docs/GUID)
* [Audit Report: Name](/docs/GUID)
* [Solution: Name](/docs/GUID)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/_template.ps1)

## Output

- Activity Details
- Custom Field: [cPVAL Field Name](/docs/GUID)

## Changelog

### YYYY-MM-DD

- Initial version of the document

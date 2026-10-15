---
id: 'b97ba03c-ce1a-4337-a42b-d07dabc59412'
slug: /b97ba03c-ce1a-4337-a42b-d07dabc59412
title: 'Get Printer Details'
title_meta: 'Get Printer Details'
keywords: ['printer', 'print']
description: 'Collects detailed printer information from the local machine.'
tags: ['print', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-13
---

## Overview

Collects detailed printer information from the local machine.

## Sample Run

- Navigate to Automation > Script
- Search for `Get Printer Details`
- Click on the script `Get Printer Details`
- Click on Run

![Sample Run 1](../../../static/img/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412/image.webp)

- Click Run again

![Sample Run 2](../../../static/img/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412/image-1.webp)


## Dependencies

- [Solution - Get Printer Details](/docs/b5c871cf-f8fc-4fde-b20c-5aabd7341ade)

## Custom Fields

| Field Name | Type | Mandatory | Scope | Description |
| ---------- | ---- | --------- | ----- | ----------- |
| cpvalPrinterDetails | WYSIWYG | true | `Device` | This custom field stores the information of the printers fetched using the script "Get Printer Details". |
| cpvalGetPrinterDetails | Drop-down | false | `Organization`, `Location`, `Device` | Select the options to enable or disable auditing of printer details on endpoints. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/get-printer-details.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-10-13

- Initial version of the document
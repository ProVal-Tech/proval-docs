---
id: '656f037b-8dba-4e59-b135-33dcd5b0b7dc'
slug: /656f037b-8dba-4e59-b135-33dcd5b0b7dc
title: 'Client - Update Channel'
title_meta: 'Client - Update Channel'
keywords: ['update', 'channel', 'microsoft365', 'client', 'computer']
description: 'This document provides guidance on selecting the Update Channel for Microsoft 365 clients within the ConnectWise RMM environment. It outlines the available options, dependencies, and details about the configuration settings for the Update Channel.'
tags: ['microsoft365', 'update']
draft: false
unlisted: false
last_update:
  date: 2025-06-16
---

## Summary

Select the Update Channel from the drop-down menu to set for the client's computers. It is used by the [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/3627ba40-ca53-4583-8435-bb09bdb03f20) task.

Available options are:

- Current Channel
- Monthly Enterprise Channel
- Semi-Annual Enterprise Channel
- Beta Channel
- None

## Dependencies

- [Solution - Microsoft 365 - Click-to-Run - Set Update Channel](/docs/b605b808-7016-4911-8c37-6b950de40919)

## Details

| Field Name         | Level   | Type      | Default Value | Description                                                                                                                                                                                                                                                                                                                                                     | Editable |
|--------------------|---------|-----------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Update Channel      | Company | Drop Down | None          | Select the Update Channel from the drop-down menu to set for the client's computer. Available options are: Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel, Beta Channel, None. Computer Level custom field [Update Channel](/docs/772c0498-4505-4f1c-afc4-46788294b3e2) can be used to override the value set in this field. | Yes      |

![Image](../../../static/img/docs/656f037b-8dba-4e59-b135-33dcd5b0b7dc/image1.webp)

## Changelog

### 2026-06-16

- Documentation

### 2025-04-10

- Initial version of the document

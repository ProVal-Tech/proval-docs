---
id: '9939d4b0-3332-4990-badc-03d5e7f43e25'
slug: /9939d4b0-3332-4990-badc-03d5e7f43e25
title: 'Windows - BIOS Boot Type'
title_meta: 'Windows - BIOS Boot Type'
keywords: ['bios', 'boot', 'uefi', 'legacy', 'client', 'location', 'computer', 'manufacturer', 'version']
description: 'This document provides a dataview that displays the BIOS boot type for machines, indicating whether they use UEFI or Legacy boot types. It includes details about the client, location, computer, BIOS manufacturer, BIOS name, BIOS version, and the determined boot type.'
tags: ['bios', 'uefi']
draft: false
unlisted: false
---

## Summary

This dataview shows the BIOS boot type for machines, indicating whether they are using UEFI or Legacy boot types.

## Dependencies

[BIOS Type - UEFI](/docs/6f8f7335-c783-4193-834a-1aa34c9129d6) role

## Columns

| Column               | Description                                                                                     |
|---------------------|-------------------------------------------------------------------------------------------------|
| Client              | The name of the client                                                                          |
| Location            | The name of the location                                                                        |
| Computer            | The name of the endpoint                                                                         |
| BIOS Manufacturer    | The manufacturer of the BIOS, based on data collected by Automate                              |
| BIOS Name           | The name of the BIOS. This may display the model of the machine as well                        |
| BIOS Version        | The BIOS version detected by Automate                                                           |
| BIOS Type           | Using the [BIOS Type - Legacy](/docs/e880c334-1062-405f-97ba-e80c2752fb28) role, this will determine if the machine has the legacy or UEFI boot type |


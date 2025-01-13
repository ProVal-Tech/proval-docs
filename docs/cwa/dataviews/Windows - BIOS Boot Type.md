---
id: 'cwa-bios-boot-type'
title: 'BIOS Boot Type Dataview'
title_meta: 'BIOS Boot Type Dataview'
keywords: ['bios', 'boot', 'uefi', 'legacy', 'client', 'location', 'computer', 'manufacturer', 'version']
description: 'This document provides a dataview that displays the BIOS boot type for machines, indicating whether they use UEFI or Legacy boot types. It includes details about the client, location, computer, BIOS manufacturer, BIOS name, BIOS version, and the determined boot type.'
tags: ['bios', 'boot', 'client', 'location', 'computer', 'manufacturer', 'version', 'uefi', 'legacy']
draft: false
unlisted: false
---
## Summary

This dataview will show the BIOS boot type for machines, whether they are UEFI or Legacy boot types.

## Dependencies

[BIOS Type - UEFI](https://proval.itglue.com/DOC-5078775-7899904) role

## Columns

| Column                | Description                                                                                     |
|----------------------|-------------------------------------------------------------------------------------------------|
| Client               | The name of the client                                                                          |
| Location             | The name of the location                                                                        |
| Computer             | The name of the end point                                                                        |
| BIOS Manufacturer     | The manufacturer of the BIOS, based on data collected by Automate                              |
| BIOS Name            | The name of the BIOS. This may display the model of the machine as well                        |
| BIOS Version         | The BIOS version detected by Automate                                                           |
| BIOS Type            | Using the [BIOS Type - Legacy](https://proval.itglue.com/DOC-5078775-7899860) role, this will determine if the machine has the legacy or UEFI boot type |



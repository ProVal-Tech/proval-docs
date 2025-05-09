---
id: '3a127207-3453-4b55-8e2d-cb179c255cdb'
slug: /3a127207-3453-4b55-8e2d-cb179c255cdb
title: 'Bitlocker and FileVault Status'
title_meta: 'Bitlocker and FileVault Status'
keywords: ['encryption', 'bitlocker', 'filevault', 'endpoints', 'status', 'automate']
description: 'This document provides a detailed overview of the encryption status of endpoints in ConnectWise Automate, focusing on BitLocker for Windows systems and FileVault for Mac systems. It includes dependencies, columns, and descriptions relevant to monitoring encryption status.'
tags: ['encryption', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview will show the encryption status of endpoints in Automate, specifically the BitLocker status for the system drives on Windows systems and the FileVault status for Mac systems.

## Dependencies

- [BitLocker Enabled - System Drive](/docs/65d800d5-0bb9-4101-a6e9-289ab737557e) (Role)
- [OS X FileVault](/docs/1e483bae-ad35-437e-a963-fb7fab9f27e1) (Role)

## Columns

| Column                           | Description                                                                                     |
|----------------------------------|-------------------------------------------------------------------------------------------------|
| Client Name                      | The name of the client                                                                          |
| Location Name                    | The name of the location                                                                        |
| Computer Name                    | The name of the endpoint                                                                        |
| Operating System                 | The operating system of the endpoint                                                            |
| Last Contact                     | The last time the endpoint checked in with Automate                                             |
| BitLocker Status - System Drive  | The BitLocker status of the system drive for Windows devices                                    |
| FileVault Status                 | The FileVault status for Mac devices                                                             |
| Last Logon User                  | The last user that logged into the device based on information gathered by Automate             |
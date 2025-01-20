---
id: '3a127207-3453-4b55-8e2d-cb179c255cdb'
title: 'Encryption Status of Endpoints in Automate'
title_meta: 'Encryption Status of Endpoints in Automate'
keywords: ['encryption', 'bitlocker', 'filevault', 'endpoints', 'status', 'automate']
description: 'This document provides a detailed overview of the encryption status of endpoints in ConnectWise Automate, focusing on Bitlocker for Windows systems and FileVault for Mac systems. It includes dependencies, columns, and descriptions relevant to monitoring encryption status.'
tags: ['encryption', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview will show the encryption status of endpoints in Automate. Specifically, the Bitlocker status for the system drives on Windows systems and the FileVault status for Mac systems.

## Dependencies

- [Bitlocker Enabled - System Drive](<../roles/Bitlocker Enabled - System Drive.md>) (Role)
- [OS X FileVault](<../roles/OS X FileVault.md>) (Role)

## Columns

| Column                           | Description                                                                                     |
|----------------------------------|-------------------------------------------------------------------------------------------------|
| Client Name                      | The name of the client                                                                          |
| Location Name                    | The name of the location                                                                        |
| Computer Name                    | The name of the endpoint                                                                        |
| Operating System                 | The operating system of the endpoint                                                            |
| Last Contact                     | The last time the endpoint checked in with Automate                                             |
| Bitlocker Status - System Drive  | The Bitlocker status of the system drive for Windows devices                                    |
| FileVault Status                 | The FileVault status for Mac devices                                                             |
| Last logon User                  | The last user that logged into the device based on information gathered by Automate             |














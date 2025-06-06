---
id: 'ecf832e3-2985-4079-971c-436f1c836e53'
slug: /ecf832e3-2985-4079-971c-436f1c836e53
title: 'Windows Update History'
title_meta: 'Windows Update History'
keywords: ['windows', 'update', 'history', 'rmm', 'patch', 'audit']
description: 'This document provides a comprehensive overview of Windows Update history for agents, detailing the various columns of information such as client name, operating system, patch details, and installation status. It also lists dependencies for effective auditing and management of Windows updates.'
tags: ['performance', 'report', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays information about Windows Update history for agents.

## Dependencies

- [pvl_windows_updates](/docs/d1791eba-107c-4be0-8048-a1d716dae301)
- [Windows Update History Audit](/docs/d0c435d0-7bfb-4d65-aff3-f3db9b5c3ab6)

## Columns

| Column                          | Description                                       |
|---------------------------------|---------------------------------------------------|
| Client Name                     | Client Name                                       |
| Location Name                   | Location Name                                     |
| Computer Name                   | Computer Name                                     |
| Operating System                | Operating System                                  |
| OS Type                         | OS Type (Server | Workstation)                   |
| Last Contact                    | Last Contact with RMM                             |
| Days Since Last Contact         | Days Since Last Contact with RMM                  |
| KB                              | KBID of the Patch                                 |
| Title                           | Title of the Patch                                |
| Description                     | Description of the Patch                          |
| Size                            | Size of the Patch in MB                           |
| Type                            | Type of the Patch (Windows Update | Driver | Third Party) |
| Is Beta                         | Is Beta? (True | False)                          |
| Is Installed                    | Is Installed? (True | False)                     |
| Is Mandatory                    | Is Mandatory? (True | False)                     |
| Is Reboot Required              | Is Reboot Required? (True | False)               |
| Is Uninstallable                | Is Uninstallable? (True | False)                 |
| Is Downloaded                   | Is Downloaded? (True | False)                    |
| Is Hidden                       | Is Hidden? (True | False)                        |
| Severity                        | Severity of the Patch                             |
| Last Deployment Change Time      | Last Deployment Change Time for the Patch        |
| Support URL                     | Support URL for the Patch                         |
| Auto Select On WebSites         | Auto Select On WebSites? (True | False)          |
| Can Require Source              | Can require Source to install? (True | False)    |
| Is Eula Accepted                | Is Eula Accepted? (True | False)                 |
| Is Present                      | Is Present on the Machine? (True | False)        |
| Is Browse Only                  | Is Browse Only? (True | False)                   |
| Is Per User                     | Is Per User? (True | False)                      |
| Recommended CPU Speed           | Recommended CPU Speed to install the Patch        |
| Recommended Hard Disk Space     | Recommended Hard Disk Space to Install the Patch  |
| Recommended Memory              | Recommended Memory to Install the Patch           |
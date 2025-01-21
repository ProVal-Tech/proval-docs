---
id: 'aa31f8b3-9d5e-4ad1-98cc-a6e1d329cb1f'
title: 'Security - TLS Status'
title_meta: 'Security - TLS Status'
keywords: ['tls', 'audit', 'endpoint', 'version', 'security']
description: 'This document provides an overview of a dataview that enables auditing of TLS versions on endpoints. It highlights the importance of understanding which versions of TLS are enabled for secure communication between machines and servers. The document also outlines dependencies and provides a detailed description of the columns in the dataview.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview is an easy way to audit which versions of TLS are enabled on the endpoint. This is native to the machine, not to Internet Explorer. An example of this would be the communication from the machine to a server, such as a File Server.

**Note:** Only if the Remote Monitor (from dependencies) has executed/run at least once on the machine will the enabled TLS version be shown in the dataview.

## Dependencies

- [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Client](<../monitors/TLS Version Check - Client.md>)
- [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Server](<../monitors/TLS Version Check - Server.md>)

## Columns

| Column                      | Description                                   |
|-----------------------------|-----------------------------------------------|
| Client ID                   | Client ID (Hidden)                           |
| Location ID                 | Location ID (Hidden)                         |
| Computer ID                 | Computer ID (Hidden)                         |
| Client Name                 | Client Name                                   |
| Location Name               | Location Name                                 |
| Computer Name               | Computer Name                                 |
| Operating System            | Operating System                              |
| Last Contact                | Last Contact with RMM                         |
| Last Logged In User         | Last Logged In User (Hidden)                 |
| Enabled TLS - Client        | Enabled TLS Client Version(s)                |
| Enabled TLS - Server        | Enabled TLS Server Version(s) (if applicable)|
| Data Collection Time        | Data Collection Time                          |

## Sample Screenshot

![Sample Screenshot](../../../static/img/Security---TLS-Status/image_1.png)




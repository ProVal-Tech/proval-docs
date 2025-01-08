---
id: 'cwa-tls-version-audit'
title: 'TLS Version Audit for Endpoints'
title_meta: 'TLS Version Audit for Endpoints'
keywords: ['tls', 'audit', 'endpoint', 'version', 'security']
description: 'This document provides an overview of a dataview that enables auditing of TLS versions on endpoints. It highlights the importance of understanding which versions of TLS are enabled for secure communication between machines and servers. The document also outlines dependencies and provides a detailed description of the columns in the dataview.'
tags: ['security', 'networking', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

This dataview is an easy way to audit which versions of TLS are enabled on the endpoint. This is native to the machine, not to I.E. An example of this would be the communication from the machine to a server, like a File Server.

Note: Only if the Remote monitor (from dependencies) has executed/run at least once on the machine will the enabled TLS version be shown in the dataview.

## Dependencies

- [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Client](https://proval.itglue.com/DOC-5078775-13217933)
- [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Server](https://proval.itglue.com/DOC-5078775-13217931)

## Columns

| Column                      | Description                                   |
|-----------------------------|-----------------------------------------------|
| Clientid                    | Clientid (Hidden)                            |
| Locationid                  | Locationid (Hidden)                          |
| Computerid                  | Computerid (Hidden)                          |
| Client Name                 | Client Name                                  |
| Location Name               | Location Name                                |
| Computer Name               | Computer Name                                |
| Operating System            | Operating System                             |
| Last Contact                | Last Contact with RMM                        |
| Last Logged In User         | Last Logged In User (Hidden)                 |
| Enabled TLS - Client        | Enabled TLS Client Version(s)                |
| Enabled TLS - Server        | Enabled TLS Server Version(s) (if applicable)|
| Data Collection Time        | Data Collection Time                         |

## Sample Screenshot

![Sample Screenshot](5078775/docs/7974498/images/18928629)



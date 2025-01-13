---
id: 'cwa-host-file-audit'
title: 'Host File Audit Dataview'
title_meta: 'Host File Audit Dataview'
keywords: ['audit', 'hostfile', 'uncommented', 'rmm', 'windows']
description: 'This document provides a summary of the Host File Audit Dataview, detailing the uncommented content of the host file fetched by the EPM - Windows Configuration script. It includes important columns such as Client Name, Location Name, Computer Name, and more, along with their descriptions.'
tags: ['audit', 'windows', 'configuration', 'report', 'security']
draft: false
unlisted: false
---
## Summary

The purpose of this dataview is to show the Uncommented comment of the Host file. Data is being fetched by the [EPM - Windows Configuration - Script - Hosts File - Audit](https://proval.itglue.com/DOC-5078775-9106329) script.

## Dependencies

[EPM - Windows Configuration - Script - Hosts File - Audit](https://proval.itglue.com/DOC-5078775-9106329)

## Columns

| Column                     | Description                                   |
|---------------------------|-----------------------------------------------|
| Client Name               | Client Name                                   |
| Location Name             | Location Name                                 |
| Computer Name             | Computer Name                                 |
| Operating System          | Operating System                              |
| Host File Contents        | Uncommented content of the host file         |
| Script Run Time           | Script Run Time                               |
| Last Contact              | Last Contact with RMM                         |
| Days Since Last Contact   | Days Since Last Contact with RMM              |
| Last Logged In User       | Last Logged In User                           |




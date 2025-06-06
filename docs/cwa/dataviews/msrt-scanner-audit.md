---
id: '3b6465a0-54e7-45ce-94b2-000ac55c6a26'
slug: /3b6465a0-54e7-45ce-94b2-000ac55c6a26
title: 'MSRT Scanner Audit'
title_meta: 'MSRT Scanner Audit'
keywords: ['msrt', 'scanner', 'status', 'dataview', 'rmm']
description: 'This document provides information about the MSRT scanner status dataview, which stores the results of the Malicious Software Removal Tool scanner and disabling. It outlines the dependencies, columns, and descriptions related to the agent status in the RMM system.'
tags: ['report', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview stores the status of the MSRT scanner result from the script [Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) and also from the script [Malicious Software Removal Tool Disable/Uninstall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7).

## Dependencies

[Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257)

[Malicious Software Removal Tool Disable/Uninstall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7)

## Columns

| Column                  | Description                                          |
|------------------------|------------------------------------------------------|
| Client                 | Client name of the agent                             |
| Location               | Location name of the agent                           |
| Computer               | The computer name of the agent                       |
| Operating System       | The operating system of the agent                    |
| Last Contact           | The last contact of the agent with the RMM          |
| MSRT Scanner Result     | MSRT tool scanner or tool disabling result conclusion recorded         |
| MSRT Scanner Date      | MSRT's last scanner date                             |
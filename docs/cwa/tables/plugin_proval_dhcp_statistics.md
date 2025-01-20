---
id: '489fe175-9ac6-420c-be2e-e5faceb956fd'
title: 'DHCP Scope Information Storage'
title_meta: 'DHCP Scope Information Storage'
keywords: ['dhcp', 'scope', 'statistics', 'ip', 'lease', 'address', 'computer', 'client']
description: 'This document outlines the purpose and structure of storing information about DHCP scopes on the target machine, as gathered by the script Get DHCP Server Scope Information. It includes details about the dependencies and a comprehensive table of the data collected, including client IDs, location IDs, and IP address ranges.'
tags: ['database', 'networking', 'report', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores information about DHCP scopes on the target machine gathered by the script [Get DHCP Server Scope Information](<../scripts/Get DHCP Server Scope Information.md>).

## Dependencies

[Get DHCP Server Scope Information](<../scripts/Get DHCP Server Scope Information.md>)

## Table

#### plugin_proval_dhcp_statistics

| Column            | Type    | Explanation                                               |
|-------------------|---------|----------------------------------------------------------|
| ClientID          | INT     | The ClientID of the audited DHCP server.                 |
| LocationID        | INT     | The LocationID of the audited DHCP server.               |
| ComputerID        | INT     | The ComputerID of the audited DHCP server.               |
| ScopeID           | VARCHAR | The ScopeID (GUID) of the audited DHCP scope.           |
| NAME              | VARCHAR | The given name of the audited DHCP scope.                |
| State             | VARCHAR | The current state of the audited DHCP scope.             |
| StartRange        | VARCHAR | The starting IP address for the DHCP scope range.       |
| EndRange          | VARCHAR | The ending IP address for the DHCP scope range.         |
| LeaseDuration     | TIME    | The duration of the lease of the DHCP scope range.      |
| FreeIPCount       | INT     | The number of free IP addresses in the DHCP scope.      |
| UsedIPCount       | INT     | The number of used IP addresses in the DHCP scope.      |
| ReservedIPCount    | INT     | The number of reserved IP addresses in the DHCP scope.  |
| PercentUsed       | INT     | The percentage of used IP addresses in the DHCP scope.  |














---
id: ps-set-netadapterdns
title: 'Set-NetAdapterDNS'
title_meta: 'Set-NetAdapterDNS Command'
keywords: ['dns', 'network', 'adapter', 'configuration']
description: 'Documentation for the Set-NetAdapterDNS command to append a DNS server address to all physical, active network adapters.'
tags: ['dns', 'networking', 'windows']
draft: false
unlisted: false
---

## Description
This command is used to append a DNS server address to all physical, active network adapters.

## Requirements
- PowerShell v5

## Usage
1. Retrieves all physical network adapters that are currently active.
2. For each adapter, checks if it is using DHCP; if true, it skips that adapter.
3. Gathers the current list of DNS servers on each adapter and appends the new address to the end if it does not already exist in the list.

This command appends the DNS address `1.1.1.1` to the end of all active, physical network adapters with static IP addresses.

```powershell
.\Set-NetAdapterDNS.ps1 -DNSServer "1.1.1.1"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `-DNSServer`      |       | True      |           | String    | The DNS server address to append to the network adapter(s). |
| `-Force`          |       | False     |           | Int       | Unimplemented. Intended to force DNS address updates to DHCP-enabled adapters. |

## Output
- `.\Set-NetAdapterDNS-log.txt`
- `.\Set-NetAdapterDNS-data.txt`


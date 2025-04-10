---
id: '6942d20e-8606-4af2-bae5-7525935a2bfd'
slug: /6942d20e-8606-4af2-bae5-7525935a2bfd
title: 'Set-DNSServersScavengingSetting'
title_meta: 'Set-DNSServersScavengingSetting'
keywords: ['dns', 'scavenging', 'configuration', 'networking']
description: 'Documentation for the Set-DNSServersScavengingSetting command to enable DNS scavenging and set intervals for Scavenging, No-refresh, and Refresh.'
tags: ['dns', 'networking']
draft: false
unlisted: false
---

## Description
Enables DNS scavenging and optionally sets the intervals for Scavenging, No-refresh, and Refresh.

## Requirements
Must be run on a DNS Server.

## Usage
1. Validates that the server is a DNS Server.
2. Creates the hashtable to splat into the `Set-DnsServerScavenging` cmdlet.
3. Attempts the update to the scavenging settings.
4. Validates success and returns the updated scavenging settings if successful.

```powershell
.\Set-DNSServerScavengingSettings.ps1 -ScavengingInterval 7 -NoRefreshInterval 7 -RefreshInterval 8
```
Sets the scavenging interval to 7 days, the no-refresh interval to 7 days, and the refresh interval to 8 days.

```powershell
.\Set-DNSServerScavengingSettings.ps1 -NoRefreshInterval 7 -RefreshInterval 8 -FallbackInterval 20
```
Sets the no-refresh interval to 7 days and the refresh interval to 8 days. If the DNS server's scavenging interval is set to 0 days, it will be set to 20 days instead.

## Parameters
| Parameter            | Required | Default | Type | Description                                                                                                                                                         |
| -------------------- | -------- | ------- | ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ScavengingInterval` | False    |         | Int  | The number of days to set the scavenging interval to.                                                                                                              |
| `NoRefreshInterval`  | False    |         | Int  | The number of days to set the no-refresh interval to.                                                                                                              |
| `RefreshInterval`    | False    |         | Int  | The number of days to set the refresh interval to.                                                                                                                 |
| `FallbackInterval`   | False    | 30      | Int  | If an interval parameter is not passed in but that interval is currently set to 0 days on the DNS server, that interval will be set to the value of this parameter. |

## Output
Microsoft.Management.Infrastructure.CimInstance#root/Microsoft/Windows/DNS/DnsServerScavenging

Log Files:

```
.\Set-DNSServerScavengingSettings-log.txt
.\Set-DNSServerScavengingSettings-error.txt
```



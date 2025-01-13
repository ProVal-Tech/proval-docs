---
id: 'cwa-dhcp-scopes-ip-monitor'
title: 'DHCP Scope(s) with Insufficient IP Addresses Monitor'
title_meta: 'DHCP Scope(s) with Insufficient IP Addresses Monitor'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'network', 'alert', 'server']
description: 'This document outlines a remote monitor designed to retrieve information about DHCP server scopes and their corresponding IP address statistics. It filters out inactive scopes, focusing on active ones, and checks for those with 5 or fewer available IP addresses, alerting administrators to potential network connectivity issues.'
tags: ['networking', 'windows', 'alert', 'configuration', 'monitoring', 'ticketing']
draft: false
unlisted: false
---
## Summary

The remote monitor retrieves information about DHCP server scopes and their corresponding IP address statistics. It filters out inactive scopes and focuses only on active ones. The monitor set then checks the number of available IP addresses within each active scope and identifies those with 5 or fewer available IP addresses.

In other words, it detects the DHCP servers having any active DHCP Scope with less than 5 IP Addresses available.

Requirement: PowerShell v5+ (Server 2016+)

The remote monitor takes into account the reserved percentage for the DHCP failover scopes, and it will not trigger an alert for the standby DHCP server.

## Details

**Suggested "Limit to"**: Windows DHCP Servers  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.01       | Run File   | REDACTED      | Regex Match | 3600     | <Screenshot below> |

![Monitor Screenshot](../../../static/img/DHCP-Scope(s)--5-IP-Addresses-Available/image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)

## Target

Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers

![Target Screenshot](../../../static/img/DHCP-Scope(s)--5-IP-Addresses-Available/image_2.png)

## Ticketing

**Subject:** ` DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%`

**Ticket Summary:**  

`Active DHCP scope(s) with less than 5 available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%.`

`This could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.`

`Affected Scope(s) details: `
  
`%RESULT%`

**%RESULT%:**  

```
scopeid    : <scopeid>
startrange : <startrange>
endrange   : <endrange>
free       : <free ip addresses>
inuse      : <ip addresses in use>
Reserved   : <reserved ip addresses>
```

**Example:**  

```
scopeid    : 10.10.0.0
startrange : 10.10.0.100
endrange   : 10.10.0.200
free       : 51
inuse      : 50
Reserved   : 4
```

## Note

The monitor set is available for import in our (ProVal's) Development environment within the `ProVal - Remote Monitors` Group.

![Note Screenshot](../../../static/img/DHCP-Scope(s)--5-IP-Addresses-Available/image_3.png)

## Monitor's Screenshot

![Monitor Screenshot 1](../../../static/img/DHCP-Scope(s)--5-IP-Addresses-Available/image_4.png)  
![Monitor Screenshot 2](../../../static/img/DHCP-Scope(s)--5-IP-Addresses-Available/image_5.png)

## How to Import

Please adhere to the guidelines provided in the article [Import - Remote Monitor - DHCP Scope(s) < 5 IP Addresses Available](https://proval.itglue.com/DOC-5078775-13206534).





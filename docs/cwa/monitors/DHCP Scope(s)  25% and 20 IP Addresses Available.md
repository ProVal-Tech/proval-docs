---
id: 'ce8d5706-137b-4a55-8a8b-5041e35421de'
title: 'DHCP Scope Monitor for Insufficient IP Addresses'
title_meta: 'DHCP Scope Monitor for Insufficient IP Addresses'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'alert']
description: 'This document outlines a remote monitor designed to retrieve information about active DHCP server scopes and their IP address statistics. It identifies DHCP servers with insufficient available IP addresses, alerting when active scopes have less than 20 IP addresses or 25% availability. The monitor considers reserved percentages for DHCP failover scopes and ensures both conditions are met before triggering an alert.'
tags: ['windows', 'networking', 'alert', 'monitoring', 'server']
draft: false
unlisted: false
---
## Summary

The remote monitor retrieves information about DHCP server scopes and their corresponding IP address statistics. It filters out inactive scopes and focuses only on active ones. The monitor set then checks the number or percentage of available IP addresses within each active scope and identifies those with less than or equal to 20 and 25% of available IP addresses.

In other words, it detects the DHCP servers having any active DHCP Scope with less than 20 IP Addresses and 25% of IP addresses available at the same time. It ensures both conditions are true before alerting.

Requirement: PowerShell v5+ (Server 2016+)

The remote monitor takes into account the reserved percentage for the DHCP failover scopes, and it will not trigger an alert for the standby DHCP server.

## Details

**Suggested "Limit to"**: Windows DHCP Servers  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.01       | Run File   | REDACTED      | Regex Match | 3600     | <Screenshot Below> |

![Screenshot](../../../static/img/DHCP-Scope(s)--25%-and-20-IP-Addresses-Available/image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)

## Target

Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers  

![Target Image](../../../static/img/DHCP-Scope(s)--25%-and-20-IP-Addresses-Available/image_2.png)

## Ticketing

**Subject:** `DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%`

**Ticket Summary:**  
Active DHCP scope(s) with less than 25% and 20 available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%.  
This could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.

**Affected Scope(s) details:**  
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

The monitor set is available for import in our (ProVal's) Development environment within the `ProVal Submitted - Remote Monitors` Group.  

![Note Image](../../../static/img/DHCP-Scope(s)--25%-and-20-IP-Addresses-Available/image_3.png)

## Monitor's Screenshot

![Monitor Screenshot 1](../../../static/img/DHCP-Scope(s)--25%-and-20-IP-Addresses-Available/image_4.png)  
![Monitor Screenshot 2](../../../static/img/DHCP-Scope(s)--25%-and-20-IP-Addresses-Available/image_5.png)

## How to Import

Please adhere to the guidelines provided in the article [Import - Remote Monitor - DHCP Scope(s) < 25% and 20 IP Addresses Available](https://proval.itglue.com/DOC-5078775-15408683)








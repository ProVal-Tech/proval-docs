---
id: 'ps-remote-monitor-dns-service'
title: 'Remote Monitor for DNS Service'
title_meta: 'Remote Monitor for DNS Service'
keywords: ['dns', 'monitor', 'service', 'windows', 'ticketing']
description: 'This document outlines a PowerShell remote monitor designed to ensure the DNS service is running on Windows servers. It provides details on alert styles, suggested settings, and ticketing information for when the service is not operational.'
tags: ['monitoring', 'windows', 'ticket', 'service', 'alert']
draft: false
unlisted: false
---
## Summary

This Powershell remote monitor attempts to run the DNS service if it's not running.

## Details

**Suggested "Limit to"**: All  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File    | REDACTED    | State Based | 600      | <Screenshot Below> |

![Screenshot](..\..\..\static\img\CWM---Automate---Remote-Monitor---DNS-Service-Monitoring\image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)

## Target

Windows DNS Servers  
![Target Image](..\..\..\static\img\CWM---Automate---Remote-Monitor---DNS-Service-Monitoring\image_2.png)

## Ticketing

**Subject:** `DNS Service Not Running on <Computer Name>`  

**Body:**  
`'DNS' service is stopped on <Computer Name>. Automate attempted to start the service but failed.`  

`<Failure Reason>`

## Implementation

[Import - Remote Monitor - DNS Service Monitoring](https://proval.itglue.com/DOC-5078775-13604735)



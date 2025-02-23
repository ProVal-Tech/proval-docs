---
id: '3dd42a74-e25a-44df-8d49-89e6b57139ce'
title: 'CWM - Automate - Remote Monitor - DNS Service Monitoring'
title_meta: 'CWM - Automate - Remote Monitor - DNS Service Monitoring'
keywords: ['dns', 'monitor', 'service', 'windows', 'ticketing']
description: 'This document outlines a PowerShell remote monitor designed to ensure the DNS service is running on Windows servers. It provides details on alert styles, suggested settings, and ticketing information for when the service is not operational.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This PowerShell remote monitor attempts to run the DNS service if it's not running.

## Details

**Suggested "Limit to"**: All  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator   | Interval | Result                 |
|--------------|----------------|-------------|-------------|--------------|----------|------------------------|
| System       | 127.0.0.1      | Run File    | REDACTED    | State Based  | 600      | \<Screenshot Below\>   |

![Screenshot](../../../static/img/CWM---Automate---Remote-Monitor---DNS-Service-Monitoring/image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Target

Windows DNS Servers  
![Target Image](../../../static/img/CWM---Automate---Remote-Monitor---DNS-Service-Monitoring/image_2.png)

## Ticketing

**Subject:** `DNS Service Not Running on \<Computer Name>`  

**Body:**  
`'DNS' service is stopped on \<Computer Name>. Automate attempted to start the service but failed.`  

`\<Failure Reason>`

## Implementation

[Import - Remote Monitor - DNS Service Monitoring](<./DNS Service Monitoring.md>)




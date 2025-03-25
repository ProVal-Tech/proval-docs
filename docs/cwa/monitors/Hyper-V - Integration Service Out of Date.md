---
id: 'be36d0c7-d03d-4daf-873b-7ed47c12501a'
slug: /be36d0c7-d03d-4daf-873b-7ed47c12501a
title: 'Integration Service Out of Date'
title_meta: 'Integration Service Out of Date'
keywords: ['hyper-v', 'monitor', 'integration', 'service', 'ticket']
description: 'This document provides details on a monitor that checks for the Hyper-V integration service and generates tickets if it is out of date. It includes setup instructions, dependencies, and implementation guidance.'
tags: ['hyper-v', 'update']
draft: false
unlisted: false
---

## Summary

This monitor checks for the Hyper-V integration service and generates tickets if it is out of date.

## Details

**Suggested "Limit to"**: Hyper-V Installed  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Automate Ticket  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Comparator       | Interval | Execute Info| Result                |
|--------------|----------------|------------|-------------------|----------|------------|-----------|
| System       | 127.0.0.1     | Run File   | Does Not Contain  | 86400    | **REDACTED**|IntegrationServicesState: |


## Dependencies

- Hyper-V installed and running on the machine

## Target

- Managed 24x7 | 8x5 Servers -> Limit To: Hyper-V Installed

## Implementation

Please follow the article below for the implementation:  
[Import - Integration Service Out of Date](./Import-Hyper-V-Integration-Service-Out-of-Date.md)
---
id: 'be36d0c7-d03d-4daf-873b-7ed47c12501a'
title: 'Hyper-V Integration Service Monitor'
title_meta: 'Hyper-V Integration Service Monitor'
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

| Check Action | Server Address | Check Type | Comparator       | Interval | Result                |
|--------------|----------------|------------|-------------------|----------|-----------------------|
| System       | 127.0.0.1     | Run File   | Does Not Contain  | 86400    | IntegrationServicesState: |

| **Execute Info**                                               |
|---------------------------------------------------------------|
| C:/Windows/system32/cmd.exe /c powershell.exe "try{ Get-VM | Where-Object {($_.IntegrationServicesState -eq 'Update required')} | Foreach-Object {Write-Host \"$($_.Name) IntegrationServicesState: $($_.IntegrationServicesState)\"}} catch {}" |

## Dependencies

- Hyper-V installed and running on the machine

## Target

- Managed 24x7 | 8x5 Servers -> Limit To: Hyper-V Installed

## Implementation

Please follow the article below for the implementation:  
[Implementation Article](https://proval.itglue.com/5078775/docs/15601869)

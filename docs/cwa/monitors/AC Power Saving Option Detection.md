---
id: '54425c6a-e77c-4c65-ab46-810e6abbb71d'
title: 'Remote Monitor for AC Options in Windows Workstations'
title_meta: 'Remote Monitor for AC Options in Windows Workstations'
keywords: ['monitor', 'windows', 'workstation', 'sleep', 'hibernate', 'alert']
description: 'This document describes a remote monitor designed to check for AC options that allow Windows workstations to go to sleep or hibernate. It includes details on suggested alert styles, templates, and the specific checks to be performed.'
tags: ['monitoring', 'alert', 'windows', 'workstation', 'configuration']
draft: false
unlisted: false
---
## Summary

This remote monitor is looking for any AC option that would allow the machine to go to sleep or hibernate.

## Details

**Suggested "Limit to"**: Windows Workstations  
**Suggested Alert Style**: Once.  
**Suggested Alert Template**: Default - Create Automate Ticket  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Comparator        | Interval | Result  |
|--------------|----------------|-------------|--------------------|----------|---------|
| System       | 127.0.0.1     | Run File    | Does Not Contain    | 86400    | Enabled |

## Dependencies

None

## Target

- Managed 24x7 | 8x5 Workstations







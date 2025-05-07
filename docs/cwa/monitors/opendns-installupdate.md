---
id: '2487dd9a-79da-443f-809c-a961c3764142'
slug: /2487dd9a-79da-443f-809c-a961c3764142
title: 'OpenDNS InstallUpdate'
title_meta: 'OpenDNS InstallUpdate'
keywords: ['opendns', 'monitor', 'windows', 'workstation', 'update', 'software']
description: 'This document outlines the functionality and requirements of the OpenDNS Monitor designed for Windows Workstations. It details the conditions under which the monitor triggers failures and provides troubleshooting information. Additionally, it suggests configurations for alerts and dependencies related to the software installation process.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

- This Remote Monitor triggers failure only if:
  1. The target is a workstation.
  2. The target is not virtual.
  3. The target does not have an ARM processor.
  4. The .NET version is 4.6.2 or greater (or Windows 11 or higher, determined by the OS build number being greater than 22000).
  5. The currently installed OpenDNS version is less than the available version provided by OpenDNS.

- **Troubleshooting**: The Monitor status information column returns reasons for failure such as .NET requirement not satisfied, incorrect OS architecture, failure to satisfy physical machine requirements, ARM processors not supported, or update/installation not required. The monitor only triggers failure when it returns "True." Success is based on the result not equaling "True."

- The monitor can be viewed in table format to see the results of the attempt, which can be addressed in the event that clients are targeting unsupported machines.

## Details

**Suggested "Limit to"**: Selected Windows Workstations, or all Windows machines, as the monitor is smart enough not to trigger on items that do not satisfy the requirements.  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Create an alert template that on error runs the [SWM - Software Install - Automate - Script - Deploy OpenDNS Roaming Client Latest Version](/docs/c18b026e-7989-4853-b1cb-00517e69adb8)

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | Default        | Run File   | Redacted     | Not Equals  | 300      | True   |

## Dependencies

- [SWM - Software Install - Automate - Script - Deploy OpenDNS Roaming Client Latest Version](/docs/c18b026e-7989-4853-b1cb-00517e69adb8)

## Target

The only limiting factor will ultimately be the Windows operating system. The reason for this is that the monitor will filter out servers, ARM processors, virtual machines, etc. That being said, even if you were to include a server in the list for this monitor, that server would never trigger the autofix action.


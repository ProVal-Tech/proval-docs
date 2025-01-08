---
id: 'cwa-open-dns-monitor'
title: 'OpenDNS Monitor for Windows Workstations'
title_meta: 'OpenDNS Monitor for Windows Workstations'
keywords: ['opendns', 'monitor', 'windows', 'workstation', 'update', 'software']
description: 'This document outlines the functionality and requirements of the OpenDNS Monitor designed for Windows Workstations. It details the conditions under which the monitor triggers failures and provides troubleshooting information. Additionally, it suggests configurations for alerts and dependencies related to the software installation process.'
tags: ['monitor', 'windows', 'update', 'software', 'alert', 'troubleshooting']
draft: false
unlisted: false
---
## Summary

- This Remote Monitor triggers failure only if:
  1. Target is a workstation
  2. Target is not virtual
  3. Target does not have an ARM processor
  4. The .net version is 4.6.2 or greater (or Windows 11 or higher, determined by the OS build number being greater than 22000)
  5. The currently installed OpenDNS version is less than the available version provided by OpenDNS

- Troubleshooting: The Monitor status information column returns reasons for failure such as .Net requirement not satisfied, incorrect OS architecture, failure to satisfy physical machine requirement, ARM processors not supported, or update/installation not required. The monitor only triggers failure when it returns "True". Success is based on the result not equaling "True".

- The monitor can be viewed in table view to see the results of the attempt, which can be addressed in the event that clients are targeting unsupported machines.

## Details

**Suggested "Limit to"**: Selected Windows Workstations, or all windows machines as the monitor is smart enough not to trigger on items that do not satisfy the requirements.  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Create an alert template that on error runs the [SWM - Software Install - Automate - Script - Deploy OpenDNS Roaming Client Latest Version](https://proval.itglue.com/DOC-5078775-11617616)

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | Default        | Run File   | Redacted     | Not Equals  | 300      | True   |

## Dependencies

- [SWM - Software Install - Automate - Script - Deploy OpenDNS Roaming Client Latest Version](https://proval.itglue.com/DOC-5078775-11617616)

## Target

The only limiting factor will be ultimately windows operating system, the reason for this is that the monitor will filter out servers, and arm processors, and virtual machines, etc. That being said, even if you were to put a server in the list for this monitor that server would never trigger the autofix action.


